### SIM Swapping

Attackers hijack a user's phone number to intercept SMS-based MFA codes,
potentially compromising Azure accounts relying on SMS 2FA.

**Azure-Specific Solutions:**

* Prefer **authenticator apps (Microsoft Authenticator)** or hardware security keys (FIDO2) over SMS for MFA in Azure AD.
* Implement **Conditional Access policies** to require stronger authentication methods.
* Educate users to secure mobile accounts with carrier PINs or biometric protections.



