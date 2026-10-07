# **Securing data transfer between On-premises and Azure**

Your company needs to securely transfer sensitive financial data between your on-premises network and an Azure storage account. Currently, you are using an insecure FTP server on-premises for data transfer.

**Question:** How would you design a secure solution for transferring sensitive data between your on-premises network and azure storage?

- Highlight the risks associated with unsecured FTP transfer.

- Propose implementing Azure Data Factory for managed data integration.

- Configure secure transfer protocols like SSH File Transfer Protocol (SFTP) with strong encryption and user authentication over a dedicated VPN connection.

- Consider Azure ExpressRoute for a dedicated, private connection between your on-premises network and Azure, bypassing the public internet.

These scenarios allow you to showcase your understanding of both VPN functionalities and azure security best practices. Remember to tailor your responses to the specific details provided in each scenario.

**<span class="mark">Use Azure Data Factory for data transfer to azure from on-premises</span>**

# File Transfer and File Shares

- How to configure open-source FTP server on Linux?

- File Transfer: \>netcat

- Download and data transfer to/from remote machine: **curl -o <https://example.com/file.zip>**

- To send a POST request with data: **curl -X POST -d "param1=value1&param2=value2" <https://example.com/api>**

- Encrypted connection to remote machine, file transfers, Openssh client**: ssh -p admin@192.168.0.1**

- Data transfer securely, use SSH FTP (SFTP)**: sftp hostname/ip_address**

- Data transfer: **ftp**

- Data transfer to/from local and remote machines, mirroring, perform backups, copy files from one directory to another directory locally: **rsync -av /path/to/source /path/to/destination**, Synchronize two directories remotely: **rsync -avzhe ssh user@remote:/path/to/source /path/to/destination**

- Data transfer copy file over ssh (secure copy), Copy a file from a local system to a remote system**: scp file.txt <remote_username@10.10.0.2:/remote/directory>**

File Transfer Methods Explained

This summary clarifies various file transfer methods and their uses:

**Unsecure (Not Recommended):**

- **FTP (File Transfer Protocol):** Transfers files, but lacks encryption and exposes data in plain text. Consider secure alternatives.

**Secure and Common Methods:**

- **SFTP (SSH File Transfer Protocol):** Securely transfers files using SSH encryption. Recommended for most file transfer needs.

- **SCP (Secure Copy):** A command-line tool for copying files over SSH securely. Great for single file transfers.

- **Rsync:** Efficiently synchronizes files and directories between local or remote machines. Ideal for backups and mirroring.

**Specific Use Cases:**

- **curl:** Primarily used for downloading files from web servers.

- **netcat (not secure):** Offers basic data transfer functionality, but lacks encryption. Use with caution.

**Command Examples:**

- **Transfer a file using SCP:** scp file.txt username@remote_ip:/remote/directory

- **Synchronize directories remotely with rsync:** rsync -avzhe ssh user@remote:/source /destination

**Remember:**

- For secure file transfer, prioritize SFTP, SCP, and rsync.

- Use curl cautiously and only for downloads from verified sources.

- Avoid netcat due to security vulnerabilities.

# SMB

**SMB (Server Message Block):**

- A network file sharing protocol used primarily on Windows systems.

- Allows users to share files and printers across a network.

- Often exposed to the internet, making it a target for attackers.

**NetBIOS (Network Basic Input/Output System):**

- A protocol used to name computers and devices on a network.

- Often used in conjunction with SMB.

**SMB Penetration Testing:**

- **Enumeration:** Gathering information about SMB shares, users, and groups.

  - **Null Sessions:** Exploiting anonymous access to gather information.

  - **Enum4Linux:** A tool for enumerating SMB shares and users.

- **Brute Force and Password Cracking:** Attempting to guess passwords for SMB accounts.

- **Denial of Service (DoS):** Overwhelming the SMB server to disrupt its service.

  - **EternalBlue and EternalRomance:** Exploiting vulnerabilities in older SMB versions.

- **Remote Login:** Gaining unauthorized access to SMB shares.

- **Port Redirection:** Redirecting network traffic to exploit vulnerabilities.

**SMB Security:**

- **Strong Password Policies:** Enforce strong, unique passwords.

- **Regular Security Updates:** Keep SMB server software up-to-date.

- **Restrict Network Access:** Limit access to SMB shares to authorized users and systems.

- **Implement Firewalls:** Filter traffic to and from SMB ports.

- **Use Intrusion Detection Systems (IDS):** Monitor network traffic for suspicious activity.

- **Consider Alternative Protocols:** For secure file transfers, use SFTP or SCP.

**File Transfer Between Windows and UNIX:**

To transfer files between Windows and UNIX systems, you can use the following methods:

- **SMB/CIFS:** If both systems are on the same network, you can use SMB/CIFS to share files and folders.

- **FTP:** While not as secure, FTP can be used to transfer files between systems.

- **SFTP:** A more secure alternative to FTP that uses SSH encryption.

- **SCP:** A command-line tool for copying files securely over SSH.

- **RSync:** A powerful tool for synchronizing files and directories between systems.

By understanding SMB, NetBIOS, and their security implications, you can protect your systems from attacks and ensure secure file transfers.

# SMB

**NetBIOS & SMB Penetration Testing**

- Introduction & Lab Setup

- SMB Enumeration

- SMB Null Sessions

- Enum4Linux

- Brute Force & Password Cracking

- SMB DOS

- Eternal Blue & Eternal romance

- Remote Login with SMB

- Port Redirection

**How to transfer a file from/to windows machine to UNIX**

- SMB attacks

- SMB security

- SMB server

# SCP

Understanding the \`scp\` Command:🡪\`scp -r /etc shekhar@172.24.0.240:/tmp\`

- What it does? This command copies the entire \`/etc\` directory (and all its contents) from the local machine to the \`/tmp\` directory on the remote machine with the IP address \`172.24.0.240\`, under the user \`shekhar\`

- Explanation:

  - \`scp\`: Secure copy command, used to copy files/directories between hosts on a network.

  - \`-r\`: Recursively copy directories and their contents.

  - \`/etc\`: Source directory to be copied.

  - \`shekhar@172.24.0.240:/tmp\`: Destination path on the remote machine.

# RSync

# Network File System (NFS)

NFS is a distributed file system protocol that allows users to access files stored on a remote server as if they were on their local machine. This is achieved by exporting directories from a server and mounting them on client machines.

**Key Benefits of NFS:**

- **Centralized Storage:** Files can be stored centrally and accessed by multiple clients.

- **Remote File Access:** Users can access files from anywhere on the network.

- **Simplified File Sharing:** Easily share files and directories between systems.

- **Reduced Storage Costs:** Consolidate storage onto fewer servers.

**Common Use Cases:**

- **File Sharing:** Sharing files between workstations and servers.

- **Home Directories:** Centralizing user home directories for easy management.

- **Software Distribution:** Distributing software installation images to client machines.

- **Backup Storage:** Storing backups on a centralized NFS server.

**To answer the question:**

**NFS** is the most suitable local file server for providing distribution installation materials during a network installation. It allows you to share the installation files from a central location, making them accessible to multiple machines on the network.

# FTP

**FTP** (File Transfer Protocol) is an old protocol used to transfer files between computers. While it was one of the first methods for doing this, it lacks crucial security features.

**Key points about FTP:**

- Created in 1971.

- Transfers files between computers.

- No built-in encryption, making it insecure.

- Uses port 21.

- Usernames, passwords, and files are sent in plain text.

- More secure alternatives exist: FTPS (FTP with encryption) and SFTP (Secure File Transfer Protocol).

**FTP security concerns:**

- Data is transmitted unencrypted, making it vulnerable to interception.

**Basic FTP commands and usage:**

- **Connecting to an FTP server:** Use commands like open, user, and password.

- **Transferring files:** Use commands like put to upload and get to download.

- **Navigating directories:** Use commands like cd and ls.

**Additional commands and concepts:**

- **scp:** A more secure alternative to FTP for copying files between servers.

- **Finding logged-in users:** Use the w command and process the output to extract unique IP addresses.

- **Creating aliases:** Use shell scripting to create custom commands for frequent tasks.

**Remember:** Due to its security vulnerabilities, FTP is generally not recommended for sensitive data transfer. Consider using FTPS or SFTP instead.

It is one of the widely used application layer protocol of the TCP/IP protocol suite. FTP is basically used to exchange data between two host devices over the Internet or Intranet securely.

It is referred to as one of the safest modes of file sharing among systems, and thus it is deployed by large industries, universities, and offices.

It works in the client-server model and thus the user needs an FTP client program to run FTP on its system. The common types of FTP client program include Filezilla and Dreamweaver etc.

The data transfer takes place only in one direction at a time. The FTP protocol carries out many duties apart from file transfer like creation and deletion of data files, listing, renaming, etc.

## FTP Model

In this model, one host behaves as the client and another host as a server. The one who requests for file-sharing or data is the client host and one which in response completes the request is the server host.

Firstly, the FTP connection is established between the client and server computer and data exchange take place after that. Two channels come into the picture of FTP connection i.e. control channel and data channel.

The control channel establishes the connection between the client and server and remains open for the overall session. The control channel port number is 21 in TCP/IP. While the data channel opens when the client request for a file sharing and get closed after the completion of the request by the server.

<img src="media/image1.jpeg" style="width:9.69306in;height:5.53542in" />

Two processes naming data transfer process (DTP) and protocol interpreter (PI) are used in managing the communication between the client and the server. The DTP establishes and manages the connection for the data channel, while PI manages the DTP by applying commands given by the control channel.

The server host end PI is accountable for analysing the commands received from the client host end via the control channel, connection establishment, and in running the DTP. The client PI is accountable for forwarding the FTP commands, receiving the response from the server and establishment of the connection with the FTP server.

After the establishment of a connection between the FTP client and the FTP server, the client builds up the connection and sends the FTP commands to the server. The server analyzes them and in response completes the request.

Now the server end PI sends the port detail on which the files will be forwarded to the client DTP. The client DTP then waits for the data to arrive at the decided port from the server.

## FTP Response

To make out a secure and reliable file transfer between the client and server, it is important that the server and client should remain in synchronization with each other.

Thus, for each command executed by the client, a user is acknowledged by the response and the action is performed by the server host in order. The response consists of a 3-digit code plus a text (a character string is separated from digit by a space) denoting the processing of the commands.

## Types of Connection

The FTP server is connected to the FTP client on the control port 21. After this, the client will decide which type of connection it will make with the FTP server, i.e. whether an active or passive connection.

\(i\) Active Connection: If an active connection is established, then the data connection from the server end is opened on port 20 or to a greater range towards the client’s end. Then all the data flow will take place on this connection.

\(ii\) Passive Connection: If the passive connection is established, the client requests for passive connection from the server and assigns any port greater than 10,000. The server bounds itself to this port and gets back to the client with it.

The client then opens a new data connection for a particular session on this newly bounded port. In a passive connection, every time a new port is assigned when a new data connection request is raised from the client’s end. The latest trend in the networking system operates mostly in passive mode.

Example: Let’s take the example of a software organization, where hundreds of performance and daily activity reports are generated by the employees and those need to be shared with their vertical head, CEO or seniors at the remote end.

One way of sharing the daily reports and tracker is to send an e-mail to all of them. However, it takes a lot of time and if the size of the attachment is big in an e-mail, then it will take much time for downloading and the mailbox will get full frequently due to oversized mails.

The other way to do this is that the creators of data will put the reports and trackers on the FTP server and share the path with each concern. In this case, the end-user will behave as the client host and can access the files of their era from the server by just logging onto the server.

The server can be made secure by putting a password. Only the concerns will have the username and password to access it. The port used here is 21. As per rights granted to the clients, they can also create a copy, modify and delete the files on the server and from the server.

## FTP PenTest 

**Overview**

FTP penetration testing involves assessing the security of a File Transfer Protocol (FTP) server. It focuses on identifying vulnerabilities that could be exploited by malicious actors.

**Key Areas of Focus**

- **Banner Grabbing:** Gathering information about the FTP server by analysing its banner, which often reveals the server type, version, and other details.

- **Banner Hiding:** Understanding techniques to obscure or modify the FTP server banner to prevent information leakage.

- **FTP Exploitation:** Identifying and exploiting vulnerabilities in the FTP server, such as weak credentials, misconfigurations, or specific software flaws.

- **Brute Force and Password Cracking:** Attempting to gain unauthorized access by trying different combinations of usernames and passwords.

- **Brute Force Prevention:** Implementing measures to protect against brute force attacks, such as account lockout policies and IP blocking.

- **Remote Port Forwarding:** Establishing a connection between a local and remote system to bypass network restrictions.

- **Pivoting:** Using a compromised system as a stepping stone to access other systems within a network.

**Additional Notes**

- The provided text repeatedly lists the same content, suggesting potential errors in the original data.

- A more comprehensive FTP penetration test would also include areas like file permissions, data exfiltration, and denial-of-service attacks.

## QnA

FTP Server Port

- **FTP servers typically run on port 21.** This is the standard control port for FTP connections.

**Connecting to an FTP Server**

To connect to an FTP server, you can use an FTP client. Some common FTP client commands include:

- **open:** Establishes a connection to the FTP server.

- **user:** Specifies the username for login.

- **pass:** Specifies the password for login.

**Restricting SSH, Telnet, and FTP with iptables**

Iptables is a firewall tool used in Linux systems to filter network traffic. To restrict SSH, Telnet, and FTP, you can use the following basic iptables rules (adjust as needed for your specific setup):

- **Blocking SSH (port 22):** \>iptables -A INPUT -p tcp --dport 22 -j DROP

- **Blocking Telnet (port 23):** \>iptables -A INPUT -p tcp --dport 23 -j DROP

- **Blocking FTP (port 21):** \>iptables -A INPUT -p tcp --dport 21 -j DROP

**Note:**

- These rules completely block the respective services. You might want to allow access from specific IP addresses or for certain purposes.

- Iptables rules are often temporary. To make them persistent, you'll need to save them using commands like iptables-save and restoring them on boot.

- Consider using more advanced firewall configurations or dedicated firewall software for robust security.

**Important:** Always test firewall changes in a controlled environment to avoid unintended consequences

**Additional Considerations:**

- While FTP is convenient, it is generally considered insecure due to plaintext transmission of credentials and data. Consider using SFTP (SSH File Transfer Protocol) for secure file transfers.

- For more complex firewall rules, consider using tools like ufw or firewalld which provide user-friendly interfaces.

## FTP

FTP (File Transfer Protocol) is a network protocol used to transfer files between a client and a server on a computer network. While it was once widely used, its lack of security has led to its decline in popularity.

**Key Points about FTP:**

- **Port Number:** FTP typically operates on port 21.

- **Security:** FTP transmits data in plain text, making it vulnerable to interception.

- **Modern Alternatives:** More secure protocols like FTPS (FTP over SSL/TLS) and SFTP (SSH File Transfer Protocol) are now preferred.

**Common FTP Commands**

Here are some common FTP client commands:

- **open hostname port:** Connects to an FTP server.

- **user username:** Identifies the user.

- **password:** Provides the password for authentication.

- **pwd:** Displays the current working directory on the server.

- **ls:** Lists files and directories in the current directory.

- **cd directory:** Changes the current working directory.

- **get filename:** Retrieves a file from the server.

- **put filename:** Uploads a file to the server.

- **quit:** Disconnects from the FTP server.

FTP Attacks

FTP servers are common targets for various attacks, including:

- **Banner Grabbing:** Extracting information about the server's software and configuration.

- **Brute Force Attacks:** Repeatedly trying different passwords to gain unauthorized access.

- **Exploiting Vulnerabilities:** Taking advantage of known security flaws in the FTP server software.

- **Remote Port Forwarding:** Establishing a tunnel to access internal systems.

- **Pivoting:** Using a compromised FTP server as a stepping stone to attack other systems.

Protecting FTP Servers

To mitigate FTP security risks, consider the following measures:

- **Strong Password Policies:** Enforce strong, unique passwords.

- **Regular Security Updates:** Keep the FTP server software up-to-date.

- **Limiting User Access:** Grant only necessary privileges to users.

- **Network Segmentation:** Isolate the FTP server from other critical systems.

- **Intrusion Detection Systems (IDS):** Monitor network traffic for suspicious activity.

- **Consider Secure Alternatives:** Migrate to FTPS or SFTP for encrypted file transfers.

**Additional Considerations**

- **SCP (Secure Copy):** A command-line utility for securely copying files between hosts.

  - **Example:** scp -r /etc user@172.24.0.240:/tmp recursively copies the /etc directory to the remote /tmp directory.

- **SFTP (SSH File Transfer Protocol):** A secure file transfer protocol built on top of SSH.

- **FTPS (FTP over SSL/TLS):** A secure version of FTP that encrypts the data transmission.

By understanding these concepts and implementing appropriate security measures, you can minimize the risks associated with FTP and protect your systems from potential attacks.

How to transfer a file from/to windows machine to UNIX

- What will the following command do scp -r /etc shekhar@172.24.0.240:/tmp

- On which port ftp server runs UNIX /Linux Fundamentals

- How to connect to the ftp server. Mention at least 3 client commands

- Find out all IP address from where users are currently logged in. Display only the unique IP addresses. (Hint: w) Q: Crete an alias named myip do display only the IP address of your server (Hint: ifconfig, cut, grep, head, tail etc.)

## SFTP

Imagine you need to send a large file to a friend. SFTP works by converting the message into a secret code that only you and the recipient can understand

<img src="media/image2.jpeg" style="width:5.20121in;height:2.4877in" />

## FTPS

# Attacks during File transfer

FTP

Python HTTP Server

PHP http server

HFS Tool

Netcat

CURL

Wget

TFTP

Python SMB Server

PowerShell File Transfer

Bitsadmin
