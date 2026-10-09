# IP Addressing Basics (IPv4)

## Overview

Internet Protocol version 4 (IPv4) uses a **32-bit address** represented as four octets separated by periods.

Example:

```text
192.168.10.15
```

Each octet ranges from **0 to 255**, resulting in approximately **4.29 billion** unique IPv4 addresses.

IPv4 networks are identified using **CIDR (Classless Inter-Domain Routing)** notation.

Example:

```text
192.168.1.0/24
```

Where:

- `192.168.1.0` = Network Address
- `/24` = Prefix Length (Subnet Mask 255.255.255.0)

---

# CIDR and Subnet Mask Cross Reference

| CIDR | Subnet Mask |
|------:|-----------------|
| /0 | 0.0.0.0 |
| /1 | 128.0.0.0 |
| /2 | 192.0.0.0 |
| /3 | 224.0.0.0 |
| /4 | 240.0.0.0 |
| /5 | 248.0.0.0 |
| /6 | 252.0.0.0 |
| /7 | 254.0.0.0 |
| /8 | 255.0.0.0 |
| /9 | 255.128.0.0 |
| /10 | 255.192.0.0 |
| /11 | 255.224.0.0 |
| /12 | 255.240.0.0 |
| /13 | 255.248.0.0 |
| /14 | 255.252.0.0 |
| /15 | 255.254.0.0 |
| /16 | 255.255.0.0 |
| /17 | 255.255.128.0 |
| /18 | 255.255.192.0 |
| /19 | 255.255.224.0 |
| /20 | 255.255.240.0 |
| /21 | 255.255.248.0 |
| /22 | 255.255.252.0 |
| /23 | 255.255.254.0 |
| /24 | 255.255.255.0 |
| /25 | 255.255.255.128 |
| /26 | 255.255.255.192 |
| /27 | 255.255.255.224 |
| /28 | 255.255.255.240 |
| /29 | 255.255.255.248 |
| /30 | 255.255.255.252 |
| /31 | 255.255.255.254 |
| /32 | 255.255.255.255 |

---

# CIDR Prefix Quick Reference

| CIDR | Total Addresses | Usable Hosts* |
|------:|---------------:|--------------:|
| /32 | 1 | 1 (Single Host) |
| /31 | 2 | 2 (Point-to-Point per RFC 3021) |
| /30 | 4 | 2 |
| /29 | 8 | 6 |
| /28 | 16 | 14 |
| /27 | 32 | 30 |
| /26 | 64 | 62 |
| /25 | 128 | 126 |
| /24 | 256 | 254 |
| /23 | 512 | 510 |
| /22 | 1,024 | 1,022 |
| /21 | 2,048 | 2,046 |
| /20 | 4,096 | 4,094 |
| /19 | 8,192 | 8,190 |
| /18 | 16,384 | 16,382 |
| /17 | 32,768 | 32,766 |
| /16 | 65,536 | 65,534 |
| /15 | 131,072 | 131,070 |
| /14 | 262,144 | 262,142 |
| /13 | 524,288 | 524,286 |
| /12 | 1,048,576 | 1,048,574 |
| /11 | 2,097,152 | 2,097,150 |
| /10 | 4,194,304 | 4,194,302 |
| /9 | 8,388,608 | 8,388,606 |
| /8 | 16,777,216 | 16,777,214 |

> *Traditional IPv4 networks reserve the first and last address for the network and broadcast addresses. Cloud providers such as Azure reserve additional addresses within each subnet.

---

# Legacy IPv4 Address Classes

Although modern networks use **CIDR**, understanding the original IPv4 classes is still useful.

| Class | First Octet | Default Prefix | Default Mask | Typical Usage |
|---------|------------|---------------|----------------|----------------|
| A | 1–126 | /8 | 255.0.0.0 | Very large networks |
| B | 128–191 | /16 | 255.255.0.0 | Medium-sized networks |
| C | 192–223 | /24 | 255.255.255.0 | Small networks |
| D | 224–239 | N/A | N/A | Multicast |
| E | 240–255 | N/A | N/A | Experimental/Reserved |

> **Note:** Classful networking has been replaced by CIDR (RFC 4632).

---

# Important IPv4 Address Ranges

| Address Range | Type | Purpose |
|---------------|------|---------|
| 0.0.0.0 | Unspecified | Represents the default route or an unknown address |
| 0.0.0.0/8 | Reserved | Current network |
| 10.0.0.0/8 | Private | RFC 1918 private network |
| 100.64.0.0/10 | Shared Address Space | Carrier Grade NAT (CGNAT) |
| 127.0.0.0/8 | Loopback | Local host communication |
| 169.254.0.0/16 | Link-Local | APIPA (Automatic Private IP Addressing) |
| 172.16.0.0/12 | Private | RFC 1918 private network |
| 192.0.0.0/24 | Reserved | IETF protocol assignments |
| 192.0.2.0/24 | Documentation | TEST-NET-1 |
| 192.88.99.0/24 | Deprecated | Former 6to4 relay |
| 192.168.0.0/16 | Private | RFC 1918 private network |
| 198.18.0.0/15 | Benchmark Testing | Network performance testing |
| 198.51.100.0/24 | Documentation | TEST-NET-2 |
| 203.0.113.0/24 | Documentation | TEST-NET-3 |
| 224.0.0.0/4 | Multicast | Multicast traffic |
| 240.0.0.0/4 | Reserved | Future use |
| 255.255.255.255 | Broadcast | Limited broadcast |

---

# RFC 1918 Private Address Space

These address ranges are **not routable on the public Internet**.

| Network | CIDR | Addresses |
|----------|------|-----------|
| 10.0.0.0 | /8 | 16,777,216 |
| 172.16.0.0 | /12 | 1,048,576 |
| 192.168.0.0 | /16 | 65,536 |

Private addresses require **Network Address Translation (NAT)** to communicate with public Internet resources.

---

# Special IPv4 Addresses

| Address | Description |
|----------|-------------|
| 0.0.0.0 | Default route / unspecified address |
| 127.0.0.1 | Localhost |
| 255.255.255.255 | Limited broadcast |
| x.x.x.0 | Network address (traditional subnet) |
| x.x.x.255 | Broadcast address (traditional /24 subnet) |

---

# Public vs Private IP Addresses

## Public IP

- Globally routable
- Assigned by ISPs or cloud providers
- Reachable from the Internet
- Must be globally unique

Example:

```text
8.8.8.8
```

---

## Private IP

- Used within private networks
- Not routable over the public Internet
- Requires NAT for Internet access
- Defined by RFC 1918

Example:

```text
10.1.20.15
```

---

# CIDR Examples

| Network | Prefix | Hosts |
|----------|--------|------:|
| 10.0.0.0/8 | Large enterprise | 16,777,214 |
| 172.16.0.0/16 | Regional network | 65,534 |
| 192.168.1.0/24 | Small LAN | 254 |
| 192.168.1.128/25 | Half subnet | 126 |
| 192.168.1.192/26 | Small subnet | 62 |
| 192.168.1.224/27 | Department | 30 |
| 192.168.1.240/28 | Small workload | 14 |
| 192.168.1.248/29 | Infrastructure devices | 6 |
| 192.168.1.252/30 | Point-to-point | 2 |
| 192.168.1.10/32 | Single host | 1 |

---

# Cloud Networking Considerations (Azure)

Azure Virtual Networks (VNets) use **CIDR notation** to define address spaces and subnets.

Example:

```text
VNet:
10.10.0.0/16

Subnet-Web
10.10.1.0/24

Subnet-App
10.10.2.0/24

Subnet-Database
10.10.3.0/24
```

### Azure Subnet Reservations

Azure reserves **five IP addresses** in every subnet:

- First address (Network Address)
- Default gateway
- Azure DNS
- Azure reserved
- Last address (Broadcast reservation)

For example:

Subnet:

```text
10.0.0.0/24
```

Total addresses:

```text
256
```

Azure usable addresses:

```text
251
```

---

# Networking Best Practices

- Use CIDR instead of legacy classful addressing.
- Plan IP addressing to avoid overlapping networks.
- Reserve address space for future growth.
- Keep production, management, and application networks segmented.
- Use private address ranges for internal workloads.
- Allocate subnet sizes based on workload growth rather than immediate requirements.
- Document IP allocation and subnet ownership.
- Use network security controls (NSGs, Azure Firewall, route tables) to enforce segmentation.
- Avoid using excessively large address spaces without justification.
- Follow cloud provider subnet size limitations and reserved address rules.

---

# Summary

- IPv4 addresses are 32 bits long.
- CIDR replaces legacy classful networking.
- RFC 1918 defines private IPv4 address ranges.
- Public IP addresses are globally routable; private IP addresses require NAT.
- Azure and other cloud platforms rely heavily on CIDR-based subnetting.
- Proper IP planning improves scalability, security, and operational efficiency.