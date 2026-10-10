Live Migration Attacks

Attacks targeting live VM migrations to intercept data or take control.
Azure Context:  
Azure handles VM migration internally, but hybrid or on-premises
integration might introduce risks.
Mitigation:
For hybrid environments, encrypt live migration traffic using IPsec or
equivalent.
Limit migration privileges and restrict migration network access.
Use Azure Network Security Groups (NSGs) and Azure Firewall to
control migration-related traffic.