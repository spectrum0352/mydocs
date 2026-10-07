# Key Management Procedures

Document Type: Operational Runbook
Audience: Security Engineering, Cloud Ops, DevOps, SOC
Owner: Security Operations
Version: 1.0

## 1. Purpose

This runbook provides step-by-step operational procedures for secure handling of cryptographic keys across their lifecycle, ensuring:
• Consistent execution
• Rapid incident response
• Audit readiness
• Compliance with ISO 27001, NIST, PCI DSS

## 2. Prerequisites

Before executing any procedure:
• Access to Key Management System (KMS) or HSM
• Role-based access approval (RBAC)
• MFA enabled
• Ticket/Change Request (CR) raised and approved
• Logging and monitoring enabled

## 3. 🔑 Key Generation Procedure

Objective:
Securely generate cryptographic keys using approved standards.
Steps:

1. Raise Request
o Create ticket with:
 Business justification
 Key type (AES, RSA, etc.)
 Usage (encryption, signing, API, etc.)
2. Validate Request
o Security team verifies:
 Algorithm compliance (AES-256, RSA-2048+)
 Data classification
 Key usage scope
3. Access KMS/HSM
o Authenticate with MFA
o Use privileged access (JIT if applicable)
4. Generate Key
o Select:
 Key type (symmetric/asymmetric)
 Key size
 Expiry/rotation policy
o Generate key within KMS/HSM (never locally)
5. Apply Metadata
o Owner
o Application/System
o Environment (Prod/Non-Prod)
o Expiry date
o Classification
6. Store Key Securely
o Ensure key is:
 Non-exportable (if possible)
 Stored in HSM/KMS
7. Grant Access
o Assign RBAC roles to:
 Applications
 Services
 Users
8. Log & Validate
o Verify audit logs
o Confirm key usability

## 4. 🔁 Key Rotation Procedure

Objective:
Replace keys periodically or upon risk triggers.
Triggers:
• Scheduled rotation
• Suspected compromise
• Employee exit
• Regulatory requirement

Steps:

1. Identify Key
o Retrieve key ID, usage, dependencies
2. Impact Analysis
o Identify:
 Applications using key
 APIs, services, integrations
3. Generate New Key Version
o Create new key in KMS/HSM
o Maintain versioning
4. Update Applications
o Update configurations:
 Environment variables
 Secrets manager references
o Use dual-key approach (old + new during transition)
5. Test Functionality
o Validate encryption/decryption
o Confirm no service disruption
6. Deactivate Old Key
o Disable old key usage
o Monitor for failures
7. Delete Old Key (if applicable)
o After validation period (e.g., 7–30 days)
8. Log & Close
o Document rotation
o Update inventory

## 5. 🚨 Emergency Key Revocation Procedure

Objective:
Immediately revoke keys in case of compromise.
Triggers:
• Security incident
• Key leakage
• Unauthorized access detected
Steps:

1. Declare Incident
o Raise P1 security incident ticket
o Notify SOC & Security Engineering
2. Identify Affected Key(s)
o Key ID
o Associated systems
3. Immediate Revocation
o Disable key in KMS/HSM
o Block all access
4. Revoke Access
o Remove RBAC permissions
o Disable related credentials
5. Generate Replacement Key
o Follow Key Generation Procedure
6. Update Systems
o Replace compromised key
o Restart/redeploy services if required
7. Monitor Systems
o Check logs for:
 Unauthorized attempts
 Failures
8. Forensic Analysis
o Determine:
 Root cause
 Scope of exposure
9. Report & Document
o Incident report
o Lessons learned

## 6. ⚠️ Handling Compromised Keys

Objective:
Contain and remediate key compromise effectively.
Steps:

1. Detection
o Alerts from SIEM (e.g., unusual access patterns)
o Developer/security report
2. Containment
o Immediately revoke key
o Isolate affected systems
3. Impact Assessment
o Identify:
 Data exposure
 Systems impacted
 Duration of compromise
4. Replace Key
o Generate new key
o Update all dependent services
5. Re-encrypt Data
o Re-encrypt sensitive data using new key
6. Credential Hygiene
o Rotate:
 API keys
 Secrets
 Tokens
7. Strengthen Controls
o Enforce stricter RBAC
o Enable additional monitoring
8. Audit & Documentation
o Maintain evidence for compliance
o Update risk register

## 7. 🔐 Access Control Procedures

Objective:
Ensure only authorized entities can access cryptographic keys.
Steps:

1. Access Request
o Submit request with:
 Business need
 Duration
 Role
2. Approval Workflow
o Manager approval
o Security team approval
3. Grant Access
o Assign role in KMS:
 Reader / Crypto User / Admin
4. Enforce Security Controls
o MFA mandatory
o Conditional access (IP/device restrictions)
o JIT access (time-bound)
5. Validation
o Test access permissions
o Ensure least privilege
6. Monitoring
o Log all access attempts
o Alert on anomalies
7. Periodic Review
o Quarterly access review
o Remove unused access
8. Access Revocation
o Triggered by:
 Role change
 Employee exit
o Remove access immediately

## 8. 🔁 Backup & Recovery Procedure (Operational)

Backup Steps:

1. Initiate backup from KMS/HSM
2. Encrypt backup using separate key
3. Store in secure/offline vault
4. Record backup metadata

Recovery Steps:

1. Raise recovery request
2. Validate approval
3. Restore key securely
4. Test functionality
5. Log recovery event

## 9. 📊 Logging & Monitoring Checklist

• ✅ Key creation events logged
• ✅ Access logs enabled
• ✅ Rotation activities tracked
• ✅ Revocation events recorded
• ✅ Integrated with SIEM (e.g., Sentinel)

## 10. ⏱️ SLA / Response Time

Activity SLA
Key generation ≤ 24 hours
Key rotation (planned) ≤ 72 hours
Emergency revocation ≤ 15 minutes
Compromise response Immediate (P1)

## 11. 🔍 Audit Readiness Checklist

• ✅ Key inventory maintained
• ✅ Rotation logs available
• ✅ Access control enforced
• ✅ Incident records documented
• ✅ Backup & recovery tested

## 12. 🔗 Integration Points

• Cloud KMS (Azure Key Vault, AWS KMS, GCP KMS)
• SIEM (Microsoft Sentinel)
• IAM systems (Azure AD / Entra ID)
• DevOps pipelines (CI/CD secrets integration)

## 13. Key Risks Mitigated

• Unauthorized key access
• Key leakage
• Weak rotation practices
• Data exposure due to compromised keys
• Non-compliance risks

If you want next-level maturity, I can also create:
• 🔐 Automated Key Rotation Architecture (DevSecOps integrated)
• 📊 Key Inventory Dashboard (Excel / SIEM model)
• 🏗️ Azure Key Vault / AWS KMS step-by-step implementation guide
• 🧩 Integration with Zero Trust architecture
