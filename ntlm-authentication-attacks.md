# NTLM Authentication Attacks

> **Note:** Microsoft recommends using **Kerberos** as the default authentication protocol in Active Directory environments because it provides stronger security than NTLM. NTLM is retained primarily for backward compatibility with legacy systems and applications.

## What is NTLM?

**NT LAN Manager (NTLM)** is a challenge-response authentication protocol developed by Microsoft. Unlike Kerberos, NTLM does **not** use tickets. Instead, it authenticates users by proving knowledge of a password hash without transmitting the actual password over the network.

---

## NTLM Authentication Process

The following steps describe the NTLM authentication workflow:

1. **User Login**

   * The user enters their **username**, **password**, and **domain** on the client machine.

2. **Password Hash Generation**

   * The client computes a cryptographic hash of the user's password.
   * The plaintext password is discarded and is never sent across the network.

3. **Authentication Request**

   * The client sends the **username** (and authentication request) to the target server.

4. **Server Challenge**

   * The server generates a **16-byte random value (nonce)**, known as the **challenge**, and sends it to the client.

5. **Challenge Response**

   * The client encrypts (or signs) the challenge using the user's password hash.
   * The resulting value is called the **NTLM response** and is sent back to the server.

6. **Forwarding to the Domain Controller**

   * The server forwards the following information to the **Domain Controller (DC)**:

     * Username
     * Original challenge (nonce)
     * NTLM response received from the client

7. **Password Hash Retrieval**

   * The Domain Controller retrieves the user's password hash from the **Active Directory database** (or the **Security Account Manager (SAM)** database for local accounts).

8. **Response Verification**

   * The Domain Controller performs the same cryptographic operation on the original challenge using the stored password hash.
   * It compares the computed response with the client's response.

9. **Authentication Result**

   * If both responses match, authentication succeeds.
   * Otherwise, authentication fails.

---

## NTLM Authentication Flow

```text
User
 │
 │ Username + Password
 ▼
Client
 │
 │ Generate Password Hash
 │
 │ Username
 ▼
Server
 │
 │ 16-byte Random Challenge (Nonce)
 ▼
Client
 │
 │ Encrypt Challenge Using Password Hash
 │
 │ NTLM Response
 ▼
Server
 │
 │ Username + Challenge + Response
 ▼
Domain Controller
 │
 │ Retrieve Password Hash
 │ Compute Expected Response
 │ Compare Responses
 ▼
Authentication Success / Failure
```

---

## Important Notes

* **The user's plaintext password is never transmitted** across the network.
* NTLM relies on a **challenge-response** authentication mechanism.
* Password hashes can still be abused in attacks such as:

  * Pass-the-Hash (PtH)
  * NTLM Relay
  * Credential Theft
  * SMB Relay
* Kerberos is the preferred authentication protocol in modern Active Directory environments.
* NTLM is primarily used for:

  * Legacy applications
  * Workgroup authentication
  * Systems that cannot use Kerberos
  * Certain fallback authentication scenarios
* The cryptographic algorithms and message formats differ between **NTLMv1** and **NTLMv2**. **NTLMv2** is significantly more secure and should always be used when NTLM is required.
