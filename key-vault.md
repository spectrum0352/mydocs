# Azure Key Vault

# Key vault RBAC

**Data Plane Permissions**
Accessing secrets, keys, and certificates inside a Key Vault.
These permissions must be defined under data Actions in a custom role.
Only the actions explicitly listed below are supported.

**Secrets:**
- Read secret values: Microsoft.KeyVault/vaults/secrets/read
- Create / update secrets: Microsoft.KeyVault/vaults/secrets/write
- Delete secrets: Microsoft.KeyVault/vaults/secrets/delete
- Backup secrets: Microsoft.KeyVault/vaults/secrets/backup
- Restore secrets: Microsoft.KeyVault/vaults/secrets/restore

**Keys**

- Read key metadata: Microsoft.KeyVault/vaults/keys/read
- Create / update keys: Microsoft.KeyVault/vaults/keys/write
- Delete keys: Microsoft.KeyVault/vaults/keys/delete
- Backup keys: Microsoft.KeyVault/vaults/keys/backup
- Restore keys: Microsoft.KeyVault/vaults/keys/restore
- Encrypt data: Microsoft.KeyVault/vaults/keys/encrypt/action
- Decrypt data: Microsoft.KeyVault/vaults/keys/decrypt/action
- Sign data: Microsoft.KeyVault/vaults/keys/sign/action
- Verify signatures: Microsoft.KeyVault/vaults/keys/verify/action
- Wrap keys: Microsoft.KeyVault/vaults/keys/wrapKey/action
- Unwrap keys: Microsoft.KeyVault/vaults/keys/unwrapKey/action

ℹ️ Cryptographic operations are exposed as /action permissions.

**Certificates**

