**Load Balancing in Azure**

Load balancing is the process of distributing incoming network traffic
across multiple servers or services to improve performance, reliability,
and scalability. Azure offers several load balancing services to meet
different application needs.

Azure Load Balancer

- **Layer 4 load balancer:** Distributes traffic based on IP address and
  port number.

- **High availability:** Provides fault tolerance by redirecting traffic
  away from unhealthy instances.

- **Types**:

  - Basic

  - Standard (offers additional features like health probes, load
    balancing rules).

Azure Traffic Manager

- **DNS-based load balancer:** Distributes traffic across multiple Azure
  regions based on geographic location, performance, or failover
  criteria.

- **Global load balancing:** Optimizes application performance and
  availability across different regions.

Azure Application Gateway

- **Layer 7 load balancer:** Distributes traffic based on
  application-layer information (HTTP/HTTPS).

- **Advanced features:** Offers features like SSL termination, web
  application firewall (WAF), and cookie-based affinity.

- **Application optimization:** Improves application performance and
  user experience.

In summary, Azure provides a range of load balancing services to suit
various application requirements, from simple load distribution to
complex traffic management and application optimization.

# Load Balancer

- Balances inbound and outbound connections to applications or service
  endpoints.

- An Azure load balancer is a Layer-4 (TCP, UDP) load balancer that
  provides high availability by distributing incoming traffic among
  healthy VMs. To distribute traffic to the VMs, a back-end address pool
  contains the IP addresses of the virtual (NICs) connected to the load
  balancer.

- The load balancer is used to distribute the incoming traffic to the
  pool of virtual machines. It stops routing the traffic to a failed
  virtual machine in the pool. In this way, we can make our application
  resilient to any software or hardware failures in that pool of virtual
  machines.

- Types of Azure Load Balancer:

- Load Balancer: Basic and Standard, Regional

- Application Gateway – Regional, WAF

- Traffic Manager - Global

- Front Door – Global, WAF

<img src="media/image1.png" style="width:6.55139in;height:2.17785in" />

Summary of your business needs:

- Does your application use HTTP/HTTPS? **Yes**

- Is your application public (internet facing)? **Yes**

- Is your application deployed in multiple regions? **Yes**

- Do you want performance acceleration? **Yes**

- Do you want SSL offloading or application layer processing per
  request? **Yes**

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 19%" />
<col style="width: 20%" />
<col style="width: 18%" />
<col style="width: 21%" />
</colgroup>
<thead>
<tr>
<th><strong>Service</strong></th>
<th><p><strong>Application gateway</strong></p>
<p>Optimize delivery from application server farms while increasing
application security with web application firewall.</p></th>
<th><p><strong>Front door</strong></p>
<p>Scalable, security-enhanced delivery point for global, micro
service-based web applications.</p></th>
<th><p><strong>Load balancer</strong></p>
<p>Balance inbound and outbound connections and requests to your
applications or server endpoints.</p></th>
<th><p><strong>Traffic manager</strong></p>
<p>Distribute traffic optimally to services across global Azure regions,
while providing high availability and responsiveness.</p></th>
</tr>
</thead>
<tbody>
<tr>
<td>Supported protocols</td>
<td>HTTP, HTTPS, HTTP2</td>
<td>HTTP, HTTPS, HTTP2</td>
<td>TCP, UDP</td>
<td>Any</td>
</tr>
<tr>
<td>Private load balancing</td>
<td><strong>Yes</strong></td>
<td></td>
<td><strong>Yes</strong></td>
<td></td>
</tr>
<tr>
<td>Global load balancing</td>
<td></td>
<td><strong>Yes</strong></td>
<td><strong>Yes</strong></td>
<td><strong>Yes</strong></td>
</tr>
<tr>
<td>Routing policies</td>
<td>Round robin</td>
<td>Latency, priority, round robin, weighted round robin</td>
<td>Hash based</td>
<td>Geographical, latency, weighted, priority, subnet, multi-value</td>
</tr>
<tr>
<td>Supported environments</td>
<td><p>Azure, on prem</p>
<p>non-Azure cloud,</p></td>
<td><p>Azure, on prem,</p>
<p>non-Azure cloud</p></td>
<td>Azure</td>
<td><p>Azure, on-prem</p>
<p>non-Azure cloud,</p></td>
</tr>
<tr>
<td>Connection draining</td>
<td><strong>Yes</strong></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Session affinity</td>
<td><strong>Yes</strong></td>
<td><strong>Yes</strong></td>
<td><strong>Yes</strong></td>
<td></td>
</tr>
<tr>
<td>Host and path-based load balancing</td>
<td><strong>Yes</strong></td>
<td><strong>Yes</strong></td>
<td></td>
<td></td>
</tr>
<tr>
<td>TLS offloading</td>
<td><strong>Yes</strong></td>
<td><strong>Yes</strong></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Site acceleration</td>
<td></td>
<td><strong>Yes</strong></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Security</td>
<td>WAF, NSG</td>
<td>WAF</td>
<td>NSG</td>
<td></td>
</tr>
<tr>
<td>Caching and compression</td>
<td></td>
<td><strong>Yes</strong></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

- **Connection draining** means gracefully remove backend pool members
  during planned service updates.

- **Session affinity** useful when you want to keep a user session on
  the same server.

- **Host/path-based load balancing** means Application-layer processing
  to route requests to endpoints being load balanced.

- **TLS offloading** means TLS termination at the load balancing
  service, data will flow unencrypted to the backend servers.

- **TLS termination** means process of decrypting HTTPS traffic at
  specific point, like load balancer or a reverse proxy, before
  forwarding it to final webserver. As traffic is decrypted before
  reaching webservers, server itself is not able to see certain client
  information such as client ip address. Adds additional attack surface
  as one more device added in end-to-end communication.

- **Round robin routing** is a method for distributing tasks or requests
  among a group of resources in a fair and sequential manner. It is like
  a circular queue, ensuring each resource gets a chance before looping
  back.
