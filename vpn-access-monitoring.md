A

VPN Login Monitoring: Detects unusual VPN logins, such as those from
untrusted or foreign IPs.

# Purpose

Monitor VPN access to detect unauthorized connections (SOC2 CC6.1 -
Logical Access).

# Query

index=paloalto sourcetype=pan_vpn \| stats count by user

# Outcome

Provides visibility into VPN connections by user. Detects unauthorized
or unusual VPN logins to the network.
