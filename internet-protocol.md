**IP (Internet Protocol)** is the foundation for communication on the
internet. It assigns a unique identifier called an **IP address** to
every connected device, enabling data transfer between them. IP is a
connectionless protocol, meaning it does not guarantee delivery or order
of data packets.

**IPsec (IP Security)** is a suite of protocols that secure IP
communication. It authenticates and encrypts each IP packet, protecting
data privacy and integrity. IPsec is often used in VPNs to establish
secure connections between devices.

**IP Addressing** comes in two primary versions: IPv4 and IPv6. IPv6 was
developed to address the limitations of IPv4 and provide a larger
address space.

What is the role of IP addresses in TCP/IP communication?

Role of IP Addresses in TCP/IP Communication

**IP addresses are the fundamental building blocks for communication on
the internet.** They serve as unique identifiers for devices connected
to a network. In the context of TCP/IP communication, they play a
crucial role in routing data packets from the source to the destination.

**Key Functions of IP Addresses:**

- **Unique Identification:** Each device connected to a network has a
  unique IP address, allowing it to be distinguished from others.

- **Addressing:** IP addresses provide the destination address for data
  packets. Routers use this information to determine the best path to
  forward the packets.

- **Routing:** Routers examine the destination IP address in a packet
  header to decide the next hop in the network towards the destination.

- **Communication Establishment:** TCP, while responsible for reliable
  data transfer, uses IP addresses to initiate connections between
  devices.

**To summarize:**

IP addresses are like postal addresses for the internet. They provide
the necessary information for data packets to travel across networks and
reach their intended recipients. Without IP addresses, the internet as
we know it would not be possible.

## IPv4 addressing

IPv4 Addressing

- 0.0.0.0 – Default Route network address

- 127.0.0.0 – Loopback address

- Wildcard mask – It indicates which parts of an IP address are
  available for examination.

Private IP Ranges

- Class-A: <span class="mark">10.0.0.0</span> to 10.255.255.255

- Class-B: <span class="mark">172.16.0.0</span> to 172.31.255.255

- Class-C: <span class="mark">192.168.0.0</span> to 192.168.255.255

Public IP Ranges

- Class-A: <span class="mark">1.0.0.0</span> to 9.255.255.255 and
  <span class="mark">11.0.0.0</span> to 126.255.255.255

- Class-B: <span class="mark">128.0.0.0</span> to 171.255.255.255 and
  <span class="mark">173.0.0.0</span> to 191.255.255.255

- Class-C: <span class="mark">192.0.0.0</span> to 195.255.255.255 and
  <span class="mark">197.0.0.0</span> to 223.255.255.255

- Class-D: <span class="mark">224.0.0.0</span> to 247.255.255.255
  Multicast Addresses

- Class-E: <span class="mark">248.0.0.0</span> to 255.255.255.254
  Experimental Use

<table style="width:100%;">
<colgroup>
<col style="width: 9%" />
<col style="width: 19%" />
<col style="width: 20%" />
<col style="width: 21%" />
<col style="width: 27%" />
</colgroup>
<thead>
<tr>
<th>Class</th>
<th>Usage</th>
<th>From</th>
<th>To</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td>Default Route</td>
<td>0.0.0.0</td>
<td>0.0.0.0</td>
<td></td>
</tr>
<tr>
<td rowspan="3">Class - A</td>
<td>Public</td>
<td>1.0.0.0</td>
<td>9.255.255.255</td>
<td>Supports 16 million hosts on each of 127 networks</td>
</tr>
<tr>
<td>Private</td>
<td>10.0.0.0</td>
<td>10.255.255.255</td>
<td></td>
</tr>
<tr>
<td>Public</td>
<td>11.0.0.0</td>
<td>126.255.255.255</td>
<td></td>
</tr>
<tr>
<td></td>
<td>Loopback</td>
<td>127.0.0.0</td>
<td>127.0.0.0</td>
<td></td>
</tr>
<tr>
<td rowspan="5">Class - B</td>
<td>Public</td>
<td>128.0.0.0</td>
<td>171.255.255.255</td>
<td>Supports 65000 hosts on each of 16000 networks</td>
</tr>
<tr>
<td></td>
<td>172.0.0.0</td>
<td>172.15.255.255</td>
<td></td>
</tr>
<tr>
<td>Private</td>
<td>172.16.0.0</td>
<td>172.31.255.255</td>
<td></td>
</tr>
<tr>
<td></td>
<td>172.32.0.0</td>
<td>172.255.255.255</td>
<td></td>
</tr>
<tr>
<td>Public</td>
<td>173.0.0.0</td>
<td>191.255.255.255</td>
<td></td>
</tr>
<tr>
<td rowspan="3">Class - C</td>
<td>Public</td>
<td>192.0.0.0</td>
<td>195.255.255.255</td>
<td>Supports 254 hosts on each of 2 million hosts</td>
</tr>
<tr>
<td>Private</td>
<td>192.168.0.0</td>
<td>192.168.255.255</td>
<td></td>
</tr>
<tr>
<td>Public</td>
<td>197.0.0.0</td>
<td>223.255.255.255</td>
<td></td>
</tr>
<tr>
<td>Class - D</td>
<td>Multicast Addresses</td>
<td>224.0.0.0</td>
<td>239.255.255.255</td>
<td>Reserved for multicast groups</td>
</tr>
<tr>
<td rowspan="2">Class - E</td>
<td>Experimental Use</td>
<td>240.0.0.0</td>
<td>254.255.255.254</td>
<td>Reserved for future use, and R&amp;D</td>
</tr>
<tr>
<td></td>
<td>255.255.255.255</td>
<td>255.255.255.255</td>
<td></td>
</tr>
</tbody>
</table>

How does IPv6 differ from IPv4 in terms of addressing and functionality?

**IPv4 vs IPv6: A Comparison**

**Addressing**

- **IPv4:** Uses a 32-bit address, represented in dotted decimal
  notation (e.g., 192.168.1.1). This limited address space has been a
  major bottleneck as the number of internet-connected devices has
  exploded.  

- **IPv6:** Employs a 128-bit address, represented in hexadecimal
  notation (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334). This vastly
  expanded address space can accommodate the growing number of connected
  devices.  

**Functionality**

- **IPv4:**

  - Header format is relatively complex with optional fields.  

  - Relies on Network Address Translation (NAT) to conserve addresses,
    which can introduce complexities and security risks.

  - Limited support for quality of service (QoS) features.  

  - Security features are not built-in.  

- **IPv6:**

  - Simpler header format, improving efficiency and reducing overhead.  

  - No need for NAT due to the vast address space.  

  - Built-in support for QoS, allowing for better management of network
    traffic.  

  - Incorporates security features like IPsec, providing end-to-end
    encryption and authentication.  

  - Supports autoconfiguration, simplifying network setup.  

**Key Differences Summary**

| Feature           | IPv4           | IPv6           |
|-------------------|----------------|----------------|
| Address size      | 32 bits        | 128 bits       |
| Address format    | Dotted decimal | Hexadecimal    |
| Address space     | Limited        | Vast           |
| Header complexity | Complex        | Simpler        |
| NAT               | Required       | Not required   |
| QoS               | Limited        | Built-in       |
| Security          | Not built-in   | IPsec built-in |
| Autoconfiguration | Limited        | Supported      |

**In essence, IPv6 is a significant upgrade over IPv4, addressing the
limitations of the older protocol and providing a more robust, secure,
and scalable foundation for the internet.**  

## Unicast and Multicast IP

Can you give me an overview of IP multicast?

**Unicast IP** is a one-to-one communication between two devices on a
network. When a device sends a unicast packet, the packet is only sent
to the destination device's IP address. All other devices on the network
ignore the packet.

**Multicast IP** is a one-to-many communication between a single source
device and multiple destination devices on a network. When a device
sends a multicast packet, the packet is sent to a specific multicast
group address. All devices on the network that are members of the
multicast group will receive the packet.

**Multicast** is often used for streaming media, such as live TV and
online video. It can also be used for other applications, such as online
gaming and software updates.

| Feature | Unicast IP | Multicast IP |
|----|----|----|
| Communication | One-to-one | One-to-many |
| Destination | Single IP address | Multicast group address |
| Packet forwarding | All devices on the network ignore the packet except for the destination device | All devices on the network that are members of the multicast group will receive the packet |
| Common uses | Web browsing, file transfer, email | Streaming media, online gaming, software updates |

## Classless Inter Domain Routing (CIDR)

- CIDR offers more granular control over IP address allocation compared
  to the older classful addressing system.

- CIDR is represented using the notation /XX, where XX indicates the
  number of bits in the network prefix.

<img src="media/image1.png" style="width:5in;height:1.40833in" />

CIDR Cross Reference

|   Subnet Mask   | CIDR |  No of IP's  |   Subnet Mask   | CIDR | No of IP's |
|:---------------:|:----:|:------------:|:---------------:|:----:|:----------:|
| 000.000.000.000 |  /0  | 4.29 billion | 255.255.128.000 | /17  |   32768    |
| 128.000.000.000 |  /1  | 2.14 billion | 255.255.192.000 | /18  |   16384    |
| 192.000.000.000 |  /2  | 1.07 billion | 255.255.224.000 | /19  |    8192    |
| 224.000.000.000 |  /3  | 536 million  | 255.255.240.000 | /20  |    4096    |
| 240.000.000.000 |  /4  | 268 million  | 255.255.248.000 | /21  |    2048    |
| 248.000.000.000 |  /5  | 134 million  | 255.255.252.000 | /22  |    1024    |
| 252.000.000.000 |  /6  |  67 million  | 255.255.254.000 | /23  |    512     |
| 254.000.000.000 |  /7  |  33 million  | 255.255.255.000 | /24  |    256     |
| 255.000.000.000 |  /8  |  16 million  | 255.255.255.128 | /25  |    128     |
| 255.128.000.000 |  /9  |  8 million   | 255.255.255.192 | /26  |     64     |
| 255.192.000.000 | /10  |  4 million   | 255.255.255.224 | /27  |     32     |
| 255.224.000.000 | /11  |  2 million   | 255.255.255.240 | /28  |     16     |
| 255.240.000.000 | /12  |  1 million   | 255.255.255.248 | /29  |     8      |
| 255.248.000.000 | /13  |     524K     | 255.255.255.252 | /30  |     4      |
| 255.252.000.000 | /14  |     262K     | 255.255.255.254 | /31  |     2      |
| 255.254.000.000 | /15  |     131K     | 255.255.255.255 | /32  |     1      |
| 255.255.000.000 | /16  |    65536     |                 |      |            |

## Role of Subnet in Network Segmentation

What is the purpose of subnet masks in TCP/IP networks? How do they help
with network segmentation?

Subnet Masks: The Network Address Dividers

**Purpose of Subnet Masks**

A subnet mask is a 32-bit number that divides an IP address into two
parts:

- **Network address:** Identifies the network to which the host belongs.
   

- **Host address:** Identifies the specific device within the network.  

Essentially, it acts like a mask that hides the host part of the IP
address, revealing only the network portion.  

**How Subnet Masks Help with Network Segmentation**

Network segmentation involves dividing a large network into smaller
subnetworks. This is crucial for several reasons:  

- **Improved performance:** Reduces network traffic by limiting
  broadcast domains.  

- **Enhanced security:** Isolates different network segments, making it
  harder for attacks to spread.

- **Efficient IP address utilization:** Allows for more efficient
  allocation of IP addresses.  

- **Better network management:** Makes network administration easier by
  dividing the network into smaller, more manageable units.  

Here's how subnet masks play a key role in this process:

1.  **Identifying network and host portions:** A subnet mask defines
    which bits of an IP address belong to the network and which belong
    to the host.  

2.  **Creating subnets:** By changing the subnet mask, you can create
    different subnets within a larger network. For example, a Class C
    network with a default subnet mask of 255.255.255.0 can be divided
    into multiple subnets by using subnet masks like 255.255.255.192 or
    255.255.255.224.  

3.  **Routing:** Routers use subnet masks to determine the network
    destination of a packet and forward it accordingly.  

**In summary**, subnet masks are essential tools for network
administrators to efficiently manage and organize their networks. By
dividing networks into smaller subnets, they contribute to improved
performance, security, and overall network efficiency.  

## Private IP address

A private IP address, also known as an internal or local IP address, is
used in your private network, otherwise known as an internal network. To
connect to the internet, you probably use a router, and your devices
connect to it via cables or Wi-Fi.

The router needs to communicate with every device, and it assigns a
private IP address to each of them. This address is only visible inside
your network, which means it cannot be found on the internet.

<img src="media/image2.png" style="width:3.8335in;height:2.17341in" />

Imagine using a wireless printer to print a document. To do it, you need
to send a request via your PC or mobile device using your private
network. The printer probably has a private IP address of its own, and
it will receive the request to start printing. However, if someone
outside your network attempts to do the same, they will not succeed.

Your private IP addresses are also there to help you with how your
router directs online traffic. Suppose you are researching something
online. When you are using your mobile device to do that, the router
also needs to read your device’s private IP to know where to send search
results. It knows that you are using a mobile device rather than a PC,
thanks to its unique private IP address.

As every device has a private IP address, you probably have several of
them, as two devices connected to the same router cannot have the same
address.

How is your private IP determined?

Private IP addresses look the same as public IP addresses. IPv4
addresses are numeric strings with full stops in between the digits, and
IPv6 addresses are alphanumeric strings with colons in between.

Network routers are also assigned private IP addresses, and they use
them to direct internet traffic internally. The unique thing about
routers is that they have default IP addresses, which are assigned
depending on your router’s manufacturer

While most routers, including Linksys, use 192.168.1.1 as the default IP
address, that is not true for every manufacturer and router model.
NETGEAR and D-Link use 192.168.0.1, while SMC and Belkin use
192.168.2.1. Cisco uses several private addresses, including
192.168.10.2 and 192.168.1.254. You might know these IPs as 192 IP
addresses.

Why use private IP addresses

Even without realizing it, you are probably already using a private IP
address assigned to your device by your router. The question is, how do
we use private IP addresses?

Every device within your home network has a unique private IP, which
helps the router provide instructions or redirect the traffic from the
Internet to the correct device. Moreover, it helps your devices
communicate with each other over the local network. As you can see, a
private IP address is an inseparable part of every network that uses a
router.

## Public IP address

Think of your public IP as your home address. A public IP address
visible on the internet is analogous to a street name and a building
number that determine where you reside. A public IP address is how your
router communicates with the World Wide Web.

Also known as an external IP address, your public IP is the address that
your Internet service provider assigned to you. It is a unique string of
numbers you need to go online. Once online, your router uses private IP
addresses to direct the internet traffic it receives further.

You can search “what is my IP address” using a search engine to find
your public IP address. The sources providing the results can also
reveal your ISP, country, and even city.

Find an IP address using a search engine Of course, personal details
remain anonymous, and, therefore, it is safe to say that your IP address
is not exactly like your home address. That said, your external IP is
more visible if we compare it to a private IP address.

## Private vs Public IP Addresses

Discover the differences between private and public IP addresses and
learn what both bring to the table.

When it comes to the private vs public IP discussion, internet users
often focus on their public IPs. However, did you know that private IPs
exist as well?

Every device connected to the web has an Internet Protocol address or IP
address, and both private and public IPs are equally as important

In this article, we discuss what private and public IP addresses are.
Furthermore, we compare the two to help you understand how they both
work and what the main differences are. We also note how private or
public IP addresses relate to Internet security.

Public and private IP addresses essentially serve the same purpose. Yet,
they are very different in terms of who has access to them. Here is a
short overview of the main differences between these two types of
addresses:

- A private IP address is used in a private or LAN network, while a
  public IP address is used in a public network (internet)

- A private IP cannot be recognized on the internet, whereas a public IP
  is visible online

- A private IP is only unique on the home network, but a public IP is
  unique globally

- A private IP is free, while there are usually costs associated with a
  public IP address

- A network administrator assigns private IP addresses, whereas an ISP
  assigns public IPs

Overall, you need both a public and a private IP address if you want to
access the internet. They work hand in hand to make the entire
experience possible and are both equally as important.

Public IP ranges vs. private IP ranges

The Internet Assigned Numbers Authority (IANA) has reserved certain
ranges of IPv4 addresses for private use. Millions of private networks
around the globe use reserved IP addresses within these ranges. Three
classes exist:

- Class A: 10.0.0.0–10.255.255.255

- Class B: 172.16.0.0–172.31.255.255

- Class C: 192.168.0.0–192.168.255.255

As you can see, these IP address ranges are not wide. However, because
we can reuse private IP address ranges in local networks, they do not
really need to be wide, as local networks all work independently from
each other

Since public IP addresses need to be unique, public address ranges are
much wider than private address ranges. In fact, they include all the
numbers that are not reserved for the private IP ranges.

The three classes shown above are reserved for local networks, but IANA
has the IPv4 Special-Purpose Address Registry that shows how other IP
addresses are reserved for other purposes, such as documentation

Ultimately, every combination of numbers that are not reserved can be
your public IP address, as assigned by your ISP.

## What is LAN?

LAN stands for Local Area Network. It is a network of computers within
the same space, such as a residential area, a university building, or an
office space.

So far, we have discussed private addresses for individual users. As an
individual user, when you start using services from your internet
service provider (ISP), a technician comes and sets up a local network
for you so that you would have an internet connection. Afterward, you
can connect your PC, laptop, mobile phone, and smart home devices, such
as your TV or printer.

However, private networks can be much larger than that. Imagine a
company with multiple devices that need to communicate with each other.
All devices with unique internal IP addresses connect to the internet
via LAN, and nobody outside the network can access it.

## Check your private or public IP address

When you are doing anything online, you are technically using both
public and private IP addresses. As we discussed already, to check your
public address, you can type “what is my IP address” into your search
engine, and you will learn your public IP address instantly.

To check private IP addresses, you need to access network properties via
your device. Here is how to find your private IP address on Windows 10.

Go to Settings and click Network and Internet.

<img src="media/image3.png" style="width:9.69306in;height:4.03472in" />

Select Status on the left and click Properties.

<img src="media/image4.png" style="width:9.69306in;height:3.52708in" />

Scroll down to Properties to find your private IP address on the right
of the IPv4 address.

It is just as easy to find your private IP address on Mac, iOS, and
Android devices.

This example demonstrates how to find the IPv4 address, but remember
that IPv6 addresses exist too. If you wish to learn more, we have
discussed in detail the differences between IPv4 and IPv6 in a
comprehensive guide. Although the latter should have replaced the
former, IPv6 adoption issues continue to plague the global internet.

## Hiding your IP address

There is no need to hide your local IP address. It remains private and
visible only to the devices that are part of the same network. However,
hiding your public IP is always a good idea, as your ISP can trace your
online whereabouts as soon as you establish an internet connection.

Unfortunately, you are more vulnerable to various cyberattacks and other
scams when you are using your public IP, which is why you may choose to
hide it.

If you want your public IP address hidden, you can use a VPN (Virtual
Private Network) or a proxy server. Even though they both offer a higher
level of privacy and security, there are several key differences between
the two.
