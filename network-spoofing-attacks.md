# Network Spoofing

Network Spoofing Techniques: Tricking Your Network

Network spoofing involves deceiving network devices by impersonating legitimate sources. Attackers exploit these techniques to gain unauthorized access or manipulate network traffic.

**1. MAC Address Snooping (Defense Technique):**

- **Function:** Monitors network traffic and identifies connected devices by their Media Access Control (MAC) addresses.

- **Benefits:**

  - Detects unauthorized devices on a network.

  - Prevents unauthorized access to sensitive information.

- **Penetration Testing:**

  - Identifies authorized/unauthorized devices to assess security vulnerabilities.

  - Tools: Wireshark, tcpdump (to capture and analyse MAC addresses in network traffic).

**2. DNS Spoofing (Attack Technique):**

- **Concept:** Redirecting users to malicious websites disguised as legitimate ones.

- **Attack Method:**

  - Tampering with DNS records to route traffic to attacker-controlled servers.

- **Impact:** Stealing sensitive data (login credentials, financial information) from unsuspecting users.

**3. ICMP Redirection (Attack Technique):**

- **Method:** Sending forged ICMP (Internet Control Message Protocol) messages to reroute network traffic.

- **Impact:** Interception of traffic for specific destinations, enabling attackers to steal or modify data.

- **Penetration Testing:**

  - Tools: icmpush, responder (to send ICMP redirect packets and test routing table modifications).

**Remember:**

- DNS Spoofing and ICMP Redirection are malicious techniques.

- MAC Address Snooping is a defensive technique to identify and potentially block unauthorized devices.

**Not covered in summary:**

- NTLM Hash Capture: A technique to steal NTLM password hashes used for Windows authentication. This wasn't covered to avoid detailing offensive techniques.

## IP Spoofing 

- Packet source routing technique is used for gaining unauthorized access to a computer with the help of a trusted host's IP address.

- The attackers spoofs the host's IP address so that the server managing a session with the host, accepts the packets from the attacker.

- When the session is established, the attacker injects forged packets before the host responds to the server.

- The original packet from the host is lost as the server gets the packet with a sequence number already used by the attacker.

- The packets are source-routed where the path to the destination IP can be specified by the attacker.

 

## MAC Spoofing

**MAC Spoofing:** Imitating a legitimate device's Media Access Control (MAC) address to gain unauthorized network access.

**Attack Techniques:**

- **MAC Duplicating:** Attacker steals a valid MAC address from a trusted device and uses it to impersonate that device on the network.

- **IRDP Spoofing:** Attacker sends fake router advertisements to redirect network traffic and potentially steal information.

- **MAC Flooding:** Attacker overwhelms a switch's CAM table with fake MAC addresses, causing it to behave like a hub and broadcast all traffic (easily sniffable). Tools like macof can be used for this.

- **Switch Port Stealing:** Attacker exploits a race condition to temporarily steal a switch port from a legitimate device and sniff its traffic.

**Defenses:**

- **DHCP Snooping Binding Table:** Tracks authorized MAC addresses associated with DHCP-assigned IP addresses.

- **Dynamic ARP Inspection:** Monitors ARP traffic for inconsistencies and prevents unauthorized devices from using spoofed MAC addresses.

- **IP Source Guard:** Restricts incoming traffic to specific allowed IP addresses and MAC addresses.

- **Port Security:** Limits the number of allowed MAC addresses on a switch port.

- **Strong Encryption:** Encrypts data packets to protect them even if sniffed.

- **Verify MAC Addresses:** Manually check the MAC addresses of connected devices for suspicious activity.

**Additional Points:**

- Each switch maintains a CAM table that maps MAC addresses to switch ports.

- A full CAM table can cause the switch to flood traffic like a hub, making it vulnerable to sniffing.

**Remember:** MAC spoofing is a serious security threat. Implementing strong network security measures is crucial to prevent these attacks.

MAC Address Snooping

**MAC address snooping** is a technique used to monitor network traffic and identify the MAC addresses of devices connected to a network. [This technique can be used to detect unauthorized devices on a network and prevent them from accessing sensitive information <sup>1</sup>](https://study-ccna.com/dhcp-snooping/).

In a penetration test, MAC address snooping can be used to identify the MAC addresses of devices connected to a network and determine whether they are authorized or not. This can help identify potential security vulnerabilities and prevent unauthorized access to sensitive information.

To perform MAC address snooping during a penetration test, you can use tools such as **Wireshark** or **tcpdump**. These tools can be used to capture network traffic and analyze it for MAC addresses.

For example, you can use the following command with **tcpdump** to capture network traffic and display the MAC addresses of devices connected to a network: \#sudo tcpdump -i eth0 -e

## DNS Spoofing

DNS spoofing attack involves <span class="mark">manipulating the DNS to redirect users to a fraudulent website that may resemble the user’s intended destination</span>. The attacker can modify DNS records to redirect traffic to a malicious server, enabling them to steal sensitive data from unsuspecting users.

**<span class="mark"><u>DNS spoofing Techniques</u></span>**

**Tampering with existing DNS nameserver resolver cache**: Modifying nameserver resolver cache of existing nameserver to redirect traffic to a malicious server.

**Creating malicious DNS nameserver:** Creating fake DNS nameserver and spreading malware that makes routers and end devices use it.

Use DNSSec to prevent DNS spoofing attacks.

## ICMP Redirect

**ICMP Redirect** technique used to <span class="mark">redirect network traffic to a different destination</span>. It involves <span class="mark">sending a forged ICMP redirect message to a target machine, which causes it to update its routing table and send traffic to the attacker’s machine instead of the intended destination</span>.

ICMP Redirect can be used to intercept traffic for a specific destination address.

ICMP Redirect attacks are often used in conjunction with other techniques such as <span class="mark">ARP cache poisoning</span> and <span class="mark">rogue DHCP server use</span>. The primary goal of these attacks is to intercept traffic for a specific destination address.

ICMP redirect is a type of attack that can be used to **modify the routing table of a victim’s computer**. This attack can be used to redirect traffic to a malicious server, allowing an attacker to intercept and modify network traffic.

To perform an ICMP redirect attack during a penetration test, you can use tools such as **icmpush or responder.** These tools can be used to send ICMP redirect packets to the victim’s computer, which will then modify its routing table.

For example, you can use the following command with icmpush to test how the routing table changes on a Linux system when an ICMP redirect is received:

\#icmpush -v red -sp current-gateway -gw new-gateway -dest google.com -c host -prot tcp my-eth1-ip-address

## NTLM Hash Capture
