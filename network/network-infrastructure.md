3. Networks and Infrastructure part
2 - Beyond the Basics
802.11
IEEE 802.11 is part of the IEEE 802 set of LAN protocols, and speci fies the set of media access control (MAC) and
physical layer (PHY) protocols for implementing wireless local area network (WLAN) Wi-Fi computer communication in
various frequencies, including but not limited to 2.4 GHz, 5 GHz, and 60 GHz frequency bands.
62 of 178
Wireless Access Point (WAP)
Wireless Access Point is a Bridge between 802.11 and Ethernet.
Every WAP have MAC address.
SSID (Service Set identifier) associated to the MAC address on a WAP is known as BSSID - (Basic Service Set
Identifier)
When a large network is connected multiple WAP's through a Common Ethernet Broadcast Domain - turns out
ESSID - (Extended Service Set Identifier)
MAC Filtering - limit access through the physical hardware address.
🛑 WAP is a bridge - extends the wired network on the wireless network (operates on OSI Layer 2 - data
link)
🛑 Not a wireless router! A wireless router is a router and a WAP in a single device.
🛑 Security Through Obscurity:
Enabling MAC Filtering don't provide security - the addresses can easily spoofed.
Disabling SSID broadcasting don't provide security - is easily determined through wireless network
analysis.
Wireless LAN (WLAN) Controllers
Controlling Multiple Access Points
Centralized management
63 of 178
Deploy new access points
Performance and security monitoring
Configure and deploy changes to all sites
Report on access point use
Usually a proprietary system
The wireless controlled is paired with the access points
LWAPP
Lightweight Access Point Protocol - is a protocol that can control multiple Wi-Fi wireless access points at
once.
Cisco proprietary - CAPWAP, based on LWAPP
Manage multiple access points simultaneously
Fat/Thick Access Point
Thick/Fat access points
The access point handles most wireless tasks
The switch is not wireless-aware
Good for small environments
Management console to configure security controls
ACLs
White/black listing
Encryption
Manage individually
Also called controller-based AP
Thin Access Point
Just enough to be 802.11 wireless
The intelligence is in the switch
Less expensive
Good for big environments. (e.g A building with multiple floors and hundreds of users might rely on one good
switch (with a redundant backup) to control dozens of thin access points)
Act as a repeater taking the wireless signal and pushing it ot a managed access control (AC) switch that handles
encryption and other security. Also called Standalone AP
