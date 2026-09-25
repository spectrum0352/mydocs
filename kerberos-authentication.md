

If there is kerberos authentication method configured and some ports on AD domain control firewall ports are not opened. so, will it cause username/password wrong error?
Yes, Kerberos authentication issues due to firewall restrictions can cause username/password wrong errors. Here is why:

Kerberos Authentication Workflow:
1.	Client Request: When a user tries to access a resource using Kerberos, their device sends a request to the Kerberos Ticket Granting Service (TGS) on the domain controller (DC).
2.	Authentication Ticket Request: The TGS needs to verify the user's identity. It might need to communicate with another DC (Authentication Server - AS) for this purpose.
3.	Communication Channels: This communication between the client device, TGS, and potentially the AS relies on specific network ports being open on the domain controller firewall.

Impact of Blocked Ports:
•	If firewalls on the domain controllers block the ports required for Kerberos communication, the TGS might not be able to verify the user's identity.
•	This can lead to the user receiving a "username/password wrong" error, even though the credentials themselves might be correct.

Commonly Used Ports for Kerberos:
•	UDP 88 (Kerberos): Used for communication between the client and the KDC (TGS or AS).
•	TCP 135 (RPC): Used for communication between the TGS and the AS within the domain for user verification (might be used).

Resolving the Issue:
•	Verify Firewall Rules: Ensure that the domain controller firewall allows inbound traffic on the necessary ports (UDP 88 and potentially TCP 135).
•	Check Network Connectivity: Make sure there are no network connectivity issues between the client device and the domain controllers.
•	Review Kerberos Configuration: If firewalls are configured correctly, double-check the overall Kerberos configuration for any errors.

Additional Considerations:
•	While Kerberos is the preferred authentication method in Active Directory domains, some applications might still rely on NTLM (another authentication protocol). In such cases, blocked firewall ports for NTLM communication (TCP 135 and TCP 445) could also lead to authentication failures.

 

