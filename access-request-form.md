User Access Management Form
(Aligned with ISO 27001:2022, SOC 2, NIST CSF)

1. Request Type
o	[ ] Access Provisioning (New Access)
o	[ ] Access Modification (Change Role/Permissions)
o	[ ] Access Revocation (Remove Access)

2. User Details
o	Employee Name:
o	Employee ID:
o	Job Title:
o	Department:
o	Manager Name:
o	Contact Number:
o	Email ID:
o	Employment Type: Permanent / Contractor / Vendor
o	Location:

3. System / Platform Access Details

A. Microsoft Entra ID (Azure AD)
o	User / Group Membership:
o	Application Access:
o	Conditional Access Exception:
o	MFA Requirement: Enable / Disable

B. Azure RBAC
o	Resource Type:
o	Resource Name:
o	Role:
o	Scope:
o	Privileged:
o	Duration:

C. Active Directory (On-Prem)
o	Security Group:
o	Distribution Group:
o	Admin Access:
o	Shared Folder Access:

D. Other Systems
o	Application/System:
o	Access Role:
o	Duration:

4. Access Justification
o	Business Need:
o	Project/Task:
o	Data Classification: Public / Internal / Confidential / Highly Confidential
o	Least Privilege Justification:
o	SoD Check: Passed / Exception

5. Access Duration
o	Start Date:
o	End Date:
o	Temporary Access: Yes / No
o	Auto Expiry: Yes / No

6. Risk & Compliance Validation
o	MFA Enabled: Yes / No
o	Conditional Access: Yes / No
o	Logging Enabled: Yes / No
o	PIM Enforced: Yes / No
o	Security Review: Yes / No

7. Requestor Details
o	Name:
o	Designation:
o	Department:
o	Date:
o	Signature:

8. Manager Approval
o	Name:
o	Designation:
o	Status: Approved / Rejected
o	Comments:
o	Date:
o	Signature:

9. Security Team Approval
o	Name:
o	Role:
o	Status: Approved / Rejected
o	Risk Level: Low / Medium / High
o	Comments:
o	Date:
o	Signature:

10. Implementation
o	Implemented By:
o	Date:
o	Ticket ID:
o	Verification: Yes / No
o	Evidence: Yes / No

11. De-Provisioning
o	Reason:
o	Last Working Day:
o	Access Removed Date:
o	Verified By:

12. Audit Trail
o	Screenshots: Yes / No
o	Logs Captured: Yes / No
o	Approval Records Stored: Yes / No

# Access Request Template

> **Purpose:** This form is used to document and standardize all logical and physical access provisioning, modification, and de-provisioning (revocation) requests across organizational systems and assets.

---

## 1. Request Metadata

| Attribute | Details |
| --- | --- |
| **Request ID** | `[Auto-generated / Unique Ref]` |
| **Request Date** | `[YYYY-MM-DD]` |
| **Request Type** | `[ ] New Access Provisioning`<br>

<br>`[ ] Access Modification`<br>

<br>`[ ] Access Revocation (De-provisioning)`<br>

<br>`[ ] Temporary Access` |
| **Priority Level** | `[ ] Standard` `[ ] Urgent` `[ ] Emergency` |

---

## 2. User & Target Information

| Field | Details |
| --- | --- |
| **Full Name** | `[Employee / Contractor Name]` |
| **Employee/Worker ID** | `[ID Number]` |
| **Job Title** | `[Designation / Role]` |
| **Department** | `[Department / Business Unit]` |
| **Email Address** | `[corporate.email@organization.com]` |
| **Contact Number** | `[Phone / Extension]` |
| **Employment Type** | `[ ] Full-Time` `[ ] Part-Time` `[ ] Contractor` `[ ] Third-Party / Vendor` |
| **Manager Name** | `[Direct Manager Name]` |

---

## 3. Access Scope & Specification

| Application / System / Asset Name | Access Type Action | Roles / Permissions Requested | Expiration Date (If Temporary) |
| --- | --- | --- | --- |
| *e.g., Active Directory / Domain* | `[ ] Add [ ] Remove` | *e.g., Standard Domain User, VPN Group* | `[YYYY-MM-DD]` |
| *e.g., AWS Cloud Portal* | `[ ] Add [ ] Remove` | *e.g., ReadOnlyAccess - Production* | `[YYYY-MM-DD]` |
| *e.g., Enterprise ERP* | `[ ] Add [ ] Remove` | *e.g., Finance - AP Module* | `[YYYY-MM-DD]` |
| *e.g., Building Physical Access* | `[ ] Add [ ] Remove` | *e.g., Keycard Access - Server Room* | `[YYYY-MM-DD]` |

---

## 4. Business Justification & Duration

* **Business Justification:**
`[Provide a detailed narrative explaining why this access is required for job duties or why access is being revoked]`
* **Access Duration:**
* **Effective Start Date:** `[YYYY-MM-DD]`
* **Effective End Date (if applicable):** `[YYYY-MM-DD]` *(Leave blank if permanent)*



---

## 5. Authorization & Approvals

### Requestor Details

* **Requested By Name:** `[Name]`
* **Designation / Title:** `[Title]`
* **Date:** `[YYYY-MM-DD]`
* **Digital Signature / Ref:** `______________________`

### Department Head / Manager Approval

* **Approved By Name:** `[Manager Name]`
* **Designation / Title:** `[Title]`
* **Date:** `[YYYY-MM-DD]`
* **Approval Status:** `[ ] Approved` `[ ] Rejected`
* **Digital Signature / Ref:** `______________________`

### System Owner / Security Administrator Approval *(If Required)*

* **Approved By Name:** `[IT/Security Lead Name]`
* **Designation / Title:** `[Title]`
* **Date:** `[YYYY-MM-DD]`
* **Approval Status:** `[ ] Approved` `[ ] Rejected`
* **Digital Signature / Ref:** `______________________`

---

## 6. IT / System Administration Execution *(Internal Use Only)*

| Execution Checklist Item | Handled By (Name) | Completion Date | Verification Status |
| --- | --- | --- | --- |
| **Access Provisioned / Revoked** | `[Admin Name]` | `[YYYY-MM-DD]` | `[ ] Completed` |
| **Privileges Verified (Least Privilege)** | `[Admin Name]` | `[YYYY-MM-DD]` | `[ ] Verified` |
| **Ticket / System Audit Log ID** | `[Ticket Ref #]` | `[YYYY-MM-DD]` | `[ ] Logged` |

---

*Confidentiality Notice: This document contains sensitive internal access information. Unauthorized distribution, copying, or disclosure is strictly prohibited.*