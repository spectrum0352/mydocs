## PE Techniques

- **Privilege Escalation using DLL Hijacking:** Most Windows applications do not use the fully qualified path when loading an external DLL library instead they search for the directory from which they have been loaded first. If attackers can place a malicious DLL in the application directory, it will be executed in place of the real DLL.

- **Resetting Passwords Using CMD:** If an attacker succeeds in gaining administrative privileges, he/she can reset the passwords of any other non-administrative accounts using command prompt. Open the command prompt, type "net user" command and press Enter to list out all the user accounts on the target system. Now type "net user useraccountname \*" and press Enter, "useraccountname" is account name from list. Type the new password to reset the password for a specific account.

> **Privilege Escalation using DLL Hijacking**

- Most Windows applications do not use the fully qualified path when loading an external DLL library instead they search for the directory from which they have been loaded first.

- If attackers can place a malicious DLL in the application directory, it will be executed in place of the real DLL.

>  
>
> **Resetting Passwords Using Command Prompt**

- If an attacker succeeds in gaining administrative privileges, he/she can reset the passwords of any other non-administrative accounts using command prompt.

- Open the command prompt, type "net user" command and press Enter to list out all the user accounts on the target system.

- Now type "net user useraccountname \*" and press Enter, "useraccountname" is account name from list.

- Type the new password to reset the password for a specific account.

>  
>
> **Privilege Escalation Tool: Active@ Password Changer**

- Active@ Password Changer resets local administrator and user passwords.

>  
>
> Executing Applications

- Attackers execute malicious applications in this stage. This is called "owning" the system.

- Attackers execute malicious programs remotely in the victim's machine to gather information that leads to exploitation or loss of privacy, gain unauthorized access to system resources, crack the password, capture the screenshots, install a backdoor to maintain easy access, etc.

- Windows: psexec

  1.  -s: Run the remote process in the System account ● Kali: winexe -U USER%PW //IP cmd.exe

> Executing Application Tools

- **RemoteExec**:

  1.  RemoteExec remotely installs applications, executes programs/scripts, and updates files and folders on Windows systems throughout the network.

> ○ It allows attackers to modify the registry, change local admin passwords, disable local accounts, and copy/update/delete files and folders.

- **PDQ Deploy**:

  1.  PDQ Deploy is a software deployment tool that allows admins to silently install almost any application or patch.

- **DameWare Remote Support**:

  1.  DameWare Remote Support lets you manage servers, notebooks, and laptops remotely.

> ○ It allows attackers to remotely manage and administer Windows computers.

## PE Techniques

- **Privilege Escalation using DLL Hijacking:** Most Windows applications do not use the fully qualified path when loading an external DLL library instead they search for the directory from which they have been loaded first. If attackers can place a malicious DLL in the application directory, it will be executed in place of the real DLL.

- **Resetting Passwords Using CMD:** If an attacker succeeds in gaining administrative privileges, he/she can reset the passwords of any other non-administrative accounts using command prompt. Open the command prompt, type "net user" command and press Enter to list out all the user accounts on the target system. Now type "net user useraccountname \*" and press Enter, "useraccountname" is account name from list. Type the new password to reset the password for a specific account.

> **Privilege Escalation using DLL Hijacking**

- Most Windows applications do not use the fully qualified path when loading an external DLL library instead they search for the directory from which they have been loaded first.

- If attackers can place a malicious DLL in the application directory, it will be executed in place of the real DLL.

>  
>
> **Resetting Passwords Using Command Prompt**

- If an attacker succeeds in gaining administrative privileges, he/she can reset the passwords of any other non-administrative accounts using command prompt.

- Open the command prompt, type "net user" command and press Enter to list out all the user accounts on the target system.

- Now type "net user useraccountname \*" and press Enter, "useraccountname" is account name from list.

- Type the new password to reset the password for a specific account.

>  
>
> **Privilege Escalation Tool: Active@ Password Changer**

- Active@ Password Changer resets local administrator and user passwords.

>  
>
> Executing Applications

- Attackers execute malicious applications in this stage. This is called "owning" the system.

- Attackers execute malicious programs remotely in the victim's machine to gather information that leads to exploitation or loss of privacy, gain unauthorized access to system resources, crack the password, capture the screenshots, install a backdoor to maintain easy access, etc.

- Windows: psexec

  1.  -s: Run the remote process in the System account ● Kali: winexe -U USER%PW //IP cmd.exe

> Executing Application Tools

- **RemoteExec**:

  1.  RemoteExec remotely installs applications, executes programs/scripts, and updates files and folders on Windows systems throughout the network.

> ○ It allows attackers to modify the registry, change local admin passwords, disable local accounts, and copy/update/delete files and folders.

- **PDQ Deploy**:

  1.  PDQ Deploy is a software deployment tool that allows admins to silently install almost any application or patch.

- **DameWare Remote Support**:

  1.  DameWare Remote Support lets you manage servers, notebooks, and laptops remotely.

> ○ It allows attackers to remotely manage and administer Windows computers.

## Password Attack Techniques

### Non electronic password attacks

Attacker **does not need technical knowledge** to crack password.

- Shoulder surfing: Looking at user keyboard or screen while he/she is logging in.

- Social engineering: Convincing people to reveal passwords

- Dumpster diving: Searching for sensitive information at the user's trash-bins, printer trash bins, and user desk for sticky notes.

### Active online attacks

Attacker cracks password by directly communicating with target.

- Dictionary, Brute-forcing and Rule-based attack

- Hash Injection attack

- Cracking Kerberos password

- Internal Monologue attack

- Password Guessing

- LLMNR/NBT-NS poisoning

- Trojan/Spyware/Keylogger

### Passive online attacks

Attacker cracks password without communicating with authorizing party:

- Wire sniffing

- Man in the middle attack

- Replay attack

### Offline attacks

Attacker copies targets password file and tries to crack password on his own system:

- Rainbow table attack (Pre computed hashes)

- Distributed network attack

### Brute Force attack

<span class="mark">**Brute-force attack** means attacker uses trial and error method to crack passwords, login credentials, and encryption keys.</span>

The program tries every combination of characters until the password is broken.

- Software can use some logic to trying passwords related to the name of the individual, their job, their family, etc.

**<span class="mark">Brute-Force attacks Countermeasures</span>**

- Adding password complexity: Include different formats of characters to make passwords stronger.

- Limit login attempts: set a limit on login failures.

- Two-factor authentication: Add this layer of security to avoid brute force attacks.

**<span class="mark"><u>Different Names for Brute Force attack</u></span>**

- **Password Spray attack** means attacker <span class="mark">attempts to match username against list of weak passwords.</span>

- **Password interception attack** means attacker <span class="mark">intercepts password when they are transmitted over internet.</span>

- **Dictionary attack** means attacker uses <span class="mark">dictionary of common passwords to gain access.</span>

- **Password guessing attack** means attacker <span class="mark">uses some tool to guess the password</span>.

- **Credential stuffing attack** means attacker <span class="mark">collects large number of stolen account credentials from data breach</span> and then uses those credentials to gain unauthorized access.

- **Pass the hash attack** means attacker steals a hashed user credential (without cracking it) and reuses it to trick an authentication system into creating a new authenticated session on the same network.

- **Internal Monologue Attack** means attacker to <span class="mark">retrieve “NTLM hashes” without directly accessing the “LSASS process memory”</span> or triggering antivirus software and Windows Credential Guard. It is similar to the well-known tool “Mimikatz”, which enables adversaries to extract plain text passwords from LSASS process memory for post-exploitation lateral movement.

- **Birthday Attack** means attacker <span class="mark">compares one-way hashes of a password based on a birthday paradox that at least two people out of 253 in a room will statistically have the same birthday.</span>

### Wordlist Scanning

Wordlists is used for password cracking, stressing authentication panels, directory brute force. Wordlists in Kali Linux are dirb, Rockyou, Wfuzz wordlists.

- Online wordlists are Github, Seclists, Assetnode, Packetstorm wordlists

- Cleaning wordlists

- Crafting wordlists are CEWL, Crunch, Cupp

- A wordlist is a file (a text file in most cases) that contains a set of values that the attacker requires to provide to test a mechanism.

- Whenever an attacker is faced with an Authentication Mechanism, they can try to work around it but if that is not possible then the attacker has to try some well-known credentials into the Authentication Mechanism to try and guess. This list of well know credentials is a wordlist.

- And instead of manually entering the values one by one, the attacker uses a tool or script to automate this process.

- Similarly, in the case of cracking hash values, the tool uses the wordlists and encodes the entries of wordlists into the same hash and then uses a string compare function to match the hashes.

- If a match is found then hash is deemed as cracked. It can be observed that the importance of wordlist is paramount in the Cyber Security World.

- In Kali Linux, wordlists are located inside the /usr/share directory.

- Here, we have the dirb directory for the wordlists to be used while using the dirb tool to perform Directory Brute force.

### Dictionary attack

- Dictionary file is loaded into cracking app that runs against user accounts.

- A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted file that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.

**Default Passwords:**

- A default password is a password supplied by the manufacturer with new equipment (e.g., switches, hubs, routers) that is password protected. Attackers use default passwords in the list of words or dictionaries that they use to perform password guessing attacks.

**Hash Injection:**

- A hash injection attack allows an attacker to inject a compromised hash into a local session and use the hash to validate to network resources.

- The attacker finds and extracts a logged-on domain admin account hash.

- The attacker uses the extracted hash to log on to the domain controller.

**Password Guessing:**

- The attacker creates a list of all possible passwords from the information collected through social engineering or any other way and tries them manually on the victim's machine to crack the passwords.

- Find a valid user

- Create a list of possible passwords

- Rank passwords from high probability to low

- Key in each password, until the correct password is discovered.

<!-- -->

- **Rule-based attack**

<!-- -->

- This attack is used when the attacker gets some information about the password: Hybrid Attack, Syllable Attack, Brute Force

<!-- -->

-  

<!-- -->

- **Trojan/Spyware/Keyloggers:**

<!-- -->

- Attacker installs Trojan/Spyware/Keylogger on the victim's machine to collect the victim's usernames and passwords.

- Trojan/Spyware/Keylogger runs in the background and sends back all user credentials to the attacker.

Active Online Attack Using USB Drive

- • Download PassView, a password hacking tool

- • Copy the downloaded files to USB drive

- • Create autorun.info in USB drive: \[autorun\]en=launch.batContents of launch.bat start pspv.exe/stextpspv.txt

- • Insert the USB drive and the autorun window will pop-up (if enabled)

- • PassView is executed in background and passwords will be stored in.TXT files in USB drive

- Wire Sniffing

- • Attackers run packet sniffer tools on LAN network to access and record the raw network traffic.

- • Captured data may include sensitive information such as passwords and emails.

- • Sniffed credentials are used to gain unauthorized access to the target system.

<!-- -->

- **Man-in-the-Middle**

<!-- -->

- **Gain access to the communication channels**: In a MITM attack, the attacker acquires access to the communication channels between victim and server to extract the information.

- **Use sniffer**: In a replay attack, packets and authentication tokens are captured using a sniffer. After the relevant info is extracted, the tokens are placed back on the network to gain access.

- **Considerations**:

  - Relatively hard to perpetrate

  - Must be trusted by one or both sides

  - Can sometimes be broken by invalidating traffic

**Replay Attack**

### Rainbow Table Attack:

- "A rainbow table is a precomputed table for caching the output of cryptographic hash functions, usually for cracking password hashes"

- Tables are usually used in recovering a key derivation function (or credit card numbers, etc.) up to a certain length consisting of a limited set of characters.

- It is a practical example of a space–time trade-off, using less computer processing time and more storage than a brute-force attack which calculates a hash on every attempt, but more processing time and less storage than a simple key derivation function with one entry per hash.

- Use of a key derivation that employs a salt makes this attack infeasible.

- Reference: <https://en.wikipedia.org/wiki/Rainbow_table>

A rainbow table is a precomputed table which contains word lists like dictionary files and brute force lists and their hash value.

- **Compare the Hashes**: Capture the hash of a password and compare it with the precomputed hash table. If a match is found then the password is cracked.

- **Easy to Recover**: It is easy to recover passwords by comparing captured password hashes to the precomputed tables.

<!-- -->

- **Precomputed Hashes**:

  - 1qazwed à 21c40e47dba72e77518ee3ef88ad0cc8

  - hh021da à 2ce80b192cfa47a0d6c8a2446314810b

  - 9da8dasf à eb0f5690164ffabbed1744087a4d6761

  - sodifo8sf à 2c749bf3fff89778efc50af7e4f8d6a8

- **Tools to create rainbow tables:**

  - **RTGEN**: This program needs several parameters to generate a rainbow table.

  - **WinRTGEN**: It is a graphical rainbow table generator that supports …

- **Rainbow Tables used for password cracking:**

  - "A rainbow table is a precomputed table for caching the output of cryptographic hash functions, usually for cracking password hashes".

  - Tables are usually used in recovering a key derivation function (or credit card numbers, etc.) up to a certain length consisting of a limited set of characters.

  - It is a practical example of a space–time tradeoff, using less computer processing time and more storage than a brute-force attack which calculates a hash on every attempt, but more processing time and less storage than a simple key derivation function with one entry per hash.

  - Use of a key derivation that employs a salt makes this attack infeasible.

<!-- -->

- Reference: <https://en.wikipedia.org/wiki/Rainbow_table>

**Rainbow Tables used for password cracking**

- Rainbow table is a precomputed table for caching the output of cryptographic hash functions for cracking password hashes.

- Can you describe Rainbow table? A rainbow table is a listing of all possible plaintext permutations of encrypted passwords specific to a given hash algorithm. Rainbow tables are often used by password cracking software for network security attacks. All computer systems that require password-based authentication store databases of passwords associated with user accounts, typically encrypted rather than plaintext as a security measure.

<!-- -->

- Key logging password attack an installed keylogger intercepts passwords as they are typed. Defend Use MFA, so even one password intercepted other protect our account.

- Manual guessing password attack Personal information, such as name and date of birth can be used to guess common passwords. Defend Prioritise administrator, remote user accounts monitor failed login attempts, train users to report suspicious activity.

- Non electronic password attacks Attacker does not need technical knowledge to crack password such as Shoulder surfing Looking at either the user's keyboard or screen while he/she is logging in. Social engineering, dumpster diving.

- Offline attacks Attacker copies targets password file and tries to crack password on his own system such Rainbow table attack (Pre computed hashes), Distributed network attack

- Passive online attacks Attacker cracks password without communicating with authorizing party such as Wire sniffing, Man in the middle attack, Replay attack
