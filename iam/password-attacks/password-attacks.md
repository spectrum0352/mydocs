rewrite and correct - Password attacks with wordlists


•	Dirb wordlists used to perform directory brute force.
•	Rockyou wordlists
•	Wfuzz wordlists
•	CEWL
•	Crunch
•	Cupp
•	Pydictor
•	Bopscrk
•	Bewgor
•	Dymerge
•	Mentalist
•	Hashcat/John rules
•	Cleaning wordlists
•	Crafting wordlists
•	Github online wordlists
•	Seclists online wordlists
•	Assetnode online wordlists
•	Packetstorm online wordlists




Brute force attack
Password spraying attack
Social engineering attacks
Most Common Types of Identity Theft:
•	Credit Card Fraud
•	Loan or Lease Fraud
•	Phone or Utilities Fraud
•	Bank Fraud
•	Employment or Tax related Fraud
•	Government documents or benefits fraud
 
Common Identity Attacks:
•	Password based attacks
o	Brute Force Attack - Try many passwords against one or more accounts, sometimes using dictionaries of commonly used passwords.
o	Password Spray Attack - Attempts to match username against list of weak passwords.
 
•	Password based attacks
•	Brute Force Attack - Try many passwords against one or more accounts, sometimes using dictionaries of commonly used passwords.
•	Password Spray Attack - Attempts to match username against list of weak passwords.
•	Password Cracking Tools:
•	John the Ripper
•	Hashcat
•	Brutus
•	Aircrack-ng
•	Wfuzz
•	THC Hydra
•	Medusa
•	Rainbow Crack
•	LoPhtCrack
•	Ophcrack
Identity Thefts
•	Credit Card Fraud
•	Loan or Lease Fraud
•	Phone or Utilities Fraud
•	Bank Fraud
•	Employment or Tax related Fraud
•	Government documents or benefits fraud
 
 
Password attacks and Defense

 

 

Password Attacks
•	Password cracking techniques are used to recover passwords from computer systems. 
•	Attackers use password cracking techniques to gain unauthorized access to the vulnerable system. 
•	Most of the password cracking techniques are successful due to weak or easily guessable passwords. 
•	In this scenario, an attacker has acquired access to a service interface, or to a data store that allows them to try many different password combinations for an account. 
•	Using specialized software and high capacity computing, attackers can complete many thousands of combinations in a very short amount of time. 
•	If the password is very short, very weak, very common, or the same as another account password owned by the user, the chances are very good that an attacker can guess the password and compromise the account.
•	Hacker can gain access to the password information of an individual by:
o	By sniffing the connection to the network
o	Using social engineering or guessing, an attacker can ‘guess’ a password in a random or systematic way.
o	By gaining access to a password database. 
•	Types of Password Attacks:
o	Non-Technical attacks
o	Active online attacks
o	Passive online attacks
o	Offline attacks
 
 
 
 
 
Dictionary attack
•	Dictionary file is loaded into cracking app that runs against user accounts.
•	A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted file that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.
 
 
Default Passwords
•	A default password is a password supplied by the manufacturer with new equipment (e.g., switches, hubs, routers) that is password protected. Attackers use default passwords in the list of words or dictionaries that they use to perform password guessing attacks.
 
 
Hash Injection:
•	A hash injection attack allows an attacker to inject a compromised hash into a local session and use the hash to validate to network resources. 
•	The attacker finds and extracts a logged-on domain admin account hash. 
•	The attacker uses the extracted hash to log on to the domain controller. 
 
 
 
Password Guessing:
•	The attacker creates a list of all possible passwords from the information collected through social engineering or any other way and tries them manually on the victim's machine to crack the passwords. 
•	Find a valid user 
•	Create a list of possible passwords 
•	Rank passwords from high probability to low 
•	Key in each password, until the correct password is discovered. 
 
 
Rule-based attack
•	This attack is used when the attacker gets some information about the password: Hybrid Attack, Syllable Attack, Brute Force 
 
 
 
 
 
 
 
Trojan/Spyware/Keyloggers:
•	Attacker installs Trojan/Spyware/Keylogger on the victim's machine to collect the victim's usernames and passwords. 
•	Trojan/Spyware/Keylogger runs in the background and sends back all user credentials to the attacker. 
 
 
 
Active Online Attack Using USB Drive 
•	Download PassView, a password hacking tool 
•	Copy the downloaded files to USB drive
•	Create autorun.info in USB drive: [autorun]en=launch.batContents of launch.bat start pspv.exe/stextpspv.txt
•	Insert the USB drive and the autorun window will pop-up (if enabled) 
•	PassView is executed in background and passwords will be stored in.TXT files in USB drive 
 
 
 
 
Wire Sniffing 
•	Attackers run packet sniffer tools on LAN network to access and record the raw network traffic. 
•	Captured data may include sensitive information such as passwords and emails. 
•	Sniffed credentials are used to gain unauthorized access to the target system. 
 
 
 
Man-in-the-Middle 
•	Gain access to the communication channels: In a MITM attack, the attacker acquires access to the communication channels between victim and server to extract the information. 
•	Use sniffer: In a replay attack, packets and authentication tokens are captured using a sniffer. After the relevant info is extracted, the tokens are placed back on the network to gain access. 
•	Considerations: 
o	Relatively hard to perpetrate 
o	Must be trusted by one or both sides 
o	Can sometimes be broken by invalidating traffic 
 
 
 
 Replay Attack
 
 
 
 
Rainbow Table Attack: 
•	A rainbow table is a precomputed table which contains word lists like dictionary files and brute force lists and their hash value. 
•	Compare the Hashes: Capture the hash of a password and compare it with the precomputed hash table. If a match is found then the password is cracked. 
•	Easy to Recover: It is easy to recover passwords by comparing captured password hashes to the precomputed tables. 
•	Precomputed Hashes: 
o	1qazwed  21c40e47dba72e77518ee3ef88ad0cc8 
o	hh021da  2ce80b192cfa47a0d6c8a2446314810b 
o	9da8dasf  eb0f5690164ffabbed1744087a4d6761 
o	sodifo8sf  2c749bf3fff89778efc50af7e4f8d6a8 
•	Tools to create rainbow tables: 
o	RTGEN: This program needs several parameters to generate a rainbow table. 
o	WinRTGEN: It is a graphical rainbow table generator that supports … 
•	Rainbow Tables used for password cracking:
o	"A rainbow table is a precomputed table for caching the output of cryptographic hash functions, usually for cracking password hashes".
o	Tables are usually used in recovering a key derivation function (or credit card numbers, etc.) up to a certain length consisting of a limited set of characters.
o	It is a practical example of a space–time tradeoff, using less computer processing time and more storage than a brute-force attack which calculates a hash on every attempt, but more processing time and less storage than a simple key derivation function with one entry per hash.
o	Use of a key derivation that employs a salt makes this attack infeasible.
o	Reference: https://en.wikipedia.org/wiki/Rainbow_table
 
 
 
Distributed Network Attack 
•	A Distributed Network Attack (DNA) technique is used for recovering passwords from hashes or password protected files using the unused processing power of machines across the network to decrypt passwords. 
•	The DNA Manager is installed in a central location where machines running on DNA Client can access it over the network. 
•	DNA Manager coordinates the attack and allocates small portions of the key search to machines that are distributed over the network. 
•	DNA Client runs in the background, consuming only unused processor time. 
•	The program combines the processing capabilities of all the clients connected to the network and uses it to crack the password. 
•	Elcomsoft Distributed Password Recovery: Elcomsoft Distributed Password Recovery breaks complex passwords, recovers strong encryption keys, and unlocks documents in a production environment. 
•	Microsoft Authentication 
•	Security Accounts Manager (SAM) Database: Windows stores user passwords in SAM, or in the Active Directory database in domain. Passwords are never stored in clear text; passwords are hashed and the results are stored in the SAM. 
•	NTLM Authentication: The NTLM authentication protocol types: 
•	NTLM authentication protocol 
•	LM authentication protocol 
•	These protocols store the user's password in the SAM database using different hashing methods. 
•	Kerberos Authentication: Microsoft has upgraded its default authentication protocol to Kerberos which provides a stronger authentication for client/server applications than NTLM.
 
How Hash Passwords Are Stored in Windows SAM? 
•	Note: LM hashes have been disable in Windows Vista and later Windows operating systems, LM will be blank in those systems. 
•	reg save hklm\sam c:\temp\sam.save 
•	reg save hklm\system c:\temp\system.save 
•	pwdump, SMBPasswd 
 
NTLM Authentication Process 
•	Note: Microsoft has upgraded its default authentication protocol to Kerberos, which provides stronger authentication for client/server applications than NTLM. 
•	XP: LM, NTLM 
•	Vista~: NTLMv2 
•	LM DES: PASSWOR DXXXXXX， 7 , 7×8=56 bits 
 
Kerberos Authentication 
 
 
Password Salting 
•	Password salting is a technique where random strings of character are added to the password to the password before calculating their hashes. 
•	Advantage: Salting makes it more difficult to reverse the hashes and defeats precomputed hash attacks. 
•	Note: Windows password hashes are not salted pwdump7 and fgdump 
•	PWDUMP extracts LM and NTLM password hashes of local user accounts from the Security Account Manager (SAM) database. 
•	fgdump works like pwdump but also extracts cached credentials and allows remote network execution. 
•	These tools must be run with administrator privileges. 
 
Password Cracking Tools 
•	L0phtCrack: L0phtCrack is a password auditing and recovery application packed with features such as scheduling, hash extraction from 64-bit Windows versions, and networks monitoring and decoding. 
•	Ophcrack: Ophcrack is a Windows password cracker based on rainbow tables. It comes with a Graphical User Interface and runs on multiple platforms. 
•	Cain & Abel: It allows recovery of various kinds of passwords by sniffing the network, cracking encrypted passwords using dictionary, brute-force, and cryptanalysis attacks. 
•	RainbowCrack: RainbowCrack cracks hashes with rainbow tables. 
•	It uses a time memory trade off algorithm to crack hashes. 
 
 
Password Cracking Tool for Mobile: FlexiSPY Password Grabber 
•	It captures the security pattern used to access the phone itself and crack the passcode used to unlock the iPhone, plus the actual passwords they use for social messaging. 
•	It allows you to login to their Facebook, Skype, Twitter, Pinterest, LinkedIn, Gmail and other Email accounts directly from your own computer. 
 
 
How to Defend against Password Cracking?
•	Enable information security audit to monitor and track password attacks. 
•	Do not use the same password during password change. 
•	Do not share passwords. 
•	Do not use passwords that can be found in a dictionary. 
•	Do not use cleartext protocols and protocols with weak encryption. 
•	Set the password change policy to 30 days. 
•	Avoid storing passwords in an unsecured location. 
•	Do not use any system's default passwords. 
•	Make passwords hard to guess by using 8-12 alphanumeric characters in combination of uppercase and lowercase letters, numbers, and symbols. 
•	Ensure that applications neither store passwords to memory nor write them to disk in clear text. 
•	Use a random string (salt) as prefix or suffix with the password before encrypting. 
•	Enable SYSKEY with a strong password to encrypt and protect the SAM database. 
•	Never use passwords such as date of birth, spouse, or child's or pet's name. 
•	Monitor the server's logs for brute force attacks on the users accounts. 
•	Lock out an account subjected to too many incorrect password guesses. 
 
 
 
Account Breach
•	In this scenario, an account in your organization is breached and can used by an attacker to interact with either resources in the cloud, or with your on-premises infrastructure. Common methods include spear phishing for credentials with harvesting websites, and spear phishing with malware. Once the attacker obtains a username and password, they can generally find a way to authenticate and interface a if they were a legitimate user.



 



Wi-Fi Password Brute-forcing




Password Cracking

•	Password cracking techniques are used to recover passwords from computer systems
•	Attackers use password cracking techniques to gain unauthorized access to vulnerable systems 
•	Most of the password cracking techniques are successful because of weak or easily guessable passwords 
•	Crack Linux machine root password: During boot, press "e", where there is linux line edit it and on it replace ro with rw and remove splash and enter "init=/bin/bash" press "CTRL+X" and change password using "passwd" then "reboot -f"
•	Crack Windows machine password: Use HirenbootCD.
•	Types of password attacks:
o	Non electronic attacks: Attacker does not need technical knowledge to crack password. Shoulder surfing, Social engineering, Dumpster diving
o	Active online attacks: Attacker cracks password by directly communicating with target. 
•	Dictionary, Brute-forcing and Rule-based attack
•	Hash Injection attack
•	Cracking Kerberos password
•	Internal Monologue attack
•	Password Guessing
•	LLMNR/NBT-NS poisoning
•	Trojan/Spyware/Keylogger
o	Passive online attacks: Attacker cracks password without communicating with authorizing party:
•	Wire sniffing
•	Man in the middle attack
•	Replay attack
o	Offline attacks: Attacker copies targets password file and tries to crack password on his own system:
•	Rainbow table attack (Pre computed hashes)
•	Distributed network attack
 
Brute-force attack:
Dictionary attack:


Password Attack

Wordlists

Content
•	Introduction
•	Wordlists in Kali Linux
o	Dirb wordlists
o	Rockyou wordlists
o	Wfuzz wordlists
•	Online wordlists
o	Github wordlists
o	Seclists
o	Assetnode wordlists
o	Packetstorm wordlists
•	Cleaning wordlists
•	Crafting wordlists
o	CEWL
o	Crunch
o	Cupp
o	Pydictor
o	Bopscrk
o	Bewgor
o	Dymerge
o	Mentalist
o	Hashcat/John rules
•	Conclusion
•	Reference

Introduction
•	Wordlists is used for:
o	Password cracking
o	Stressing authentication panels
o	Directory Brute force
•	A wordlist is a file (a text file in most cases but not limited to it) that contains a set of values that the attacker requires to provide to test a mechanism.
•	Whenever an attacker is faced with an Authentication Mechanism, they can try to work around it but if that is not possible then the attacker has to try some well known credentials into the Authentication Mechanism to try and guess. This list of well know credentials is a wordlist.
•	And instead of manually entering the values one by one, the attacker uses a tool or script to automate this process. 
•	Similarly, in the case of cracking hash values, the tool uses the wordlists and encodes the entries of wordlists into the same hash and then uses a string compare function to match the hashes.
•	If a match is found then the hash is deemed as cracked. It can be observed that the importance of wordlist is paramount in the Cyber Security World.
•	In Kali Linux, wordlists are located inside the /usr/share directory.
•	Here, we have the dirb directory for the wordlists to be used while using the dirb tool to perform Directory Brute force.
Dirb wordlists

Password Cracking
•	Password cracking techniques are used to recover passwords from computer systems
•	Attackers use password cracking techniques to gain unauthorized access to vulnerable systems 
•	Most of the password cracking techniques are successful because of weak or easily guessable passwords 
•	Password cracking techniques are used to recover passwords from computer systems. 
•	Attackers use password cracking techniques to gain unauthorized access to the vulnerable system. 
•	Most of the password cracking techniques are successful due to weak or easily guessable passwords. 
•	In this scenario, an attacker has acquired access to a service interface, or to a data store that allows them to try many different password combinations for an account. 
•	Using specialized software and high-capacity computing, attackers can complete many thousands of combinations in a very short amount of time. 
•	If the password is very short, very weak, very common, or the same as another account password owned by the user, the chances are very good that an attacker can guess the password and compromise the account.
Hacker can gain access to the password information of an individual by:
•	By sniffing the connection to the network
•	Using social engineering or guessing, an attacker can ‘guess’ a password in a random or systematic way.
•	By gaining access to a password database. 
•	Crack Linux machine root password: During boot, press "e", where there is linux line edit it and on it replace ro with rw and remove splash and enter "init=/bin/bash" press "CTRL+X" and change password using "passwd" then "reboot -f"
•	Crack Windows machine password: Use HirenbootCD.


Wordlist Scanning
Wordlists is used for password cracking, stressing authentication panels, directory brute force. Wordlists in Kali Linux are dirb, Rockyou, Wfuzz wordlists.
•	Online wordlists are Github, Seclists, Assetnode, Packetstorm wordlists
•	Cleaning wordlists
•	Crafting wordlists are CEWL, Crunch, Cupp
•	A wordlist is a file (a text file in most cases) that contains a set of values that the attacker requires to provide to test a mechanism.
•	Whenever an attacker is faced with an Authentication Mechanism, they can try to work around it but if that is not possible then the attacker has to try some well-known credentials into the Authentication Mechanism to try and guess. This list of well know credentials is a wordlist.
•	And instead of manually entering the values one by one, the attacker uses a tool or script to automate this process. 
•	Similarly, in the case of cracking hash values, the tool uses the wordlists and encodes the entries of wordlists into the same hash and then uses a string compare function to match the hashes.
•	If a match is found then hash is deemed as cracked. It can be observed that the importance of wordlist is paramount in the Cyber Security World.
•	In Kali Linux, wordlists are located inside the /usr/share directory.
•	Here, we have the dirb directory for the wordlists to be used while using the dirb tool to perform Directory Brute force.

Dictionary attack
•	Dictionary file is loaded into cracking app that runs against user accounts.
•	A dictionary of common passwords is used to gain access to the computer and network of the victim. One method is to copy an encrypted file that has the passwords, apply the same encryption to a dictionary of regularly used passwords, and contrast the findings.


Default Passwords:
•	A default password is a password supplied by the manufacturer with new equipment (e.g., switches, hubs, routers) that is password protected. Attackers use default passwords in the list of words or dictionaries that they use to perform password guessing attacks.
Hash Injection:
•	A hash injection attack allows an attacker to inject a compromised hash into a local session and use the hash to validate to network resources. 
•	The attacker finds and extracts a logged-on domain admin account hash. 
•	The attacker uses the extracted hash to log on to the domain controller. 
Password Guessing:
•	The attacker creates a list of all possible passwords from the information collected through social engineering or any other way and tries them manually on the victim's machine to crack the passwords. 
•	Find a valid user 
•	Create a list of possible passwords 
•	Rank passwords from high probability to low 
•	Key in each password, until the correct password is discovered. 
•	Rule-based attack
•	This attack is used when the attacker gets some information about the password: Hybrid Attack, Syllable Attack, Brute Force 
•	 
•	Trojan/Spyware/Keyloggers:
•	Attacker installs Trojan/Spyware/Keylogger on the victim's machine to collect the victim's usernames and passwords. 
•	Trojan/Spyware/Keylogger runs in the background and sends back all user credentials to the attacker. 
Active Online Attack Using USB Drive 
•	•	Download PassView, a password hacking tool 
•	•	Copy the downloaded files to USB drive
•	•	Create autorun.info in USB drive: [autorun]en=launch.batContents of launch.bat start pspv.exe/stextpspv.txt
•	•	Insert the USB drive and the autorun window will pop-up (if enabled) 
•	•	PassView is executed in background and passwords will be stored in.TXT files in USB drive 
•	Wire Sniffing 
•	•	Attackers run packet sniffer tools on LAN network to access and record the raw network traffic. 
•	•	Captured data may include sensitive information such as passwords and emails. 
•	•	Sniffed credentials are used to gain unauthorized access to the target system. 
•	Man-in-the-Middle 
•	Gain access to the communication channels: In a MITM attack, the attacker acquires access to the communication channels between victim and server to extract the information. 
•	Use sniffer: In a replay attack, packets and authentication tokens are captured using a sniffer. After the relevant info is extracted, the tokens are placed back on the network to gain access. 
•	Considerations: 
o	Relatively hard to perpetrate 
o	Must be trusted by one or both sides 
o	Can sometimes be broken by invalidating traffic 
Replay Attack
