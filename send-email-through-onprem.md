
Scenario-2: If there is application is in Microsoft Azure VM, email server is in On-premises, there is Expressroute between on-premises and azure cloud, now applications want to send email through on Prem email servers to users, how will you ensure communication uses TLS1.2 encryption?

Here are the steps to ensure communication uses TLS 1.2 encryption when an application in a Microsoft Azure VM sends email through on-premises email servers with an ExpressRoute connection:

> **1. Enable TLS 1.2 on the Azure VM:** Use Group Policy Objects (GPOs) or registry edits to enable TLS 1.2 for Schannel on the Azure VM.
>
> **2. Enable TLS 1.2 on the on-premises email server:** The specific steps will vary depending on your email server software. Consult your server's documentation for enabling TLS 1.2.
>
> **3. (Optional) Disable insecure TLS versions on both the Azure VM and email server:** Disabling older, insecure TLS versions (e.g., TLS 1.0, TLS 1.1) can further enhance security. Refer to your Azure VM and email server documentation for guidance.
>
> **4. Test email communication:** After making these changes, test email functionality to ensure successful communication with TLS 1.2 encryption.
