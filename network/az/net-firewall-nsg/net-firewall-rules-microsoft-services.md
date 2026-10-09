### Azure services

Allow the Azure portal URLs on your firewall or proxy server.

[https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-safelist-urls?tabs=public-cloud](https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-safelist-urls?tabs=public-cloud)



### Microsoft Entra

Ports required for Microsoft Entra Hybrid Identity:

Hybrid Identity Required Ports and Protocols

Microsoft Entra and AD

Firewall ports need to be opened between ADFS and AD servers?

Ports required to open between ADFS and AD servers

Microsoft Entra, Azure AD, and AD

[https://learn.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-ports](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-ports)

[https://stackoverflow.com/questions/50327955/ports-required-to-open-for-azure-active-directory](https://stackoverflow.com/questions/50327955/ports-required-to-open-for-azure-active-directory)

[https://stackoverflow.com/questions/51859053/which-firewall-ports-need-to-be-opened-up-between-adfs-and-ad-servers](https://stackoverflow.com/questions/51859053/which-firewall-ports-need-to-be-opened-up-between-adfs-and-ad-servers)

[https://techcommunity.microsoft.com/t5/azure/which-port-to-join-domain-azure-ad-domain-service/m-p/521459](https://techcommunity.microsoft.com/t5/azure/which-port-to-join-domain-azure-ad-domain-service/m-p/521459)



### Microsoft 365

Microsoft 365 and Office 365 URLs and IP address range 

[https://learn.microsoft.com/en-us/microsoftteams/office-365-urls-ip-address-ranges](https://learn.microsoft.com/en-us/microsoftteams/office-365-urls-ip-address-ranges)





### Windows Server Ports

General Windows Server Ports (Non-Clustering Specific)

|Protocol|Port|Purpose|
|-|-|-|
|TCP|25|SMTP (Email Sending)|
|TCP|110|POP3 (Email Receiving)|
|TCP|143|IMAP (Email Receiving)|
|TCP|21|FTP (File Transfer)|
|TCP|3389|RDP (Remote Desktop Protocol)|
|TCP|5900|VNC (Virtual Network Computing)|
|TCP|80|HTTP (Web Browsing)|
|TCP|443|HTTPS (Secure Web Browsing)|
|TCP/UDP|53|DNS (Domain Name System)|

Windows Server Clustering Specific Ports

|Protocol|Port|Purpose|Notes|
|-|-|-|-|
|TCP/UDP|3343|Cluster Network Communication|Essential for heartbeat and node communication.|
|TCP/UDP|88|Kerberos|User and computer authentication.|
|TCP/UDP|389|LDAP|Lightweight Directory Access Protocol.|
|TCP/UDP|445|SMB|Server Message Block (File sharing, cluster communication, File Share Witness)|
|UDP|137|NetBIOS Name Service|Authentication and cluster communication|
|UDP|138|NetBIOS Datagram Service|Authentication and cluster communication|
|TCP|139|NetBIOS Session Service|Authentication and cluster management|
|TCP|464|Kerberos Change/Set Password|Kerberos password changes.|
|TCP|3268|Global Catalog|Directory services.|
|TCP|3269|Global Catalog SSL|Secure directory services.|
|TCP|636|LDAP SSL|Secure LDAP communication.|
|TCP|135|RPC Endpoint Mapper|Remote Procedure Call.|
|UDP|123|NTP|Network Time Protocol (Time synchronization).|
|TCP|5985|WinRM|Windows Remote Management.|
|TCP|5986|WinRM HTTPS|Secure Windows Remote Management.|
|TCP/UDP|49152+|Dynamic RPC Ports|Range varies; check your environment.|
|||||

Monitoring Ports

|Protocol|Port|Purpose|
|-|-|-|
|UDP|161|SNMP|
|UDP|162|SNMP Traps|



