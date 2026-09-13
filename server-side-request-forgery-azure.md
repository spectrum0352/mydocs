# Azure SSRF → Managed Identity Token Theft

## Overview

Azure workloads that use **Managed Identities** obtain OAuth 2.0 access tokens from the **Azure Instance Metadata Service (IMDS)**.

If an attacker exploits a **Server-Side Request Forgery (SSRF)** vulnerability or gains **Remote Code Execution (RCE)** within an Azure-hosted workload, they may be able to request tokens from IMDS and impersonate the managed identity assigned to that resource.

> **Important**
>
> Successfully obtaining a token **does not automatically grant administrative privileges**. The attacker only receives the permissions assigned to the managed identity. The impact depends entirely on the RBAC roles and application permissions granted to that identity.

---

### Azure Instance Metadata Service (IMDS)

Azure IMDS is available from within Azure compute resources at:

```text
http://169.254.169.254/metadata/
```

Managed Identity token endpoint:

```text
http://169.254.169.254/metadata/identity/oauth2/token
```

Required HTTP header:

```http
Metadata: true
```

---

## Attack Flow

```text
Internet
     │
     ▼
Public Azure Application
(App Service / Function / VM / Container)
     │
     ▼
SSRF or RCE
     │
     ▼
Azure IMDS
169.254.169.254
     │
     ▼
Managed Identity Access Token
     │
     ▼
Azure Resource Manager
Microsoft Graph
Key Vault
Storage
Other Azure Services
```

---

## Attack Prerequisites

The attack generally requires all of the following:

- An Azure-hosted workload with a **Managed Identity** enabled.
- A vulnerable application allowing **SSRF**, **RCE**, or another method of making arbitrary HTTP requests.
- Network connectivity from the workload to IMDS.
- The managed identity possessing permissions that are useful to the attacker.

---

## Typical Attack Sequence

1. Discover a vulnerable Azure application.
2. Exploit SSRF (or achieve RCE).
3. Send a request to Azure IMDS requesting an access token.
4. Receive the OAuth access token.
5. Use the token to authenticate to Azure services.
6. Enumerate permissions.
7. Access resources permitted to the managed identity.
8. Establish persistence or continue lateral movement if possible.

---

## Example IMDS Request

```http
GET /metadata/identity/oauth2/token?api-version=2019-08-01&resource=https://management.azure.com/ HTTP/1.1
Host: 169.254.169.254
Metadata: true
```

---

## Example Response

```json
{
  "access_token": "<JWT_TOKEN>",
  "expires_in": "3599",
  "token_type": "Bearer"
}
```

---

## Possible Post-Exploitation Activities

Depending on the permissions assigned to the managed identity, an attacker may be able to:

- Enumerate Azure subscriptions
- Enumerate resource groups
- Read Azure Storage data
- Read Azure Key Vault secrets
- Query Microsoft Graph
- Deploy Azure resources
- Modify infrastructure
- Access application secrets
- Establish persistence

---

## Common Azure Services Exposed to IMDS Abuse

| Azure Service | Risk |
|--------------|------|
| Azure Virtual Machines | Applications running on the VM may expose SSRF or RCE that reaches IMDS. |
| Azure App Service | Public-facing web applications are common SSRF targets. |
| Azure Functions | HTTP-triggered functions may expose SSRF vulnerabilities. |
| Azure Container Instances (ACI) | Containerized applications may be vulnerable to SSRF or RCE. |
| Azure Kubernetes Service (AKS) | Applications running inside pods may abuse the node or workload identity configuration if compromised. |
| Azure Logic Apps | HTTP connectors and webhook workflows can expose SSRF paths if poorly designed. |

> Azure Application Gateway, Azure Front Door, Azure API Management, and reverse proxies are **not themselves vulnerable to IMDS theft**, but application or proxy misconfigurations can facilitate SSRF attacks against backend workloads.

---

## Common SSRF Attack Patterns

| Technique | Description | Potential Impact |
|-----------|-------------|------------------|
| Direct SSRF → IMDS | Application fetches attacker-controlled URL | Managed Identity token theft |
| Open Redirect | Redirects internal request to IMDS | Token theft |
| XXE | XML parser performs internal HTTP requests | Access to IMDS |
| Deserialization | Gadget chain performs arbitrary HTTP requests | IMDS access or RCE |
| RCE | Local code execution directly queries IMDS | Full access to managed identity |

---

## High-Value Azure Resources Frequently Targeted

After obtaining a token, attackers commonly attempt to access:

- Azure Resource Manager (ARM)
- Azure Key Vault
- Azure Storage Accounts
- Azure SQL
- Azure Container Registry
- Azure Cosmos DB
- Microsoft Graph
- Azure Event Hubs
- Azure Service Bus

---

## Detection Opportunities

Monitor for:

- Requests to **169.254.169.254** originating from web applications.
- Unexpected Managed Identity token requests.
- Managed Identity authentication from unusual workloads.
- Sudden enumeration of Azure resources.
- Key Vault access by unexpected managed identities.
- Unusual Microsoft Graph activity.
- Storage enumeration immediately after IMDS access.
- Privileged Azure Resource Manager API calls from application identities.

Useful telemetry includes:

- Azure Activity Logs
- Microsoft Defender for Cloud
- Microsoft Defender for Endpoint
- Azure Monitor
- Key Vault Diagnostic Logs
- Microsoft Entra Sign-in Logs
- Storage Diagnostic Logs

---

## Hardening Recommendations

### Application Security

- Validate and sanitize all user-supplied URLs.
- Use strict allowlists for outbound HTTP requests.
- Disable arbitrary URL fetching where possible.
- Prevent open redirects.
- Prevent XXE and unsafe deserialization.

### Identity Security

- Apply the principle of least privilege.
- Prefer **User-Assigned Managed Identities** when appropriate.
- Regularly review Managed Identity role assignments.
- Remove unused managed identities.

### Network Security

- Restrict outbound network access where feasible.
- Use Azure Firewall or Network Virtual Appliances to control egress.
- Isolate workloads using Virtual Networks.
- Avoid exposing unnecessary internal services.

> **Note**
>
> Azure IMDS is a platform service and cannot be universally blocked with a simple NSG rule. Network controls should be carefully designed and validated to avoid disrupting legitimate Managed Identity functionality.

### Monitoring

- Enable Microsoft Defender for Cloud recommendations.
- Alert on unusual Managed Identity activity.
- Monitor Azure Resource Manager API usage.
- Enable diagnostic logging for critical Azure services.

---

## SSRF Assessment Checklist

### Identify Potential SSRF Entry Points

- Image fetchers
- URL preview services
- Webhook endpoints
- File import features
- PDF generators
- RSS readers
- Proxy endpoints
- URL validation APIs

---

### Test IMDS Access

Target:

```text
http://169.254.169.254/metadata/identity/oauth2/token?api-version=2019-08-01&resource=https://management.azure.com/
```

Required header:

```http
Metadata: true
```

---

### Verify Token Retrieval

Successful responses typically contain:

```json
{
  "access_token": "...",
  "token_type": "Bearer",
  "expires_in": "3599"
}
```

---

### Enumerate Identity Permissions

After obtaining a token (during an authorized security assessment), determine what the managed identity can access, such as:

- Azure Resource Manager
- Azure Key Vault
- Azure Storage
- Microsoft Graph
- Other Azure services permitted by its assigned roles

---

## Detection Indicators

Potential indicators include:

- HTTP requests to `169.254.169.254`
- Unexpected Managed Identity token issuance
- Abnormal Azure Resource Manager API usage
- Unusual Key Vault access
- Large-scale Azure resource enumeration
- Storage account enumeration
- Microsoft Graph activity from application identities
- Sudden privilege changes or resource deployments

---

## MITRE ATT&CK Mapping

| Tactic | Technique |
| --------- | ----------- |
| Initial Access | Exploit Public-Facing Application (T1190) |
| Execution | Exploitation for Client Execution (T1203) *(when applicable)* |
| Credential Access | Steal or Forge Authentication Tokens (T1528) |
| Discovery | Cloud Service Discovery (T1526) |
| Discovery | Permission Groups Discovery (T1069) |
| Collection | Data from Cloud Storage (T1530) |
| Lateral Movement | Valid Accounts (T1078) *(using the managed identity)* |
| Persistence | Account Manipulation (T1098) *(if permissions allow)* |

---

## References

- Azure Instance Metadata Service
- Azure Managed Identity documentation
- Microsoft Defender for Cloud recommendations
- Microsoft Security Best Practices for Managed Identities