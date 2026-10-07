8. Cryptography
Cryptography is the practice of disguising information in a way that looks random.
Provide confidentiality and integrity
Used for authentication and access control
Non-repudiation
You said it. You can't deny it
Cryptography Terms
Plaintext
An unencrypted message (in the clear)
Ciphertext
An encrypted message
Cipher
The algorithm used to encrypt and decrypt
Cryptanalysis
The art of cracking encryption
Researchers are constantly trying to find weaknesses in ciphers
Mathematically flawed cipher is bad for everyone
156 of 178
Classic Algorithms - by Substituition
Caesar Cipher - The earliest known and simples ciphers.
It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number
of positions down the alphabet.
ROT13 - Rotate by 13 places
Substitute one letter with another
e.g., "URYYB" is "HELLO"
Vigenère Cipher - Employs the Caesar cipher as one element of the encryption process + the key.
157 of 178
�
� Kerkchoff Principle - The crypto algorithm should be public and the key is the secret.
Where to Encrypt & Decrypt?
Data-in-Transit / Data-in motion: Transport / Network
Not much protection as it travels
Many different switches, routers, devices
Network-based protection:
Firewall, IPS
Provide transport encryption:
TLS, IPsec
Data-at-Rest: Resides in storage
Hard drive, SSD, flash drive, etc
Encrypt the data
Whole disk encryption
Database encryption
File or/ folder-level encryption
Apply permissions
Access control lists
Only authorized users can access the data
Data-in-use / Data-in-process: RAM & CPU
The data is in memory or CPU registers and cache
The data is almost always decrypted
Symmetric Encryption
One Single Key / Session Key to encryption and decryption
Primary way to encrypt data
Ephemeral Key / Session key:
Temporary
Provides perfect forward secrecy
Is possible to Share a symmetric session key using asymmetric encryption:
1. Client encrypts a random (symmetric) key with a server's public key
2. Ther server decrypts this shared key and uses it to encrypt data
3. This is the session key
Very fast to use
Less overhead than asymmetric encryption
Often combined with asymmetric encryption
128-bit or larger symmetric keys are common
Asymmetric Encryption
Uses a Key pair:
Public Key - Anyone can see this key; give it away
Private Key - Keep this private
Larger keys than symmetric encryption; Common to see key lengths of 3,072 bits or larger
158 of 178
�
� Symmetric key from Asymmetric keys 
Cryptosystem 
�
�
🗝
Defines key properties, communication requirements for the key exchange; actions through encryption and decryption
process.
(Ex: Using asymetric encryption to exchange Session keys after that communicate using Symmetric encryption.)
Key escrow (also known as a “fair” cryptosystem) is an arrangement in which the keys needed to decrypt
encrypted data are held in escrow so that, under certain circumstances, an authorized third party may gain access
to those keys.
Symmetric Cryptosystems
Algorithm
Block or
Streaming
Block
Size
Rounds
Key Size
Notes
DES
Block
64-bit
16
56 bits
Uses five modes of operation: ECB,
CBC, CFB, OFB and CTR.
Blowfish
Block
64-bit
16
32-448 bits
Public domain algorithm.
Twofish
Block
128-bit
16
128, 192 and
256 bits
Public domain algorithm.
3DES
Block
64-bit
16
168 bits (56 x
3)
Repeats DES process 3 times.
AES
Block
128-bit
10, 12, or
14
128, 192 or
256 bits
Encryption standard for the US
Gov.; Used in WPA2
RC4
Streaming
N/A
1
40-2048 bits
Used in WEP, SSL and TLS; largely
deprecated in current technologies.
159 of 178
Rounds: Repeating the XOR/left-shift iteration X times.
Asymmetric Algorithms
Diffie-Hellman
Uses key exchange protocol
DOES NOT use Public or Private keys
DOES NOT itself encrypt or authenticate
It's an anonymous key-agreement protocol
Used for Perfect Forward Secrecy (PFS)
Ephemeral Diffie-Hellman (EDH or DHE)
Combine with elliptic curve cryptography for ECDHE
The image below explain with an analogy the complex mathematical process of the key exchange on DH:
Diffie Hellman groups help by defining the size or type of key structure to use:
160 of 178
Diffie Hellman Groups
Group
Size
Group 1
768-bit modulus
Group 2
1024-bit modulus
Group 5
1536-bit modulus
Group 14
2048 bit modulus
Group 19
256-bit elliptic curve
Group 20
384-bit elliptic curve
Group 21
521-bit elliptic curve
RSA
Rivest Shamir and Edelman - Asymmetric algorithm, generates the private and public key.
The first practical public-key cryptography systems
Encrypt, decrypt, digital signatures
Based on the product of two large prime numbers
Now released into the public domain
Used extensively for web site encryption and digital rights management
DSA (Digital Signature Algorithm)
A standard for digital signatures
Is a modification of Diffie-Hellman key exchange for use in digital signatures
Combine with elliptic curve cryptography
ECDSA - Elliptic Curve Digital Signature Algorithm
Fast and efficient digital signatures
ECC - Elliptic Curve Cryptography
Used for encryption, digital signatures, pseudo-random generators, and more
Can create a smaller key than RSA, provides the same security with increased performance (more faster).
Instead of numbers, use curves
Uses smaller keys than non-ECC encryption
ECDSA - Elliptic Curve Digital Signature Algorithm
PGP - Pretty Good Privacy
Popular asymmetric encryption
OpenPGP
Provide privacy and authentication for data communication.
Used for signing, encrypting, and decrypting texts, e-mails, files, directories, and whole disk partitions and to
increase the security of e-mail communications.
161 of 178
PGP Certificates
Symantec Corp.
Enterprise Solution
Encrypts Massa storage
Signing
Disk Encryption
BitLocker
FileVault
Enterprise Cloud Solutions
OpenPGP
Free
Encrypted email
PKI Support
S/MIME
GPG (GNU Privacy Guard)
Free Toolset
File and Disk encryption
Certificates and Trust
Certificates include a public key and at least one Digital signature.
Digital Signature
1. To create a digital signature for a document
2. Signing: You hash the document using your private key.
3. Verification: Others can verify your digital signature with your public key.
162 of 178
Stream ciphers & Block modes
Stream ciphers
Encryption is done one bit or byte at a time
Provides high speed, low hardware complexity
Used with symmetric encryption
Not used in asymmetric encryption
The starting state should never be the same twice
Key is often combined with an initialization vector (IV)
Block modes
Encrypt fixed-length groups
Often 64-bit or 128-bit blocks
Pad added to short blocks
Each block is enrypted or decrypted independently
Symmetric encryption
Similar to stream ciphers
Block cipher modes of operation
Avoid patterns in the encryption
Many different modes to choose from
163 of 178
Block Cipher Modes
ECB - Eletronic Code Block (deprecated because nowdays is a week method that always produces the same
output results with same input)
Each block is encrypted with the same key. Identical plaintext blocks create identical ciphertext blocks
CBC - Cipher Block Chaining
Popular mode of operation
Each plaintext block is XORed with the previous ciphertext block
Adds additional randomization
Uses an initialization vector for the first block
CTR (Counter)
Block cipher mode / acts like a stream cipher
Encrypts successive values of a 'counter'
Plaintext can be any size, since it's part of the XOR
e.g., 8 bits at a time (streaming) instead of a 128-bit block
GCM (Galois/Counter Mode)
Encryption with authentication
Authentication is part of the block mode
164 of 178
Combines Counter Mode with Galois authentication
Minimum latency, minimum operation overhead
Very efficient encryption and authentication
Commonly used in packetized data
Network traffic security (wireless, IPsec)
SSH, TLS
🛑 All block modes below uses IV, which ensures the output block is uniquely different
🛑 A Binary Block is a plaintext converted into 16-bit, 64-bit or 128-bit binary ciphertext.
Hashes
One-way encryption providing integrity.
Impossible to recover the original message from the digest
Used to store passwords providing confidentiality.
Hash
Algo.
MD5
165 of 178
128 bit hash
Hash
Algo.
SHA-1
160 bit hash
SHA256
256 bit hash
Examples:
String: hello world!
MD5 Hash: FC3FF98E8C6A0D3087D515C0473F8677
SHA-1 Hash: 430CE34D020724ED75A196DFC2AD67C77772D169
SHA256 Hash: 7509E5BDA0C762D2BAC7F90D758B5B2263FA01CCBC542AB5E3DF163BE08E6CA9
🛑 If you change a single character, the entire Hash value changes. See the example below, changing the
last character '!' to '.'
String: hello world!
MD5 Hash: FC3FF98E8C6A0D3087D515C0473F8677
String: hello world.
MD5 Hash: 3C4292AE95BE58E0C58E4E5511F09647
Message digest
A message digest or hash, can be used to verify the integrity of a message by comparing the original hash to one
generated after receipt of the message. If the two match, then integrity is assured. If they do not match, then the
message was altered between transmission and receipt.
Hashing Algorithms
MD5 - Message Digest Algorithm
First published in April 1992
Replaced MD4
128-bit hash value
1996: Vulnerabilities found
Not collision resistant
SHA - Secure Hash Algorithm
Developed by NSA
SHA-1
Widely used
160-bit digest
2005: Collision attacks published
SHA-2 Family
SHA-256 | minor version: SHA-224
SHA-512 | minor version: SHA-384
166 of 178
SHA-3
Uses a hash function called Keccack and has the same length of SHA-2.
SHA-1 and SHA-2 have been replaced by the latest iteration of SHA known as SHA-3.
HMAC
Hash Message Authentication Code - Used in conjunction with symmetric key both to authenticate and verify integrity of
the message.
Verify data integrity and authenticity
No fancy asymmetric encryption is required
Used in network encryption protocols
IPsec, TLS
Requires each side of the conversation to have the same key
RIPEMD
RACE Integrity Primitives Evaluation Message Digest.
Not very common
Open Standard
128, 168, 256, 320 bit digests (RIPEMD-128, RIPEMD-256, RIPEMD-320)
Original RIPEMD was found to have collision issues (2004)
Effectively replaced with RIPEMD-160 (no known collision issues)
Based upon MD4 design but performs similar to SHA-1
Practical use of Hashing 
Verify a downloaded file
🛠
Hashes may be provided on the download site
Compare the donwloaded file hash with the posted hash value
Password storage
Instead of storing the password in the clear, store a salted hash
Compare hashes during the authentication process
Keystretching
Combine a very long salt and a huge number of hashing iterations to make cracking even more harder. (e.g Hashing the
hashed password N times)
167 of 178
Two most popular Key stretching libraries/ functions:
PBKDF2 (Password-Based Key Derivation Function 2) algorithm
Part of RSA public key cryptography standards (PKCS #5, RFC 2898)
bcrypt
Generates hashes from passwords
An extension to the UNIX crypt library
Uses Blowfish cipher to perform multiple rounds of hashing
Example:
PBKDF2
Password: 123456
Hash:
rYoSDg62evyzhE1+lWBa9A==:YaeMu71c8KU3H0RYFPle0Q==
bcrypt
Password: 123456
Hash:
$2b$10$vES9mCPsE10//vOc1u01XeUVmJrZyHGMPaRfo39OIUoJ2g7iPtDnu
🛑 Key streaming - involves sending individual characters of the key through an algorithm and using a
mathematical XOR function to change the output.
Cryptographic nonce
Cryptographic randomization schemes
Used once - 'for the nonce'/ for the time being
A random or pseudo-random number
Somehting that can't be reasonably guessed
Can also be a counter
Use a nonce during the login process
Server gives you a nonce
Calculate your password hash using the nonce
Each password hash sent to the host will be different, so a replay attack won't work
Initialization vectors
Is a type of nonce
Used for randomizing an encryption scheme
The more random the better
Use in encryption ciphers, WEP, and older SSL implementations
168 of 178
Salt
A nonce most commonly associated with password randomization, making the pasword hash unpredictable.
Salt is an arbitrary value
Usually created by the application or OS storing passwords, added to the end of the password before it is hashed
Makes cracking harder
🛑 If the password database is breached, you can't correlate any passwords because even users with the
same password have different hashes stored.
Salt Example:
1. Password: 123456
2. Salt: s4Lt1337=
3. Add salt: 123456s4Lt1337=
4. Hash function: B2099F11CC4D34E9E8EED83E83D815732986D50097CA765BB8AFB355EABFFFB9
