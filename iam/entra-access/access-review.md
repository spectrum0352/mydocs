# **Access Reviews**

Access reviews help ensure that only the appropriate users retain access to resources such as groups, applications, and roles. They are a critical control for enforcing least privilege and maintaining security posture.

---

### **1️⃣ Plan Access Reviews**

* **Define scope**
  Identify what needs to be reviewed:

  * User access to groups
  * Application access
  * Directory roles (e.g., administrative roles)

* **Identify reviewers**
  Assign responsible reviewers such as:

  * Managers
  * Resource owners
  * Security or identity administrators

* **Set review frequency**
  Determine how often reviews should occur:

  * One-time reviews
  * Recurring reviews (e.g., quarterly, semi-annually)

---

### **2️⃣ Implement Access Reviews**

* **Create access reviews in Microsoft Entra ID (Azure AD)**
  Configure reviews by:

  * Selecting the target group, application, or role
  * Assigning reviewers
  * Defining duration and deadlines
  * Configuring rules (e.g., auto-remove access if no response)

* **Types of access reviews**

  * Microsoft 365 groups
  * Enterprise applications with user assignments
  * Privileged roles using Privileged Identity Management (PIM)

---

### **3️⃣ Manage Access Reviews**

* **Establish Access Review Programs (for large organizations)**

  * Group reviews by department, business unit, or risk category
  * Standardize configurations (frequency, reviewers, automation rules)
  * Ensure consistent governance across environments

---

### **4️⃣ Monitor Access Review Activity**

* Use the Access Reviews dashboard in Microsoft Entra to track:

  * Active and completed reviews
  * Reviewer participation and completion rates
  * Access decisions (approved, denied, auto-processed)

* Analyze trends to identify:

  * Excessive or stale access
  * Reviewer delays or gaps
  * High-risk access patterns

---

### **5️⃣ Respond to Access Review Outcomes**

* **Manual actions**

  * Reviewers approve or deny access based on business need

* **Automated actions**

  * Automatically remove users who:

    * Do not respond
    * Are denied access

* **Post-review actions**

  * Remove unnecessary or excessive access
  * Notify users and stakeholders of changes
  * Feed results into audit and compliance processes

---

## **✅ Key Best Practices**

* 🔁 Schedule regular reviews (e.g., quarterly for most access, more frequent for privileged roles)
* 👨‍💼 Assign managers or resource owners as reviewers for better accountability
* ⚙️ Enable auto-apply results to reduce manual overhead
* 🔒 Prioritize high-risk areas (privileged roles, sensitive applications, critical data access)
* 📊 Continuously monitor metrics and trends to improve review effectiveness
* 🧠 Integrate access reviews with identity governance and zero trust strategy

---

## **📌 Access Review Lifecycle (Summary)**

**Plan → Implement → Manage → Monitor → Respond**

* Plan access review scope and strategy
* Create and configure reviews for groups, apps, and roles
* Organize and standardize via review programs
* Monitor review activity and insights
* Respond with manual and automated remediation actions

---

If you want, I can align this specifically with **Microsoft Entra ID governance architecture**, **Zero Trust**, or **SOC operations workflows**.
