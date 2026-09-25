Vulnerabilities with Wireless Access Points
Rogue Access Point
Unauthorized access point plugged into a wired one. (Can be accidental)
64 of 178
Evil Twin Attack
Is a Rogue AP tha is broadcasting the same (or very similar) SSID.
802.11 Jammer
Jamming is a form of intentional interference on wireless networks, designed as a DoS attack. This type of
attack by overpowering the signals of a legitimate wireless AP, typically using a rogue AP with its transmit power
set to very high levels.
Deauthentication / Disassociation Attack
Deauth Attack Is a type of denial-of-service attack that targets communication between a user and a Wi-Fi
wireless access point.
Technical details: The IEEE 802.11 (Wi-Fi) protocol contains the provision for a deauthentication frame. Sending the
frame from the access point to a station is called a "sanctioned technique to inform a rogue station that they have been
disconnected from the network".
Cracking WEP, WPA, WPA2 and WPS 
WEP
IV Attack - Initialization Vector is vulnerable to cracking.
Aircrack can grab WEP keys and crack them.
WEP is the oldest security standard 802.11
WPA/WPA2
⚔
WPA/WPA2 uses 4-way handshake
WPA is vulnerable to a dictionary attack
Can be cracked at the initial connection between the WPA/WPA2 client and the access point during the 4-way
handshake
Aircrack can grab WPA handshakes on authentication time and crack the PSK's (if they are common/weak).
WPS
Wi-Fi Protected Setup (WPS) - is a push button configuration, which enables the router WPS enable to another WPS
device (wireless printers are the most common).
8 digit key is actually only 7 digits, 2^7
Key exchange is the first processed in 4-bit and 3-bit
Can be cracked using Reaver or Brute forcing
The WPS validates each half of the PIN
First half, 4 digits. Second half, 3 digits.
First half, 10,000 possibilities. Second half, 1,000 possibilities
It takes about for hours to go through all of them
The new generation of WPS enabled device can detect an attack and shut off.
WPS Attack Prevention:
Get rid of older routers
Firmware updates
Upgrade to newer wireless routers
