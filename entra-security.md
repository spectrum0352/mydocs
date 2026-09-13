# Microsoft Entra Book of News: Recent Updates & Announcements

## Microsoft Entra ID Security & Feature Updates

### Passkey Enhancements

* **Synced Passkeys (Cross-Device Convenience):** Users can now utilize synced passkeys across ecosystem accounts (Apple iCloud Keychain, Google Password Manager, Bitwarden), drastically simplifying setup and sign-in across new iOS and Android devices.
* **Setup Comparison:** Reduced device onboarding friction from over 20 manual setup steps down to just 2 steps.
* **Broader Accessibility:** Eliminates mandatory dependencies on the Microsoft Authenticator app or standalone password manager configurations for initial setup.


* **Device-Bound Passkeys:** Remains supported for high-assurance scenarios requiring hardware-bound credentials (e.g., FIDO2 security keys, TPM-bound keys).

### Security Copilot & Microsoft 365 E5 Integration

* **Security Compute Units (SCUs):** Microsoft 365 E5 licenses include an allocation of Security Copilot Compute Units (SCUs) per user per month to power built-in automation and AI-driven security features.
* **Self-Remediation & Autonomous Operations:** Enables automated triage, risk remediation, and security incident management directly within the Microsoft Entra admin center.

---

## Autonomous Governance & Entra AI Agents

Microsoft Entra is introducing specialized **Autonomous Agents** powered by Security Copilot to streamline identity governance, policy management, and application lifecycles.

> **Operational Footprint:** Agents typically run once per day. On average, each agent execution consumes less than **1 SCU**.

### 1. Access Review Agent

* **Platform:** Integrates directly with Microsoft Entra ID Governance.
* **Capabilities:** Provides real-time insights, contextual risk scoring, and automated decision recommendations to access reviewers.
* **Impact:** Enables reviewers to complete complex certifications quickly and accurately through a streamlined interface.

### 2. Conditional Access Optimization Agent

* **Capabilities:** Continuously evaluates policy effectiveness, identifies policy gaps, detects conflicting rules, and recommends optimization paths to ensure baseline security without impacting user productivity.

### 3. Risk Management Agent

* **Capabilities:** Monitors real-time identity threats, user risk levels, and sign-in risks, automatically applying defensive guardrails or triggering self-remediation workflows.

### 4. Application Lifecycle Management Agent

* **Capabilities:** Automates application registration, credential rotation, consent management, and offboarding for unused or enterprise applications.

---

## Identity & AI Security Guardrails

### Agentic & Shadow AI Governance

* **Agent Registry:** A centralized directory within Microsoft Entra to discover, register, and govern AI agents, Model Context Protocol (MCP) servers, and agentic workflows.
* **Shadow AI Detection:** Automatic discovery and tracking of unmanaged AI tools, external MCP servers, and third-party AI agents operating within the tenant.

### Protection & Conditional Access for AI

* **Conditional Access for Agents:** Extend identity-based Conditional Access policies to non-human workloads, AI agents, and MCP servers.
* **Prompt Injection Protection:** Integrated guardrails designed to detect, intercept, and mitigate prompt injection attacks against enterprise AI models and connected enterprise data sources.