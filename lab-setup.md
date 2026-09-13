Lab IP addressing
* static IP address for Windows server 2019: 172.16.0.10
* DNS address: 172.16.0.10 or 127.0.0.1
* Default gateway: 172.16.0.3
* Subnet mask: 255.255.255.0 / 24
* Kali linux IP address: 172.16.0.50

**Assign static IP to Windows**
* Open Control Panel - Network and Internet - Network and sharing center 
* Change adapter settings - Right click on Ethernet0 - Properties – Internet protocol version 4 
* Select Use following ip address: IP address: 172.16.0.10, Subnet mask: 255.255.255.0, Default gateway: 172.16.0.3, 
* Select use the following DNS server address: Preferred IP address: 127.0.0.1

<img width="458" height="516" alt="image" src="https://github.com/user-attachments/assets/c3981026-20e0-4e3f-931b-02769e9574f5" />

Setup Domain controller

Step 1: Install Active Directory Domain Services (ADDS) 

Log into your Active Directory Server with administrative credentials.
•	Open Server Manager → Roles Summary → Add roles and features

<img width="821" height="585" alt="image" src="https://github.com/user-attachments/assets/34dd88c6-0315-4516-b49b-a08237d05652" />

Following screen should reflect the Static IP address of the Windows 2019, if not displaying then please retry.

<img width="973" height="690" alt="image" src="https://github.com/user-attachments/assets/f1f8fde4-2263-47e2-b88c-d62af20b8746" />
++++++++++
Select the roles, ‘Active directory domain services’ and ‘DNS server’ 

<img width="845" height="599" alt="image" src="https://github.com/user-attachments/assets/109b5d82-dc0e-431b-8c0f-e45f0f1821e1" />

## Join Kali Linux to ADDS 
Open network manager: Right click on WIFI/Ethernet option on display and Click on Edit button.
* Double click on “eth0”, navigate to “IPv4 settings”. Select method as “Manual”
* Add ip address: 172.16.0.50, Netmask: 24 or 255.255.255.0, Gateway: 172.16.0.3
* Add DNS server: 172.16.0.10 and Search domain as “win2019.windc.local” Click on Save
* Restart your machine.

<img width="757" height="235" alt="image" src="https://github.com/user-attachments/assets/93c62704-31ff-49e2-bc8d-39290e2cc50e" />

<img width="557" height="429" alt="image" src="https://github.com/user-attachments/assets/4bcb845c-474a-4d85-a4e3-3ddd10b06bea" />


## DC Implementation

**Step 1: Install Active Directory Domain Services (ADDS) **

Log into your Active Directory Server with administrative credentials.
•	Open Server Manager → Roles Summary → Add roles and features

<img width="821" height="585" alt="image" src="https://github.com/user-attachments/assets/2f847176-2572-48ed-9e8b-36c71a206e7b" />

Following screen should reflect the Static IP address of the Windows 2019, if not displaying then please retry.

<img width="973" height="690" alt="image" src="https://github.com/user-attachments/assets/3054efc3-fb73-48cb-bbb1-e82470f5228d" />

Select the roles, ‘Active directory domain services’ and ‘DNS server’ 

<img width="845" height="599" alt="image" src="https://github.com/user-attachments/assets/4f6556eb-311e-4a92-b6f3-349676572a33" />

