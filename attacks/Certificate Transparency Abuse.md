Certificate Transparency Abuse

Abusing certificate transparency logs to issue fraudulent certificates.
Azure Context:  
Azure Key Vault certificates and Azure App Services rely on certificates
that must be trusted.
Mitigation:
Monitor certificate issuance and logs (using Azure Monitor or
external CT log tools).
Enforce strict validation in apps and services.
Use Azure Key Vault for secure certificate management.