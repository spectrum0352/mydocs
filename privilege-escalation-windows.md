## Windows Privilege Escalation

- Kernel

- Bypass UAC

- Unquoted Path

- Scheduled Task

- Automated Scrip

## Windows Privilege Escalation Topics

### Introduction & Lab Setup

- Types of Privilege Escalation

- ACL Permissions

- Mitre ID T1547

### Exploiting Scheduled Tasks

- Task Scheduler

- Misconfigured Scheduled Task/Job

- Abusing Scheduled Task/Job

- Detection & Mitigation

### Weak Services/Permissions

- Insecure Service Properties

- Unquoted Service Path

- Weak Registry Permissions

- Insecure Service Executables

- Insecure GUI Apps

### Kernel Exploits

- What is kernel

- Compiling exploit code

- Enumerating missing patches

- Kernel exploit hunting

### Logon Autostart Execution

- Run Registry key

- Always Install Elevated

- Startup Folder

### Passwords Hunting

- Registry

- Brute force

- Credential Manager (run as)

- Configuration File

### Bypass ACL

- SeBackupPrivilege

- SeRestorePrivilege

- Token Impersonation (Hot/Rotten/Juicy Potato/Printspoofer)

- Hive Nightmare

## Windows IAM

**How Hash Passwords Are Stored in Windows SAM?**

**Note**: LM hashes were disabled in Windows Vista and later Windows OS, LM will be blank in those systems.

- reg save hklm\sam c:\temp\sam.save

- reg save hklm\system c:\temp\system.save

- pwdump, SMBPasswd

**Kerberos Authentication**

**NTLM Authentication**

Note: Microsoft has upgraded its default authentication protocol to Kerberos, which provides stronger authentication for client/server applications than NTLM.

**NTLM authentication step-by-step process:**

1.  The user shares their username, password, and domain name with the client.

2.  The client **develops a scrambled** version of the password, known as a **hash**, and **deletes the full password.**

3.  The **client passes a plain text** version of the **username to the relevant server**.

4.  The server replies to the client with a **challenge or nonce**, which is a **16-byte random number.**

5.  **Client encrypts** this **challenge** with the **hash of the user's password** and **returns the result to the server** called <span class="mark">response</span>.

6.  **Server** sends the **username, challenge** sent to the client, and **response** received from the client to the <span class="mark">domain controller</span>.

7.  **Domain controller** uses the **username** to **retrieve the hash of the user's password** from the <span class="mark">Security Account Manager DB</span>.

8.  It uses this password hash to encrypt the challenge.

9.  **Domain controller** compares the **encrypted challenge** with the **response** computed by the **client**. <span class="mark">If they are identical, authentication is successful.</span>

Please note that encryption methods can vary between versions of NTLM and different server settings.
