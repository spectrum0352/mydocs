
**3. SailPoint (Identity Governance & Administration - IGA)**

Testing SailPoint (IdentityIQ or IdentityNow) focuses on the integrity of identity lifecycles and "Joiner-Mover-Leaver" processes.

- **Identity Governance & Policy Testing:** Attempt to violate **Separation of Duties (SoD)** policies. Check if the system allows a single user to hold conflicting roles that should be prohibited.

- **Workflow & Approval Logic:** Intercept and manipulate "Access Request" traffic. Attempt to self-approve requests or bypass manual intervention points via parameter tampering.

- **Provisioning & Data Exposure:** Verify if sensitive attributes (SSNs, cleartext passwords) are exposed in the UI or during the transmission of identity data to target systems.

- **API & Connector Security:** Test the security of "Connectors" that link SailPoint to downstream apps. Ensure that the service accounts used for provisioning are not over-privileged on the target systems.

 
