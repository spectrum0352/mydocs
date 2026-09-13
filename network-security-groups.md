Azure NSGs are used to filter network traffic to and from resources in
an Azure virtual network

Subnet level network and application access control

## NSG Limits

limits are applied per region per subscription:

- 5000 NSGs per subscription

- 1000 Rules per NSG

- 4000 IP’s or ranges specified per NSG

>  

## NSG Rules Components

- Name: name with purpose of NSG rule

- Priority rang is 100-4096. Low number processed before higher

- Source: Any IP address or CIDR or Service tag or Application security
  group

- Destination: Any or IP address or CIDR or Service tag or Application
  security group

- Protocol: TCP, UDP, ICMP, SMTP, SSH, RDP, FTP, or any

- Direction: Inbound or Outbound

- Port Range: Individual or range of ports, 22, 3389, 100-110

- Action: Allow or Deny

 

<table style="width:99%;">
<colgroup>
<col style="width: 9%" />
<col style="width: 7%" />
<col style="width: 16%" />
<col style="width: 10%" />
<col style="width: 16%" />
<col style="width: 15%" />
<col style="width: 7%" />
<col style="width: 5%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr>
<th>Rule Name</th>
<th>Priority</th>
<th>Source</th>
<th>Source Port</th>
<th>Destination</th>
<th>Destination Port</th>
<th>Protocol</th>
<th>Access</th>
<th>Direction</th>
</tr>
</thead>
<tbody>
<tr>
<td>Name</td>
<td>100-4096</td>
<td><p>Any,</p>
<p>IP/CIDR,</p>
<p>Service Tag,</p>
<p>App security group</p></td>
<td>0-65535</td>
<td><p>Any,</p>
<p>IP/CIDR,</p>
<p>Service Tag,</p>
<p>App security group</p></td>
<td>0-65535</td>
<td><p>Any,</p>
<p>TCP,</p>
<p>UDP,</p>
<p>ICMP</p></td>
<td><p>Allow,</p>
<p>Deny</p></td>
<td><p>Inbound,</p>
<p>Outbound</p></td>
</tr>
</tbody>
</table>

## NSG Workflow

> <img src="media/image1.png" style="width:8.60833in;height:4.06026in" />
>
>  
>
>  

## Default NSG Rules

Inbound Rules:

| Rule Name | Priority | Source | Source Port | Destination | Destination Port | Protocol | Access |
|----|----|----|----|----|----|----|----|
| AllowVNetInBound | 65000 | VirtualNetwork | 0-65535 | VirtualNetwork | 0-65535 | Any | Allow |
| AllowAzureLoadBalancerInBound | 65001 | AzureLoadBalancer | 0-65535 | 0.0.0.0/0 | 0-65535 | Any | Allow |
| DenyAllInbound | 65500 | 0.0.0.0/0 | 0-65535 | 0.0.0.0/0 | 0-65535 | Any | Deny |

Outbound Rules

| Rule Name | Priority | Source | Source Port | Destination | Destination Port | Protocol | Access |
|----|----|----|----|----|----|----|----|
| AllowVNetOutBound | 65000 | VirtualNetwork | 0-65535 | VirtualNetwork | 0-65535 | Any | Allow |
| AllowInternetOutBound | 65001 | 0.0.0.0/0 | 0-65535 | Internet | 0-65535 | Any | Allow |
| DenyAllOutbound | 65500 | 0.0.0.0/0 | 0-65535 | 0.0.0.0/0 | 0-65535 | Any | Deny |

>  

## Sample NSG Rules 

Network rule collection group

- Priority: 100

- Rule collection action: Allow

<table style="width:96%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 14%" />
<col style="width: 21%" />
<col style="width: 17%" />
<col style="width: 9%" />
<col style="width: 15%" />
<col style="width: 11%" />
</colgroup>
<thead>
<tr>
<th>Name</th>
<th>Source type</th>
<th>Source</th>
<th>Protocol</th>
<th>Ports</th>
<th>Destination type</th>
<th>Destination</th>
</tr>
</thead>
<tbody>
<tr>
<td>Rule-1</td>
<td>IP/CIDT/IP group</td>
<td><p>*, 10.0.0.0,</p>
<p>172.16.0.0</p></td>
<td>TCP, UDP, ICMP, Any</td>
<td>80, 150-155</td>
<td><p>IP/CIDR/IP group</p>
<p>Service tag/FQDN</p></td>
<td><p>*, 10.0.0.0,</p>
<p>172.16.0.0/24</p></td>
</tr>
<tr>
<td>Test-1</td>
<td>IP_Address</td>
<td>10.0.0.0</td>
<td>TCP</td>
<td>80</td>
<td>IP address</td>
<td></td>
</tr>
<tr>
<td>Test-2</td>
<td>IP Group</td>
<td>ipgroup-oracleappserver</td>
<td>TCP</td>
<td>443</td>
<td>Service tag</td>
<td></td>
</tr>
<tr>
<td>Test-3</td>
<td>IP_Address</td>
<td>10.0.0.0</td>
<td>UDP</td>
<td>150</td>
<td>IP Group</td>
<td></td>
</tr>
<tr>
<td>Test-4</td>
<td>IP Group</td>
<td>ipgroup-oracleappserver</td>
<td>UDP</td>
<td>135</td>
<td>FQDN</td>
<td></td>
</tr>
</tbody>
</table>

Application rule collection group

- Priority: 101

- Action: Allow

<table>
<colgroup>
<col style="width: 5%" />
<col style="width: 13%" />
<col style="width: 20%" />
<col style="width: 10%" />
<col style="width: 12%" />
<col style="width: 16%" />
<col style="width: 19%" />
</colgroup>
<thead>
<tr>
<th>Name</th>
<th>Source type</th>
<th>Source</th>
<th>Protocol</th>
<th>TLS Inspection</th>
<th>Destination type</th>
<th>Destination</th>
</tr>
</thead>
<tbody>
<tr>
<td>Rule-1</td>
<td>IP/CIDR/IP group</td>
<td>*, 10.0.0.0, 172.16.0.0</td>
<td><p>HTTP/HTTPS,</p>
<p>FTP/FTPS</p>
<p>RDP/SSH</p></td>
<td>80, 150-155</td>
<td><p>FQDN/FQDN tag</p>
<p>Web URL/Categories</p></td>
<td>*, 10.0.0.0, 172.16.0.0/24</td>
</tr>
<tr>
<td>Test-1</td>
<td>IP_Address</td>
<td>10.0.0.0</td>
<td></td>
<td>80</td>
<td>FQDN</td>
<td>*.microsoft.com</td>
</tr>
<tr>
<td>Test-2</td>
<td>IP Group</td>
<td>ipgroup-oracleappserver</td>
<td></td>
<td>443</td>
<td>FQDN tag</td>
<td></td>
</tr>
<tr>
<td>Test-3</td>
<td>IP_Address</td>
<td>10.0.0.0</td>
<td></td>
<td>150</td>
<td>URL</td>
<td><a href="http://www.microsoft.com/">www.microsoft.com</a></td>
</tr>
<tr>
<td>Test-4</td>
<td>IP Group</td>
<td>ipgroup-oracleappserver</td>
<td></td>
<td>135</td>
<td>Web Categories</td>
<td></td>
</tr>
</tbody>
</table>

DNAT rule collection group

DNAT stands for Destination Network Address Translation.

- Priority:

- Action: Allow

<table style="width:100%;">
<colgroup>
<col style="width: 3%" />
<col style="width: 9%" />
<col style="width: 13%" />
<col style="width: 5%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 14%" />
<col style="width: 7%" />
<col style="width: 16%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th>Name</th>
<th>Source type</th>
<th>Source</th>
<th>Protocol</th>
<th>Destination port</th>
<th>Destination type</th>
<th>Destination</th>
<th>Translated type</th>
<th>Translated address or FQDN</th>
<th>Translated port</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>IP/CIDR/ IP group</td>
<td><p>*, 10.0.0.0,</p>
<p>172.16.0.0</p></td>
<td><p>HTTP</p>
<p>RDP</p>
<p>FTP</p>
<p>SMTP</p></td>
<td>80, 150-155</td>
<td>IP address, FQDN</td>
<td><p>*, 10.0.0.0,</p>
<p>172.16.0.0/24</p></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>1</td>
<td>IP Address</td>
<td>10.0.0.0</td>
<td></td>
<td>80</td>
<td>IP address</td>
<td>172.16.0.0</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>2</td>
<td>IP Group</td>
<td>ipgroup-oracleappserver</td>
<td></td>
<td>443</td>
<td>IP address</td>
<td>172.16.0.0</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>3</td>
<td>IP Address</td>
<td>10.0.0.0</td>
<td></td>
<td>150</td>
<td>FQDN</td>
<td>*.microsoft.com</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>4</td>
<td>IP Group</td>
<td>ipgroup-oracleappserver</td>
<td></td>
<td>135</td>
<td>FQDN</td>
<td>*.microsoft.com</td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## Logging and Monitoring

## Design and Implementation

How to design and implement NSG and ASG?

## Application Security Group

What is ASG and how to design and implement ASG?

## Securing azure network with segmentation and access Control

There are several methods for securing your Azure cloud network using
network segmentation and access control mechanisms.

**Key Points:**

- **Azure Virtual Networks (VNets) and Subnets:**

  - VNets and subnets are the building blocks for network segmentation.

  - You can isolate high-risk or high-value resources in separate VNets
    or subnets.

- **Network Security Groups (NSGs):**

  - NSGs act as firewalls, controlling traffic flow based on rules
    defined for ports, protocols, source, and destination IP addresses.

  - Follow a "deny-by-default" approach with NSGs, explicitly allowing
    only authorized traffic.

  - **Application Security Groups (ASGs):** For complex applications,
    ASGs simplify NSG configuration by grouping VMs and defining
    security policies based on those groups.

- **Azure Policies:**

  - Azure policies enforce security best practices within your Azure
    environment.

  - The passage recommends specific policies like:

    - Restricting all network ports on VM-associated NSGs.

    - Disabling IP forwarding on VMs.

    - Routing all internet traffic through a deployed Azure Firewall
      (preview).

- **Securing Cloud Services with Private Endpoints:**

  - Azure Private Link enables private access to Azure services within
    your VNet, bypassing the public internet.

  - This reduces the attack surface and strengthens security.

**Additional Resources:**

- VNet concepts and best practices:
  <https://learn.microsoft.com/en-us/azure/virtual-network/>

- Network Security Groups:
  <https://learn.microsoft.com/en-us/azure/virtual-network/manage-network-security-group>

- Application Security Groups:
  <https://learn.microsoft.com/en-us/azure/virtual-network/application-security-groups>

- Azure Private Link:
  <https://learn.microsoft.com/en-us/azure/private-link/>

- Security architecture:
  <https://learn.microsoft.com/en-us/azure/security/>

By implementing these network segmentation and access control
techniques, you can significantly improve the security posture of your
Azure cloud environment.

Secure cloud services with network controls (Private Endpoints)

- Secure cloud services by establishing a private access point for the
  resources. You should also disable or restrict access from public
  network when possible.

- Deploy private endpoints for all azure resources that support the
  Private Link feature, to establish a private access point for the
  resources. You should also disable or restrict public network access
  to services where feasible.

- For certain services, you also have the option to deploy VNet
  integration for the service where you can restrict the VNET to
  establish a private access point for the service."

## Azure Policy

- Adaptive network hardening recommendations should be applied on
  internet facing virtual machines

- All Internet traffic should be routed via your deployed Azure Firewall

- All network ports should be restricted on network security groups
  associated to your virtual machine

- Azure Firewall Led the security assessment of azure security services
  such as Azure Firewall

<!-- -->

- Configure diagnostic settings for Azure Network Security Groups to Log
  Analytics workspace

- Configure network security groups to enable traffic analytics

- Configure network security groups to use specific workspace for
  traffic analytics

- Deploy a flow log resource with target network security group

<!-- -->

- Finding the most efficient way to implement firewall policies across
  Contoso's multiple Azure regions.

<!-- -->

- Flow logs should be enabled for every network security group

- Gateway subnets should not be configured with a network security group

<!-- -->

- Internet-facing virtual machines should be protected with Network
  Security Groups

- IP Forwarding on your virtual machine should be disabled

- Management ports of virtual machines should be protected with
  just-in-time network access control

- Management ports should be closed on your virtual machines

<!-- -->

- Network Watcher flow logs should have traffic analytics enabled

<!-- -->

- Non-internet-facing virtual machines should be protected with network
  security groups

- NSG Led the security assessment of azure security services such as
  network security groups,

- Secured Virtual Hubs and Hub Virtual Networks.

- Subnets should be associated with a Network Security Group

- Virtual network design considerations and configuration options for
  Azure Active Directory Domain Services

Understand Azure Private Link:
<https://docs.microsoft.com/azure/private-link/private-link-overview>

Security architecture:
<https://docs.microsoft.com/azure/cloud-adoption-framework/organize/cloud-security-architecture>

## Best practices
