Domain Generation Algorithm (DGA) Attacks

Malware uses algorithmically generated domains for C2 communication.
Azure Context:  
Malware on Azure VMs or Azure IoT devices may use DGAs.
Mitigation:
Use Azure Firewall DNS filtering or Azure Sentinel to
detect/block suspicious domains.
Implement DNS sinkholing to divert malicious traffic.