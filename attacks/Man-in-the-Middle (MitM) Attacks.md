Man-in-the-Middle (MitM) Attacks
Intercepting and manipulating Azure service communication or user connections to steal data or credentials.  
Azure Context: Risks in unencrypted API calls, misconfigured VPNs, or exposed endpoints.  
Mitigation:
Enforce TLS/SSL encryption on all Azure endpoints (App Services, APIs).
Use Azure Private Link and VPN Gateway to secure network traffic.
Employ mutual authentication (certificates) where applicable.
Regularly update certificates and network device firmware.



**4. Man-in-the-Middle (MitM)**

Intercepts traffic between clients and Azure services (e.g., stealing
Azure AD tokens via fake VPNs or rogue Wi-Fi).

**Mitigation:** Enforce TLS/HTTPS, Conditional Access, and certificate
pinning.



## MITM Attack

* **Explain MITM attack and how to prevent it?** A MITM(Man-in-the-Middle) attack is a type of attack where the hacker places himself in between the communication of two parties and steal the information. Suppose there are two parties A and B having a communication. Then the hacker joins this communication. He impersonates as party B to A and impersonates as party A in front of B. The data from both the parties are sent to the hacker and the hacker redirects the data to the destination party after stealing the data required. While the two parties think that they are communicating with each other they are communicating with the hacker. You can prevent MITM attack by using the following practices: Use VPN, Use strong WEP/WPA encryption, Use Intrusion Detection Systems, Force HTTPS, Public Key Pair Based Authentication.
* **What is MITM attack?** A MITM or Man-in-the-Middle is a type of attack where an attacker intercepts communication between two persons. The main intention of MITM is to access confidential information.
* How to prevent the Man-in-the-Middle attack? 🡪 Recommended to use VPN or Tunnelling to prevent unauthorized interception of communication. This will prevent the manipulation of data sent between the two parties. Data encryption in transit.
* **How to prevent Man-in-the-Middle Attack?** 🡪 The following practices prevent the ‘Man-in-the-Middle Attacks’: Have a stronger WAP/WEP Encryption on wireless access points avoids unauthorized users. Use a VPN for a secure environment to protect sensitive information. It uses key-based encryption. Public key pair-based authentication must be used in various layers of a stack for ensuring whether you are communicating the right things are not. HTTPS must be employed for securely communicating over HTTP through the public-private key exchange.



