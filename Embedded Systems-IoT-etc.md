Embedded Systems - Static Hosts
IoT (Internet of Things):
Wearable technology
Watches, health monitors, glasses
Track our location
Where is that data and how is it stored?
72 of 178
Home automation
Video doorbells (e.g Ring-Bot device)
Internet-connected garage door openers
It knows when you are home (and when you aren't)
HVAC - Heating, Ventilating, and Air Conditioning
Thermodynamics, fluid mechanics, and heat transfer
Very complex system
Must be integrated into the fire system
Workstation manages equipment
Makes cooling and heating decisions for workspaces and data centers
Traditionally not built with security in mind
Very hard to recover from a infrastructure DoS
SCADA | ICS:
SCADA - Supervisory Control and Data Acquisition
Pretty much ICS with more funcionality
ICS - Industrial Control Systems
HVAC - Heating Ventilation, and Air Conditioning
Distributed control systems
Real-time information
System control
Requires extensive segmentation
No access from the outside
SoC - System on a Chip
Multiple components running on a single chip
Common with embedded systems
Small form-factor
73 of 178
External interface support
Cache memory, flash memory
Usually lower power consumption
As shown above, you can see the Raspberry Pi 4 and the chip (Broadcom processor) controlling every interface on the
device (HDMI ports, Ethernet, etc)
Security considerations are important
Difficult to upgrade hardware
Limited off-the-shelf security options
Printers, Scanners and Fax machines
All-in-one or multifunction devices (MFD)
Everything you need in one single device
Printers have a very sophisticated firmware
Some images are stored locally on the device
Can be retrieved externally
Logs are stored on the device
Contain communication and fax details
Camera systems
Video monitoring for home or office
Video recorders and Cameras are IP devices
Authenticate using a specialized application
Privacy concerns
Another Devices (Special purpose)
Medical devices
Heart monitors, insulin pumps
Often use older OS
Vehicles
Internal network is often accessible from mobile networks
Control internal electronics
Disable the engine
Aircraft / UAV (Unmanned aerial vehicle)
DoS could damage the aircraft and other on the ground
74 of 178
Securing Static Hosts
Change default passwords
Turn off unnecessary services
Monitoring security and firmware updates
Defense in depth
Network Segmentation - VLANs with Firewalls; VPN to connect a pipeline securely.
