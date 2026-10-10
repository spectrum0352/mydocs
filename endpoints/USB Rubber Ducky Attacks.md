USB Rubber Ducky Attacks
Description: Malicious USB devices that simulate keyboards and
inject commands automatically.  
Azure Context: Physical Azure datacenter attacks are unlikely, but
this can affect on-premises systems connected via Azure Hybrid or Azure
Arc.  
Mitigation:
Disable USB autorun on endpoints.
Implement USB device whitelisting and endpoint security policies.
Use Azure Defender to monitor endpoint activity.