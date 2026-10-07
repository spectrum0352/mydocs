# Windows Network Administration (Security & Monitoring Focus)

Network Security Configuration

View IP configuration: ipconfig /all
Show DNS cache entries: ipconfig /displaydns
Configure interface to use DHCP: netsh interface ip set address
Configure DNS server for an interface: netsh interface ip set dns
View routing table: netstat -r
View ARP cache (IP-to-MAC mappings): arp -a
View ARP cache for a specific interface: arp -N <if_addr>
Add static ARP entry: arp -s IP_Address MacAddress
Delete ARP entry: arp -d IP_Address
Clear routing tables: route -f
Create persistent route across boots: route -p ADD
Modify existing routes: route CHANGE
Delete a route: route DELETE
Print routing table: route PRINT
View all Windows Firewall rules: netsh advfirewall firewall show rule name=all
View specific Firewall rule: netsh advfirewall firewall show rule name="allow browser"
Check firewall settings of current profile: netsh advfirewall show currentprofile
(⚠️ Security Note) Avoid disabling firewall (netsh advfirewall set) unless for controlled troubleshooting.
📡 Connection & Monitoring

View active TCP connections: Get-NetTCPConnection
Sort TCP connections by local port (PowerShell): Get-NetTCPConnection -LocalAddress <YourIP> | Sort-Object LocalPort
View all connections & listening ports: netstat -a
View connections with Process IDs (PIDs): netstat -ano
View protocol statistics (TCP/UDP/IP/ICMP): netstat -s -p <protocol>
View TCP connection states: netstat -i
View TCP templates: netstat -y
View executable files per connection: netstat -b
View FQDNs for remote addresses: netstat -f
View network direct connections: netstat -x
Monitor specific port usage every N seconds: netstat -ano <n> | find <port>
View process IDs of connections: netstat -o
Identify abnormal listening/active ports: netstat -nao 10
Dump protocol statistics: netstat -s
View active network sessions: net session
View active network shares: net use
🛠️ Network Testing & Troubleshooting

Ping continuously: ping -t <hostname/IP>
Ping using IPv4: ping -4 <hostname/IP>
Ping using IPv6: ping -6 <hostname/IP>
Send specific number of requests: ping -n <count> <hostname/IP>
Resolve IP to hostname: ping -a <hostname/IP>
Set TTL for ping: ping -i <hostname/IP>
Record route for N hops: ping -r <hostname/IP>
Loose source routing: ping -j <hostname/IP>
Strict source routing: ping -k <hostname/IP>
Specify source address: ping -S <src_address> <hostname/IP>
⚠️ Important Security Considerations

False Positives: Not all unusual connections are malicious. Verify processes/IPs before action.
System Stability: Avoid terminating critical system processes.
Updates: Keep Windows & antivirus updated for protection.
Research: Investigate unfamiliar processes or IP addresses before blocking.
⚙️ Assign Static IP Address

Open Control Panel → Network and Internet → Network and Sharing Center
Change adapter settings → Right-click Ethernet0 → Properties → IPv4
Select Use the following IP address:
IP: 172.16.0.10
Subnet: 255.255.255.0
Gateway: 172.16.0.3
Select Use the following DNS server:
Preferred DNS: 127.0.0.1
🧰 Network Troubleshooting Tools

Netsh – Configure & troubleshoot suspicious activity.
Tracert – Trace packet routes.
NSLOOKUP – Query DNS records.
Netstat – Display active connections & ports.
Ping – Test connectivity.
ARP – Manage ARP cache.
Route – View/modify routing table.
🔒 Network Security Controls

Windows Defender Firewall: Enforce inbound/outbound filtering.
User Access Control (UAC): Manage privilege elevation.
Network Access Protection (NAP): Restrict non-compliant devices.
BitLocker & EFS: Encrypt sensitive data.
Microsoft Defender ATP/Endpoint: Threat detection.
Security Auditing & Logging: Event Viewer, SIEM integration.
Group Policy (GPO): Apply domain-wide security baselines.
📂 Key Network Configuration Files

C:\Windows\System32\drivers\etc\hosts – Hostname-to-IP mappings.
C:\Windows\System32\drivers\etc\lmhosts – Legacy NetBIOS resolution.
C:\Windows\System32\config\SYSTEM – Registry network settings.
C:\Windows\System32\netsh.exe – CLI network tool.
C:\Windows\System32\drivers\etc\protocol – Supported protocols.
C:\Windows\System32\drivers\etc\services – Port-to-service mappings.
C:\Windows\System32\LogFiles\Firewall\pfirewall.log – Firewall logs.
C:\Windows\System32\wbem\Logs\NetSetup.log – Network setup logs.
🛡️ Hardening Windows Network Security

Enable Windows Defender Firewall & block unused ports.
Disable legacy protocols (SMBv1, NetBIOS).
Use strong encryption (TLS 1.2/1.3, IPsec).
Enforce segmentation (VLANs, firewall rules).
Enable NAP for compliance.
Use Defender ATP/Endpoint for advanced protection.
Apply Windows updates regularly.
Monitor logs via Event Viewer & SIEM.
🌐 Proxy Configuration

Manual Setup: Settings → Network & Internet → Proxy → Enter IP & Port.
Open-Source Proxy: Install Squid/CCProxy → Configure rules → Allow firewall exceptions.
Domain-wide Proxy (GPO):
Open Group Policy Editor (gpedit.msc)
Navigate: Computer Configuration → Administrative Templates → Windows Components → Internet Explorer
Set Proxy Settings for all users.
 =============================================================



Windows Network Security Cheat Sheet
🔐 Network Security Configuration
ipconfig /all – View IP configuration

ipconfig /displaydns – Show DNS cache entries

netsh interface ip set address – Configure interface to use DHCP

netsh interface ip set dns – Configure DNS server for an interface

netstat -r – View routing table

arp -a – View ARP cache

arp -N <if_addr> – View ARP cache for specific interface

arp -s IP MAC – Add static ARP entry

arp -d IP – Delete ARP entry

route -f – Clear routing tables

route -p ADD – Create persistent route

route CHANGE – Modify existing route

route DELETE – Delete a route

route PRINT – Print routing table

netsh advfirewall firewall show rule name=all – View all firewall rules

netsh advfirewall firewall show rule name="rule" – View specific firewall rule

netsh advfirewall show currentprofile – Check firewall profile settings

📡 Connection & Monitoring
Get-NetTCPConnection – View active TCP connections

netstat -a – View all connections & listening ports

netstat -ano – View connections with PIDs

netstat -s -p <protocol> – Protocol statistics

netstat -b – View executables per connection

netstat -f – View FQDNs for remote addresses

netstat -x – View direct connections

net session – View active network sessions

net use – View active network shares

🛠️ Network Testing & Troubleshooting
ping -t host – Continuous ping

ping -4 host – Force IPv4

ping -6 host – Force IPv6

ping -n count host – Send specific number of requests

ping -a host – Resolve IP to hostname

tracert host – Trace route

nslookup domain – Query DNS records

⚙️ Assign Static IP
Control Panel → Network & Sharing Center → Adapter Settings → IPv4 Properties

Example: IP 172.16.0.10, Subnet 255.255.255.0, Gateway 172.16.0.3, DNS 127.0.0.1

🧰 Troubleshooting Tools
Netsh – Configure & troubleshoot network

Tracert – Trace packet routes

NSLOOKUP – DNS queries

Netstat – Connections & ports

Ping – Connectivity test

ARP – Manage ARP cache

Route – Manage routing table

🔒 Security Controls
Windows Defender Firewall – Inbound/outbound filtering

UAC – Privilege elevation control

NAP – Device compliance enforcement

BitLocker/EFS – Encrypt sensitive data

Microsoft Defender ATP/Endpoint – Threat detection

Event Viewer/SIEM – Security auditing & logging

Group Policy (GPO) – Domain-wide security baselines

📂 Key Config Files
hosts – Hostname-to-IP mappings

lmhosts – Legacy NetBIOS resolution

SYSTEM – Registry network settings

netsh.exe – CLI network tool

protocol – Supported protocols

services – Port-to-service mappings

pfirewall.log – Firewall logs

NetSetup.log – Network setup logs

🛡️ Hardening Security
Enable firewall & block unused ports

Disable legacy protocols (SMBv1, NetBIOS)

Use TLS 1.2/1.3, IPsec

Enforce segmentation (VLANs, firewall rules)

Enable NAP for compliance

Use Defender ATP/Endpoint

Apply Windows updates regularly

Monitor logs via Event Viewer & SIEM

🌐 Proxy Configuration

Manual Setup: Settings → Network & Internet → Proxy → Enter IP & Port

Open-Source Proxy: Install Squid/CCProxy → Configure rules → Allow firewall exceptions

Domain-wide Proxy (GPO): gpedit.msc → Computer Config → Admin Templates → Windows Components → Internet Explorer → Set Proxy Settings