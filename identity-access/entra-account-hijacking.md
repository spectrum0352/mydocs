# Account Hijacking and Credential Abuse

**Objective**: Identify Azure AD accounts at risk of compromise due to poor credential hygiene (e.g., never-used passwords, stale credentials, inactive usage).

**Detection Command (Azure CLI):**

az ad user list --output json \| jq '.\[\] \| select(.passwordLastChanged == null)' \| grep -iE "(account hijacking\|credential compromise\|privilege misuse)"

**🔎 Explanation:**

- **az ad user list --output json**: Retrieves all users in the Azure Active Directory (AAD) tenant.

- **jq '.\[\] \| select(.passwordLastChanged == null)'**: Filters users who have **never changed their password**, which may indicate:

  - A default password still in use

  - Potential backdoor/service account

  - Account provisioned but never actively managed

- **grep -iE "(account hijacking\|credential compromise\|privilege misuse)"**: Searches for accounts that may contain metadata, notes, or tags suggesting suspicious use or compromise potential.

**🧠 Azure Use Cases (PenTest/Red Team):**

- **Identify low-hygiene accounts**: Users who never changed passwords are prime targets for brute-force or password-spray attacks.

- **Locate backdoor/service accounts**: Accounts created for automation or integrations but never used may be unmonitored.

- **Privilege escalation paths**: Look for these accounts in role assignments; if they have elevated roles (e.g., Owner, User Access Administrator), they pose a high risk.

**🔄 GCP / AWS Equivalent (FYI):**

| **Cloud** | **Command (Summarized)**                                        |
|-----------|-----------------------------------------------------------------|
| AWS       | aws iam list-users + jq on PasswordLastUsed == null             |
| GCP       | gcloud auth list + jq on credential_last_refreshed_time == null |

**✅ Summary**

| **Risk Indicator**          | **Azure Detection**                      |
|-----------------------------|------------------------------------------|
| Never-changed password      | passwordLastChanged == null              |
| No credential rotation      | Not directly exposed via az ad user list |
| Privileged + inactive users | Combine with az role assignment list     |
| Abusable metadata/tags      | grep -iE for abuse-related keywords      |

Would you like an automated script version that combines this with role enumeration and outputs a CSV or JSON report?
