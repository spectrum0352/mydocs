# Purview
## Insider Risk Management (IRM)

**IRM Roles:**
- **IRM Admin:** Policies/Settings, Analytics insights.
- **IRM Analyst:** Analytics insights, Investigate Alerts/Cases, Notice Templates.
- **IRM Investigator:** Investigate Alerts/Cases, Content Explorer, Notice Templates.
- **IRM Auditor:** View & export audit logs only.

**Escalating to Advanced eDiscovery:** Create a case in the IRM portal

**Data Loss Prevention (DLP) Roles:**

- **Compliance Data Administrator:** Manages DLP settings, device management, and reporting.
- **Communication Compliance Analyst:** Investigates policy matches and takes remediation actions on suspicious content.
- **Communication Compliance Viewer:** Has read-only access to communication compliance data.

Insider Risk Management (IRM) Roles:
- **IRM (All):** Full access to all IRM features.
- **IRM Admin:** Manages policies, settings, and analytics insights.
- **IRM Analyst:** Access to analytics insights, investigates alerts/cases, and manages notice templates.
- **IRM Investigator:** Investigates alerts/cases, uses Content Explorer, and manages notice templates.
- **IRM Auditor:** Can view and export audit logs only.

**Escalating IRM Alerts to Advanced eDiscovery:**

Before escalating an alert from the IRM portal to Advanced eDiscovery, we must **create a case** within the Insider Risk Management portal.

Microsoft Purview (Includes DLP and Insider Risk Management)

- Roles required to configure data loss prevention policy (DLP):
  - Compliance data administrator: it can manage settings related to DLP, device management and report.
  - Communication compliance analyst: Investigate when policy is matched and take remediation actions when suspicious content is detected.
  - Communication compliance viewer:

- Insider Risk management Role Group:
  - Insider risk management (IRM): All
  - IRM Admin: Policies/Settings, Analytics insights
  - IRM Analysts: Analytics insights, Investigate Alerts/Cases, Notice Templates,
  - IRM Investigators: Investigate Alerts/Cases, Content Explorer, Notice Templates
  - IRM Auditors: Only able to View & export audit logs

- Alert is triggered on IRM portal, now we need to escalate it to Advanced eDiscovery, but before escalating what step we need to do?
  --\> Create Case in Insider Risk Management portal.

- Employee sends email outside organization with sensitive information. Manager wants incident should be identified as Red Incident by Microsoft Defender XDR. What 2 action you will perform?
  - Edit name of incident
  - Add tag to the incident