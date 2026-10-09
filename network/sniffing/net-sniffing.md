# Introduction

please summarize and correct: Network Sniffing is a process of monitoring and capturing all data packets passing through a given network using sniffing tools. It is a form of wiretap applied to computer networks. Many enterprises' switch ports are open. Anyone in the same physical location can plug into the network using an Ethernet cable. Sniffing is a technique used to monitor and capture network traffic. It involves using specialized tools to intercept data packets passing through a network, essentially acting as a wiretap for computer networks. Network sniffing is the technique of capturing data packets traveling across a network. It's like eavesdropping on a conversation, but for computer networks. Sniffing tools can be used for legitimate purposes like network monitoring and troubleshooting, but attackers can also use them to steal sensitive information. It means every packet that travels across the internet or a local network is gathered for a wide range of purposes such as – monitoring the traffic & bandwidth, maintain the networks, analyse the data collected by the device, and so on. • MAC Address Snooping • DNS Spoofing • ICMP Redirect • NTLM Hash Capture What is Sniffing? o The act of monitoring and capturing all data packets passing through a network. o Essentially, it's like wiretapping for computer networks. o Exploits open network ports, allowing anyone with physical access to easily tap into the network. Promiscuous Mode Sniffer turns the NIC of a system to the promiscuous mode so that it listens to all the data transmitted on its segment. Decode Information A sniffer can constantly monitor all the network traffic to a computer through the NIC by decoding the information encapsulated in the data packet. How attacker Hacks the Network Using Sniffers? • Connect to Network: An attacker connects his laptop to a switch port. • Reconnaissance Network: Runs discovery tools to learn about network topology. • Identify Victim Machine: Identifies the victim's machine to target his attacks. • Poisons the victim machine by using ARP spoofing techniques. • The traffic destined for the victim machine is redirected to the attacker. • The hacker extracts passwords and sensitive data from the redirected traffic. • Promiscuous Mode: Sniffers put network interface cards (NICs) into promiscuous mode, allowing them to capture all traffic on the network segment. • Decoding Information: Sniffers decode the information encapsulated in data packets to monitor network traffic. • Network Interface Card (NIC) Modes: o Normal Mode: NIC only processes packets addressed to the connected device. o Promiscuous Mode: NIC captures all traffic on the network segment. Attackers use tools to put a NIC in promiscuous mode. • Sniffing Techniques: o Passive Sniffing: Exploits hubs (outdated technology) where all devices receive all traffic. o Active Sniffing: Injects packets (e.g., ARP spoofing) to manipulate network switches and capture traffic. o Promiscuous Mode: Sniffers put the network interface card (NIC) into this mode, allowing it to "listen" to all network traffic. o Decoding Information: Sniffers decode the information within captured data packets.

 

# Sniffing Types

Sniffing involves capturing network traffic. It can be categorized into:

## Passive Sniffing

Monitors network traffic without injecting any extra packets. Primarily used on outdated hub-based networks where all devices receive all traffic.

- **Advantages:** Simple to implement.

- **Disadvantages:** Ineffective on modern switched networks.

## Active Sniffing

Manipulates network traffic to capture packets that would not normally be accessible. Often used on modern switched networks.

- **MAC Flooding:** Overwhelms the switch's MAC address table, allowing the attacker to capture traffic meant for other devices.

- **DNS Spoofing:** Redirects DNS requests to a malicious server to intercept user traffic.

- **ARP Poisoning:** Tricks devices into associating their MAC address with the attacker's IP address, redirecting traffic to the attacker.

- **DHCP Attacks:** Manipulates DHCP to control IP address assignment, potentially redirecting traffic.

- **Switch Port Stealing:** Exploits switch vulnerabilities to gain access to specific ports.

- **Spoofing Attacks:** Involves creating fake network packets to impersonate legitimate devices or services.

Key Points:

- **Wiretapping:** A broader term encompassing various methods for monitoring communication channels. Sniffing is a specific type of wiretapping used on computer networks.

- **Lawful Interception:** Refers to government-authorized monitoring of communications.

- **PRISM:** A controversial NSA program that collected and processed foreign intelligence passing through US servers.

## Sniffing in the OSI Model

Sniffing in the OSI Model refers to the interception of network traffic by capturing data frames as they pass through a network segment.

- **Sniffing primarily occurs at the Data Link layer.** While some sniffing techniques can operate at higher layers (like application layer sniffing for specific protocols), most commonly, sniffing involves capturing frames at the Data Link layer (e.g., Ethernet). This layer deals with the physical addressing and framing of data for transmission within a local network.

- **Higher layers can be indirectly affected by sniffing activity.** While higher layers may not be directly aware of the sniffing process itself, the consequences of sniffing can impact them. For instance, sniffing can reveal sensitive information like passwords, credit card details, and confidential communications, which are handled by higher layers (e.g., Application layer). This intercepted data can then be misused by attackers.

**Key Points:**

- **Data Link Layer Focus:** Sniffing primarily targets the Data Link layer due to its access to raw network traffic.

- **Security Implications:** Sniffing poses a significant security risk as it can compromise data confidentiality and integrity.

- **Mitigation Techniques:** Various techniques can mitigate sniffing risks, such as encryption, Virtual Private Networks (VPNs), and network segmentation.

## Protocols Vulnerable to Sniffing

Sniffing attacks exploit the transmission of data in plain text (unencrypted) over a network. This allows attackers to intercept sensitive information such as usernames, passwords, and data content.

**Vulnerable Protocols:**

- **HTTP (unencrypted):** Web traffic, including login credentials and form submissions, can be easily captured.

- **Telnet & Rlogin:** These remote login protocols send user credentials (username/password) in cleartext, making them highly susceptible to sniffing.

- **Email Protocols:**

  - **POP (unencrypted):** Passwords and email content are vulnerable to interception.

  - **IMAP (unencrypted):** Similar to POP, usernames, passwords, and email content can be easily captured.

  - **SMTP (unencrypted):** Passwords and email content are exposed if not encrypted.

- **NNTP (unencrypted):** Used for newsgroups, this protocol can also be exploited by sniffers to capture sensitive information.

- **FTP (unencrypted):** File transfers, including usernames, passwords, and file content itself, are vulnerable to interception.

<!-- -->

- **HTTP**: Data sent in clear text

- **Telnet and Rlogin**: Keystrokes including usernames and passwords

- **POP**: Passwords and data sent in clear text

- **IMAP**: Passwords and data sent in clear text

- **SMTP and NNTP**: Passwords and data sent in clear text

- **FTP**: Passwords and data sent in clear text

Mitigation:

To prevent sniffing attacks, always use the secure versions of these protocols:

- **HTTPS:** Encrypts web traffic.

- **POP3S, IMAPS, SMTPS:** Encrypted versions of email protocols.

- **FTPS, SFTP:** Secure versions of the File Transfer Protocol.

By utilizing these secure protocols, you can significantly reduce the risk of data interception and protect sensitive information from sniffing attacks.

**Remember:** Always use secure versions of these protocols (HTTPS, POP3S, IMAPS, SMTPS, FTPS, SFTP) to encrypt data and protect sensitive information from sniffers.

## How Attackers Use Sniffers:

Connect to the network.

Discover network topology.

Identify target machines.

Use techniques like ARP spoofing to redirect traffic intended for the victim to the attacker.

Capture sensitive data like passwords.

1.  **Connect to the network:** Physically plugs a device into the network.

2.  **Reconnaissance:** Identifies valuable targets (devices) on the network.

3.  **Target and Capture:** Uses sniffing techniques to capture data packets from the target device.

4.  **Extract Information:** Decodes captured packets to steal passwords, emails, and other sensitive data.

# Sniffing Tools

Sniffing tools capture network traffic flowing across a computer network. This can be useful for network troubleshooting and analysis, but attackers can also use them to steal sensitive information.

## Wireshark 

Wireshark lets you capture and interactively browse the traffic running on a computer network. Wireshark uses Winpcap to capture packets, so it can only capture the packets on the networks supported by Winpcap. It captures live network traffic from Ethernet, IEEE 802.11, PPP/HDLC, ATM, Bluetooth, USB, Token Ring, Frame Relay, FDDI networks. Captured files can be programmatically edited via command-line. A set of filters for customized data display can be refined using a display filter.

Free and open-source packet sniffer for Windows, macOS, Linux, and Unix systems. It offers powerful features for capturing, analyzing, and filtering network traffic.

**Key Features:**

Capture live traffic from various network types (Ethernet, WiFi, etc.)

Follow TCP streams to analyze application layer data

Apply display filters to focus on specific traffic types (protocols, IP addresses, ports)

Rich options for data visualization and analysis

**Follow TCP Stream in Wireshark**: The tool sees TCP data in the same way as that of the application layer. Use this tool to find passwords in a Telnet session or make sense of a data stream.

**Display Filters in Wireshark**:

Display filters are used to change the view of packets in the captured files.

Example: Type the protocol in the filter box; arp, http, tcp, udp, dns, ip

- Monitor the specific port: wireshark: tcp.port==23

- Monitor the IP address: wireshark: ip.addr==192.168.1.100

- Monitor the IP address and port: wireshark: ip.addr==192.168.1.100 && tcp.port=23

- Filter by multiple IP addresses: wireshark\> ip.addr==10.0.0.4 or ip.addr==10.0.0.5

- Filter by destination IP addresses and frame packet length: wireshark\> ip.dst==10.0.1.50 && frame.pkt_len\>400

- Filter by IP addresses and frame packet range: wireshark\> ip.addr==10.0.1.12 && icmp && frame.number \> 15 && frame.number \< 30n

- Filter by source and destination IP addresses: wireshark\> ip.src==205.153.63.30 or ip.dst==205.153.63.30

<span class="mark">Monitoring the Specific Ports:</span>

- tcp.port==23

- ip.addr==192.168.1.100 machine

- ip.addr==192.168.1.100 && tcp.port=23

<span class="mark">Filtering by Multiple IP Addresses:</span>

- ip.addr==10.0.0.4 or ip.addr==10.0.0.5

<span class="mark">Filtering by IP Address:</span>

- ip.addr==10.0.0.4

Other Filters:

- ip.dst==10.0.1.50 && frame.pkt_len\>400

- ip.addr==10.0.1.12 && icmp && frame.number \> 15 && frame.number \< 30

- ip.src==205.153.63.30 or ip.dst==205.153.63.30

 

**Additional Wireshark Filters**

- Displays all TCP resets: tcp.flags.reset==1

- Set a filter for the HEX values of 0x33 0x27 0x58 at any offset: udp contains 33:27:58

- Displays all HTTP GET requests: http.request

- Displays all retransmissions in the trace: tcp.analysis.retransmission

- Displays all TCP packets that contain the word 'traffic': tcp contains traffic

- Masks out arp, icmp, dns, or other protocols and allows you to view traffic of you interest: (arp or icmp or dns)

**Example Filters:**

- tcp.port == 23: Monitor traffic on port 23 (Telnet)

- ip.addr == 192.168.1.100: Monitor traffic from/to a specific IP address

- http.request: Show only HTTP GET/POST requests

- ip.src == 205.153.63.30 or ip.dst == 205.153.63.30: Monitor traffic involving a specific IP address

## Tcpdump

Command-line packet sniffers for Linux/Unix (tcpdump) and Windows (WinDump). They offer a powerful way to capture and filter network traffic.

## Sniffing Tools

- **Wireshark:** Popular tool for capturing and analyzing network traffic.

  - Uses Winpcap for packet capture.

  - Supports various network technologies.

  - Offers powerful filtering capabilities.

# Countermeasures

Network sniffing is a technique where attackers capture data traveling across a network. This can expose sensitive information like usernames, passwords, and financial data.

- **Physical Access Control:** Restrict physical access to network equipment.

- **Encryption:** Use encryption to protect sensitive data.

- **ARP Cache Management:** Permanently add the gateway's MAC address to the ARP cache.

- **Static IP Addresses:** Use static IP addresses and ARP tables to prevent ARP poisoning.

- **Network Identification:** Turn off network identification broadcasts and restrict access to authorized users.

- **IPv6:** Use IPv6 instead of IPv4 for enhanced security.

- **Encrypted Sessions:** Use encrypted protocols like SSH, SCP, SSL/TLS, and HTTPS.

- **Switches:** Use switches instead of hubs to limit traffic to intended recipients.

- **Encryption Protocols:** Use PGP, S/MIME, VPN, IPsec, SSL/TLS, SSH, and OTP.

- **Wireless Security:** Use strong encryption protocols like WPA and WPA2 for wireless networks.

- **MAC Address Spoofing Prevention:** Retrieve MAC addresses directly from NICs to prevent spoofing.

- **Promiscuous Mode Detection:** Use tools to detect NICs running in promiscuous mode.

## Protection Measures:

- **Encryption:** Scrambles data in transit (VPN) and at rest (strong encryption) making it useless even if captured.

- **Network Switches:** Modern switches only send traffic to intended recipients, unlike hubs.

- **Port Security:** Restricts unauthorized devices from connecting to switch ports.

- **Monitor for suspicious activity:** Look for unusual network traffic patterns.

**Additional Points:**

- Sniffing operates at the Data Link Layer (OSI model). Higher layers are unaware of sniffing.

- Hardware protocol analysers are specialized sniffing tools.

- SPAN ports on switches can be used for legitimate monitoring but can also be misused for sniffing.

- Wiretapping is the general term for monitoring a communication channel, and sniffing is a specific type of wiretapping on computer networks.

- Lawful interception refers to government-authorized monitoring of communication.

## Detecting Sniffing

- **Check for Promiscuous Mode:** Monitor for devices operating in this mode.

- **Use IDS (Intrusion Detection Systems):** Detect suspicious activity, such as changes in MAC addresses.

- **Utilize Network Tools:** Tools like Capsa Network Analyzer can help identify unusual traffic patterns.

- **Sniffer Detection Techniques:**

  - **Ping Method:** Send pings with incorrect MAC addresses. Only a sniffer will respond.

  - **ARP Method:** Exploit the behavior of sniffers in caching ARP information.

  - **DNS Method:** Monitor for reverse DNS lookups, which are often performed by sniffers.

- **Detection Tools:** PromqryUI (Microsoft), Nmap (with the sniffer-detect script).

## Sniffing Detection

- **Promiscuous Mode:** Check for NICs running in promiscuous mode.

- **Intrusion Detection Systems (IDS):** Monitor for suspicious activity, such as changes in MAC addresses.

- **Network Tools:** Use tools like Capsa Network Analyzer to monitor for unusual network traffic.

- **Ping Method:** Send ping requests with incorrect MAC addresses to identify machines in promiscuous mode.

- **ARP Method:** Analyze ARP responses to detect machines in promiscuous mode.

- **DNS Method:** Monitor for reverse DNS lookup traffic to identify potential sniffers.

- **Promiscuous Detection Tools:** Use tools like PromqryUI and Nmap to detect promiscuous NICs.

<!-- -->

- **Promiscuous Mode Detection:**

  - Check if machines are in promiscuous mode, which allows them to see all network traffic.

  - Tools like PromqryUI and Nmap can help identify such machines.

- **Other Techniques:**

  - Monitor for frequent Address Resolution Protocol (ARP) requests.

  - Analyze network traffic for unusual patterns using network monitoring tools.

**<span class="mark">Ping Method</span>**

Send a ping request to the suspect machine with its IP address and incorrect MAC address. The Ethernet adapter rejects it, as the MAC address does not match, whereas the suspect machine running the sniffer responds to it as it does not reject packets with a different MAC address.

 

**<span class="mark">ARP Method</span>**

- Only a machine in promiscuous mode (machine C) caches the ARP information (IP and MAC address mapping).

- A machine in promiscuous mode replies to the ping message as it has corrected information about the host sending a ping request in its cache; the rest of the machines will send an ARP probe to identify the source of the ping request.

- When the NIC is set to promiscuous mode, packets that are supposed to be filtered by the NIC are now passed to the system kernel. By using this mechanism, we come up with a new way to detect promiscuous nodes: if we configure an ARP packet such that it does not have broadcast address as the destination address, send it to every node on the network and discover that some nodes respond to it, then those nodes are in promiscuous mode.

 

**<span class="mark">DNS Method</span>**

- Most of the sniffers perform reverse DNS lookup to identify the machine from the IP address.

- A machine generating reverse DNS lookup traffic will be most likely running a sniffer.

 

**<span class="mark">PromqryUI sniffing detection tool</span>**

PromqryUI is a security tool from Microsoft that can be used to detect network interfaces that are running in promiscuous mode.

**<span class="mark">Nmap sniffing detection tool</span>**

Nmap's NSE script allows you to check if a target on a local Ethernet has its network card in promiscuous mode.

Command to detect NIC in promiscuous mode: \#nmap --script=sniffer-detect \[Target IP Address/Range of IP addresses\]

## Sniffing Prevention

- **Encryption:** Encrypt data in transit (VPN) and at rest (strong encryption protocols) to render it useless even if captured.

- **Network Segmentation:** Divide the network into smaller zones to limit the data a sniffer can access.

- **Physical Security:** Restrict access to network cables and devices to prevent installing packet sniffers.

- **Static ARP Tables:** Prevent ARP spoofing by using static IP addresses and ARP tables.

- **Secure Protocols:** Use secure protocols like SSH, HTTPS, and SFTP instead of insecure ones like Telnet, FTP, and HTTP.

- **Network Switches:** Use switches instead of hubs, as switches only send data to the intended recipient.

- **Strong Wireless Encryption:** Encrypt wireless traffic with WPA2 or a stronger protocol.

- **MAC Address Verification:** Retrieve MAC addresses directly from the network interface card (NIC) to prevent spoofing.

By understanding the techniques used for sniffing and implementing appropriate countermeasures, organizations can protect their networks from unauthorized access and data breaches.

- Data encryption is the best choice to defend against the network sniffing.

- Use VPN to protect ourself from packet sniffers.

- Restrict the physical access to the network media to ensure that hardware packet sniffer cannot be installed.

- Permanently add the MAC address of the gateway to the ARP cache.

- Use static IP addresses and static ARP tables to prevent attackers from adding the spoofed ARP entries for machines in the network.

- Turn off network identification broadcasts and if possible, restrict the network to authorized users in order to protect the network from being discovered with sniffing tools.

- Use IPv6 instead of IPv4 protocol.

- Use encrypted sessions such as SSH instead of Telnet, Secure Copy (SCP) instead of FTP, SSL for email connection, etc. to protect wireless network users against sniffing attacks.

- Use HTTPS instead of HTTP to protect usernames and passwords.

- Use switch instead of hub as switch delivers data only to the intended recipient.

- Use SFTP, instead of FTP for secure transfer of files.

- Use PGP and S/MIPE, VPN, IPsec, SSL/TLS, Secure Shell (SSH) and One-time passwords (OTP).

- Always encrypt the wireless traffic with a strong encryption protocol such as WPA and WPA2.

- Retrieve MAC directly from NIC instead of OS; this prevents MAC address spoofing.

- Use tools to determine if any NICs are running in the promiscuous mode.

 

 

**Sniffing Detection**

- **Promiscuous Mode**: You will need to check which machines are running in the promiscuous mode. Promiscuous mode allows a network device to intercept and read each network packet that arrives in its entirety.

- **IDS**: Run IDS and notice if the MAC address of certain machines has changed (Example: router's MAC address). IDS can alert the administrator about suspicious activities.

- **Network Tools**: Run network tools such as Capsa Network Analyzer to monitor the network for strange packets. It enables you to collect, consolidate, centralize and analyse traffic data across different network resources and technologies: nmap -sV --script=sniffer-detect \<target\>

## Sniffing Countermeasures

- **Restrict Physical Access:** Prevent unauthorized access to network media.

- **Use Encryption:** Protect sensitive data with encryption protocols.

- **Static IP Addresses and ARP Tables:** Prevent ARP poisoning.

- **Disable Network Identification Broadcasts:** Limit network discovery by sniffing tools.

- **Use IPv6:** Offers improved security over IPv4.

- **Utilize Encrypted Protocols:** SSH, SCP, HTTPS, SFTP.

- **Strong Wireless Encryption:** Use WPA2 or stronger protocols.

- **Prevent MAC Address Spoofing:** Retrieve MAC addresses directly from the NIC.

- **Implement Tools to Detect Promiscuous Mode:** Use tools like PromqryUI and Nmap.

# Best practice:

Network security is an ongoing process. Regularly monitor your network for suspicious activity and update your security measures as needed.

Using sniffing tools on a network you do not own is illegal. Sniffing can be a security risk, so it's important to take steps to protect your network traffic with encryption and other security measures.

**Best practices**

- **Hub Usage:** While hubs are outdated, they are still occasionally used in specific scenarios.

- **Switch Port Stealing:** Clarified as a technique used in active sniffing.

- **Sniffer Detection:** Refined and expanded explanations of detection techniques.

- **Countermeasures:** Added specific recommendations for preventing MAC address spoofing and improving wireless security.

This summary aims to provide a concise and accurate overview of network sniffing, its threats, detection, and countermeasures.
