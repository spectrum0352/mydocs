Cryptojacking
Unauthorized use of Azure compute resources (VMs, containers) to mine cryptocurrency, degrading performance.\
Azure Context: Attackers may exploit vulnerabilities or misconfigured resources to run crypto miners.\
Mitigation:
Monitor resource utilization via Azure Monitor and Azure Advisor.
Use Microsoft Defender for Cloud to detect crypto-mining patterns.
Harden VM images and container registries; use managed identities carefully.
Apply network egress controls to prevent unauthorized outbound connections.