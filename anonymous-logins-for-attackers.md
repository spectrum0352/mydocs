# Anonymous Logins for Attackers

This guide explores the risks of anonymous logins in network services,
particularly focusing on **FTP** and **SMB**. These services can be
configured to allow access without authentication, which attackers can
exploit to gain unauthorized access to sensitive data. The document
walks through the setup of anonymous services on a local Ubuntu machine,
simulates attacks against them, and highlights the penetration testing
techniques used to discover and exploit these misconfigurations.

- Setting Up Anonymous FTP
- Attacking Anonymous FTP
- Setting Up Anonymous SMB
- Attacking Anonymous SMB
- Conclusion

------------------------------------------------------------------------

## Introduction

Anonymous login services allow access without requiring specific
credentials. While this can be useful for public data sharing, it poses
a significant security risk if sensitive data is exposed. In penetration
testing, identifying and testing anonymous access points is critical.
This guide demonstrates how to set up and exploit such services using
FTP and SMB on an Ubuntu-based target.

------------------------------------------------------------------------

## Setting Up Anonymous FTP

Covers configuring the **vsftpd** service on Ubuntu to enable anonymous
FTP access. Key configuration steps include:

- Installing vsftpd
- Editing the /etc/vsftpd.conf file
- Enabling anonymous_enable=YES
- Restarting the service

### Attacking Anonymous FTP

Demonstrates how an attacker can:

- Connect using ftp or tools like nmap or enum4linux
- Browse public directories
- Download accessible files
- Look for sensitive configuration files or credentials stored in public folders

## Setting Up Anonymous SMB

Explains configuring **Samba (SMB)** on Ubuntu for anonymous shares. Key steps:

- Installing samba
- Modifying /etc/samba/smb.conf to add public shares with guest ok = yes
- Restarting the Samba service
- Creating directories for sharing

### Attacking Anonymous SMB

Describes using tools such as:

- smbclient to list and access shares
- enum4linux or smbmap to enumerate shares and permissions
- Identifying sensitive files in anonymous shares

## Conclusion

Anonymous login features can inadvertently expose sensitive data. During
penetration testing, these services should be thoroughly assessed, and
any discovered misconfigurations should be reported with remediation
guidance, such as disabling anonymous access or properly securing shared
folders.

# Anonymous FTP logins on the Azure Linux VMs

## Objective

Demonstrate how attackers can exploit **anonymous FTP logins** on Linux VMs (especially in Azure environments) to gain unauthorized access and download sensitive files.

1. Anonymous FTP Login Setup on Ubuntu
Install the FTP Service: Use a Linux VM (e.g., Ubuntu) with root access to install **vsftpd** (Very Secure FTP Daemon):

```
sudo apt update && sudo apt install vsftpd
```

2. Configure Anonymous FTP Access
Open and edit the configuration file:

```
sudo nano /etc/vsftpd.conf
```

Find and change:

```
anonymous_enable=NO
```

to:

```
anonymous_enable=YES
```

Add the following configurations exist:

* anon_root=/var/ftp
* no_anon_password=YES
* hide_ids=YES
* pasv_min_port=40000
* pasv_max_port=50000

**3. Create Anonymous Share Directory**

Set up the directory where files can be accessed anonymously:

```
sudo mkdir -p /var/ftp/pub
```

```
sudo chown nobody:nogroup /var/ftp/pub
```

```
cd /var/ftp/pub
```

```
echo "Welcome to Hacking Articles" \> note.txt
```

**4. Restart the FTP Service**

Apply the configuration changes:

```
sudo systemctl restart vsftpd
```

**Attacker Perspective (Kali Linux or Equivalent)**

Once anonymous FTP is enabled, attackers can connect using tools like ftp, ncftp, or even web browsers.
Example:

```
ftp \<target-ip\>
```

```
login as: anonymous
password: \[blank or any text\]
```

**Security Impact**

- Misconfigured FTP services with anonymous access **can expose sensitive files to attackers**.
- Azure Linux VMs exposed via public IPs with open FTP ports (21) are especially vulnerable.
- Attackers often scan Azure IP ranges for such services.

**Recommendations**

- **Disable anonymous login** unless explicitly needed:

- anonymous_enable=NO

- Use **firewall rules, NSGs (Azure Network Security Groups)**, or
  **Just-in-Time VM access** to restrict public access to port 21.

- **Monitor FTP logs** and configure **Microsoft Defender for Cloud** to
  detect anomalous FTP activity.

------------------------------------------------------------------------

# Penetration Testing: Attacking Anonymous Logins on Azure VMs

**1. Attacking Anonymous FTP**

- **Reconnaissance:**\
  Attackers start by scanning the target VM for open ports and services.
  Using **Nmap** with aggressive scan options, attackers detect the FTP
  service and identify if **anonymous login is enabled**:

- nmap -A 192.168.1.46

- **Exploiting Anonymous FTP:**\
  With anonymous access allowed, attackers can connect without
  credentials:

- ftp 192.168.1.46

- \# username: anonymous

- \# password: \[blank or any\]

  - List directories using ls

  - Navigate to shared folders (e.g., cd pub)

  - Download files with get \<filename\> (e.g., get note.txt)

  - View downloaded files locally to confirm data access:

- cat note.txt

------------------------------------------------------------------------

**2. Setting Up and Attacking Anonymous SMB**

- **Setup on Ubuntu:**\
  SMB service is commonly used on Windows but can be enabled on Linux
  via **Samba**:

- sudo apt install samba

- **Configuration:**

  - Edit Samba’s config file /etc/samba/smb.conf

  - Configure an anonymous accessible share pointing to a directory like
    /var/www

  - Set permissions to allow public, browsable access

  - Create a test file:

- echo "Welcome To Ignite Technologies" \> /var/www/file.txt

- **Restart Samba Service:**

- sudo systemctl restart smbd

- **Attacking Anonymous SMB:**\
  Using tools like smbclient, attackers connect anonymously:

- smbclient -L //192.168.1.46 \# List shares anonymously

- smbclient //192.168.1.46/shares \# Connect to share without
  credentials

  - Enumerate files and download sensitive data (e.g., file.txt)

  - Confirm file contents locally:

- cat file.txt

# Conclusion

- **Anonymous logins** on FTP and SMB services are a common misconfiguration in both real environments and CTF challenges.
- Understanding setup and exploitation techniques is critical for penetration testers to identify and exploit these weaknesses.
- Attackers leverage these misconfigurations to gain unauthorized access, download sensitive files, and potentially escalate further.
- Defenders should audit for anonymous access, restrict it when unnecessary, and monitor related network traffic.