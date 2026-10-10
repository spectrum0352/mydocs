Credential Theft via Keylogging
Description: Attackers capture keystrokes (passwords, sensitive
info) via keyloggers installed on endpoints or virtual machines.  
Azure Context: If an attacker compromises Azure VMs or endpoints,
keyloggers can capture credentials used to access Azure resources.  
Mitigation:
Deploy endpoint security with anti-malware and EDR (e.g., Microsoft
Defender for Endpoint).
Monitor for suspicious processes or software installations.
Use Azure AD passwordless methods (e.g., MFA, Windows Hello) to reduce
risk from stolen passwords.
