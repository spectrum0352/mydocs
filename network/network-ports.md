# Network Ports

What are the common TCP ports an Analyst should know?

**Essential TCP Ports for an Analyst**

Understanding common TCP ports is crucial for network analysts, security engineers, and anyone involved in network troubleshooting or security analysis. Here are some of the most important ones:  

**Well-Known Ports (0-1023)**

- **Port 21:** FTP (File Transfer Protocol) - Used for transferring files between computers.  

- **Port 22:** SSH (Secure Shell) - Provides secure remote access to systems.  

- **Port 23:** Telnet (Deprecated) - Used for remote terminal access (insecure).  

- **Port 25:** SMTP (Simple Mail Transfer Protocol) - Used for sending emails.  

- **Port 53:** DNS (Domain Name System) - Translates domain names into IP addresses.  

- **Port 80:** HTTP (Hypertext Transfer Protocol) - Used for web browsing.  

- **Port 443:** HTTPS (Hypertext Transfer Protocol Secure) - Encrypted version of HTTP.  

**Common Registered Ports (1024-49151)**

- **Port 110:** POP3 (Post Office Protocol version 3) - Used for retrieving emails from a server.

- **Port 143:** IMAP (Internet Message Access Protocol) - Another protocol for retrieving emails.  

- **Port 2525:** SMTP submission port - Often used for outbound email servers.  

- **Port 3306:** MySQL - Database server.  

- **Port 1433:** Microsoft SQL Server - Database server.  

- **Port 3389:** RDP (Remote Desktop Protocol) - Allows remote control of another computer.  

**Additional Important Ports**

- **Port 161, 162:** SNMP (Simple Network Management Protocol) - Used for network management.  

- **Port 139, 445:** SMB (Server Message Block) - File and printer sharing protocol.  

- **Port 5900:** VNC (Virtual Network Computing) - Remote desktop sharing.

**Understanding Port Ranges**

- **Well-known ports (0-1023):** Assigned to specific services.  

- **Registered ports (1024-49151):** Used by applications and services.  

- **Dynamic or private ports (49152-65535):** Used by client applications for temporary connections.  

**Tools for Port Scanning**

- **nmap:** A powerful open-source port scanner.  

- **Nessus:** Commercial vulnerability scanner with port scanning capabilities.  

**Remember:**

- Port numbers can be changed, and not all services use default ports.

- Some services use multiple ports.

- Always verify information with reliable sources.

By understanding these common TCP ports, you will be better equipped to analyse network traffic, identify potential security threats, and troubleshoot network issues.

Explain the concept of ports in TCP/IP communication. How do they work with IP addresses?

**Ports in TCP/IP Communication**

**Understanding Ports**

A port is essentially a logical address used to identify specific applications or processes running on a device. It is like a doorway within a building (the device) that leads to a specific room (the application). While an IP address identifies a device on a network, a port number identifies a specific service or application running on that device.

**How Ports Work with IP Addresses**

To visualize this, imagine sending a letter. The IP address is the recipient's street address, specifying where the building is located. The port number is the apartment number, indicating where to deliver the letter within that building.

- **IP address:** Specifies the destination device on the network.

- **Port number:** Specifies the specific application or service on the destination device.

Together, an IP address and a port number form a *socket* which uniquely identifies a connection between two applications on different computers.

**Port Numbers**

Port numbers are numerical values ranging from 0 to 65535. They are divided into three ranges:

- **Well-known ports (0-1023):** Assigned to standard services like HTTP (port 80), FTP (port 21), and SMTP (port 25).

- **Registered ports (1024-49151):** Used by user applications and services.

- **Dynamic or private ports (49152-65535):** Used for temporary connections.

**Examples**

- To access a web page, your browser sends a request to the web server's IP address on port 80 (the standard port for HTTP).

- An email client uses port 25 to send emails to a mail server.

**Importance of Ports**

Ports are crucial for network communication because they allow multiple applications to share a single network connection. Without ports, it would be difficult to differentiate between different types of traffic on a network.

**In summary,** ports are essential for specifying applications on a device and enabling efficient communication in TCP/IP networks. They work in conjunction with IP addresses to create unique endpoints for network connections.

**Would you like to know more about specific port numbers or how ports are used in different network protocols?**