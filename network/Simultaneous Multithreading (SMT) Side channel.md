Simultaneous Multithreading (SMT) Side-Channel Attacks
Attack:  
Hardware vulnerabilities allow attackers sharing CPU cores
(hyperthreading) to leak sensitive data.  
Azure Context:  
Azure VMs share hardware; side-channel attacks could leak data across
VMs on the same host.  
Solution:
Azure constantly patches hosts; use the latest VM SKUs and keep
OS/firmware updated.
Enable Azure Confidential Computing if highly sensitive workloads
require hardware isolation.
Regularly apply OS and firmware updates inside VMs.