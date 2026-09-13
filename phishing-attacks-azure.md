
## Phishing Attacks in Azure

**Types:**

- Email Phishing
- Spear Phishing
- Vishing
- Smishing

**Azure Security Solutions:**

- Use **Microsoft Defender for Office 365** for email filtering and anti-phishing protection.
- Deploy **Office 365 ATP Safe Links and Safe Attachments**.
- Train users with **Microsoft Security Awareness Training**.
- Enforce **DMARC, SPF, and DKIM** for domain email authentication.

**Detection (Microsoft Sentinel):**

- Analyze Exchange Online logs for phishing indicators.
- Correlate with threat intelligence feeds and user behavior analytics.

**Mitigation:**

- Enable advanced email threat protection in Microsoft Defender.
- Conduct regular phishing awareness campaigns.
- Use DMARC to prevent email spoofing of your Azure tenant domains.

**Example:**

- Phishing emails impersonate Azure tenant administrators to steal credentials.