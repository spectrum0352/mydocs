# Credential exposure points

## Credential exposure points in Azure

- **App Config/Settings:** Web apps may store secrets in plain text settings.
- **Azure Automation / Runbooks:** Credentials hardcoded or improperly secured in scripts.
- **Azure Functions / Logic Apps:** Environment variables or code may contain exposed secrets.
- **Azure Key Vault:** Misconfigured access policies can expose secrets to unauthorized users.
- **Azure Resource Manager (ARM) Templates:** Hardcoded secrets in templates or parameter files.
- **Azure Run Command:** Command history may reveal sensitive credentials.
- **Blob Storage:** Unsecured or publicly accessible blobs with credential files.
- **Log Analytics / Diagnostics Logs:** Debug logs may inadvertently capture credentials.
- **VM Custom Script Extensions:** Scripts with embedded credentials may be stored in plain text.

### Key Vault

- Path: `Azure🡪 Key Vaults 🡪 Vault Name 🡪 Secrets/Keys/Certificates`
- Risk: Misconfigured access policies may allow unauthorized access to secrets. Poor access policies (RBAC or Access Policies) may allow unauthorized reads.
- Risk severity: *High* 🔸

### Custom Script Extensions on VMs

- Path: `Azure🡪 VMs 🡪 VM 🡪 Extensions + applications`
- Risk Severity: *High* 🔸
- Risk: Scripts with hardcoded credentials are stored on disk, accessible to attackers. Scripts may contain hardcoded credentials; stored in /var/lib/waagent/ on Linux or C:\Packages\Plugins on Windows.

### Run Command

- Path: `Azure 🡪 VM 🡪 Run command`
- Risk Severity: *High* 🔸
- Risk: Secrets may be visible in command logs or audit history. Credentials passed via command may be logged in portal or command history.

### App Service Settings

- Path: `Azure 🡪 App Services 🡪 Configuration 🡪 Application Settings`
- Risk: Secrets in environment variables can be exposed via Kudu or code dumps. Secrets stored as plain text; accessible via Kudu or environment dump.
- Risk Severity: *Medium* 🔸

### ARM Templates / Parameters

- Path: `Deployments or Git Repos 🡪 templates (.json) / parameters (.json)` or `Stored in GitHub, DevOps repos, or ARM deployments under`
- Risk: Hardcoded secrets may be exposed in source control (JSON/YAML) or deployment history.
- Risk Severity: *High* 🔸

### Automation Accounts/Runbooks

- Path: `Azure Automation 🡪 Automation Account 🡪 Runbooks / Credentials`
- Risk: Hardcoded credentials or exposed variables in scripts pose leakage risk. Hardcoded credentials in PowerShell scripts or insecure use of stored credentials.
- Risk Severity: *High* 🔸

### Azure Functions / Logic Apps

- Path: `Function App 🡪 Configuration / Code + Test`
- Risk: Environment variables or code may contain secrets directly. Secrets in environment variables, inline code, or bindings.
- Risk Severity: *High* 🔸

### Azure Blob Storage

- Path: `Storage Accounts 🡪 Containers / Files`
- Risk: Credential files may be public or accessible with leaked SAS tokens. Blobs with sensitive data may be public or shared with SAS tokens.
- Risk Severity: *Critical* 🔸

### Azure Monitor Logs / Log Analytics

- Path: `Azure 🡪 Monitor 🡪 Logs / Log Analytics Workspaces`
- Risk: Secrets may leak via diagnostic/debug logs or output from scripts. Logs may contain credentials from verbose script output.
- Risk Severity: *Medium* 🔸

## Azure DevOps

- **Artifacts and Logs:** Build/test logs may contain tokens, connection strings, or passwords.
- **Personal Access Tokens (PATs):** Stored or shared insecurely; long-lived PATs increase exposure risk.
- **Pipeline Variables:** Non-secret variables may be used to store credentials in plain text.
- **Pipeline YAML Files:** Hardcoded secrets in source-controlled CI/CD definitions.
- **Secure Files:** Uploaded secrets not encrypted properly or shared broadly.
- **Service Connections:** Improperly scoped or over-permissioned connections.
- **Variable Groups:** Misconfigured access control can lead to credential leaks.

### Pipeline Variables

- Path: `Azure DevOps 🡪 Pipelines 🡪 Pipeline Name 🡪 Edit Variables`
- Risk: Non-secret variables can store credentials in plain text; exposed in logs.

### YAML Pipeline Files

- Path: `Azure DevOps 🡪 Repos 🡪 Repo Name 🡪 .azure-pipelines.yml\`
- Risk: Secrets hardcoded in YAML; visible in source control.

### Service Connections

- Path: `Azure DevOps 🡪 Project Settings 🡪 Service connections`
- Risk: Over-permissioned or outdated connections (e.g., Azure RM, GitHub, DockerHub).

### Secure Files

- Path: `Azure DevOps 🡪 **Library** 🡪 **Secure files**`
- Risk: Files may contain unencrypted keys or credentials if mishandled.

### Variable Groups

- Path:  `Azure DevOps 🡪 **Library** 🡪 **Variable groups**`
- Risk:  Secrets stored here if not marked as secret or if permissions are too broad.

### Build Artifacts / Logs

- Path:  `Azure DevOps 🡪 **Pipelines** 🡪 *Pipeline Run* 🡪 **Logs /Artifacts**\`
- Risk:  Credentials may be leaked through console output or logs.

### Personal Access Tokens (PATs)

- Path: `Azure DevOps 🡪 **User Settings** 🡪 **Personal Access Tokens**`
- Risk:  Long-lived PATs or tokens shared insecurely can lead to account compromise.

| **Location / Feature** | **Path** | **Risk Severity** | **Risk Explanation** |
| ---- | ---- | ---- | ---- |
| **Pipeline Variables** | Pipelines 🡪 Pipeline Name 🡪 Edit 🡪 Variables | Medium | Non-secret variables may hold plaintext credentials and appear in logs. |
| **Pipeline YAML Files** | Repos 🡪 Repo Name 🡪 \*.azure-pipelines.yml | High | Hardcoded secrets in YAML are visible in source control. |
| **Service Connections** | Project Settings 🡪 Service Connections | High | Over-permissioned or stale connections may be abused by attackers. |
| **Secure Files** | Library 🡪 Secure Files | Medium | Files uploaded here can be misused if permissions are too broad. |
| **Variable Groups** | Library 🡪 Variable Groups | Medium | Variables may not be marked as secret; risk if reused across pipelines. |
| **Build Artifacts & Logs** | Pipelines 🡪 Pipeline Run 🡪 Logs / Artifacts | Medium | Secrets may leak via debug output or logs. |
| **Personal Access Tokens (PATs)** | User Settings 🡪 Personal Access Tokens | Critical | Compromise of a PAT can grant full access to projects, repos, and pipelines. |

## Credential Storage Best Practices

### Where to Store Credentials in Azure

| **Method** | **Description** |
| ---- | ---- |
| **Azure Key Vault** | Centralized, secure storage for secrets, keys, and certificates. Use access policies or RBAC. |
| **Managed Identity** | Assign managed identities to services (VMs, Functions, etc.) to avoid using secrets entirely. |
| **App Service → Key Vault References** | Use @Microsoft.KeyVault(...) syntax in app settings to securely reference secrets. |
| **Azure AD Authentication** | Use token-based authentication (OAuth2, MSI) instead of password/API key authentication. |

## Where NOT to Store Credentials in Azure (Insecure Practices)

| **Insecure Location** | **Why It’s Risky** |
| ---- | ---- |
| **Custom Script Extensions** | Scripts and parameters are stored on disk in plaintext, readable by users or attackers. |
| **Run Command Input** | Commands and credentials passed via portal may be logged in audit history. |
| **App Service Configuration (Unprotected)** | Plaintext environment variables can be dumped via Kudu console or app error. |
| **ARM Templates / Parameters Files** | Hardcoded secrets may be exposed in deployment logs or source repositories. |
| **Function or Logic App Code** | Secrets in code or bindings can be extracted or reversed. |
| **Blob Storage (Public/Unsecured)** | Secrets stored in blobs may be accessed via public URLs or misused Shared Access Signatures. |

### Where to store credentials in **Azure DevOps**

| **Method** | **Description** |
| ---- | ---- |
| **Secret Pipeline Variables** | Mark variables as "secret" so they're masked in logs and not exposed in UI or YAML. |
| **Azure Key Vault Task** | Use the Key Vault task in pipelines to securely fetch secrets at runtime. |
| **Service Connections** | Use securely scoped service connections to authenticate to Azure and external services. |
| **Secure Files (Library)** | Store sensitive files (SSH keys, certificates) securely with access restrictions. |

### Where not to store credentials in **Azure DevOps**

| **Insecure Location** | **Why It’s Risky** |
| ---- | ---- |
| **Plain Pipeline Variables** | Non-secret variables are exposed in UI and logs. |
| **YAML Files in Repos** | Hardcoded credentials in .yml files are visible to anyone with repo access. |
| **Build/Release Logs** | Secrets printed to logs (intentionally or not) are stored long-term and accessible. |
| **Variable Groups (No RBAC)** | Broad access to variable groups allows leakage of secrets across teams. |
| **Long-lived PATs in Scripts** | If compromised, long-lived PATs can grant full access to repos and pipelines. |

## 🔒 General Best Practices

| **Practice** | **Recommendation** |
| ---- | ---- |
| **Use Key Vault as the primary store** | Avoid storing secrets in application code, templates, or environment settings. |
| **Enable auditing/logging** | Monitor access to Key Vaults, pipelines, and storage to detect misuse. |
| **Use RBAC & access policies** | Restrict who can access or update secrets, both in Azure and DevOps. |
| **Rotate credentials regularly** | Automate rotation for secrets, passwords, and keys wherever possible. |
| **Never echo secrets in output** | Avoid using secrets in echo, write-host, or similar commands in pipelines. |
| **Use Managed Identities when possible** | Prefer identity-based auth over storing credentials. |

## Where NOT to Store Credentials

**1. Source Code**

- ❌ Never hardcode credentials in source files (e.g., .py, .js, .sh,
  etc.).

- ❌ Avoid storing credentials in Git repositories, even private ones.

**Example (bad):**

db_password = "SuperSecret123!"

**2. Configuration Files (Unencrypted)**

- ❌ Avoid storing credentials in plain text .env, .yaml, .json, .ini
  files without protection.

**Example (bad):**

AWS_SECRET_KEY=AKIA...

**3. Logs and Debug Output**

- ❌ Never log secrets or tokens, especially in debug or error messages.

**Example (bad):**

echo "Failed login with password: \$PASSWORD"

**4. Shared Documents or Chats**

- ❌ Do not store or share secrets in Slack, Teams, Notion, Google Docs,
  or email.

**5. Local Machines Without Encryption**

- ❌ Avoid storing secrets in plain files (e.g., .bashrc, .zshrc,
  notes.txt) unless encrypted.

## Where to Securely Store Credentials

**1. Secret Management Systems**

These are purpose-built tools to store and access secrets securely.

**🔐 Recommended:**

- **HashiCorp Vault**

- **AWS Secrets Manager**

- **Azure Key Vault**

- **GCP Secret Manager**

- **CyberArk Conjur**

- **1Password CLI or Bitwarden for teams**

These solutions offer encryption at rest, access controls, auditing, and
rotation features.

**2. Environment Variables (With Limits)**

- ✅ Use **environment variables** to load secrets **at runtime only**,
  not stored permanently.

- Combine with a secret management tool or container orchestrator like
  Kubernetes.

export DB_PASSWORD=\$(aws secretsmanager get-secret-value --secret-id
db_pass --query SecretString --output text)

------------------------------------------------------------------------

**3. CI/CD Secrets Integration**

- ✅ Use **CI/CD secret injection mechanisms** (GitHub Actions, GitLab
  CI, Jenkins Credentials plugin).

- These tools inject secrets securely at build/runtime, without storing
  them in code.

------------------------------------------------------------------------

**4. Encrypted Configuration Files**

- ✅ If using config files, encrypt them using tools like:

  - **Mozilla SOPS**

  - **Ansible Vault**

  - **age or GPG**

  - **KMS-encrypted blobs (AWS KMS, Azure Key Vault)**

------------------------------------------------------------------------

**5. Operating System Keychains**

- ✅ Use secure credential storage built into the OS:

  - Windows Credential Manager

  - macOS Keychain

  - GNOME Keyring / KWallet on Linux

------------------------------------------------------------------------

**🔁 Bonus: Best Practices Summary**

| **Practice** | **✅ Do** | **❌ Don't** |
|----|----|----|
| Version Control | Use .gitignore & secret scanners | Hardcode secrets in repo |
| Access Control | Use least privilege & rotate secrets | Share secrets in chat/email |
| Rotation | Automate secret rotation | Reuse secrets indefinitely |
| Auditing | Enable logging & alerts on access | Ignore access tracking |
| Encryption | Encrypt secrets in transit and at rest | Store in plain text |

## Summary of Credential Storage Best Practices

**🔐 General Best Practices**

- ✅ Always treat credentials (passwords, API keys, tokens, etc.) as
  **sensitive assets**.

- ✅ Enforce **least privilege access** to secrets.

- ✅ Use **unique credentials** per environment/system.

- ✅ Regularly **rotate credentials** (manually or automatically).

- ✅ Enable **audit logging** on all credential access.

- ✅ Encrypt credentials **at rest** and **in transit**.

- ✅ Use **multi-factor authentication (MFA)** where supported.

- ✅ Use **versioned and immutable** secrets when possible.

- ✅ Set **expiration** for secrets and tokens.

- ✅ Scan repositories and file systems for exposed secrets using tools
  like:

  - truffleHog

  - git-secrets

  - gitleaks

  - GitHub Secret Scanning

**🚫 Where NOT to Store Credentials**

- ❌ **Never hardcode** credentials in source code or scripts.

- ❌ Avoid storing credentials in:

  - .env, .yaml, .json, .ini (unless encrypted)

  - Git repositories (even private ones)

  - Shell profiles (.bashrc, .zshrc)

  - Debug logs, error messages, or console output

  - Cloud-init or user-data scripts

  - Shared notes, email, or messaging platforms (e.g., Slack, Teams)

- ❌ Don’t store secrets unencrypted on local machines.

**✅ Where to Store Credentials Securely**

**1. Secrets Management Tools**

- ✅ Use centralized secret management platforms:

  - **AWS Secrets Manager**

  - **Azure Key Vault**

  - **Google Secret Manager**

  - **HashiCorp Vault**

  - **CyberArk Conjur**

  - **1Password CLI / Bitwarden (Team Vaults)**

**2. Environment Variables (Runtime Only)**

- ✅ Load secrets into environment variables **at runtime only**.

- ✅ Avoid permanent storage in .env files.

- ✅ Use secret managers or container orchestration tools (Kubernetes,
  Docker Secrets) to inject securely.

**3. CI/CD Secret Management**

- ✅ Use built-in secret stores for CI/CD pipelines:

  - GitHub Actions → Encrypted Secrets

  - GitLab CI → Protected Variables

  - Jenkins → Credentials Plugin

  - CircleCI → Environment Variables

**4. Encrypted Configuration Files**

- ✅ If config files are necessary, **encrypt them** using:

  - **Mozilla SOPS**

  - **Ansible Vault**

  - **age** or **GPG**

  - Cloud KMS (AWS KMS, Azure Key Vault, GCP KMS)

**5. OS Keychains**

- ✅ Use system-level secure storage:

  - **macOS Keychain**

  - **Windows Credential Manager**

  - **Linux Keyring (GNOME, KWallet)**

------------------------------------------------------------------------

**🛡️ Security Operations Best Practices**

- ✅ Use **access controls (RBAC)** to limit who can access secrets.

- ✅ Monitor and alert on unusual access or secret usage.

- ✅ Store secret metadata (who created, when, purpose).

- ✅ Regularly audit and remove unused or stale secrets.

- ✅ Use **zero-trust principles** in secret access and handling.

- ✅ Ensure **backup and recovery** procedures include secure secrets
  recovery.

## Credential Storage Best Practices Checklist

| **Item** | **Description** | **Status** |
|----|----|----|
| 🔒 Centralized Storage | All credentials are stored in a centralized secrets manager (e.g., Vault, AWS Secrets Manager) | ☐ |
| 🔐 Encryption | All credentials are encrypted at rest and in transit | ☐ |
| 🔄 Rotation Policy | Credentials have automatic or periodic rotation policies | ☐ |
| ⏳ Expiration | All temporary secrets and tokens are configured to expire | ☐ |
| 🔍 Audit Logging | All access to secrets is logged and monitored | ☐ |
| 🧪 Secret Scanning | Regular scanning of source code and repos for exposed secrets | ☐ |
| 🚫 No Hardcoding | No credentials are hardcoded in source code or scripts | ☐ |
| 📁 No Plaintext Files | Credentials are not stored in .env, .json, .yaml, etc. without encryption | ☐ |
| 💬 No Secret Sharing via Chat | No secrets shared via email, Slack, Teams, Notion, etc. | ☐ |
| 👤 Least Privilege | Access to secrets is governed by least privilege (RBAC/ABAC) | ☐ |
| 🔁 Unique Per Environment | Secrets are unique across environments (dev, staging, prod) | ☐ |
| 🧩 CI/CD Injection | CI/CD pipelines use injected secrets securely (not hardcoded) | ☐ |
| 🛠️ Secure Config | Encrypted configs are used when necessary (e.g., SOPS, Ansible Vault) | ☐ |
| 🖥️ Local Machine Protection | Local machine secrets are stored using system keychains (macOS Keychain, Windows Credential Manager) | ☐ |
| 🔑 MFA Used | MFA is required for systems that access/manage secrets | ☐ |

## Credential Audit Checklist

| **Audit Step** | **Description** | **Status** |
|----|----|----|
| 🔎 Inventory Secrets | Identify all credentials and secrets in use across systems and environments | ☐ |
| 🔄 Review Rotation Dates | Check when each secret was last rotated and next due | ☐ |
| 🧑‍🤝‍🧑 Access Review | Audit who has access to each secret and why | ☐ |
| 🗃️ Storage Location | Validate where each secret is stored (should be in secure manager) | ☐ |
| 🔓 Encryption Validation | Confirm all secrets are encrypted at rest and in transit | ☐ |
| 🚨 Alert Configuration | Ensure alerts exist for abnormal access or failed attempts | ☐ |
| 🔐 Secret Use Analysis | Analyze usage logs—look for anomalies or unused secrets | ☐ |
| 📦 CI/CD & DevOps | Check pipeline config files for accidental exposure of secrets | ☐ |
| 📜 Source Code Scan | Run secret scanning tools (e.g., truffleHog, gitleaks) on all codebases | ☐ |
| 📤 Shared Secret Check | Investigate if secrets have ever been emailed or shared informally | ☐ |
| 🗑️ Decommission Unused | Remove or revoke stale, unused, or orphaned credentials | ☐ |
| 📈 Metrics & KPIs | Track number of secrets, rotation intervals, and access anomalies over time | ☐ |
| 🛠️ Incident History | Review any past credential leaks or incidents, and mitigation steps | ☐ |
| 🧩 3rd Party Access | Review secrets shared with or accessed by vendors/partners | ☐ |
| 📚 Documentation | Ensure secret ownership and handling procedures are documented | ☐ |

------------------------------------------------------------------------

# Credential Exposure Attack Surface

- **App Configuration**: Web apps may store secrets in plain text settings.
- **Azure Automation**: Credentials hardcoded or improperly secured in scripts.
- **Azure Functions**: Environment variables or code may contain exposed secrets.
- **Logic Apps**: Environment variables or code may contain exposed secrets.
- **Azure Key Vault:** Misconfigured access policies can expose secrets to unauthorized users.
- **ARM Templates:** Hardcoded secrets in templates or parameter files.
- **Azure Run Command:** Command history may reveal sensitive credentials.
- **Blob Storage:** Unsecured or publicly accessible blobs with credential files.
- **Log Analytics / Diagnostics Logs:** Debug logs may inadvertently capture credentials.
- **VM Custom Script Extensions:** Scripts with embedded credentials may be stored in plain text.

| **Service/Feature** | **Path** | **Risk Severity** | **Risk Explanation** |
|----|----|----|----|
| **Key Vault** | Key Vaults 🡪 Secrets/Keys/Certificates | High | Misconfigured access policies may allow unauthorized access to secrets. |
| **Custom Script Extension** | VM 🡪 Extensions + applications | High | Scripts with hardcoded credentials are stored on disk, accessible to attackers. |
| **Run Command** | VM 🡪 Run command | High | Secrets may be visible in command logs or audit history. |
| **App Service Settings** | App Services 🡪 Configuration 🡪 Application Settings | Medium | Secrets in environment variables can be exposed via Kudu or code dumps. |
| **ARM Templates / Parameters** | Deployments or Git Repos 🡪 templates (.json) / parameters (.json) | High | Hardcoded secrets may be exposed in source control or deployment history. |
| **Log Analytics / Monitor Logs** | Azure Monitor 🡪 Log Analytics Workspace | Medium | Logs may contain credentials from verbose script output. |
| **Automation Runbooks** | Automation Account 🡪 Runbooks / Credentials | High | Hardcoded credentials or exposed variables in scripts pose leakage risk. |
| **Azure Functions / Logic Apps** | Function App 🡪 Configuration / Code + Test | High | Environment variables or code may contain secrets directly. |
| **Azure Blob Storage** | Storage Account 🡪 Containers 🡪 Files | Critical | Credential files may be public or accessible with leaked SAS tokens. |

# Azure DevOps

- **Artifacts and Logs:** Build/test logs may contain tokens, connection strings, or passwords.
- **Personal Access Tokens (PATs):** Stored or shared insecurely; long-lived PATs increase exposure risk.
- **Pipeline Variables:** Non-secret variables may be used to store credentials in plain text.
- **Pipeline YAML Files:** Hardcoded secrets in source-controlled CI/CD definitions.
- **Secure Files:** Uploaded secrets not encrypted properly or shared broadly.
- **Service Connections:** Improperly scoped or over-permissioned connections.
- **Variable Groups:** Misconfigured access control can lead to credential leaks.

| **Location / Feature** | **Path** | **Risk Severity** | **Risk Explanation** |
|----|----|----|----|
| **Pipeline Variables** | Pipelines 🡪 Pipeline Name 🡪 Edit 🡪 Variables | Medium | Non-secret variables may hold plaintext credentials and appear in logs. |
| **Pipeline YAML Files** | Repos 🡪 Repo Name 🡪 \*.azure-pipelines.yml | High | Hardcoded secrets in YAML are visible in source control. |
| **Service Connections** | Project Settings 🡪 Service Connections | High | Over-permissioned or stale connections may be abused by attackers. |
| **Secure Files** | Library 🡪 Secure Files | Medium | Files uploaded here can be misused if permissions are too broad. |
| **Variable Groups** | Library 🡪 Variable Groups | Medium | Variables may not be marked as secret; risk if reused across pipelines. |
| **Build Artifacts & Logs** | Pipelines 🡪 Pipeline Run 🡪 Logs / Artifacts | Medium | Secrets may leak via debug output or logs. |
| **Personal Access Tokens (PATs)** | User Settings 🡪 Personal Access Tokens | Critical | Compromise of a PAT can grant full access to projects, repos, and pipelines. |

# Credential Storage Best Practices

## Where to Store Credentials (Secure Storage Options)

### Azure

| **Method** | **Description** |
|----|----|
| **Azure Key Vault** | Centralized, secure storage for secrets, keys, and certificates. Use access policies or RBAC. |
| **Managed Identity** | Assign managed identities to services (VMs, Functions, etc.) to avoid using secrets entirely. |
| **App Service → Key Vault References** | Use @Microsoft.KeyVault(...) syntax in app settings to securely reference secrets. |
| **Azure AD Authentication** | Use token-based authentication (OAuth2, MSI) instead of password/API key authentication. |

### Azure DevOps

| **Method** | **Description** |
|----|----|
| **Secret Pipeline Variables** | Mark variables as "secret" so they're masked in logs and not exposed in UI or YAML. |
| **Azure Key Vault Task** | Use the Key Vault task in pipelines to securely fetch secrets at runtime. |
| **Service Connections** | Use securely scoped service connections to authenticate to Azure and external services. |
| **Secure Files (Library)** | Store sensitive files (SSH keys, certificates) securely with access restrictions. |

## Where NOT to Store Credentials (Insecure Practices)

### Azure

| **Insecure Location** | **Why It’s Risky** |
|----|----|
| **Custom Script Extensions** | Scripts and parameters are stored on disk in plaintext, readable by users or attackers. |
| **Run Command Input** | Commands and credentials passed via portal may be logged in audit history. |
| **App Service Configuration (Unprotected)** | Plaintext environment variables can be dumped via Kudu console or app error. |
| **ARM Templates / Parameters Files** | Hardcoded secrets may be exposed in deployment logs or source repositories. |
| **Function or Logic App Code** | Secrets in code or bindings can be extracted or reversed. |
| **Blob Storage (Public/Unsecured)** | Secrets stored in blobs may be accessed via public URLs or misused Shared Access Signatures. |

### Azure DevOps

| **Insecure Location** | **Why It’s Risky** |
|----|----|
| **Plain Pipeline Variables** | Non-secret variables are exposed in UI and logs. |
| **YAML Files in Repos** | Hardcoded credentials in .yml files are visible to anyone with repo access. |
| **Build/Release Logs** | Secrets printed to logs (intentionally or not) are stored long-term and accessible. |
| **Variable Groups (No RBAC)** | Broad access to variable groups allows leakage of secrets across teams. |
| **Long-lived PATs in Scripts** | If compromised, long-lived PATs can grant full access to repos and pipelines. |

**🔒 General Best Practices**

| **Practice** | **Recommendation** |
|----|----|
| **Use Key Vault as the primary store** | Avoid storing secrets in application code, templates, or environment settings. |
| **Enable auditing/logging** | Monitor access to Key Vaults, pipelines, and storage to detect misuse. |
| **Use RBAC & access policies** | Restrict who can access or update secrets, both in Azure and DevOps. |
| **Rotate credentials regularly** | Automate rotation for secrets, passwords, and keys wherever possible. |
| **Never echo secrets in output** | Avoid using secrets in echo, write-host, or similar commands in pipelines. |
| **Use Managed Identities when possible** | Prefer identity-based auth over storing credentials. |

## Where NOT to Store Credentials

**1. Source Code**

- ❌ Never hardcode credentials in source files (e.g., .py, .js, .sh, etc.).
- ❌ Avoid storing credentials in Git repositories, even private ones.

**Example (bad):**

db_password = "SuperSecret123!"

**2. Configuration Files (Unencrypted)**

- ❌ Avoid storing credentials in plain text .env, .yaml, .json, .ini files without protection.

**Example (bad):**

AWS_SECRET_KEY=AKIA...

**3. Logs and Debug Output**

- ❌ Never log secrets or tokens, especially in debug or error messages.

**Example (bad):**

echo "Failed login with password: \$PASSWORD"

**4. Shared Documents or Chats**

- ❌ Do not store or share secrets in Slack, Teams, Notion, Google Docs,
  or email.

**5. Local Machines Without Encryption**

- ❌ Avoid storing secrets in plain files (e.g., .bashrc, .zshrc,
  notes.txt) unless encrypted.

## Where to Securely Store Credentials

**1. Secret Management Systems**

These are purpose-built tools to store and access secrets securely.

**🔐 Recommended:**

- **HashiCorp Vault**
- **AWS Secrets Manager**
- **Azure Key Vault**
- **GCP Secret Manager**
- **CyberArk Conjur**
- **1Password CLI or Bitwarden for teams**

These solutions offer encryption at rest, access controls, auditing, and
rotation features.

**2. Environment Variables (With Limits)**

- ✅ Use **environment variables** to load secrets **at runtime only**, not stored permanently.
- Combine with a secret management tool or container orchestrator like Kubernetes.

    export DB_PASSWORD=\$(aws secretsmanager get-secret-value --secret-id
    db_pass --query SecretString --output text)

------------------------------------------------------------------------

**3. CI/CD Secrets Integration**

- ✅ Use **CI/CD secret injection mechanisms** (GitHub Actions, GitLab
  CI, Jenkins Credentials plugin).

- These tools inject secrets securely at build/runtime, without storing
  them in code.

------------------------------------------------------------------------

**4. Encrypted Configuration Files**

- ✅ If using config files, encrypt them using tools like:

  - **Mozilla SOPS**

  - **Ansible Vault**

  - **age or GPG**

  - **KMS-encrypted blobs (AWS KMS, Azure Key Vault)**

------------------------------------------------------------------------

**5. Operating System Keychains**

- ✅ Use secure credential storage built into the OS:

  - Windows Credential Manager

  - macOS Keychain

  - GNOME Keyring / KWallet on Linux

------------------------------------------------------------------------

**🔁 Bonus: Best Practices Summary**

| **Practice** | **✅ Do** | **❌ Don't** |
|----|----|----|
| Version Control | Use .gitignore & secret scanners | Hardcode secrets in repo |
| Access Control | Use least privilege & rotate secrets | Share secrets in chat/email |
| Rotation | Automate secret rotation | Reuse secrets indefinitely |
| Auditing | Enable logging & alerts on access | Ignore access tracking |
| Encryption | Encrypt secrets in transit and at rest | Store in plain text |

## Summary of Credential Storage Best Practices

**🔐 General Best Practices**

- ✅ Always treat credentials (passwords, API keys, tokens, etc.) as
  **sensitive assets**.

- ✅ Enforce **least privilege access** to secrets.

- ✅ Use **unique credentials** per environment/system.

- ✅ Regularly **rotate credentials** (manually or automatically).

- ✅ Enable **audit logging** on all credential access.

- ✅ Encrypt credentials **at rest** and **in transit**.

- ✅ Use **multi-factor authentication (MFA)** where supported.

- ✅ Use **versioned and immutable** secrets when possible.

- ✅ Set **expiration** for secrets and tokens.

- ✅ Scan repositories and file systems for exposed secrets using tools
  like:

  - truffleHog

  - git-secrets

  - gitleaks

  - GitHub Secret Scanning

**🚫 Where NOT to Store Credentials**

- ❌ **Never hardcode** credentials in source code or scripts.

- ❌ Avoid storing credentials in:

  - .env, .yaml, .json, .ini (unless encrypted)

  - Git repositories (even private ones)

  - Shell profiles (.bashrc, .zshrc)

  - Debug logs, error messages, or console output

  - Cloud-init or user-data scripts

  - Shared notes, email, or messaging platforms (e.g., Slack, Teams)

- ❌ Don’t store secrets unencrypted on local machines.

**✅ Where to Store Credentials Securely**

**1. Secrets Management Tools**

- ✅ Use centralized secret management platforms:

  - **AWS Secrets Manager**

  - **Azure Key Vault**

  - **Google Secret Manager**

  - **HashiCorp Vault**

  - **CyberArk Conjur**

  - **1Password CLI / Bitwarden (Team Vaults)**

**2. Environment Variables (Runtime Only)**

- ✅ Load secrets into environment variables **at runtime only**.
- ✅ Avoid permanent storage in .env files.
- ✅ Use secret managers or container orchestration tools (Kubernetes,
  Docker Secrets) to inject securely.

**3. CI/CD Secret Management**

- ✅ Use built-in secret stores for CI/CD pipelines:
  - GitHub Actions → Encrypted Secrets
  - GitLab CI → Protected Variables
  - Jenkins → Credentials Plugin
  - CircleCI → Environment Variables

**4. Encrypted Configuration Files**

- ✅ If config files are necessary, **encrypt them** using:

  - **Mozilla SOPS**
  - **Ansible Vault**
  - **age** or **GPG**

  - Cloud KMS (AWS KMS, Azure Key Vault, GCP KMS)

**5. OS Keychains**

- ✅ Use system-level secure storage:
  - **macOS Keychain**
  - **Windows Credential Manager**
  - **Linux Keyring (GNOME, KWallet)**

------------------------------------------------------------------------

**🛡️ Security Operations Best Practices**

- ✅ Use **access controls (RBAC)** to limit who can access secrets.
- ✅ Monitor and alert on unusual access or secret usage.
- ✅ Store secret metadata (who created, when, purpose).
- ✅ Regularly audit and remove unused or stale secrets.
- ✅ Use **zero-trust principles** in secret access and handling.
- ✅ Ensure **backup and recovery** procedures include secure secrets   recovery.

## Credential Storage Best Practices Checklist

| **Item** | **Description** | **Status** |
|----|----|----|
| 🔒 Centralized Storage | All credentials are stored in a centralized secrets manager (e.g., Vault, AWS Secrets Manager) | ☐ |
| 🔐 Encryption | All credentials are encrypted at rest and in transit | ☐ |
| 🔄 Rotation Policy | Credentials have automatic or periodic rotation policies | ☐ |
| ⏳ Expiration | All temporary secrets and tokens are configured to expire | ☐ |
| 🔍 Audit Logging | All access to secrets is logged and monitored | ☐ |
| 🧪 Secret Scanning | Regular scanning of source code and repos for exposed secrets | ☐ |
| 🚫 No Hardcoding | No credentials are hardcoded in source code or scripts | ☐ |
| 📁 No Plaintext Files | Credentials are not stored in .env, .json, .yaml, etc. without encryption | ☐ |
| 💬 No Secret Sharing via Chat | No secrets shared via email, Slack, Teams, Notion, etc. | ☐ |
| 👤 Least Privilege | Access to secrets is governed by least privilege (RBAC/ABAC) | ☐ |
| 🔁 Unique Per Environment | Secrets are unique across environments (dev, staging, prod) | ☐ |
| 🧩 CI/CD Injection | CI/CD pipelines use injected secrets securely (not hardcoded) | ☐ |
| 🛠️ Secure Config | Encrypted configs are used when necessary (e.g., SOPS, Ansible Vault) | ☐ |
| 🖥️ Local Machine Protection | Local machine secrets are stored using system keychains (macOS Keychain, Windows Credential Manager) | ☐ |
| 🔑 MFA Used | MFA is required for systems that access/manage secrets | ☐ |

## Credential Audit Checklist

| **Audit Step** | **Description** | **Status** |
|----|----|----|
| 🔎 Inventory Secrets | Identify all credentials and secrets in use across systems and environments | ☐ |
| 🔄 Review Rotation Dates | Check when each secret was last rotated and next due | ☐ |
| 🧑‍🤝‍🧑 Access Review | Audit who has access to each secret and why | ☐ |
| 🗃️ Storage Location | Validate where each secret is stored (should be in secure manager) | ☐ |
| 🔓 Encryption Validation | Confirm all secrets are encrypted at rest and in transit | ☐ |
| 🚨 Alert Configuration | Ensure alerts exist for abnormal access or failed attempts | ☐ |
| 🔐 Secret Use Analysis | Analyze usage logs—look for anomalies or unused secrets | ☐ |
| 📦 CI/CD & DevOps | Check pipeline config files for accidental exposure of secrets | ☐ |
| 📜 Source Code Scan | Run secret scanning tools (e.g., truffleHog, gitleaks) on all codebases | ☐ |
| 📤 Shared Secret Check | Investigate if secrets have ever been emailed or shared informally | ☐ |
| 🗑️ Decommission Unused | Remove or revoke stale, unused, or orphaned credentials | ☐ |
| 📈 Metrics & KPIs | Track number of secrets, rotation intervals, and access anomalies over time | ☐ |
| 🛠️ Incident History | Review any past credential leaks or incidents, and mitigation steps | ☐ |
| 🧩 3rd Party Access | Review secrets shared with or accessed by vendors/partners | ☐ |
| 📚 Documentation | Ensure secret ownership and handling procedures are documented | ☐ |

# Azure Credential Leak Vectors

Pentest Reference Table

| **Attack Vector** | **API/Service or Method** | **Required Access / Misconfig** | **What You Can Extract** |
|----|----|----|----|
| **IMDS Token Abuse** | http://169.254.169.254/metadata/identity/oauth2/token | SSRF / RCE on VM / container | Managed Identity access tokens |
| **Key Vault Secrets Dump** | GET /secrets/{secret-name} via Azure Key Vault API | Key Vault Reader / misconfigured access | Credentials, API keys, secrets |
| **App Service AppSettings Dump** | Kudu / SCM or ARM API (/config/appsettings/list) | Contributor / Reader on App Service | Environment vars with credentials |
| **Automation Account Variable Dump** | ARM API / Runbook access (/variables, /credentials) | Contributor / Automation Operator | Stored credentials, passwords |
| **Azure Function Admin Token Dump** | https://\<func\>.azurewebsites.net/admin/token | Access to Function App | Admin bearer token (can invoke functions) |
| **Azure DevOps PAT Token Extraction** | Pipeline variable dump or REST API (/personalaccesstokens) | Pipeline access or contributor | PATs scoped to Azure DevOps resources |
| **Container Instance Env Leak** | docker inspect, /proc/self/environ, or API metadata | Access to container / API | Environment secrets, SPN secrets |
| **Logic App Credential Disclosure** | View Logic App JSON definition in portal or via ARM | Reader / Contributor | Embedded creds (SMTP, API keys, etc.) |
| **Azure SQL / Cosmos DB Connection Strings** | GET /config/connectionstrings or AppSettings | Contributor / Reader | Cleartext connection strings |
| **SAS Token Exposure** | URLs with ?sig= in Blob/File/Table/Queue storage | Public sharing or misconfig | Full/partial access to storage resources |
| **Service Principal Secrets from Config** | Hardcoded in code, AppSettings, or accessible logs | File access or source control | AZURE_CLIENT_ID, AZURE_CLIENT_SECRET |
| **AAD Token Replay / Session Hijack** | Access tokens found in logs, memory, or browser cache | Local compromise / token leak | Replay into Microsoft Graph or ARM API |
| **Role Elevation via Microsoft Graph API** | RoleAssignmentScheduleRequests, PrivilegedRoleAssignmentRequests | Privileged access | Assign self privileged roles (e.g., Global Admin) |
| **Azure AD OAuth2 Abuse** | POST /oauth2/token with client credentials | Known SPN creds or misconfigured apps | Access tokens for Azure services |