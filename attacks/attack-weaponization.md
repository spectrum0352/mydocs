## 4. Weaponization & Controlled Exploitation

**Goal:** Validate that documented escalation paths and exposures are real, using only pre-approved test targets.

- Select an authorized target resource (test VM, test storage account, non-prod SQL instance)
- Validate exploitation preconditions before execution
- Execute approved test actions only — no destructive payloads
- Run remote commands on the designated test VM: `Invoke-AzVMRunCommand`
- Validate whether execution permissions allow broader lateral movement
- Assess data-access exposure reachable from the compromised identity
- Record how (or whether) security controls responded to the action
- Document every finding with timestamp, command, and target

**Common malware-emulation patterns to test detection against** (mapped to current threat trends):
- **T1059 – Command & Scripting Interpreter (LOLBins):** test PowerShell/CMD/Bash abuse inside Azure VMs, Automation Runbooks, and Custom Script Extensions
- **T1486 – Data Encrypted for Impact:** simulate mass-encryption behavior on a test VM/storage account only, to validate Azure Disk Encryption, SSE, and Defender for Cloud alerting — never encrypt real data

---


# Post-Exploitation Analysis Flow

Validate Access Scope → Enumerate Additional Reachable Resources → Assess Lateral Movement Paths → Identify Sensitive Data Locations → Evaluate Monitoring Visibility → Test Logging Coverage → Identify Defense Gaps → Record Evidence Securely
