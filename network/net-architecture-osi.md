An OSI model is a reference model for how applications communicate over
a network. The purpose of an OSI reference is to guide vendors and
developers so the digital communication products and software programs
can interoperate.

An OSI model is a reference model for how applications communicate over
a network. The purpose of an OSI reference is to guide vendors and
developers so the digital communication products and software programs
can interoperate.

The OSI (Open Systems Interconnection) Model is a standardised model
which we use to demonstrate the theory behind computer networking. In
practice, it is the more compact TCP/IP model that real-world networking
is based off; however, the OSI model, in many ways, is easier to get an
initial understanding from.

The International Standards Organization (ISO) developed the Open
Systems Interconnect (OSI) model in 1981. It consists of seven
functional layers that provide the basis for communication among
computers over networks, as described in the table below. You can easily
remember them using the mnemonic phrase “All people seem to need data
processing.” Understanding this model will help you build a strong
network, troubleshoot problems, develop effective applications, and
evaluate third-party products.

History of OSI Model

- Here are essential landmarks from the history of OSI model:

- In the late 1970s, the ISO conducted a program to develop general
  standards and methods of networking.

- In 1973, an Experimental Packet Switched System in the UK identified
  the requirement for defining the higher-level protocols.

- In the year 1983, OSI model was initially intended to be a detailed
  specification of actual interfaces.

- In 1984, the OSI architecture was formally adopted by ISO as an
  international standard

7 Layers of the OSI Model

OSI model is a layered server architecture system in which each layer is
defined according to a specific function to perform. All these seven
layers work collaboratively to transmit the data from one layer to
another.

1.  **The Upper Layers:** It deals with application issues and mostly
    implemented only in software. The highest is closest to the end
    system user. In this layer, communication from one end-user to
    another begins by using the interaction between the application
    layer. It will process all the way to end-user.

2.  **The Lower Layers:** These layers handle activities related to data
    transport. The physical layer and datalink layers also implemented
    in software and hardware The OSI model consists of seven layers:

<img src="media/image1.png" style="width:5.93248in;height:3.0922in" />

There are many mnemonics floating around to help you learn the layers of
the OSI model -- search around until you find one that you like. I
personally favour: Anxious Pale Shakespeare Treated Nervous Drunks
Patiently Let Us briefly look at each of these in turn:

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 27%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th><strong>Layer</strong></th>
<th><strong>Protocols</strong></th>
<th><strong>Function</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Layer-7: Application</td>
<td><p>HTTP, FTP, TFTP</p>
<p>DNS, SMTP, SFTP<br />
SNMP, POP3, Boot</p>
<p>MIME</p></td>
<td>Provides services such as e-mail, file transfers and file
servers</td>
</tr>
<tr>
<td>Layer-6: Presentation</td>
<td><p>MPEG, JPEG, TIFF</p>
<p>ASCH, SSL, TLS</p></td>
<td>Provides encryption, code conversion and data formatting</td>
</tr>
<tr>
<td>Layer-5: Session</td>
<td><p>NETBIOS, SAP, SQL</p>
<p>X- Window, ASP, DNA</p>
<p>SCP, NFS, RPC</p></td>
<td>Negotiates and establishes a connection with another computer</td>
</tr>
<tr>
<td>Layer-4: Transport</td>
<td>TCP, UDP, SPX</td>
<td>Supports end-to-end delivery of data</td>
</tr>
<tr>
<td>Layer-3: Network</td>
<td><p>IP, ICMP, OSPF</p>
<p>RIP, ARP, RARP</p>
<p>IPsec, MPLS</p></td>
<td>Performs packet routing</td>
</tr>
<tr>
<td>Layer-2: Data link</td>
<td><p>RAPA, PPP, Frame Relay</p>
<p>ATM</p></td>
<td>Provides error checking and transfer of message frames</td>
</tr>
<tr>
<td>Layer-1: Physical</td>
<td><p>EIA RS-232, EIA RS-449</p>
<p>IEEE 802</p></td>
<td>Physically interfaces with transmission medium and sends data over
the network</td>
</tr>
</tbody>
</table>

## L1_physical

Responsible for transmission of digital data from sender to receiver
through the communication media. It transfers the computer bits from one
device to another through the network. It also controls how physical
connections are set up to the network and bits represented into signals
while transmitting either optically, electrically, or radio waves. Used
for Transmitting bits, Attack Type: Surveillance Sniffing Media, signal
and binary transmission: RS-232, RJ45, V.34, 100BaseTX, SDH, DSL,
802.11. Direct physical data connection (cables)

The physical layer is right down to the hardware of the computer. This
is where the electrical pulses that make up data transfer over a network
are sent and received. It is the job of the physical layer to convert
the binary data of the transmission into signals and transmit them
across the network, as well as receiving incoming signals and converting
them back into binary data

- **Physical:** Responsible for transmission of digital data from sender
  to receiver through the communication media. It transfers the computer
  bits from one device to another through the network. It also controls
  how physical connections are set up to the network and bits
  represented into signals while transmitting either optically,
  electrically, or radio waves.

## L2_data link

Handles the movement of data to and from the physical link. It is also
responsible for encoding and decoding of data bits. It handles the flow
of data to and from network. It also controls problems that occur due to
bit transmission errors. Used for Organizing data and transmitting.
Attack Type: Wired equivalent privacy attacks, MAC/ARP Sniffing
Protocol: 802.11. Protocols: Ethernet, 802.11, MAC/LLC, VLAN, ATM, HDP,
Fiber Channel, HDLC, PPP, Q.921, Token Ring, PPP, SLIP, PPTP, L2TP.

- **Data Link:** Handles the movement of data to and from the physical
  link. It is also responsible for encoding and decoding of data bits.
  It handles the flow of data to and from network. It also controls
  problems that occur due to bit transmission errors

The data link layer focuses on the physical addressing of the
transmission. It receives a packet from the network layer (that includes
the IP address for the remote computer) and adds in the physical (MAC)
address of the receiving endpoint. Inside every network enabled computer
is a Network Interface Card (NIC) which comes with a unique MAC (Media
Access Control) address to identify it. MAC addresses are set by the
manufacturer and literally burnt into the card; they cannot be changed
-- although they can be spoofed. When information is sent across a
network, it is the physical address that is used to identify where
exactly to send the information. Additionally, it is also the job of the
data link layer to present the data in a format suitable for
transmission. The data link layer also serves an important function when
it receives data, as it checks the received information to make sure
that it has not been corrupted during transmission, which could well
happen when the data is transmitted by layer 1: the physical layer.

**Key Functions:**

1.  **Physical Addressing:**

    - Assigns and manages unique MAC addresses to network devices.

    - Adds the source and destination MAC addresses to data frames for
      accurate delivery.

2.  **Data Framing:**

    - Encapsulates data into frames, adding header and trailer
      information.

    - Defines frame formats for different network technologies (e.g.,
      Ethernet, Wi-Fi).

3.  **Media Access Control (MAC):**

    - Manages access to the shared network medium (e.g., Ethernet cable,
      wireless channel).

    - Employs protocols like Carrier Sense Multiple Access with
      Collision Detection (CSMA/CD) or Carrier Sense Multiple Access
      with Collision Avoidance (CSMA/CA) to coordinate data
      transmission.

4.  **Error Detection and Correction:**

    - Employs techniques like Cyclic Redundancy Check (CRC) to detect
      errors in transmitted data.

    - May use retransmission or error correction codes to ensure data
      integrity.

5.  **Flow Control:**

    - Regulates the rate of data transmission to prevent overwhelming
      the receiver.

    - Uses mechanisms like sliding window protocols to control the flow
      of data.

**Additional Considerations:**

- **Sublayers:** The Data Link Layer is often divided into two
  sublayers:

  - **Logical Link Control (LLC):** Handles logical addressing, flow
    control, and error correction.

  - **Media Access Control (MAC):** Manages physical access to the
    network medium.

- **Network Technologies:** Different network technologies (e.g.,
  Ethernet, Wi-Fi) have specific data link layer protocols and frame
  formats.

By performing these functions, the Data Link Layer ensures reliable and
efficient data transmission between devices on a network.

## L3_network

Responsible for packet forwarding and providing routing paths for
network communication. It is used to transfer data to and from through
another network. Used for Address assigning and packet forwarding.
Attack Type: IP Smurfing and other spoofing attacks, Self-Forwarding,
Hijacking, Sybil Attack, IP Port Sniffing. Protocol: IP, ARP, ICMP,
IGMP, OSPF, RIP, BGP, IPsec, IP NAT, IPx

The network layer is responsible for locating the destination of your
request. For example, the Internet is a huge network; when you want to
request information from a webpage, it is the network layer that takes
the IP address for the page and figures out the best route to take. At
this stage we are working with what is referred to as Logical addressing
(i.e. IP addresses) which are still software controlled. Logical
addresses are used to provide order to networks, categorising them and
allowing us to properly sort them. Currently the most common form of
logical addressing is the IPV4 format, which you will likely already be
familiar with (i.e. 192.168.1.1 is a common address for a home router).

- **Network:** Responsible for packet forwarding and providing routing
  paths for network communication. It is used to transfer data to and
  from through another network

**Purpose:** Handles address assignment, packet forwarding, and routing
data between network nodes.

**Key protocols:**

- **IP (Internet Protocol):** Core protocol for addressing and routing
  packets across networks.

- **ICMP (Internet Control Message Protocol):** Error reporting and
  diagnostic messages.

- **ARP (Address Resolution Protocol):** Maps IP addresses to physical
  (MAC) addresses.

- **IGMP (Internet Group Management Protocol):** Manages multicast group
  memberships.

- **OSPF (Open Shortest Path First) and RIP (Routing Information
  Protocol):** Routing protocols used to determine the best path for
  data transmission.

- **BGP (Border Gateway Protocol):** Routing protocol used between
  autonomous systems (large networks).

- **IPsec:** Provides security for IP communication.

- **IP NAT (Network Address Translation):** Translates private IP
  addresses to public IP addresses.

**ARP (Address Resolution Protocol):**

- Translates IP addresses (32-bit) to physical addresses (48-bit MAC
  addresses).

- Essential for sending data from an IP address to a specific device on
  a network.

**Note:** The provided text focuses primarily on ARP. The other
protocols mentioned require more detailed explanations to fully
understand their functions.

**Would you like to delve deeper into any of the other protocols
mentioned?**

## L4_transport

Responsible for end-to-end communication over the network. It splits the
data from the above layer and passes it to the Network Layer and then
ensures that all the data has successfully reached at the receiver’s
end. It is used for sending data across a network and offers error
checking practices and data flow controls. Used for Provide reliable
delivery, Error checking and sequencing. Attack Type: Desynchronization,
TCP Sequence Prediction, Routing information protocol attack, SYN
Flooding, Sequence number prediction, TCP Session/UDP Sniffing.
Protocol: TCP, UDP SCTP, SSL, TLS.

- **Transport Layer:** Responsible for end-to-end communication over the
  network. It splits the data from the above layer and passes it to the
  Network Layer and then ensures that all the data has successfully
  reached at the receiver’s end. It is used for sending data across a
  network and offers error checking practices and data flow controls

The transport layer is a very interesting layer that serves numerous
important functions. Its first purpose is to choose the protocol over
which the data is to be transmitted. The two most common protocols in
the transport layer are TCP (Transmission Control Protocol) and UDP
(User Datagram Protocol); with TCP the transmission is connection-based
which means that a connection between the computers is established and
maintained for the duration of the request. This allows for a reliable
transmission, as the connection can be used to ensure that the packets
all get to the right place. A TCP connection allows the two computers to
remain in constant communication to ensure that the data is sent at an
acceptable speed, and that any lost data is re-sent. With UDP, the
opposite is true; packets of data are essentially thrown at the
receiving computer -- if it cannot keep up then that is its problem
(this is why a video transmission over something like Skype can be
pixelated if the connection is bad). What this means is that TCP would
usually be chosen for situations where accuracy is favoured over speed
(e.g. file transfer, or loading a webpage), and UDP would be used in
situations where speed is more important (e.g. video streaming).

With a protocol selected, the transport layer then divides the
transmission up into bite-sized pieces (over TCP these are called
segments, over UDP they are called datagrams), which makes it easier to
transmit the message successfully.

The Transport layer is responsible for end-to-end communication between
applications on different hosts. It ensures reliable data delivery, flow
control, error checking, and congestion control.

**Key Protocols:**

- **TCP (Transmission Control Protocol):**

  - Connection-oriented protocol, meaning a reliable connection is
    established before data transfer.

  - Guarantees delivery of data in order and without errors.

  - Uses flow control and congestion control mechanisms.

  - Suitable for applications requiring high reliability, such as email,
    file transfer, and web browsing.

  - TCP is for reliable, ordered data transfer.

- **UDP (User Datagram Protocol):**

  - Connectionless protocol, meaning data is sent as individual packets
    without establishing a connection.

  - Does not guarantee delivery, order, or error-free transmission.

  - Offers lower overhead and faster transmission than TCP.

  - Suitable for applications that can tolerate packet loss or delay,
    such as real-time streaming (audio/video), gaming, and DNS.

  - UDP is for faster, less reliable data transfer.

- **RTP (Real-time Transport Protocol):**

  - Used for delivering audio and video data over IP networks.

  - Provides end-to-end delivery services for data with timing
    constraints.

  - Offers mechanisms for synchronization and quality of service (QoS).

  - RTP is for real-time media delivery.

- **SCTP (Stream Control Transmission Protocol):**

  - Connection-oriented protocol like TCP, but offers additional
    features such as multithreading (sending multiple streams of data
    within a single connection) and multihoming (using multiple network
    interfaces for a single connection).

  - SCTP combines features of TCP and UDP for more complex applications.

  - Provides reliability and order while supporting real-time
    applications.

## L5_session

Controls connection between the sender and the receiver. It is
responsible for starting, ending, and managing the session and
establishing, maintaining, and synchronizing interaction between the
sender and the receiver. It determines the period of a system that waits
for other application to respond. Establish Communication, Attack Type:
Remote Procedure Call Worms, Port mapper Exploits, Telnet/FTP Sniffing.
Authentication, Monitoring, Probing, Redundancy used to secure.
Protocol: RPC, TCP, SIP, RTP, RPC, NETBIOS

- **Session:** Controls connection between the sender and the receiver.
  It is responsible for starting, ending, and managing the session and
  establishing, maintaining, and synchronizing interaction between the
  sender and the receiver. It determines the period of a system that
  waits for other application to respond.

When the session layer receives the correctly formatted data from the
presentation layer, it looks to see if it can set up a connection with
the other computer across the network. If it cannot then it sends back
an error and the process goes no further. If a session can be
established then it is the job of the session layer to maintain it, as
well as co-operate with the session layer of the remote computer to
synchronise communications. The session layer is particularly important
as the session that it creates is unique to the communication in
question. This is what allows you to make multiple requests to different
endpoints simultaneously without all the data getting mixed up (think
about opening two tabs in a web browser at the same time)! When the
session layer has successfully logged a connection between the host and
remote computer the data is passed down to Layer 4: the transport Layer.

## L6_presentation

It deals with presenting the data in a proper format and data structure
instead of sending raw datagrams or packets. It manages encryption and
decryption of data required for the application layer. It translates or
formats data for the application layer based on the syntax of the
application that accepts. Display Data, Client puzzle authentication
approach. Attack Type: SSL/TLS Session Sniffing Protocols: HTML, DOC,
JPEG, MP3, MP4, AVI

- **Presentation Layer:** It deals with presenting the data in a proper
  format and data structure instead of sending raw datagrams or packets.
  It manages encryption and decryption of data required for the
  application layer. It translates or formats data for the application
  layer based on the syntax of the application that accepts

The presentation layer receives data from the application layer. This
data tends to be in a format that the application understands, but it is
not necessarily in a standardised format that could be understood by the
application layer in the receiving computer. The presentation layer
translates the data into a standardised format, as well as handling any
encryption, compression, or other transformations to the data. With this
complete, the data is passed down to the session layer.

## L7_application

It provides an interface between the application and the network. It
focuses on process-to-process communication and provides a communication
interface. It allows users to communicate with network/application
whenever required to perform network-related operations. Application:
NFS, NIS+, DNS, telnet, ftp, rlogin, RSH, RCP, RIP, RDISC, SNMP and
others

- **Application Layer:** It provides an interface between the
  application and the network. It focuses on process-to-process
  communication and provides a communication interface. It allows users
  to communicate with network/application whenever required to perform
  network-related operations.

Application layer

- How Application uses network? For security Unique pairwise Keys and
  Cryptography approach are used.

- HTTP: Hyper Text Transfer Protocol used by web browser to communicate
  with web servers

- SMTP: Simple mail transfer protocol used to transfer email messages
  between servers.

- IMAP: Internet message access protocol used to allow retrieval and
  manipulation of email messages on server.

- POP: Post office protocol used to download email messages from server
  to local device

- SIP: Session initiation protocol used for initiating, managing, and
  terminating voice or video calls over internet.

- FTP: File transfer protocol used to transfer files between computers

- NFS: Network file system allows computer to access files on remote
  servers as if they were local.

- NTP: Network time protocol synchronizes the clocks of computers on a
  network.

- DHCP

- DNS

- SNMP

- P2P

The application layer of the OSI model essentially provides networking
options to programs running on a computer. It works almost exclusively
with applications, providing an interface for them to use to transmit
data. When data is given to the application layer, it is passed down
into the presentation layer.

**Purpose:** The Application layer is the top layer of the OSI model and
interacts directly with end-users. It provides network services for
applications, such as email, web browsing, and file transfer.

**Key protocols:**

While many of the listed protocols serve different purposes, they all
operate at the Application layer.

- **HTTP (Hypertext Transfer Protocol):** For web browsing and data
  transfer between web servers and clients.

- **FTP (File Transfer Protocol):** For transferring files between
  computers.

- **SMTP (Simple Mail Transfer Protocol):** For sending emails.

- **POP3 (Post Office Protocol version 3) and IMAP (Internet Message
  Access Protocol):** For receiving emails.

- **DNS (Domain Name System):** Translates domain names (like \[invalid
  URL removed\]) into IP addresses.

- **DHCP (Dynamic Host Configuration Protocol):** Automatically assigns
  IP addresses to devices on a network.

<!-- -->

- **NTP (Network Time Protocol):** Synchronizes clocks across computer
  systems.

- **SNMP (Simple Network Management Protocol):** For network management
  and monitoring.

- **TFTP (Trivial File Transfer Protocol):** A simplified version of FTP
  for basic file transfer.

- **SIP (Session Initiation Protocol):** Used for initiating, managing,
  and terminating multimedia communication sessions.

- **P2P (Peer-to-Peer):** A decentralized network architecture where
  individual computers act as both clients and servers.

<!-- -->

- **SMPP (Short Message Peer-to-Peer):** Primarily used in the SMS
  industry for sending text messages.

## OSI Network Security Architecture

**The OSI Security Architecture** is a framework for understanding and
implementing security within computer networks. It outlines:

- **Security services:** These are the functions provided to protect
  data and systems, such as confidentiality, integrity, availability,
  authentication, and non-repudiation.

- **Security mechanisms:** These are the specific processes or devices
  used to implement security services, like encryption, digital
  signatures, and access controls.

- **Security attacks:** These are actions that compromise the security
  of information.

The OSI model maps these elements to the layers of the network to
provide a structured approach to security. It emphasizes the importance
of a comprehensive security strategy rather than relying solely on
individual technologies.

**Key points:**

- Provides a standardized framework for network security.

- Defines security services and mechanisms.

- Emphasizes the importance of threat and risk analysis.

- Highlights the need for a holistic approach to security.

Essentially, the OSI Security Architecture serves as a blueprint for
designing and implementing secure network systems.

The text emphasizes the critical role of **security architecture** in
safeguarding systems and data. It draws a parallel between building a
secure system and constructing a house, highlighting the importance of a
well-thought-out plan.

**Key Points:**

- **Security architecture** is a blueprint for securing a system,
  encompassing services, elements, and performance requirements.

- A **threat and risk analysis** is essential for designing an effective
  security architecture.

- The reliance on **ethical hacking** as a primary security measure is
  flawed and often ineffective.

- The **OSI security architecture** provides a foundational framework
  but falls short of a comprehensive, situation-specific security
  blueprint.

**Core Argument**

The text advocates for a proactive and systematic approach to security,
emphasizing the need for a well-defined security architecture based on
thorough threat and risk assessments. It criticizes the common practice
of relying solely on ad-hoc security testing (ethical hacking) and
highlights the limitations of the OSI security architecture as a
standalone solution.

In essence, the text promotes the idea that a robust security posture
requires a comprehensive, tailored security architecture rather than
reactive measures.

Security Services

**Security services** are mechanisms that protect data and systems from
unauthorized access, use, disclosure, disruption, modification, or
destruction. The OSI security architecture categorizes these services
into five primary types:

**Types of Security Services**

- **Authentication:** Verifies the identity of entities involved in a
  communication.

- **Access Control:** Restricts access to system resources based on
  authorization.

- **Data Confidentiality:** Protects data from unauthorized disclosure.

- **Data Integrity:** Ensures data is not altered or destroyed without
  authorization.

- **Non-repudiation:** Prevents entities from denying involvement in a
  communication or action.

These services can be further categorized based on their scope and
application within a network. For instance, authentication can be
applied to entities or data origins. Similarly, data integrity can be
provided at the connection or individual data unit level.

Essentially, security services form the backbone of a secure system,
working together to protect information and resources from various
threats.

Would you like to delve deeper into a specific security service?

Non-repudiation Services

**Non-repudiation** is a security service that prevents parties involved
in a communication from denying their participation. It ensures
accountability.

There are two primary types:

- **Non-repudiation with proof of origin:** Protects the recipient by
  proving the message originated from a specific sender.

- **Non-repudiation with proof of delivery:** Protects the sender by
  proving the message was delivered to the intended recipient.

**Non-repudiation is crucial for:**

- Preventing disputes between parties involved in a transaction.

- Providing legal evidence in case of disputes.

- Building trust in electronic communications.

Examples of where non-repudiation is critical include online
transactions like stock trading, where both parties need proof of their
actions.

Would you like to know how non-repudiation is implemented technically?

Security Mechanisms

**Security mechanisms** are the technical tools and techniques used to
implement security services. They protect data and systems from
unauthorized access, use, disclosure, disruption, modification, or
destruction.

**Types of Security Mechanisms**

The OSI security architecture categorizes mechanisms into two types:

**Specific Security Mechanisms**

These are directly tied to specific security services. Examples include:

- **Encipherment:** Protects data confidentiality through encryption.

- **Digital signatures:** Ensure data integrity and authenticity.

- **Access control mechanisms:** Restrict access to system resources.

- **Data integrity mechanisms:** Protect data from unauthorized
  modification.

- **Authentication exchange mechanisms:** Verify the identity of
  entities.

- **Traffic padding mechanisms:** Hides traffic patterns.

- **Routing control mechanisms:** Control data flow paths.

- **Notarization mechanisms:** Provide independent assurance of data
  properties.

**Pervasive Security Mechanisms**

These are broader security concepts that support multiple security
services. Examples include:

- **Trusted functionality:** Ensuring components perform as intended.

- **Security labels:** Classifying data and resources for protection.

- **Event detection:** Identifying security-related events.

- **Security audit trail:** Recording system activities for analysis.

- **Security recovery:** Restoring systems after a security breach.

**In essence, security mechanisms are the building blocks for creating
secure systems.** They work in conjunction with security services to
protect information and systems from various threats.

Would you like to delve deeper into a specific security mechanism or its
relationship with a security service?

Security Controls

The provided table outlines a basic security framework, categorizing
security controls into different layers or "rings".

**Key Points**

- **Data Layer:** Protects data at rest with encryption.

- **Application Layer:** Ensures data integrity during transmission with
  SSL/TLS.

- **Endpoint Layer:** Maintains system availability through regular
  patching.

- **Network Layer:** Protects data confidentiality with network security
  rules.

- **Perimeter Layer:** Safeguards system availability through DDoS
  protection.

- **Identity and Access Layer:** Ensures data integrity through user
  authentication.

- **Physical Layer:** Protects data confidentiality with physical access
  controls.

**Overall Goal**

The framework aims to provide a layered defense strategy, addressing
confidentiality, integrity, and availability at different levels of the
IT infrastructure.

**Potential Enhancements**

While the table provides a foundation, it could be expanded to include
additional controls and principles. For example:

- **Accountability:** Mechanisms to track user actions.

- **Non-repudiation:** Ensuring actions cannot be denied.

- **Least Privilege:** Granting only necessary permissions.

- **Separation of Duties:** Distributing responsibilities.

By incorporating these principles, a more comprehensive security
framework can be developed.

| OSI Layer | Cyber Attack | Prevention Methods |
|----|----|----|
| Physical | Wiretapping, Cable tampering, Electromagnetic eavesdropping | Physical security, Encryption, Shielding, EMI/RFI protection |
| Data Link | Man-in-the-middle attacks, MAC spoofing, ARP poisoning | MAC address filtering, Address resolution protocol (ARP) inspection, Network intrusion detection systems (NIDS) |
| Network | IP spoofing, Routing attacks, DDoS, ICMP attacks | Firewalls, Intrusion prevention systems (IPS), Network address translation (NAT), Rate limiting |
| Transport | Session hijacking, Port scanning, SYN flooding, TCP sequence prediction | Firewalls, Intrusion prevention systems (IPS), Network address translation (NAT), Stateful packet inspection (SPI) |
| Session | Session hijacking, Remote procedure call (RPC) attacks | Session authentication, Encryption, Intrusion detection systems (IDS) |
| Presentation | Data manipulation, SSL/TLS session sniffing | Encryption, Data integrity checks, Data validation |
| Application | SQL injection, Cross-site scripting (XSS), Denial of Service (DoS), Buffer overflow | Input validation, Output encoding, Web application firewalls (WAF), Intrusion prevention systems (IPS) |

**The OSI (Open Systems Interconnection) model** is a conceptual
framework used to understand and describe the functions of a networking
system. It divides the communication process into seven distinct layers,
each with specific responsibilities. While the OSI model is a conceptual
framework, it provides a valuable foundation for understanding network
communication and security.

**The Seven Layers**

- **Physical Layer:** Handles the physical connection between devices,
  including cables and signals.

- **Data Link Layer:** Manages data transfer between nodes on a network.

- **Network Layer:** Handles routing and addressing of packets across
  networks.

- **Transport Layer:** Ensures reliable data delivery between endpoints.

- **Session Layer:** Manages communication sessions between
  applications.

- **Presentation Layer:** Handles data formatting and
  encryption/decryption.

- **Application Layer:** Provides network services to users.

- **Physical Layer:** Handles the physical connection between devices,
  including cables and signals.

- **Data Link Layer:** Manages data transfer between nodes on a network.

- **Network Layer:** Handles routing and addressing of packets across
  networks.

- **Transport Layer:** Ensures reliable data delivery between endpoints.

- **Session Layer:** Manages connections between applications.

- **Presentation Layer:** Handles data formatting and
  encryption/decryption.

- **Application Layer:** Provides network services to users.

 

## OSI Layer Reference architecture

OSI Model is a Layered Approach to Network Communication

The Open Systems Interconnection (OSI) model is a conceptual framework
that divides network communication into seven distinct layers. Each
layer has specific responsibilities, facilitating standardized
communication between diverse network devices and applications.

**The 7 Layers of the OSI Model:**

1.  **Physical Layer (Layer 1):**

    - Deals with the physical transmission of raw data bits across the
      network medium (cables, fibre optics, etc.).

    - Handles signal transmission, representation (electrical, optical),
      and media connections (e.g., RJ-45 connectors).

    - **Security Concerns:** Physical access threats (eavesdropping) and
      signal interference.

2.  **Data Link Layer (Layer 2):**

    - Focuses on error-free data transmission between neighbouring
      network nodes.

    - Encodes and decodes data packets (frames), performs error
      detection and correction, and manages Media Access Control (MAC)
      addresses for device identification.

    - **Security Concerns:** MAC address spoofing, ARP spoofing.

3.  **Network Layer (Layer 3):**

    - Responsible for logical addressing (IP addresses) and routing data
      packets across networks.

    - Determines the optimal path for data packets to reach their
      destination network.

    - **Security Concerns:** IP spoofing, denial-of-service (DoS)
      attacks.

4.  **Transport Layer (Layer 4):**

    - Provides reliable and sequenced data transfer between applications
      on different machines.

    - Breaks down application data into smaller packets, handles flow
      control and error checking, and ensures data arrives in the
      correct order.

    - Protocols: TCP (reliable, connection-oriented), UDP (unreliable,
      connectionless).

    - **Security Concerns:** Session hijacking, SYN flooding.

5.  **Session Layer (Layer 5):**

    - Establishes, manages, and terminates sessions between
      communicating applications.

    - Provides synchronization and dialog control mechanisms for
      applications.

    - **Security Concerns:** Session hijacking, man-in-the-middle
      attacks.

6.  **Presentation Layer (Layer 6):**

    - Prepares data for the application layer by handling data
      encryption, compression, and formatting.

    - Ensures data is presented in a format compatible with the
      receiving application.

    - Protocols: MIME, ASCII, EBCDIC.

    - **Security Concerns:** Data interception and tampering during
      encryption or decryption.

7.  **Application Layer (Layer 7):**

    - Provides network services directly to user applications (e.g., web
      browsing, email, file transfer).

    - Acts as the interface between users and network services.

    - Protocols: HTTP, FTP, SMTP, DNS.

    - **Security Concerns:** Application-specific vulnerabilities (e.g.,
      SQL injection).

**Benefits of the OSI Model:**

- **Standardization:** Enables interoperability between different
  network devices and software from various vendors.

- **Modular Design:** Simplifies network communication by breaking it
  down into manageable layers.

- **Troubleshooting:** Provides a structured approach to identifying and
  resolving network issues.

While the OSI model is a conceptual framework, it serves as a valuable
foundation for understanding network communication and security. By
understanding the functions and potential security concerns at each
layer, network administrators can implement appropriate security
measures to protect data across the entire network infrastructure.

**1. Removing an OSI Layer:**

It is not recommended to remove any layer from the OSI model. Each layer
plays a crucial role in network communication. Removing one would
disrupt the standardized flow of data.

**2. Finding Unique User IPs:**

Here's a command using Linux tools to find unique user IP addresses
(replace 'server_name' with your actual server name):

Bash

netstat -atnp \| grep 'ESTABLISHED' \| awk '{print \$5}' \| sort \| uniq
-c \| awk '{print \$2, \$4}'

This command breakdown:

- netstat -atnp: Lists all network connections (TCP and UDP) listening,
  established, and their process IDs (PIDs).

- grep 'ESTABLISHED': Filters for established connections (active user
  sessions).

- awk '{print \$5}': Extracts the fifth column, usually the source IP
  address.

- sort: Sorts the IPs.

- uniq -c: Counts the occurrences of each IP.

- awk '{print \$2, \$4}': Prints the count (number of users) and the
  unique IP address.

**3. Creating an Alias for Server IP:**

Here is a command to create an alias named my_ip that displays your
server's IP address:

Bash

alias my_ip='ifconfig \| grep "inet addr:" \| cut -d: -f2 \| awk '{print
\$1}' \| head -n 1'

Explanation:

- ifconfig: Lists network interface information.

- grep "inet addr:": Filters for lines containing "inet addr:".

- cut -d: -f2: Extracts the second field after the colon (":"), which is
  the IP address.

- awk '{print \$1}': Takes the first element (IP address).

- head -n 1: Prints only the first line (assuming one network
  interface).

**4. Network Security Vulnerabilities:**

Network security vulnerabilities are weaknesses in network devices,
software, or protocols that can be exploited by attackers to gain
unauthorized access, steal data, or disrupt operations. Common
vulnerabilities include:

- Unpatched software: Outdated software often contains known
  vulnerabilities.

- Weak passwords: Easy-to-guess passwords are a common entry point for
  attackers.

- Misconfigured devices: Improperly configured network devices can leave
  them vulnerable.

- Phishing attacks: Tricking users into revealing sensitive information.

- Zero-day attacks: Exploits for previously unknown vulnerabilities.

**5. 80/20 Rule of Networking:**

The 80/20 rule (also known as the Pareto Principle) suggests that
roughly 80% of network traffic stays local within a network (e.g.,
accessing internal servers, printing resources). The remaining 20% goes
to external destinations like the internet. This rule helps network
administrators optimize network traffic flow and prioritize resources.

**6. IP Multicast:**

IP multicast is a technique that allows a single source to send data
packets to a group of destinations simultaneously. It's efficient for
distributing data to multiple recipients without sending individual
copies. Multicast uses dedicated IP addresses starting with 224.0.0.0 to
239.255.255.255.

**7. Proxy Server:**

A proxy server acts as an intermediary between a client (your computer)
and a server on the internet. When you request a web page, your browser
connects to the proxy server first. The proxy server then fetches the
page from the actual web server and delivers it to you.

**Benefits of using a proxy server:**

- Improved security: Proxy servers can filter out malicious content and
  hide your IP address.

- Caching: Proxies can store frequently accessed data locally, improving
  performance for repeat requests.

- Access control: Organizations can restrict internet access through a
  proxy server.

## Interaction between OSI Layers

Information sent from a one computer application to another needs to
pass through each of the OSI layers.

This is explained in the below-given example:

- Every layer within an OSI model communicates with the other two layers
  which are below it and its peer layer in some another networked
  computing system.

- In the below-given diagram, you can see that the data link layer of
  the first system communicates with two layers, the network layer, and
  the physical layer of the system. It also helps you to communicate
  with the data link layer of, the second system

<img src="media/image2.png" style="width:4.72653in;height:2.49553in" />

## OSI vs TCP/IP

<img src="media/image3.png" style="width:2.56in;height:2.0301in" />

What is the difference between TCP/IP and OSI Layer network frameworks?

**TCP/IP vs. OSI Model: A Comparative Overview**

**TCP/IP** and **OSI** are two fundamental frameworks used to understand
and manage network communication. While both serve a similar purpose,
they differ significantly in their structure, approach, and
implementation.  

**OSI Model**

- **Conceptual Framework:** The OSI (Open Systems Interconnection) model
  is a theoretical framework that divides network communication into
  seven distinct layers, each with specific functions.  

- **Layers:**

  - Physical: Defines hardware and media.  

  - Data Link: Handles data frames and error correction.  

  - Network: Routes packets between networks.  

  - Transport: Ensures reliable data delivery.

  - Session: Manages connections between applications.  

  - Presentation: Handles data formatting and encryption.

  - Application: Provides network services to users.  

- **Purpose:** To provide a standardized reference model for network
  communication.  

**TCP/IP Model**

- **Protocol Suite:** The TCP/IP (Transmission Control Protocol/Internet
  Protocol) model is a practical implementation of network
  communication, based on a suite of protocols.  

- **Layers:**

  - Network Interface: Combines the physical and data link layers of
    OSI.  

  - Internet: Responsible for routing packets (like OSI's network
    layer).  

  - Transport: Handles end-to-end communication (like OSI's transport
    layer).  

  - Application: Combines the application, presentation, and session
    layers of OSI.

- **Purpose:** To provide a functional model for building and operating
  networks.

Key Differences

| Feature                   | OSI Model  | TCP/IP Model |
|---------------------------|------------|--------------|
| Nature                    | Conceptual | Practical    |
| Layers                    | 7          | 4            |
| Protocol independence     | Yes        | No           |
| Standardization           | High       | Lower        |
| Real-world implementation | Less       | Widely used  |

**In essence:**

- **OSI Model** is a theoretical blueprint for network communication,
  providing a structured approach to understanding network functions.  

- **TCP/IP Model** is a practical implementation based on real-world
  protocols, forming the backbone of the internet.  

While TCP/IP is more widely used in practice, understanding the OSI
model can provide valuable insights into network concepts and
troubleshooting.  

## QnA

If you had to get rid of a layer of the OSI model, which would it be?

The OSI model is a conceptual framework used to illustrate the functions
of a networking system. It divides the communication process into seven
distinct layers, each with specific tasks. If I had to eliminate one
layer, it would be the **Session Layer**.

Here is why:

- **Redundancy:** The Session Layer's functions, such as managing
  communication sessions and synchronizing data exchange, can be
  partially or completely handled by other layers like the Transport
  Layer.

- **Implementation Challenges:** In practice, the Session Layer is often
  not strictly implemented in many networking protocols and systems.

- **Focus on Core Functionality:** Removing the Session Layer could
  simplify the model and emphasize the core functions of network
  communication, which are primarily handled by the lower layers
  (Physical, Data Link, Network, Transport) and the Application Layer.

While removing the Session Layer might streamline the model, it is
important to acknowledge that it serves a purpose in certain scenarios.
It provides a structured approach to managing complex communication
sessions, especially in environments with diverse applications and
devices.

# TCP/IP Suite

- TCP / IP à Transport Control Protocol / Internet Protocol Layers **of
  TCP/IP protocol**

- Application Layer

- Transport Layer

- Internet Layer

- Network Access

TCP - Transport Control Protocol

IP - Internet Protocol

**Internet Layer**

**Protocols in the TCP/IP Internet Layer**

The Internet layer, also known as the Network layer, is responsible for
addressing and routing packets across networks. The primary protocols
operating at this layer are:  

**Core Protocols:**

- **Internet Protocol (IP):** The fundamental protocol that handles
  packet routing and addressing. It ensures data packets reach their
  destination by using IP addresses.  

- **Address Resolution Protocol (ARP):** Maps IP addresses to physical
  hardware addresses (MAC addresses) for devices on the same network.  

- **Internet Control Message Protocol (ICMP):** Provides error reporting
  and diagnostic information for IP communication.  

**Other Notable Protocols:**

- **Internet Group Management Protocol (IGMP):** Used for managing
  multicast groups.  

- **Reverse Address Resolution Protocol (RARP):** (Less commonly used)
  Allows a host to discover its IP address based on its hardware
  address.  

These protocols work together to ensure efficient and reliable data
transmission across networks.  

What is some common TCP/IP security protocols? How do they help protect
data transmission? (e.g., SSL/TLS)

TCP/IP, the backbone of the internet, relies on several protocols to
ensure secure data transmission. Here are some of the most common ones:

**SSL/TLS (Secure Sockets Layer/Transport Layer Security)**

- **How it works:** SSL/TLS encrypts data transmitted over the web,
  protecting it from eavesdropping. It also verifies the identity of the
  website, preventing man-in-the-middle attacks.  

- **Protection:**

  - **Encryption:** Data is scrambled into an unreadable format,
    protecting it from unauthorized access.  

  - **Authentication:** Verifies the identity of the website, ensuring
    you are communicating with the intended recipient.  

  - **Data Integrity:** Ensures data has not been altered during
    transmission.  

**IPsec (Internet Protocol Security)**

- **How it works:** IPsec provides end-to-end security for IP packets by
  encrypting, authenticating, and verifying data integrity.  

- **Protection:**

  - **Confidentiality:** Protects data from unauthorized disclosure.

  - **Integrity:** Ensures data has not been modified or tampered with.

  - **Authentication:** Verifies the identity of the sender and
    receiver.

**SSH (Secure Shell)**

- **How it works:** SSH provides secure remote access to computer
  systems, allowing users to log in and execute commands as if they were
  sitting at the console.  

- **Protection:**

  - **Authentication:** Strong authentication methods to protect against
    unauthorized access.

  - **Confidentiality:** Encrypts data transmitted between client and
    server.

  - **Integrity:** Ensures data integrity during transmission.

**HTTPS (Hypertext Transfer Protocol Secure)**

- **How it works:** HTTPS is the secure version of HTTP, using SSL/TLS
  to encrypt communication between a web browser and a web server.  

- **Protection:** Same as SSL/TLS.

**Other Notable Protocols**

- **VPN (Virtual Private Network):** Creates a secure tunnel over a
  public network, protecting data transmission.  

- **S/MIME (Secure/Multipurpose Internet Mail Extensions):** Provides
  encryption, digital signatures, and authentication for email.  

These protocols work together to create a layered security approach,
protecting data from various threats like eavesdropping, tampering, and
unauthorized access.

What are some emerging trends and technologies related to the TCP/IP
protocol suite? (e.g., Software-Defined Networking (SDN))

Emerging Trends and Technologies Related to TCP/IP

While TCP/IP remains the backbone of the internet, several emerging
trends and technologies are influencing its evolution and application:

**1. Software-Defined Networking (SDN):**

- **Centralized control:** SDN separates the control plane from the data
  plane, allowing for more flexible and programmable network management.
   

- **Automation:** Enables automated network provisioning, configuration,
  and troubleshooting.

- **Virtualization:** Facilitates the creation of virtual networks
  within physical infrastructure.

**2. Network Function Virtualization (NFV):**

- **Virtualized network functions:** Replaces traditional hardware-based
  network functions with software-based ones.  

- **Agility and scalability:** Offers greater flexibility and
  scalability for network services.  

- **Cost reduction:** Potentially lowers operational expenses.

**3. Internet of Things (IoT):**

- **Massive connectivity:** IoT devices generate vast amounts of data,
  requiring efficient network protocols.  

- **Low-power and low-cost networks:** Protocols like Lora WAN and
  Sigfox are gaining traction for IoT applications.

- **Security challenges:** Addressing security concerns in IoT
  environments is crucial.  

**4. 5G and Beyond:**

- **Increased data rates:** 5G and future wireless technologies demand
  higher throughput and lower latency.  

- **Network slicing:** Enables the creation of multiple virtual networks
  within a single physical network.  

- **Edge computing:** Brings computation and storage closer to the
  network edge for improved performance and responsiveness.  

**5. Cloud Computing:**

- **Network virtualization:** Cloud providers heavily rely on network
  virtualization to create isolated environments for tenants.

- **Load balancing:** Efficiently distributes traffic across multiple
  servers to optimize performance.  

- **Content Delivery Networks (CDNs):** Accelerate content delivery by
  caching data closer to end-users.  

**6. Security Enhancements:**

- **Encryption:** Widespread adoption of encryption protocols like
  TLS/SSL to protect data in transit.

- **Intrusion detection and prevention systems:** Detect and prevent
  cyberattacks.  

- **Zero-trust architecture:** A security model that assumes no one or
  nothing is inherently trustworthy.  

**7. Protocol Optimization:**

- **TCP congestion control:** Ongoing research to improve TCP
  performance in various network conditions.

- **QUIC:** A new transport layer protocol designed for modern networks,
  offering lower latency and higher performance.  

- **Multipath TCP:** Exploits multiple network paths to improve
  reliability and throughput.  

**8. Network Slicing:**

- **Dedicated network resources:** Creates isolated network slices for
  specific applications or services.  

- **Improved performance and reliability:** Provides tailored network
  capabilities for different use cases.

These trends and technologies are reshaping the networking landscape,
driving innovation, and addressing the challenges posed by the
increasing complexity and demands of modern networks.
