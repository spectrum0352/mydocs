# Risk-Based Vulnerability Prioritization Framework

**Document Type:** Enterprise Security Standard  
**Domain:** Vulnerability Management  
**Version:** 1.0  
**Owner:** Security Architecture / Vulnerability Management Team

---

# 1. Purpose

This framework defines the organization's **risk-based methodology** for prioritizing vulnerabilities for remediation.

Rather than relying solely on CVSS severity, the framework incorporates exploitability, threat intelligence, business context, and exposure to ensure remediation efforts focus on vulnerabilities that present the greatest risk to the organization.

The framework enables consistent, repeatable, and auditable prioritization decisions aligned with enterprise risk management objectives.

---

# 2. Objectives

The framework aims to:

- Prioritize vulnerabilities based on actual organizational risk.
- Reduce exposure to actively exploited vulnerabilities.
- Improve remediation efficiency.
- Support risk-based SLA enforcement.
- Align remediation activities with business priorities.
- Enable automated prioritization across vulnerability management platforms.

---

# 3. Risk Prioritization Principles

Vulnerabilities shall **not** be prioritized solely on CVSS severity.

Each vulnerability shall be evaluated using multiple risk factors, including:

- Technical Severity (CVSS)
- Exploit Probability (EPSS)
- Known Exploited Vulnerability (KEV) status
- Threat Intelligence
- Asset Criticality
- Business Impact
- Exposure Level
- Available Compensating Controls
- Patch Availability

---

# 4. Risk Assessment Factors

## 4.1 Technical Severity (CVSS)

CVSS provides the baseline technical severity of a vulnerability.

### Purpose

- Measure technical impact
- Standardize vulnerability severity
- Enable consistent comparison

### Limitations

CVSS alone does not consider:

- Active exploitation
- Business importance
- Internet exposure
- Threat actor interest

CVSS shall always be considered but shall **never be the sole factor** for remediation priority.

---

## 4.2 Exploit Prediction (EPSS)

The Exploit Prediction Scoring System (EPSS) estimates the likelihood that a vulnerability will be exploited in the near future.

### Interpretation

| EPSS Score | Interpretation |
|------------|----------------|
| > 0.90 | Extremely likely to be exploited |
| 0.70–0.90 | High likelihood |
| 0.30–0.69 | Moderate likelihood |
| < 0.30 | Lower likelihood |

High EPSS values should increase remediation priority.

---

## 4.3 Threat Intelligence

Threat intelligence provides real-world context regarding vulnerability exploitation.

### Intelligence Sources

- CISA Known Exploited Vulnerabilities (KEV)
- Microsoft Threat Intelligence
- Vendor advisories
- Commercial threat intelligence platforms
- Open-source intelligence

### Indicators

| Indicator | Priority Impact |
|-----------|-----------------|
| Listed in CISA KEV | Critical |
| Active ransomware exploitation | Critical |
| Active exploitation observed | Critical |
| Weaponized exploit available | High |
| Public proof-of-concept | Medium |
| No known exploitation | Low |

---

## 4.4 Asset Criticality

Asset criticality measures the business importance of the affected system.

| Classification | Description |
|---------------|-------------|
| Critical | Identity systems, production workloads, payment systems, domain controllers, crown jewels |
| High | Business-critical applications |
| Medium | Internal production systems |
| Low | Development, testing, laboratory systems |

Asset classification should be maintained through the enterprise CMDB.

---

## 4.5 Business Impact

Business impact considers the consequences of compromise.

Factors include:

- Revenue impact
- Customer impact
- Regulatory impact
- Safety impact
- Operational disruption
- Data sensitivity

Business impact may increase remediation priority even when technical severity is moderate.

---

## 4.6 Exposure Level

Exposure determines how accessible the vulnerable asset is to attackers.

| Exposure | Description |
|----------|-------------|
| Internet-facing | Publicly accessible |
| Partner / Extranet | Accessible by trusted third parties |
| Internal Production | Accessible only within enterprise |
| Restricted Network | Segmented administrative network |
| Isolated | No external connectivity |

Internet-facing systems should receive higher remediation priority.

---

## 4.7 Compensating Controls

Existing security controls may temporarily reduce organizational risk.

Examples include:

- Web Application Firewall (WAF)
- Endpoint Detection and Response (EDR)
- Network segmentation
- IPS/IDS protection
- Application allowlisting
- Privileged Access Management
- Multi-Factor Authentication

Compensating controls do **not eliminate vulnerabilities**, but they may reduce remediation urgency until permanent remediation is implemented.

---

## 4.8 Patch Availability

The remediation strategy depends on whether an official fix exists.

| Status | Required Action |
|---------|----------------|
| Patch available | Patch within SLA |
| Temporary mitigation available | Apply mitigation immediately |
| No vendor patch | Apply compensating controls and monitor |
| Zero-day | Emergency response process |

---

# 5. Composite Risk Score

Organizations may calculate an overall Composite Risk Score (CRS) using weighted risk factors.

### Example Formula

```
CRS =
(CVSS × 25%)
+ (EPSS × 20%)
+ (Threat Intelligence × 20%)
+ (Asset Criticality × 20%)
+ (Exposure × 10%)
+ (Business Impact × 5%)
```

Organizations may adjust weighting to align with their risk appetite.

---

# 6. Mandatory Priority Overrides

Certain conditions shall automatically elevate remediation priority regardless of the calculated Composite Risk Score.

Examples include:

- Listed in CISA KEV
- Active exploitation observed
- Internet-facing Domain Controllers
- Internet-facing VPN appliances
- Internet-facing firewalls
- Identity infrastructure
- Critical cloud management services
- Ransomware exploitation
- Privilege escalation vulnerabilities affecting Tier-0 assets

These vulnerabilities shall be treated as **Critical**.

---

# 7. Risk Classification

| Composite Risk Score | Risk Level | Required Action |
|---------------------|------------|-----------------|
| ≥ 8.5 | Critical | Immediate remediation |
| 7.0–8.4 | High | Priority remediation |
| 5.0–6.9 | Medium | Planned remediation |
| < 5.0 | Low | Routine remediation |

Risk classification may be overridden by the Mandatory Priority Override rules.

---

# 8. Risk-Based Remediation Decision Matrix

| CVSS | EPSS | KEV | Asset | Exposure | Priority |
|------|------|-----|--------|----------|----------|
| High | High | Yes | Critical | Internet | Critical |
| High | Low | No | Low | Internal | Medium |
| Medium | High | Yes | Critical | Internet | Critical |
| Medium | High | No | Critical | Internet | High |
| Low | High | Yes | Critical | Internet | High |
| Critical | Low | No | Low | Internal | Medium |

This matrix illustrates that remediation priority depends on overall organizational risk rather than CVSS alone.

---

# 9. Automation Requirements

The vulnerability management platform should automatically enrich vulnerabilities with:

- CVSS
- EPSS
- CISA KEV status
- Threat intelligence
- Asset criticality
- CMDB ownership
- Internet exposure
- Business tags
- Patch availability

Risk scores should be recalculated automatically whenever threat intelligence or asset context changes.

---

# 10. Governance

The risk prioritization model shall be reviewed:

- Quarterly
- Following major security incidents
- Following significant threat landscape changes
- When introducing new business-critical systems

Validation should compare predicted priority with actual incident data to continuously improve the scoring model.

---

# 11. Compliance Alignment

This framework aligns with:

- NIST Cybersecurity Framework (CSF)
- NIST SP 800-53 (RA-5, SI-2)
- NIST SP 800-40
- ISO/IEC 27001
- CIS Controls v8
- PCI DSS v4.0
- Microsoft Security Best Practices

---

# 12. Expected Outcomes

Implementation of this framework will:

- Focus remediation on vulnerabilities that present the greatest business risk.
- Reduce remediation effort spent on low-risk findings.
- Improve SLA compliance.
- Support threat-informed vulnerability management.
- Enable consistent enterprise-wide prioritization.
- Improve executive visibility into cyber risk.