# Azure Key Vault

# Key vault RBAC

**Data Plane Permissions**
Accessing secrets, keys, and certificates inside a Key Vault.
These permissions must be defined under data Actions in a custom role.
Only the actions explicitly listed below are supported.

**Secrets:**

* Read secret values: Microsoft.KeyVault/vaults/secrets/read
* Create / update secrets: Microsoft.KeyVault/vaults/secrets/write
* Delete secrets: Microsoft.KeyVault/vaults/secrets/delete
* Backup secrets: Microsoft.KeyVault/vaults/secrets/backup
* Restore secrets: Microsoft.KeyVault/vaults/secrets/restore

**Keys**

* Read key metadata: Microsoft.KeyVault/vaults/keys/read
* Create / update keys: Microsoft.KeyVault/vaults/keys/write
* Delete keys: Microsoft.KeyVault/vaults/keys/delete
* Backup keys: Microsoft.KeyVault/vaults/keys/backup
* Restore keys: Microsoft.KeyVault/vaults/keys/restore
* Encrypt data: Microsoft.KeyVault/vaults/keys/encrypt/action
* Decrypt data: Microsoft.KeyVault/vaults/keys/decrypt/action
* Sign data: Microsoft.KeyVault/vaults/keys/sign/action
* Verify signatures: Microsoft.KeyVault/vaults/keys/verify/action
* Wrap keys: Microsoft.KeyVault/vaults/keys/wrapKey/action
* Unwrap keys: Microsoft.KeyVault/vaults/keys/unwrapKey/action

ℹ️ Cryptographic operations are exposed as /action permissions.

**Certificates**





1. What is Azure Key Vault?

   * Key Vault is a cloud-based service used to securely store, manage, and control access to cryptographic keys, secrets, and certificates used by cloud applications and services.
2. What are the core functional features?
3. Secrets Management
Secure storage of passwords, connection strings, API keys

Secret versioning

Expiry date enforcement

Soft delete \& purge protection

RBAC-based or policy-based access control

Integration with Managed Identity

2. Key Management
RSA (2048, 3072, 4096)

ECC keys (P-256, P-384)

Key import (BYOK)

HSM-backed keys

Key rotation policies

Key wrapping/unwrapping

Cryptographic operations without exposing private keys

3. Certificate Management
Store SSL/TLS certificates

Auto-renewal with integrated CAs

Certificate lifecycle management

Exportable/non-exportable keys

4. Hardware Security Module (HSM)
FIPS 140-2 Level 2 and Level 3

Managed HSM support

Dedicated HSM clusters

Double encryption support

5. Access \& Security Controls
Azure AD integration

Role-Based Access Control (RBAC)

Network restrictions (Private Endpoint, firewall)

Logging \& auditing

Integration with Microsoft Defender

6. Advanced Capabilities
Purge protection enforcement

Soft delete mandatory (cannot disable)

Geo-redundancy

Throttling protection

Event Grid integration



