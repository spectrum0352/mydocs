Hardware & Firmware Security 
Disk Encryption
Full Disk Encryption (FDE)
Encrypt an entire drive
e.g. Windows - BitLocker
Self-encrypting Drive (SED)
Trusted Platform Module (TPM)
💻
🔐
13 of 178
Microchip built into a computer hardware that is used to store cryptographic information(public/private key). (e.g
BitLocker 1.2+); The OS relies on this hardware of root trust to check for low-level changes at boot up.
Examples of disk encryption TPM and non-TPM:
BitLocker (for Windows - TPM)
PGP Disk (non-TPM)
TrueCrypt (non-TPM)
FileVault (for macOS - non-TPM)
🛑 BitLocker is a built-in Windows Utility Drive Encryption Tool; must have a recovery key to access the data.
Secure Boot - TPM
During the boot process, the TPM and UEFI generate reports about the process and can send those reports to a remote
system, like a central authentication server. This process is called remote authentication / remote attestation.
🛑 Secure Boot is built into the UEFI BIOS specifications. If your system has a UEFI BIOS, it also has the
Secure Boot functionality.
Remote Attestation
During the boot, the TPM and UEFI generate reports about the process and can send those reports to a remote
system, like a central authentication server. This process is called remote attestation.
🛑 This process is very useful when there are a high number of machines to manage.
14 of 178
�
� 'Remote Attestation' and 'Attestation' is the same thing.
Hardware Security Module (HSM)
Is any type of hardware that's designed to do security work. For ATMs, Web Servers, or other applications that perform
an unusually high amount of key handling, it's usually a good idea to offload this work to other hardware.
Designed for cryptoprocessing
The gold standard for encryption key security
Cryptoprocessors such as HSMs use algorithms to encrypt data to offer an increased level of security.
HSMs can encrypt and decrypt information and can manage digital keys.
