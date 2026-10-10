Eavesdropping (Passive Surveillance)
Attack:  
Unauthorized interception of network or communication data.  
Azure Context:  
Data in transit between Azure services, or between users and cloud,
could be intercepted if unencrypted.  
Solution:
Use TLS/SSL encryption for all Azure services (App Service, Storage,
SQL).
Enable VPNs or ExpressRoute with encryption for hybrid connectivity.
Use Azure Confidential Computing to protect data in use.