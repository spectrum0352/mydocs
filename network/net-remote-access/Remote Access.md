# Secure remote access

Employees and vendors may need to connect to your network remotely.

Put your network’s security first. Make employees and vendors follow strong security standards before

they connect to your network. Give them the tools to make security part of their work routine.

How to protect devices?

Whether employees or vendors use company-issued devices or their own when connecting remotely to your network, those devices should be secure. Follow these tips — and make sure your employees and vendors do as well:

- Always change any pre-set router passwords and the default name of your router. And keep the router’s software up to date; you may have to visit the router’s website often to do so

- Consider enabling full-disk encryption for laptops and other mobile devices that connect remotely to your network. Check your operating system for this option, which will protect any data stored on the device if it’s lost or stolen. This is especially important if the device stores any sensitive personal information.

- Change smartphone settings to stop automatic connections to public Wi-Fi.

- Keep up-to-date antivirus software on devices that connect to your network, including mobile devices.

How to connect remotely to the network?

Require employees and vendors to use secure connections when connecting remotely to your network. They should:

- Use a router with WPA2 or WPA3 encryption when connecting from their homes. Encryption protects information sent over a network so that outsiders cannot read it. WPA2 and WPA3 are the only encryption standards that will protect information sent over a wireless network.

- Only use public Wi-Fi when also using a virtual private network (VPN) to encrypt traffic between their computers and the internet. Public Wi-Fi does not provide a secure internet connection on its own. Your employees can get a personal VPN account from a VPN service provider, or you may want to hire a vendor to create an enterprise VPN for all employees to use

What to do to maintain security?

Train your staff:

- Include information on secure remote access in regular trainings and new staff orientations.

- Have policies covering basic cybersecurity, give copies to your employees, and explain the importance of following them.

- Before letting any device — whether at an employee’s home or on a vendor’s network — connect to your network, make sure it meets your network’s security requirements.

- Tell your staff about the risks of public Wi-Fi.

Give your staff tools that will help maintain security:

- Require employees to use unique, complex network passwords and avoid unattended, open workstations.

- Require multi-factor authentication to access areas of your network that have sensitive information. This requires additional steps beyond logging in with a password — like a temporary code on a smartphone or a key that is inserted into a computer.

- If you offer Wi-Fi on your business premises for guests and customers, make sure it is separate from and not connected to your business network.

- Consider creating a VPN for employees to use when connecting remotely to the business network.

- Include provisions for security in your vendor contracts, especially if the vendor will be connecting remotely to your network

<!-- -->

- **How do you protect your home wireless access point?** This is another opinion question. There are a lot of different ways to protect a wireless access point: using WPA2, not broadcasting the SSID and using MAC address filtering are the most popular among them. There are many other options, but in a typical home environment, those three are the biggest.

<!-- -->

- **How do you protect your home wireless access point?**

- 

- **What do you have on your Home Network?** à Nothing shows you how to break and fix things more than a test environment, and for most people that means their home network. Whether it is a Windows laptop with a wireless generic router and a phone, all the way up to 14 Linux workstations, an Active Directory Domain Controller, a dedicated firewall appliance and a net-attached toaster — if you are learning and fiddling with it, that is what matters. This seems like a strange question for an interviewer to ask at first, but it does come up quite often. The aim of this question, from an interviewer’s perspective, is to see how much research and lab testing a candidate likes to do at home. Your answer is not likely to directly affect the outcome of the job interview, but the person asking the question will be able to gauge how seriously you take your studying and practice labs. They might post a follow-up question to see how you relate your home security setup to the work environment, so be prepared to go into detail about the technologies you have deployed around the house. Some companies are trying to get a feel for how passionate you are about technology in general, so include as much detail as you can. 

- **How to protect Home Wireless Access Point?** Using WPA2, Not broadcasting the SSID, Using MAC address filtering

**What is your preferred method of giving remote employees access to the company network and are there any weaknesses associated to it?** VPNs are especially useful for remote workers because they can be used to access your company's network from anywhere in the world. This means that you can connect to your office computer as if you were in the office itself, allowing you to work on files and applications that are stored on the network. 

- **You are remoted in to a headless system in a remote area. You have no physical access to the hardware and you need to perform an OS installation. What do you do?** There are a couple of different ways to do this, but the most like scenario you will run into is this: What you would want to do is setup a network-based installer capable of network-booting via PXE (if you have ever seen this during your system boot and wondering what it was. Environments that have very large numbers of systems often have the capability of pushing out images via the network. This reduces the amount of hands-on time that is required on each system, and keeps the installs more consistent.

- **How do you check if a particular process is listening on a particular port on remote host?** By using telnet command for example “telnet hostname port.” If it can successfully connect then some process is listening on that port.

- **How do you find which remote hosts are connecting to your host on a particular port say 10123?** By using netstat command execute netstat -a \| grep "port" and it will list the entire host which is connected to this host on port 10123.

- **How do you know if a remote host is alive or not?** You can check these by using either ping or telnet command in UNIX. This question is most asked in various Unix command Interview because its most basic networking test anybody wants to do it.

- **How to check if process is listening on port on remote host?** By using telnet command for example “telnet hostname port.” If it can successfully connect then some process is listening on that port. Find out which process is listening on a particular port by running: \#fuser 80/tcp. Find the process name using PID number: \#ps -p \<PID\>

- **How to find out which clients are connected to your machine (not just ssh clients)**

- **How to find which remote hosts are connecting to your machine on a particular port say 10123?** By using netstat command execute: netstat -a \| grep "port"

- **How to test remote server status?**

- **How would you determine whether a remote server is running Apache or IIS?**

- **How would you judge if a remote server is running IIS or Apache?** Error messages oftentimes give away what the server is running, and many times if the website administrator has not set up custom error pages for every site, it can give it away as simply as just entering a known bad address. Other times, just using telnet can be enough to see how it responds. Never underestimate the amount of information that can be gained by not getting the right answer but by asking the right questions.

- **How would you lock down a mobile device?** Another opinion question, and as usual a lot of different potential answers. The baseline for these though would be three key elements: an anti-malware application, a remote wipe utility and full disk encryption. Almost all modern mobile devices regardless of manufacturer have antimalware and remote wipe available for them, and very few systems now do not come with full disk encryption available as an option directly within the OS.

- **What do you do, if you are remoted in to a headless system in a remote area. You have no physical access to the hardware and you need to perform an OS installation?** There are a couple of different ways to do this, but the most like scenario you will run into is this: What you would want to do is setup a network-based installer capable of network-booting via PXE (if you have ever seen this during your system boot and wondering what it was. Environments that have very large numbers of systems often have the capability of pushing out images via the network. This reduces the amount of hands-on time that is required on each system, and keeps the installs more consistent.

- **What is your preferred method of giving remote employees access to the company network and are there any weaknesses associated to it?** VPNs are especially useful for remote workers because they can be used to access your company's network from anywhere in the world. This means that you can connect to your office computer as if you were in the office itself, allowing you to work on files and applications that are stored on the network. 

- **You are remoted in to a headless system in a remote area. You have no physical access to the hardware and you need to perform an OS installation. What do you do?** There are a couple of different ways to do this, but the most like scenario you will run into is this: What you would want to do is setup a network-based installer capable of network-booting via PXE (if you have ever seen this during your system boot and wondering what it was. Environments that have very large numbers of systems often have the capability of pushing out images via the network. This reduces the amount of hands-on time that is required on each system, and keeps the installs more consistent.

- **You are remoted in to a headless system in a remote area. You have no physical access to the hardware and you need to perform an OS installation. What do you do?** There are a couple of different ways to do this, but the most like scenario you will run into is this: What you would want to do is setup a network-based installer capable of network-booting via PXE (if you have ever seen this during your system boot and wondering what it was. Environments that have very large numbers of systems often have the capability of pushing out images via the network. This reduces the amount of hands-on time that is required on each system, and keeps the installs more consistent.

**Is SSH completely secured? If not, can it be hardened more?**

# **Remote access to Azure Resources**

How to connect remotely Azure VMs?

# **Remote access to Azure virtual machines**

Connecting Azure Virtual Machines (VMs) securely to the internet involves several best practices and tools to ensure your VMs are protected from unauthorized access and attacks. Here are some key methods:

 

1\. Azure Bastion: This is a fully managed service that provides secure and seamless RDP and SSH access to your VMs without exposing them to public IP addresses. It reduces the attack surface and avoids the need for jump boxes.

2\. Just-In-Time VM Access: This feature allows you to control when and how users can access your VMs, reducing the risk of brute force attacks. It can be configured to allow access only when needed and for a limited time. 

4\. Site-to-Site VPN: This method connects your on-premises network to your Azure virtual network, allowing secure access to your VMs using private IP addresses. It keeps your communication off the public internet, protecting against port scanning and DDoS attacks.

5\. Public IP Address with NAT: You can assign a public IP address to your VM and use Network Address Translation (NAT) to hide the internal IP addresses of your VMs. This adds an extra layer of security by masking the internal network structure.

6\. Jump box VM: Create a single VM in Azure with RDP or SSH access to the internet. From this VM, you can securely connect to other VMs in your virtual network.

**Azure Bastion is most secure option to access Azure VM’s from internet.**

Azure Bastion provides a managed platform for RDP and SSH access to your VMs, keeping your VMs off the public internet and reducing the attack surface. Here is why it is considered the most secure option:

- **No Public IP Exposure:** VMs accessed through Azure Bastion do not require public IP addresses, making them less vulnerable to external threats.

- **Integrated with Azure**: It seamlessly integrates with Azure’s native platform, providing an extra layer of security and ease of use.

- **Encrypted Connections**: All connections through Azure Bastion are encrypted, protecting your data during transmission.

- **Simplified Management**: It eliminates the need for jump servers, virtual private networks (VPNs), and firewall configurations, reducing potential points of failure or misconfiguration.

# **Remote access challenges**

Your company has a growing number of remote employees who need secure access to internal resources on your Azure Virtual Network. Currently, you rely on a basic Point-to-Point VPN (PPTP) solution. However, you are experiencing performance issues and concerns about the security of PPTP.

**Question:** How would you design a secure and scalable solution for remote access to your Azure Virtual Network, considering the limitations of PPTP?

- Discuss the limitations of PPTP (weak encryption) and its unsuitability for many users.

- Propose a migration to Microsoft Entra with MFA for secure user identification and access control.

- Suggest utilizing Azure Remote Desktop Gateway for secure remote desktop access to specific VMs within the VNet.

- For additional security, explore configuring a site-to-site VPN connection to a secure on-premises firewall for specific use cases requiring access to internal resources beyond RD Gateway.
