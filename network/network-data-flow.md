# Network Data Flow: From Browser HTTPS Request to Organization Infrastructure

A packet-level breakdown of what happens after a browser sends an HTTPS request, covering client-side networking, ISP transit, BGP routing, and CDN behavior — up to the point where the request reaches an organization's perimeter.

## Table of Contents

1. [Request Leaves the Client Network](#1-request-leaves-the-client-network)
2. [ISP Network Processing](#2-isp-network-processing)
3. [Internet Routing](#3-internet-routing)
4. [CDN Edge Nodes (If Used)](#4-cdn-edge-nodes-if-used)
5. [Summary Flow](#5-summary-flow)

---

## 1. Request Leaves the Client Network

### 1.1 Protocol Encapsulation

When the browser sends an HTTPS request, the HTTP request is encrypted, segmented, and wrapped through several protocol layers before it becomes a transmittable frame:

```flow
HTTP Request
   ↓
TLS Encryption
   ↓
TCP Segment
   ↓
IP Packet
   ↓
Ethernet Frame
```

Example packet fields:

| Field | Value |
|---|---|
| Source IP | 192.168.1.10 |
| Destination IP | 34.102.55.10 |
| Source Port | 52341 |
| Destination Port | 443 |
| Protocol | TCP |

### 1.2 Browser Sends Packet to the OS Network Stack

The browser passes the request to the operating system's TCP/IP stack, which performs:

- TCP segmentation
- IP addressing
- Routing table lookup
- ARP resolution
- Packet encapsulation

### 1.3 OS Routing Table Decision

The OS checks its routing table to determine where to send the packet.

Example routing table:

| Destination | Gateway | Interface |
| --- | --- | --- |
| 0.0.0.0/0 | 192.168.1.1 | WiFi Adapter |
| 192.168.1.0/24 | Local | WiFi Adapter |

Since the destination is external, the packet is routed to the default gateway (`192.168.1.1`).

### 1.4 ARP Resolution

If the router's MAC address is unknown, the system broadcasts an ARP request:

```flow
Who has 192.168.1.1?
Tell 192.168.1.10
```

The router responds:

```flow
192.168.1.1 → MAC 00:1A:2B:3C:4D:5E
```

The MAC address is then cached in the ARP table.

### 1.5 Local Firewall Inspection

Before leaving the host, traffic passes through the local host firewall — for example, Windows Defender Firewall, Linux `iptables`, or macOS PF.

The firewall checks:

- Outbound rules
- Blocked ports
- Application policies

Example rule:

```flow
Allow outbound TCP 443
Block suspicious processes
```

If allowed, the packet is forwarded to the network interface.

### 1.6 Packet Sent to the Network Interface

The OS hands the packet to the NIC (Network Interface Card), which encapsulates the IP packet into an Ethernet frame:

```flow
Destination MAC → Router MAC
Source MAC      → Client MAC
Payload         → IP Packet
```

The frame is transmitted via WiFi or Ethernet.

### 1.7 Router Receives the Packet

The home/office router receives the packet and performs:

- Layer 2 frame decoding
- NAT processing
- Firewall inspection
- Routing decision

### 1.8 Network Address Translation (NAT)

Most home networks use private IP addresses. The router replaces the client's private IP with its public IP:

```flow
192.168.1.10:52341 → 103.25.84.210:52341
```

The router maintains a NAT translation table:

| Internal IP | External IP |
|--- | --- |
| 192.168.1.10 | 103.25.84.210 |

### 1.9 Router Firewall Inspection

The router firewall checks outbound traffic rules, suspicious patterns, and blocked ports.

Example rule:

```flow
Allow outbound 80/443
Block inbound unsolicited traffic
```

### 1.10 Packet Sent to the ISP Modem / Gateway

The packet is forwarded to the ISP modem or gateway device, over a transmission technology such as fiber, DSL, cable, cellular, or satellite.

---

## 2. ISP Network Processing

### 2.1 Packet Enters the ISP Access Network

The packet reaches the ISP edge router, where the ISP performs packet inspection, traffic shaping, and routing decisions. Some ISPs also apply basic security filtering, such as anti-spoofing, botnet filtering, and rate limiting.

### 2.2 Source IP Validation

ISPs may implement BCP 38 anti-spoofing, checking whether the source IP belongs to the customer's network. If the source IP appears spoofed, the packet is dropped.

### 2.3 ISP Traffic Classification

Some ISPs classify traffic into categories such as HTTP/HTTPS, VoIP, streaming, and P2P. This classification is used for QoS prioritization and bandwidth shaping.

### 2.4 Packet Routed to the ISP Backbone

The packet enters the ISP backbone network, composed of high-capacity routers operating at typical speeds of 10, 40, 100, or 400 Gbps. Backbone routers perform Layer 3 routing using global routing tables.

---

## 3. Internet Routing

### 3.1 Global Internet Routing

The internet is composed of Autonomous Systems (AS). Examples:

| AS Number | Organization |
| --- | --- |
| AS15169 | Google |
| AS16509 | AWS |
| AS13335 | Cloudflare |
| AS9498 | Bharti Airtel |

Each ISP belongs to an Autonomous System.

### 3.2 Border Gateway Protocol (BGP)

Routers exchange routing information using BGP, which determines the best path to a destination IP.

Example route advertisement:

```flow
34.102.0.0/16 → AS15169   (belongs to Google)
```

### 3.3 BGP Route Selection

Routers choose the best route based on AS path length, local preference, MED, and route policies.

Example path:

```flow
AS9498 → AS3356 → AS15169
```

### 3.4 Inter-ISP Peering

Traffic may pass through multiple networks:

```flow
User ISP
 ↓
Regional ISP
 ↓
Tier 1 Backbone
 ↓
Destination ISP
```

Tier 1 networks include Level 3, Cogent, Telia, and NTT.

### 3.5 Internet Exchange Points (IXP)

Traffic between ISPs often happens at Internet Exchange Points, such as DE-CIX, AMS-IX, LINX, and NIXI (India). These reduce latency, improve bandwidth, and lower transit cost.

### 3.6 Packet Hop-by-Hop Routing

At each router along the path:

1. Packet received
2. Destination IP examined
3. Routing table lookup
4. Next-hop selected
5. TTL reduced
6. Packet forwarded

Example traceroute path:

```flow
Client
 ↓
Home Router
 ↓
ISP Edge Router
 ↓
Regional Router
 ↓
Tier-1 Backbone Router
 ↓
Destination ISP Router
 ↓
Destination Network
```

### 3.7 Time-To-Live (TTL) Protection

Each IP packet has a TTL field (e.g., `TTL = 64`). Each router reduces the TTL by 1; if it reaches 0, the packet is discarded. This prevents routing loops.

---

## 4. CDN Edge Nodes (If Used)

### 4.1 DNS Points to CDN Edge

If the website uses a CDN, DNS resolves the hostname to a CDN edge IP:

```flow
cdn.example.com → CDN edge IP
```

Examples of CDNs: Cloudflare, Akamai, Fastly, AWS CloudFront.

### 4.2 CDN Edge Server Receives Request

The CDN edge node, geographically close to the user, handles caching, TLS termination, DDoS protection, and bot filtering.

### 4.3 CDN Cache Lookup

The CDN checks whether the requested resource is cached (e.g., images, CSS, JavaScript, static pages).

- If cached → the response is returned immediately.
- If not cached → the request is forwarded to the origin server.

### 4.4 CDN Security Filtering

The CDN may perform bot detection, rate limiting, IP reputation checks, geo-blocking, and WAF filtering.

### 4.5 Request Forwarded to Origin

On a cache miss, the CDN establishes a secure connection to the origin server and forwards the request.

---

## 5. Summary Flow

```flow
Browser
 ↓
OS Network Stack
 ↓
Local Firewall
 ↓
Network Interface
 ↓
Router (NAT)
 ↓
ISP Access Network
 ↓
ISP Edge Router
 ↓
ISP Backbone
 ↓
BGP Internet Routing
 ↓
Internet Exchange Points
 ↓
Destination Network
 ↓
CDN Edge (optional)
 ↓
Organization Perimeter
```

---

## Related Topics

A follow-up deep dive could cover the security monitoring view of this same layer, including:

- Where DDoS attacks happen
- Where IP spoofing occurs
- Where MITM attacks occur
- Where BGP hijacking happens
- How a SOC monitors this layer

This is useful context for cybersecurity architecture, threat modeling, and SOC workflows.
