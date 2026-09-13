# Initial attack vectors

## 1. Phishing

Attackers use social engineering to trick users into revealing their Microsoft Entra ID credentials or executing malicious content. Since most Azure resources are identity-driven, compromising a single user account can provide immediate access to Azure Portal, Microsoft 365, Azure CLI, Microsoft Graph, and other cloud services.

### 1.1 Common Techniques

- Fake Microsoft sign-in pages
- HTML Smuggling
- Office documents with malicious macros or embedded downloaders
- QR-code phishing (Quishing)
- MFA fatigue attacks
- Adversary-in-the-Middle (AiTM) phishing

### 1.2 Attack Flow

1. The attacker sends a phishing email, Teams message, or LinkedIn message.
2. The victim clicks a fake Microsoft login page or opens a malicious attachment.
3. Credentials, MFA tokens, or session cookies are stolen.
4. The attacker authenticates to Microsoft Entra ID.
5. Using the stolen identity, the attacker gains access to Azure Portal, Azure CLI, Microsoft Graph, Exchange Online, or other cloud resources.

### 1.3 Potential Impact

- Microsoft Entra ID account compromise
- Azure Portal access
- Microsoft 365 compromise
- Azure subscription access
- Session hijacking

---

## 2. Exploitation of Internet-Facing Applications

Attackers scan public Azure-hosted applications for exploitable vulnerabilities. Successful exploitation allows arbitrary code execution within the application, often providing access to Managed Identities, application secrets, or backend Azure resources.

### 2.1 Attack Flow

1. The attacker discovers an internet-facing Azure App Service, Function App, AKS workload, or API.
2. The attacker exploits vulnerabilities such as SSRF, RCE, SQL Injection, or deserialization.
3. Code executes on the Azure-hosted application.
4. The attacker extracts Managed Identity tokens, application secrets, or Azure credentials.
5. These credentials are used to authenticate against Azure Resource Manager or Microsoft Graph.

### 2.2 Potential Impact

- Initial shell access
- Managed Identity compromise
- Azure resource access
- Container compromise

---

## 3. Exposed Credentials and Secrets

Developers frequently expose Azure credentials in source code, configuration files, CI/CD pipelines, or public repositories. Attackers continuously scan the Internet for these secrets and use them to authenticate directly to Azure without exploiting any vulnerability.

### 3.1 Attack Flow

1. The attacker discovers leaked credentials in GitHub, GitLab, Azure DevOps, public storage, or backup files.
2. The credentials are validated against Azure authentication endpoints.
3. Successful authentication provides immediate access using Azure CLI, Azure PowerShell, REST APIs, or the Azure Portal.
4. The attacker enumerates accessible subscriptions and resources.

### 3.2 Potential Impact

- Azure CLI authentication
- Storage account compromise
- Key Vault access
- Service Principal compromise

---

## 4. OAuth Application Consent Abuse

Instead of stealing passwords, attackers convince users to grant consent to a malicious Microsoft Entra application. Once approved, the application receives OAuth tokens that allow persistent access to Microsoft Graph and Microsoft 365 resources without requiring the user's password.

### 4.1 Attack Flow

1. The attacker creates a malicious OAuth application.
2. A victim is sent a consent URL through phishing or social engineering.
3. The victim approves the requested permissions.
4. Microsoft Entra ID issues OAuth access and refresh tokens.
5. The attacker accesses Microsoft Graph APIs on behalf of the user.

### 4.2 Potential Impact

- Persistent Graph API access
- Mailbox compromise
- OneDrive access
- Teams data access

---

## 5. Password Spraying

Password spraying targets many user accounts using a small number of commonly used passwords. This avoids account lockouts while identifying weak passwords that provide valid access to Microsoft Entra ID.

### 5.1 Attack Flow

1. The attacker enumerates valid usernames.
2. A commonly used password is attempted against many accounts.
3. Successfully authenticated accounts are identified.
4. The attacker logs into Azure Portal or Microsoft 365 using the compromised account.

### 5.2 Potential Impact

- Valid user access
- Azure Portal compromise
- Microsoft 365 compromise

---

## 6. Misconfigured Azure Resources

Misconfigured Azure services frequently expose administrative interfaces, storage accounts, APIs, or virtual machines directly to the Internet. Attackers identify these exposed resources through Internet-wide scanning and exploit weak or missing security controls.

### 6.1 Attack Flow

1. The attacker scans Azure IP ranges and DNS records.
2. Public storage accounts, Azure Functions, App Services, or VMs are discovered.
3. Weak authentication or insecure configuration is exploited.
4. Administrative access or sensitive data is obtained.
5. The attacker uses the compromised resource to pivot further into Azure.

### 6.2 Potential Impact

- Unauthorized access
- Data exposure
- Remote code execution

---

## 7. Managed Identity Token Theft (SSRF)

Applications with Server-Side Request Forgery (SSRF) vulnerabilities may allow attackers to access the Azure Instance Metadata Service (IMDS). If a Managed Identity is assigned, Azure returns OAuth access tokens that can be used to authenticate to Azure services.

### 7.1 Attack Flow

1. The attacker identifies an SSRF vulnerability.
2. Requests are redirected to the Azure Metadata Service.
3. Azure returns a Managed Identity access token.
4. The attacker uses the token to access Azure Resource Manager, Key Vault, Storage, or Microsoft Graph.

### 7.2 Potential Impact

- Managed Identity compromise
- Azure API access
- Secret theft

---

We can apply this same pattern to **all 11 attack vectors**:

* **Overview** (what the attack is)
* **How attackers gain initial access** (1–2 paragraph explanation)
* **Attack Flow** (step-by-step)
* **Common Techniques**
* **Potential Impact**
* **Azure Services Targeted**
* **MITRE ATT&CK Mapping**
* **Common Detection Opportunities**
* **Recommended Mitigations**

## 2. Initial Access & Authentication Validation

**Goal:** Establish an authorized session in-scope and confirm what it can actually reach.

1. Authenticate with approved/provided credentials — `Connect-AzAccount`, `Connect-MsolService`
2. Import a pre-authorized context if the engagement provides one — `Import-AzContext`
3. Persist the session for the engagement window — `Save-AzContext`
4. Validate the access scope matches what was authorized (no more, no less)
5. Enumerate current role assignments — `Get-AzRoleAssignment`
6. Identify baseline privilege level for the tested identity
7. Switch/validate access across in-scope subscriptions — `Select-AzSubscription`

> Any MFA-bypass or stolen-token simulation must be pre-approved in writing and performed only against test identities, never live user sessions, per the engagement's ethical constraints.
