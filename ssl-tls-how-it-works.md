
## How SSL works?

1. **Handshake:** The initial exchange of information to establish a secure connection.
2. **Data Transfer:** Encrypted data is exchanged between the client and server.
3. **Termination:** The connection is closed.

**TLS Connection Process:**

1. A browser attempts to connect to a web server secured with SSL/TLS.
2. The server sends a copy of its SSL/TLS certificate to the browser.
3. The browser verifies the certificate's trustworthiness.
4. If the certificate is valid, the browser sends a request to the server to establish an encrypted connection.
5. The server sends an acknowledgment, and an encrypted SSL/TLS connection is established.
6. Encrypted communication then occurs between the browser and the web server.

How SSL connection works?

1. **User initiates connection** by entering Website URL in browser, then <span class="mark">browser</span> to <span class="mark">initiate the TLS handshake.</span>
2. **Server sends its** <span class="mark">public key and certificate</span> to the browser.
3. **Browser verifies** the <span class="mark">certificate's authenticity</span> to ensure it is communicating with the legitimate website.
4. **If certificate is valid**, then <span class="mark">browser generates a shared secret key</span> and <span class="mark">sends it back to server securely encrypting it with public Key of
 server</span>.
5. **Server encrypts** the requested webpage content before sending it back to the <span class="mark">browser using shared secret key by browser</span>.
6. **Browser decrypts** the requested webpage <span class="mark">using the shared secret key</span> which it shared earlier with server.

**Conclusion**

- **In this Secret key that is symmetric encryption key is used to encrypt and decrypt data.**
- **Public-Private key pair is used to share the secret key for symmetric encryption.**

How they work:

1. **Client (browser) initiates contact:** You try to access a secure website (https).
2. **Server sends its ID:** The website sends its security certificate containing its public key.
3. **Client verifies ID:** Your browser checks the certificate with a trusted authority to make sure it's legit.
4. **Secret key exchange:** If all checks out, the browser creates a secret session key and encrypts it with the website's public key (only the website's private key can decrypt it).
5. **Confirmation and encryption:** The website decrypts the session key and sends an acknowledgement encrypted with the same key. Now both sides have the same secret key.
6. **Secure conversation:** All data exchanged between the browser and website is encrypted with the session key, making it unreadable to anyone eavesdropping.

Additional security measures:

- Strong passwords
- Data encryption at rest (when data is stored) are recommended.

When a user enters a website address (URL) into their browser, an SSL/TLS handshake begins to establish a secure connection.

1. **Client Hello:** The browser sends a "Client Hello" message,
 indicating its supported security protocols and cipher suites.

2. **Server Hello & Certificate:** The server responds with a "Server
 Hello," selecting the protocol and cipher, and sends its digital
 certificate, which contains its public key.

3. **Certificate Verification:** The browser verifies the certificate's
 authenticity and validity. If it fails, the connection is
 terminated.

4. **Key Exchange:** If the certificate is valid, the browser generates
 a pre-master secret, encrypts it with the server's public key, and
 sends it to the server. Both the client and server then derive
 symmetric session keys from this pre-master secret.

5. **Encrypted Communication:** The server and browser use the
 symmetric session keys to encrypt and decrypt the data exchanged.
 The server sends the requested encrypted webpage, which the browser
 decrypts.

**Key Corrections:**

- The browser does not send the symmetric key. Instead, the browser
 generates a pre-master secret, encrypts it with the server's public
 key, and both the client and server generate the symmetric session
 keys independently.

- The server sends a certificate, not just a public key.

- The steps are not simply "if the certificate is ok, send symmetric
 key". Instead, the client uses the public key from the certificate to
 encrypt the pre-master secret.

- The symmetric keys are used to encrypt the data, not sent across the
 network.

- The handshake is the entire process of establishing the secure
 connection, not just the final decryption.

**In essence:** SSL/TLS uses a combination of public-key cryptography
(for initial key exchange and authentication) and symmetric-key
cryptography (for efficient data encryption) to provide secure
communication.

How SSL Creates a Secure Connection?

**SSL (Secure Sockets Layer)** establishes a secure connection between a
web browser and a web server using a process known as the **SSL
Handshake**. This handshake involves the exchange of cryptographic keys
to ensure data confidentiality and integrity.

**Key Components:**

- **Public Key:** Used to encrypt data that can only be decrypted with
 the corresponding private key.

- **Private Key:** Kept secret and used to decrypt data encrypted with
 the public key.

- **Session Key:** A symmetric key generated during the handshake and
 used to encrypt and decrypt data efficiently.

**SSL Handshake Process:**

1. **Browser Initiates Connection:** The browser connects to a website
 secured with SSL (https).

2. **Server Sends Certificate:** The server sends its SSL certificate,
 containing its public key.

3. **Browser Verifies Certificate:** The browser checks the
 certificate's validity, expiration, and revocation status against a
 list of trusted Certificate Authorities (CAs).

4. **Browser Generates Session Key:** If the certificate is trusted,
 the browser generates a symmetric session key, encrypts it using the
 server's public key, and sends it to the server.

5. **Server Decrypts Session Key:** The server decrypts the session key
 using its private key.

6. **Encrypted Communication:** Both the browser and server now use the
 session key to encrypt and decrypt all subsequent data transmitted
 between them.

**SSL Session:**

- An SSL session is a temporary connection between a client and a
 server.

- It is established during the handshake and defines parameters for the
 secure communication.

- Multiple SSL connections can share a single SSL session to improve
 efficiency.

**In essence, SSL provides a secure channel for data transmission by
using cryptographic techniques to protect against eavesdropping,
tampering, and impersonation.**

## SSL Connection

Here are the SSL Connection and Session Fundamentals

- **SSL Connection:**

 - A temporary, peer-to-peer communication link between a client and a
 server.

 - Each connection is associated with one SSL Session.

- **SSL Session:**

 - An association between a client and a server, established during the
 handshake protocol.

 - Defines a set of security parameters that can be shared by multiple
 SSL connections between the same client and server.

**Parameters Defining an SSL Connection**

- Server and client random values

- **Server** write MAC secret

- **Client** writes MAC secret

- **Server** write key

- **Client** writes key

- Initialization vectors

- Sequence numbers

**Parameters Defining an SSL Session State**

- Session identifier

- Peer certificate(s)

- Compression method

- Cipher spec (cipher suite)

- Master secret

- Is resumable (session resumption capability)

**Key Components of a Robust SSL Connection**

- **Session Identifier:** A unique identifier for the session.

- **Peer Certificates:** Digital certificates that verify the identities
 of the client and server.

- **Compression Method:** The algorithm used to compress data for
 efficient transmission.

- **Cipher Spec (Cipher Suite):** Defines the encryption algorithms,
 hashing algorithms, and key exchange methods used for secure
 communication.

- **Security Parameters:** The chosen encryption and hashing algorithms.

- **Session Keys:** Temporary keys used to encrypt and decrypt data.

- **Read/Write States:** Information on how data is encrypted/decrypted.

- **Protocol Version:** The version of the TLS/SSL protocol in use.

**Additional Information:**

- SSL relies on protocols like the SSL Record protocol, Handshake
 protocol, and Change Cipher Spec protocol.

- Client certificates may be used for enhanced authentication.