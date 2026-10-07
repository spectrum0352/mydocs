# Microsoft Defender XDR - First-Time Configuration Guide

## Microsoft Defender Portal

**Portal URL:**

https://security.microsoft.com/

## Prerequisites

Required role:

- Global Administrator
- Security Administrator

---

# Initial Tenant Configuration

During the initial setup, configure the tenant-wide settings before onboarding devices.

Navigate to:

```
Settings
└── Endpoints
    └── General
        └── Data Retention
```

## Data Storage Location

Choose the geographic location where Microsoft Defender for Endpoint stores telemetry data.

Available regions include:

- United States (US)
- United Kingdom (UK)
- European Union (EU)

> **Important**
>
> The data storage location **can only be selected during the initial configuration**. After the first-time setup is complete, the storage location **cannot be changed or migrated**.

---

## Data Retention

Default endpoint telemetry retention:

- **180 days (6 months)**

Depending on your Microsoft licensing, longer retention periods may be available.

---

# Configure Notifications

After completing the initial tenant setup, configure:

- Alert notifications
- Email notifications
- Scheduled reports
- Incident notifications

These settings ensure administrators receive timely security alerts and investigation updates.

---

# Microsoft Defender for Endpoint Advanced Features

Navigate to:

```
Settings
└── Endpoints
    └── Advanced Features
```

Enable the advanced capabilities in the following recommended order.

---

# Recommended Configuration Order

1. Endpoint Detection and Response (EDR)
2. Microsoft Defender Vulnerability Management
3. Next-Generation Protection (NGP)
4. Attack Surface Reduction (ASR)
5. Automated Investigation and Remediation (AIR)
6. Microsoft Defender Experts (if licensed)

---

# Advanced Feature Configuration

## 1. Automated Investigation and Remediation

Enable:

- Automated Investigation
- Automated Remediation

> **Recommendation**
>
> Enable Automated Investigation before enabling Live Response.

---

## 2. Live Response

Enable **Live Response** to allow security analysts to:

- Connect remotely to devices
- Collect forensic artifacts
- Execute approved commands
- Perform remediation actions

---

## 3. Potentially Unwanted Application (PUA) Protection

Enable PUA Protection to detect and block:

- Adware
- Bundled software
- Browser toolbars
- Cryptocurrency miners
- Other potentially unwanted applications

---

## 4. Endpoint Detection and Response (EDR) in Block Mode

Enable **EDR in Block Mode**.

Benefits:

- Provides additional protection when Microsoft Defender Antivirus is running in Passive Mode.
- Detects and blocks post-breach threats.
- Works alongside third-party antivirus products.

---

## 5. Automatic Alert Resolution

Enable:

- Auto-resolve remediated alerts

This automatically closes alerts after successful remediation, reducing analyst workload.

---

## 6. File Blocking

Enable File Blocking to prevent malicious files from:

- Being executed
- Being opened
- Being written to disk

**Requirements**

- Microsoft Defender Antivirus
- Cloud-delivered protection enabled

File indicators can be configured from:

```
Microsoft Defender Portal
→ Indicators
→ Files
```

---

## 7. Custom Network Indicators

Configure custom indicators to:

- Allow or block IP addresses
- Allow or block Domains
- Allow or block URLs

Useful for:

- Threat intelligence
- Blocking known malicious infrastructure
- Allowlisting trusted resources

---

## 8. Tamper Protection

Enable **Tamper Protection**.

This prevents unauthorized users or malware from modifying Microsoft Defender security settings.

---

## 9. User Information

Enable:

- Show user details

This displays Microsoft Entra ID user information during investigations to improve incident analysis.

---

# Integrations

Enable integrations with other Microsoft security products.

## Microsoft Defender for Identity

Provides identity-based attack detection.

---

## Microsoft Defender for Office 365

Shares email and collaboration threat intelligence.

---

## Microsoft Defender for Cloud Apps

Provides visibility into SaaS applications and cloud activity.

---

## Microsoft Intune

Enables:

- Device compliance
- Security policy deployment
- Endpoint management

---

## Microsoft Defender Experts

Enable Targeted Attack Notifications if your organization has a Defender Experts subscription.

---

# Additional Security Features

## Web Content Filtering

Configure policies to:

- Block unwanted websites
- Restrict inappropriate categories
- Monitor web activity

---

## Microsoft Purview Integration

Enable sharing of endpoint alerts with:

- Microsoft Purview Compliance Portal

---

## Conditional Access Integration

Integrate endpoint risk with Microsoft Entra Conditional Access policies.

This allows access decisions based on device risk.

---

## Device Discovery

Enable Device Discovery to identify unmanaged devices connected to the network.

---

## Download Quarantined Files

Allow authorized administrators to download quarantined files for malware analysis.

---

# Investigation Settings

Configure automated investigation actions such as:

- Run antivirus scan
- Collect investigation package
- Collect diagnostic logs
- Isolate device (when required)

---

# Device Tag Management

Configure device tags for:

- Business units
- Environment
- Criticality
- Geographic location
- Device ownership

Device tags simplify filtering, reporting, and policy targeting.

---

# Alert Suppression

Configure suppression rules to reduce known false positives and prevent unnecessary alert noise.

---

# Automation Exclusions

Configure exclusions for:

- Files
- Folders
- Processes

Only create exclusions after proper security validation.

---

# Email Notifications

Configure notifications for:

- New alerts
- High-severity incidents
- Investigation completion
- Malware detections
- Device isolation events

---

# Endpoint Security Management

If using Microsoft Intune, enable Endpoint Security Management to centrally manage:

- Antivirus policies
- Firewall policies
- Attack Surface Reduction rules
- Disk encryption
- Endpoint detection settings
- Security baselines

---

# Recommended Best Practices

- Configure the data storage location before onboarding devices.
- Enable Tamper Protection on all managed devices.
- Enable EDR in Block Mode, even when using a third-party antivirus.
- Configure Web Content Filtering and Custom Network Indicators.
- Integrate Defender with Microsoft Intune, Defender for Identity, Defender for Office 365, Defender for Cloud Apps, and Microsoft Purview.
- Enable Automated Investigation and Remediation to reduce analyst workload.
- Configure alert notifications and scheduled reports.
- Review advanced feature settings regularly as Microsoft introduces new capabilities.
- Test all policies in audit mode before enforcing them across production devices.