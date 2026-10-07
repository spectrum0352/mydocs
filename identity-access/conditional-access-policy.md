# Conditional Access Policy

Conditional Access is a **policy-based access control framework** in Microsoft Entra ID that protects organizational resources by enforcing specific conditions before granting access.

* Extends security beyond the traditional network perimeter using **identity-driven signals**
* Evaluates multiple signals in real time to make access decisions
* Policies are enforced **after first-factor authentication**
* A core component of the **Zero Trust security model**

---

## **Core Components**

### **1. Signals (Inputs)**

Conditional Access evaluates various signals:

* **User & Group Membership**
* **Device State** (compliance, join type)
* **Device Platform** (Windows, Linux, Android, iOS)
* **Location / IP Address**
* **Application / Cloud App**
* **Client App Type** (browser, mobile, desktop)
* **Risk Signals**

  * User risk
  * Sign-in risk
* **Security Integrations**

  * Microsoft Defender for Cloud Apps
  * Microsoft Defender XDR
  * Microsoft Sentinel

---

### **2. Decisions**

Based on evaluated signals:

* **Grant Access**
* **Block Access**

---

### **3. Controls (Enforcement Actions)**

#### **Grant Controls**

Access can be granted with one or more requirements:

* Require **Multi-Factor Authentication (MFA)**
* Require **authentication strength** (specific methods)
* Require **compliant device** (via Intune)
* Require **Hybrid Entra ID joined device**
* Require **approved client application**
* Require **app protection policy**

👉 Controls can be configured as:

* **Require all selected controls**
* **Require one of the selected controls**

#### **Session Controls**

* Sign-in frequency
* Persistent browser sessions
* Continuous Access Evaluation (CAE)
* App-enforced restrictions

---

## **Policy Structure**

### **1. Assignments (Who & What)**

#### **Users / Identities**

* All users
* Selected users or groups
* Directory roles
* Guest / external users (B2B)
* Workload identities (service principals, managed identities)

👉 **Exclude**: Specific users/groups (e.g., emergency accounts)

---

#### **Target Resources**

* **Cloud Apps**

  * All cloud apps
  * Selected applications
* **User Actions**

  * Register security information
  * Register/join devices
* **Authentication Context**

  * Protect sensitive actions within apps (e.g., SharePoint)

---

### **2. Conditions**

Policies are triggered based on:

* **User Risk / Sign-in Risk**
* **Device Platforms**
* **Locations** (named locations, countries)
* **Client Apps** (browser, mobile, legacy auth)
* **Device Filters**

  * Device ID
  * OS version
  * Compliance state
  * Manufacturer/model

---

### **3. Policy State**

* **Off** – Disabled
* **Report-only** – Monitor impact without enforcement
* **On** – Enforced

---

## **Security Defaults (Baseline Protection)**

Security Defaults provide a **basic level of protection**:

* Require **MFA registration for all users**
* Enforce **MFA for administrators**
* **Block legacy authentication protocols**
* Protect privileged operations (e.g., Azure portal access)

📌 **MFA Registration Window**

* Users may get up to **14 days to register**
* Enforcement starts at **first sign-in after enablement**

---

## **Advanced Capabilities**

### **1. Risk-Based Conditional Access**

* Uses Identity Protection (requires **P2 license**)
* Automatically responds to:

  * Compromised credentials
  * Suspicious sign-ins

---

### **2. Continuous Access Evaluation (CAE)**

* Near real-time access revocation when risk changes
* Example triggers:

  * Password reset
  * Account compromise
  * Policy updates

---

### **3. Device Compliance Integration**

* Integrates with MDM tools like **Microsoft Intune**
* Ensures devices meet:

  * Encryption requirements
  * Security baselines
  * Compliance policies

---

### **4. Templates**

* Predefined policy templates for:

  * MFA enforcement
  * Admin protection
  * Risk-based policies

---

## **Licensing Requirements**

* **Microsoft Entra ID P1** → Required for Conditional Access
* **Microsoft Entra ID P2** → Required for risk-based policies (Identity Protection)

---

## **Best Practices**

### **Planning & Deployment**

* Start with **Report-only mode**
* Use **pilot groups** before full rollout
* Follow a **phased implementation approach**

---

### **Security Recommendations**

* Create **break-glass (emergency) accounts** and exclude them
* **Block legacy authentication**
* Enforce **MFA for all users**, especially admins
* Require **compliant or managed devices**

---

### **Operational Excellence**

* Use **group-based assignments** (not individual users)
* Maintain **clear documentation**
* Perform **regular policy reviews**
* Monitor **sign-in logs and audit logs**

---

### **User Experience**

* Communicate policy changes clearly
* Provide guidance for:

  * MFA setup
  * Device compliance
* Minimize friction while maintaining security

---

## **Key Benefits**

* Strengthens **Zero Trust security posture**
* Reduces risk of compromised identities
* Enables **granular access control**
* Improves compliance and governance
* Balances **security and user productivity**

---

## **Summary**

Conditional Access in Microsoft Entra ID is a **centralized, intelligent access control system** that evaluates identity, device, and risk signals in real time to enforce secure access decisions. When properly implemented, it significantly enhances organizational security while maintaining a seamless user experience.

---

If you want, I can convert this into:

* **Architecture diagram**
* **Policy design blueprint (real-world scenarios)**
* **Interview notes / cheat sheet**
* **Comparison: Conditional Access vs Security Defaults vs Identity Protection**

# Condition access policy during pentest
**What They Are:**
Conditional Access Policies (CAPs) in Microsoft Entra provide fine-grained control over when and how users authenticate. They are used to enforce MFA, restrict access based on location, device, risk level, and user role, and are essential for modern identity security.

CAPs replace or enhance default MFA protections and must be used instead of Security Defaults in complex environments.

**🔐 Microsoft MFA Basics (Relevant for Pen testing)**
•	MFA options include:
o	Microsoft Authenticator App
o	SMS or Voice Call
o	Hardware OAUTH tokens
•	Security Defaults (baseline protection):
o	Enforce MFA registration for all users
o	Block legacy authentication protocols (IMAP, EWS, POP)
o	Require MFA for privileged actions (like portal access)
o	Must be disabled to enable Conditional Access Policies

## 🎯 How Conditional Access Impacts Pentesting
✅ 1. Determines Your Attack Surface
•	CAPs define whether MFA is enforced or bypassed under certain conditions.
•	Pen testers must test:
o	Geolocation-based rules (e.g., “only allow login from specific countries”)
o	Device compliance (e.g., corporate-joined vs. BYOD)
o	Risk-based access (e.g., sign-in risk score from Identity Protection)
✅ 2. Used to Bypass or Evade MFA
•	Look for scenarios where CAPs don’t enforce MFA, such as:
o	Service accounts or legacy protocols
o	Logins from "trusted" locations or IPs
o	Specific user groups with weaker rules
✅ 3. Can Be Abused by Privileged Users
•	If a Global Admin or Conditional Access admin is compromised, policies can be:
o	Disabled or edited to allow MFA bypass
o	Used to create targeted exclusions for persistence or lateral movement
✅ 4. Gives Insight Into Attack Paths
•	Understanding how CAPs are structured can help:
o	Map out privileged paths to sensitive apps
o	Identify weak policy configurations that allow token theft, Golden SAML, or session hijacking
________________________________________
🧰 Pen tester Workflow Example: CAP Recon and Exploitation
1.	Recon: Use AzureAD or MS Graph API to dump Conditional Access policies (if permissions allow).
2.	Analyze: Look for exclusions, IP whitelists, or misconfigured conditions.
3.	Exploit: Attempt authentication with stolen credentials from an IP range or device that bypasses CAP.
4.	Persist: If Global Admin is compromised, create or modify CAPs to ensure backdoor access (e.g., exclude a service account from MFA).


## Enumerate Conditional Access Policies via Graph API
✅ Requirements:
•	Permissions: Policy.Read.All, Directory.Read.All, or Security.Read.All
•	Admin consent must be granted (typically for red team ops via token abuse or post-compromise)
•	Microsoft.Graph PowerShell SDK installed
________________________________________
🔹 Installation (if needed)
Install-Module Microsoft.Graph -Scope CurrentUser
________________________________________
🔹 Login and Consent (Interactive)
Connect-MgGraph -Scopes "Policy.Read.All", "Directory.Read.All"
If you're post-exploitation and using a token instead, you can also authenticate with MSAL or import a token directly (ask if you'd like that version too).
________________________________________
🔹 Enumerate Conditional Access Policies
# List all Conditional Access policies
$policies = Get-MgConditionalAccessPolicy

# Display basic info
$policies | Select-Object Id, DisplayName, State, Conditions, GrantControls | Format-List
________________________________________
🧠 What This Shows You
Field
* DisplayName - Policy name — often describes intent or coverage
* State - Enabled / Disabled / Report-only
* Conditions - Who/what it applies to (users, apps, IPs, platforms)
* GrantControls - MFA requirements, session controls, block/allow logic


________________________________________
🔍 Example Red Team Questions to Ask
•	Is MFA enforced for all users, or only certain groups?
•	Are any trusted IPs or device platforms excluded?
•	Are legacy auth protocols still allowed via exceptions?
•	Can you target a service principal or app that isn’t subject to any CAP?

