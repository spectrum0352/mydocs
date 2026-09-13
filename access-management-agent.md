To deploy or build a **Conditional Access (CA) Optimization AI Agent** for Microsoft Entra ID, you can either **enable Microsoft’s built-in native agent** (recently released in Public Preview via Security Copilot) or **build a custom AI agent** using Microsoft Graph API and Azure OpenAI / Semantic Kernel.

---

## Option 1: Enable Microsoft’s Native CA Optimization Agent (Public Preview)

Microsoft provides a native **Conditional Access Optimization Agent** directly inside the Microsoft Entra admin center. It runs on Microsoft Security Copilot to evaluate policy gaps, enforce baseline controls, and propose policy consolidation.

### Prerequisites

* **Licensing:** Microsoft Entra ID P1 or P2 + active Microsoft Security Compute Units (SCUs) provisioned.
* **Roles:** *Security Administrator* (to activate/configure) or *Conditional Access Administrator* (to review and apply suggestions).

### Deployment Steps

1. **Access Agent Center:**
* Sign in to the [Microsoft Entra admin center](https://www.google.com/search?q=https://entra.microsoft.com) as a Security Administrator.
* Navigate to **Identity** > **Agents** > **Conditional Access Optimization Agent** (or select **Go to agents** from the home notification card).


2. **Configure Capabilities & Scope:**
* Go to **Settings** > **Capabilities**.
* Enable monitoring for new **Users**, **Applications**, and **Agent Identities**.
* Toggle **Agent Capabilities** to allow the agent to draft policies directly in *Report-only* mode on your behalf.
* Enable **Phased Rollout** to deploy policy changes in automated, low-risk user batches.


3. **Execute and Review:**
* Click **Start Agent** to trigger the initial full scan.
* Review suggestions (e.g., blocking legacy auth, enforcing MFA, consolidating overlapping rules) under **Suggestions**.
* Approve actions via **One-Click Remediation** or initiate a **Phased Rollout**.



---

## Option 2: Build a Custom CA Optimization AI Agent

If you want to build a custom, independent agent (e.g., using Python, LangChain/Semantic Kernel, and Microsoft Graph API), follow this architectural blueprint.

### Architectural Overview

```
 [ Microsoft Graph API ] ---> [ Data Collector / Audit Log Scraper ]
                                          │
                                          ▼
[ Guardrails / Rules Engine ] <---> [ AI Agent Orchestrator (LLM) ]
                                          │
                                          ▼
 [ Microsoft Teams / Admin UI ] <--- [ Action & Remediation Service ]

```

---

### Step 1: Set Up Permissions and API Access

Register an App in Entra ID (`App Registrations`) and grant **Application permissions**:

* `Policy.Read.All` / `Policy.ReadWrite.ConditionalAccess` (To audit and modify CA policies)
* `AuditLog.Read.All` / `Directory.Read.All` (To check user/app sign-in activity and gaps)
* `DeviceManagementConfiguration.Read.All` (To verify Intune compliance integration)

---

### Step 2: Implement the Graph API Data Collector

Build a service to fetch existing policies and sign-in telemetry.

```python
import requests

def get_conditional_access_policies(access_token):
    headers = {"Authorization": f"Bearer {access_token}"}
    url = "https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies"
    response = requests.get(url, headers=headers)
    return response.json().get('value', [])

```

---

### Step 3: Define Agent Tools & Evaluation Prompts

Supply the LLM (e.g., Azure OpenAI GPT-4o) with tools to analyze policy JSON structures against best practices.

#### Core Agent Tasks:

1. **MFA Coverage Check:** Identify users or apps not targeted by an active MFA policy.
2. **Device Controls:** Ensure cloud apps require `compliantDevice` or `domainJoinedDevice`.
3. **Legacy Auth & Device Code Flow:** Verify policies exist blocking `other` client types and `deviceCodeFlow`.
4. **Policy Consolidation:** Compare conditions (Users, Grant Controls, Target Apps) across policies to merge redundant rules.

#### Prompt Engineering System Message Example:

```text
You are an expert Security Engineer specializing in Microsoft Entra Conditional Access.
Analyze the provided JSON list of Conditional Access policies. Identify:
1. Users/Apps missing MFA requirements.
2. Gaps in blocking legacy authentication or device code flow.
3. Redundant or overlapping policies that can be consolidated into a single policy.

Output your recommendation as a JSON payload containing:
- "finding_type": "GAP" | "CONSOLIDATION"
- "risk_score": HIGH | MEDIUM | LOW
- "suggested_policy_json": <Microsoft Graph API compatible JSON>

```

---

### Step 4: Add Safety Mechanisms & Human-in-the-Loop

To avoid locking out administrators or disrupting access:

1. **Default to Report-Only Mode:** Ensure any proposed or auto-generated policy is created with `"state": "enabledForReportingButNotEnforced"`.
2. **Admin Approval Loop:** Send recommendations to a Microsoft Teams channel via Webhook/Bot with **Approve** and **Reject** buttons before changing policy states to `"enabled"`.
3. **Exclusion Guardrails:** Automatically inject emergency break-glass accounts into the `excludeUsers` block of any new policy payload.
