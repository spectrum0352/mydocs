**4. CyberArk (Privileged Access Management - PAM)**

Penetration testing CyberArk involves attempting to extract "crown jewel" credentials and bypassing the "Isolated Session" model.

- **Vault & Component Reconnaissance:** Map the CyberArk architecture, including the Vault, PVWA (Password Vault Web Access), CPM (Central Policy Manager), and PSM (Privileged Session Manager).

- **Privileged Account Logic:** Attempt to "check out" credentials without proper justification or ticketing system integration. Test the "Dual Control" mechanism for bypasses.

- **PSM Session Escape:** While inside a PSM-proxied session (RDP/SSH), attempt to "break out" of the isolated window to gain access to the underlying PSM server or the local file system.

- **Secret Management Testing (Conjur/AAM):** For DevOps environments, test how applications retrieve secrets. Attempt to steal "Host Identities" or API keys used by non-human identities.

- **Communication & Storage Security:** Analyze the encryption of data-at-rest in the Vault and the security of the private network tunnel between CyberArk components.
