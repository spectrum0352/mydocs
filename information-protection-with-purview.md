# Information protection with Purview

Enforcing Information Protection with Microsoft Defender for Cloud Apps & Why It Is Hard to Monitor Cloud Traffic from the Network

🔐 Enforcing Information Protection with Microsoft Defender for Cloud Apps
Image

Image

Image

Image

1️⃣ Connect Company Applications to Microsoft Defender for Cloud Apps (MDCA)
Goal: Gain visibility and control over SaaS, PaaS, and some IaaS applications.

Microsoft Defender for Cloud Apps is part of Microsoft Defender for Cloud Apps and integrates deeply with Microsoft 365 and third-party SaaS apps.

Step-by-step:
A. Discover Shadow IT
Integrate firewall/proxy logs (e.g., Palo Alto, Zscaler, Fortinet).

Upload logs manually or use continuous log collectors.

Review discovered apps (risk score, compliance, data handling).

Sanction or unsanction apps.

B. Connect Sanctioned Applications (App Connectors)
Connect via API to:

Microsoft 365

Salesforce

Box

ServiceNow

Google Workspace

Configuration Steps:

Go to Settings → Cloud Apps → App Connectors

Click + Connect an app

Authenticate using global admin account

Grant required API permissions

Enable continuous scanning

This provides:

File scanning

User activity visibility

Threat detection

Governance actions (quarantine, revoke sharing, remove access)

2️⃣ Classify Sensitive Information via MDCA
Goal: Identify and protect sensitive data across connected apps.

MDCA integrates with Microsoft Purview sensitivity labels.

A. Create Sensitivity Labels
Inside Microsoft Purview:

Define labels (Public, Internal, Confidential, Highly Confidential)

Configure:

Encryption

Watermarking

Access restrictions

Auto-labeling rules

B. Create File Policies in MDCA
Navigate to:

Control → Policies → Create Policy → File Policy

Examples:

Detect credit card numbers (PCI)

Detect Aadhaar numbers (India-specific PII)

Detect source code files

Detect "Confidential" labeled documents shared externally

Governance Actions:

Remove external sharing

Quarantine file

Apply sensitivity label

Notify user

Suspend user account

3️⃣ Enable Real-Time Protection (Session Control)
Integrate with:

Microsoft Entra ID (formerly Azure AD)

Steps:

Configure Conditional Access Policy

Select "Use Conditional Access App Control"

Route session through MDCA proxy

Now you can:

Block download of sensitive files on unmanaged devices

Monitor risky sessions

Prevent copy/paste

Apply real-time DLP

4️⃣ Enable Threat Detection Policies
Use built-in anomaly detection:

Impossible travel

Mass download

Suspicious OAuth apps

Ransomware behavior

Integrates with:

Microsoft Defender XDR

5️⃣ Continuous Monitoring & Governance
Best practices:

Weekly review of discovered apps

Monthly policy effectiveness review

Quarterly data exposure assessment

Automate incident response via Logic Apps

🌐 Why It Is Hard to Monitor Cloud Traffic from the Network
📊 Cloud Traffic Visibility Challenges
Image

Image

Image

Image

Even though workloads move to IaaS platforms like:

Microsoft Azure

Amazon Web Services

Google Cloud Platform

Monitoring does NOT disappear — it becomes harder.

🔍 Key Reasons Monitoring Cloud Traffic is Difficult
1️⃣ No Physical Network Access
In traditional data centers:

You had SPAN ports

Network taps

Packet capture devices

In cloud:

No access to underlying hardware

No direct packet mirroring (unless using specific cloud-native features)

2️⃣ East-West Traffic Explosion
Cloud-native apps use:

Microservices

Containers

Serverless

Traffic flows:

VM to VM

Pod to Pod

Service to service

This internal (east-west) traffic:

Never touches perimeter firewall

Hard to inspect centrally

3️⃣ Encryption Everywhere
Most traffic is:

HTTPS

TLS 1.2/1.3

Mutual TLS (mTLS)

Deep packet inspection becomes limited without:

TLS termination

Private key access

Inline proxies

4️⃣ Elastic & Ephemeral Workloads
Cloud resources:

Scale up/down automatically

Change IPs frequently

Spin up for minutes

Traditional IP-based monitoring fails.

5️⃣ Hybrid & Multi-Cloud Complexity
Traffic may flow between:

On-prem → Azure

Azure → AWS

AWS → SaaS apps

You now monitor:

VNet

VPC

VPN

ExpressRoute

Internet egress

Each provider logs differently.

6️⃣ Shared Responsibility Model Confusion
Cloud providers manage:

Physical network

Hypervisor layer

Customers manage:

Traffic between workloads

NSGs / Security Groups

Routing

Firewall rules

Many organizations wrongly assume network visibility is fully outsourced.

🛡 Why Cloud Network Monitoring Is Still Critical
Without monitoring, you miss:

Lateral movement

Data exfiltration

C2 communications

Crypto mining traffic

Performance bottlenecks

Shadow SaaS usage

✅ Modern Solution Approach
Instead of relying only on network taps:

Combine:
Cloud-native flow logs (NSG Flow Logs, VPC Flow Logs)

CASB (MDCA)

Endpoint telemetry

Identity monitoring

API-based SaaS visibility

XDR correlation

Move from network-centric visibility → identity + workload-centric visibility

🎯 Executive Summary (For Non-Technical Stakeholders)
Moving to cloud does NOT eliminate monitoring needs.

It removes physical visibility but increases complexity.

Data protection must be enforced at:

Identity layer

Application layer

API layer

Endpoint layer

Microsoft Defender for Cloud Apps helps classify and control sensitive data across SaaS platforms.

Network monitoring must shift to cloud-native logging and XDR-based correlation.

If you would like, I can also provide:

📊 End-to-end Cloud Monitoring Architecture Diagram

🔍 Cloud Data Exfiltration Attack Flow

🛡 MDCA Enterprise Deployment Blueprint

📋 100+ Point MDCA Implementation Checklist

Just tell me which one you need.

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

![alt text](image-6.png)

![alt text](image-7.png)

