Deep Packet Inspection (DPI) Evasion
Attack:  
Attackers obfuscate or encrypt malicious network traffic to bypass
network security devices (firewalls, IDS/IPS), avoiding detection.  
Azure Context:  
Encrypted traffic (e.g., TLS) can hide attacks moving laterally inside
Azure VNets or across peered networks.  
Solution:
Use Azure-native threat detection (Azure Defender for Networks, Azure
Sentinel) with SSL/TLS inspection where feasible.
Implement network segmentation via Azure Network Security Groups
(NSGs) and Azure Firewall to limit lateral movement.
Monitor traffic flows with Azure Network Watcher and analyze logs for
anomalies.