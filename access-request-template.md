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