4. Identity and Access Management
Identification and AAA
Identification, Authentication, Authorization, and Accounting work together to manage assets securely.
Identification
The information on credentials identifies the user.
Authentication
Authentication Factors:
Something you know (e.g. - password)
Something you have (e.g. - smart card)
Something you are (e.g. - fingerprint)
Something you do (e.g. - android pattern; manual signature)
Somewhere you are (e.g. - geolocation)
101 of 178
�
� Multi-factor authentication generally uses two of this examples (e.g. - Something you Know(1) and
Something you Have(2), never on same category
Trusts and Federated Authentication:
Trust Relationship - Active Directory DS
Transitive Trust - The organization trusts another entity because they are trusted by someone else that the
organization trusts.
Federated System - Common authentication and credentials database that multiple entities use and share.
(Active Directory: Different Domains could be used in other domains in the same forest).
Other types of trust:
One-way trust: Domain B trusts Domain A, Domain A doesn't trust Domain B.
Two-way trust: Both domains are peers, both trust each other equally.
Non-transitive trust: A trust is specifically created and applies only to that domain.
Authorization concepts
Permissions:
Applied to resources
Rights / Privileges:
Assign at system level
Authorization strategies:
Least privileged
Separation of Duties
Authorization Models
Mandatory Access Control (MAC):
Every object gets a label
Confidential, secret, top secret, etc
The administrator decides who gets access to what security level; Users cannot change these settings
Used on old systems (e.g. Top Secret Gov. information)
Discretionary Access Control (DAC):
Used in most OS
Owner of the data defines access
Very flexible access control; Very weak security
Role-based Access Control (RBAC):
Access to resources is defines by a set of rules defined by a role in your organization/job function (Manager,
Director etc)
102 of 178
Administrators provide access based on the role of the user
Rights are gained implicity instead of explicity
In Windows, use Groups to provide role-based access control
e.g. Admin Groups --> Rights and Perms,
Sales Group --> Rights and Perms
Attribute-based Access Control (ABAC):
Users can have complex relationships to applications and data
Access may be based on many different criteria
ABAC can combine and evaluate multiple parameters
Resource information, IP address, time of day, desired action, relationship to the data, etc
Rule-based Access Control:
Generic term for Following Rules
Conditions other than who you are
Access is determined through system-enforced rules
System administrators, not users
The rule is associated with the object
System checks the ACLs for that object
Rule examples
Permitting access for an account or group to a network connection at certain hours of the day or days of
the week
Only Chrome browsers may complete this web form
🛑 Rule Based Access Control (RBAC) introduces acronym ambiguity by using the same four letter
abbreviation (RBAC) as Role Based Access Control. Under Rules Based Access Control, access is allowed
or denied to resource objects based on a set of rules defined by a system administrator.
🛑 Access is defined by ACL, Access Control List. 
permitted.
File system security
Store files and access them
Hard drives, SSDs, flash drives, DVDs
Part of most OS's
Accessing information
ACL - Access Control List
Group/User rights and permissions
🛑 Implicity deny prevents access unless specifically
Can be centrally administred and/or users can manage files they own
Encryption can be built-in
The file system handles encryption and decryption
Database security
Databases have their own Access Control
Username, password, permissions
Encryption may be an option
Most databases support data encryption
Data integrity is usually an option
No data is lost because of a fault
Part of the database server operation
Applications can provide a secure front-end
Prevent SQL injections and inappropriate access to data

Triple AAA
Authentication, Authorization and Accounting
Two most popular protocols of triple AAA is RADIUS and TACACS+, providing centralized Authentication,
Authorization and Account management and registry logging for computers to connect and use a network service
securely.
RADIUS or TACACS+ server resides on a remote system and responds to queries from clientes such as VPN clients,
wireless access points, routers and switches.
How RADIUS and TACACS+ works:
1. [Authentication] -> The server authenticates username and password
2. [Authorization] -> Determine if a user is allowed to connect to the client
3. [Accounting] -> Log the connection
RADIUS - Remote Authentication Dial-In User Service
Used for network access
1. Radius Server: Get the stack of usernames and passwords (can be MySQL, AD/DS, etc.)
2. Radius Client: The Gateway between users and servers
3. Radius Supplicant: The person that want to authenticate
RADIUS can use up to 4 different ports: Ports used by RADIUS | :-:|- 1812 | 1813 | 1645 | 1646 |
TACACS+ - Terminal Access Controller Access-Control
System Plus
Is really good to manage a big number of network devices.
Provide the same as RADIUS but the service decouple the authorization from the authentication. Manages the
authorization better than RADIUS.
🛑 Uses TCP Port 49
🛑 TACACS encrypts all information between the client and server.
🛑 RADIUS only encrypts the passwords
104 of 178
Authentication Methods
PAP - Password Authentication Protocol
Is the oldest authentication method. PAP sends username and password in the clear / plaintext
CHAP - Challenge Handshake Authentication Protocol
Uses a hash value of challenge message to authenticate
NTLM - NT LAN Manager for Windows
Similar to the CHAP; uses a challenge hashed message with a different process than CHAP
🛑 NTLM is vulnerable to a credentials forwarding attack (use credentials of one computer to gain
access to another) -> Most secure systems migrate to Kerberos
Kerberos for Active Directory Domain Services (AD DS)
1. Authenticator (Encrypted with user's password)
2. TGT (Encrypted with KDC's key) [ticket-grant-ticket]
3. Resource Ticket (Encrypted with Resource's key by the KDC and issued to the user)
4. Resource Ticket used by Client to access the resources
🛑 Uses Port 88
SAML - Security Assertion Markup Language
Used exclusive for Web Application
LDAP - Lightweight Directory Access Protocol
Query Directories: Structured language that allows one computer to go into somebody's directory and query, update...
105 of 178
🛑 Uses TCP/UDP Port 389
Single Sign-On
Authenticate one time - gain access to everything
LAN: Windows Active Directory is dominant for security SSO
SAML: SSO for Web Application / used to manage multiple apps using a single account
PPP - Point-to-Point Protocol
In computer networking, Point-to-Point Protocol (PPP) is a data link layer (layer 2) communications protocol between two
routers directly without any host or any other networking in between. It can provide connection authentication,
transmission encryption, and compression.
Transport layer protocol
Initiate connection
Get address information
Make connection
Poor authentication mechanisms:
PAP - password authentical protocol (passwords in the clear)
CHAP - Challenge handshake authentication protocol - (use of hashing)
MS-CHAP (Microsoft CHAP)
Accounts Types 
User accounts
👤
This is the account type most people will use
Storage and files can be private to that user
No privileged access to the OS
Shared accounts
Used by more than one person/guest login, anonymous login
Very difficult to create an audit trail
Password management becomes harder
Best practice is simply DON'T use these dumb type of accounts
Service accounts
Used exclusively by services running on a computer
No interactive/user access(ideally)
Web server, database server, etc
Access can be defined for a specific server
Web server rights and permissions will be different than a database server
Commonly use usernames and passwords using policy to determine best passwords practices
Privileged accounts
Administrator, Root
Complete access to the system
This account should NOT be used for normal administration
Needs to be HIGHLY secured - Strong passwords, 2FA, scheduled password changes
106 of 178
User Account Management
Least privilege
Rights and permissions should be set to the bare minimum
You only get exactly what's needed to complete your objective
This is apply to all users in the organization
All users accounts must be limited
Applications should run with minimal privileges
Don't allow users to run with administrative privileges
Limits the scope of malicious behavior
🛑 Privilege creep - when someone get a bunch of new privileges unecessarily; gradual accumulation of
access rights beyond what an individual needs to do his or her job.
Continuous Access Monitoring
Monitoring all users account activity
Track Log on and Log off activity
Track file access
🛑 Shared Accounts = BAD!!!
🛑 Multiple Accounts = Use different user/pass
🛑 Use least privilege - enough necessary to accomplish task
🛑 Monitor and log activity of users with multiple accounts (LOG EVERYTHING)
🛑 Avoid default usernames on user accounts
Access Control Technologies
Proximity Cards
Close range card - contactless smart card
Passive deivce
No power in the card - powered from the reader
Not a large data storage device
Often used as an identifier
Keycard door access, library cards, payment systems
The identifier is linked to data stored elsewhere
107 of 178
Smart cards
Integrated circuit card - contact or contactless
Common on credit cards - Also used for access control
Must have physical card to provide digital access - a digital certificate
Multiple factors - use the card with a PIN or fingerprint
Biometrics
Fingerprints
Facial Recognition
Vocal Recongnition
Can lock and unlock devices
Use to configure applications
Biometric acceptance rates:
False acceptance rate (FAR) - Type II
Likelihood that an unauthorized user will be accepted (This would be bad)
False injection rate (FRR) - Type I
Likelihood that an authorized user will be rejected
Crossover error rate (CER)
The rate at which FAR and FRR are equal
Adjust sensitivity to equalize both values
Used to quantitatively compare biometric systems
🛑 Type II and Type I errors - In statistical hypothesis testing, a type I error is the rejection of a true null
hypothesis (also known as a "false positive" finding or conclusion), while a type II error is the non-rejection of
a false null hypothesis (also known as a "false negative" finding or conclusion). 
�
� FAR and FRR can apply
108 of 178
to many softwares that uses authentication and authorization methods.
Token generators
Pseudo-random token generators - useful authentication factor
Carry around a physical hardware token generator
Use software-based token generator on your phone
HOTP - HMAC-based One-time Password algorithm
One-time passwords
Use them once, and never again
Once a session, once each authentication attempt
Keyed-hash message authentication code (HMAC)
The keys are based on a secrete key and a counter
Token-based authentication
The hash is different every time
Hardware and software tokens available
TOTP - Time-based One-Time Password algorithm
Use a secret key and the time of day
No incremental counter
Secret key is configured ahead of time
Timestamps are synchronized via NTP
Timestamp usually increments every 30 seconds
Put in your username, password, and TOPT code
One of the more common OTP methods used by Google, Facebook, Microsoft, etc
Certificate-based authentication
109 of 178
Smart card
PIV (Personal Identity Verification) card
US Federal Government smart card
Picture and identification information
CAC (Common Access Card)
US DoD smart card
Picture and ID
IEEE 802.1X
Gain access to the network using a certificate on device storage or separate physical device
Account Policy Enforcement
Windows Group Policy Management
Apply security and admin setting across many computers
Different than NTFS or Share permissions that control the use of the OS
Linked to Active Directory administrative boundaries
Sites, Domains, Organization Units (OUs)
110 of 178
Define by Groups, Locations, etc
Group Policy Management Editor - Windows
Administrative Policies
Remove add or Remove Programs
Prohibit changing sounds
Allow font downloads
ONly allow approved domains to use ActiveX controls without prompt
Security Policies
Specify minimum password length
Require smart card
Maximum security log size
Enforce user login restrictions
Password Security
1. Complexity
Length and character requirements
2. Expiration
Reset and time triggers
3. Password history
Reusage and retention
Local Security Policy - Password Policy - Windows
111 of 178
Enforce Password History: determine the number of new unique passwords [1-24]
Maximum Password Age: Password age [1-999 days]
Minimum Password Age: Limit until request password change [1-998 days]
Maximum Password Lenght: [1-20 characters]
Password Complexity:
Not contain user account name or parts of full name
At least 6 characters lenght
At least three of four categories:
Uppercase [A-Z]
Lowercase [a-z]
Base 10 digits [0-9]
Non-alphabetic characters [!,@,#,$,...]
Account Lockout Policy
Account Lockout Duration: Time (in minutes) for a locked-out account [0-99,999]
Account Lockout Threshold: Number of failed logon attempts [0-999]
Reset Account Lockout Duration: Period of time that must elapse before the account lockout counter is reset to 0
bad logon attempts. [1-99,999]
🛑 Local Security Policy applies policies for the host machine/local. 
�
� Group Policy Management
applies policies for the organization through Active Directory Domains, Groups, OUs, etc.
1. Good practices - Password complexity
AVOID single words or obvious passwords
Name of dog, parent, partner
Use upper, lower case and special characters on each password
At least 8 characters
Consider a phrase or set of words
Prevent password reuse
System remember password history, requires unique passwords
112 of 178
1.1 Good practices - Password expiration and recovery
All passwords should expire
Change every 30 days, 60 days, 90 days
Critical systems might change more frequently
Every 15 days or every week
The recovery process should NOT be trivial!
Some organizations have a very formal process
1.2 Good practices - Account lockout and disablement
Always turn on the policy of Account Lockout to avoid brute-force try out
Disable accounts is better than Delete account; Often users save data, encryption keys, etc; Makes easier to
retrieve this information.
Group Policy Objects (AD DS)
Set of rules that allow an administrator granular control over the configuration of objects in Active Directory,
including user accounts, operation systems, applications and other AD objects. Can apply over multiple domains,
groups and OU's.
Permissions - Windows
NTFS permissions are granted to users and groups on folders and files.
113 of 178
NTFS Permissions - Folder
Full Control - Anything
Modify - Read, Write and Delete Files and Subfolders
Read/Execute - See contents and Run Programs
List Folder Contents - See Contents of Folders and Subfolders
Read - View Contents and Open data files
Write - Write to Files and Create new files and folders
NTFS Permissions - File
Full Control - Anything
Modify - Read, Write and Delete files
Read/Execute - Open and Run the file
List Folder Contents - Open the file See Contents of Folders and Subfolders
Read - Open the file
Write - Open and Write to the file
🛑 Deny is stronger than allow.
Moving and Copying NTFS Objects
1. Copy and Move from drive X: to Y: - will take the NTFS permissions of the destination drive.
2. Copy from drive X: to the same drive X: - will loose the NTFS permissions.
3. Move from drive X: to the same drive X: - will inheritance the NTFS permissions
114 of 178
Permissions - Linux
Linux has three permissions and they can be set for the owner, group or other.
r = read - open a file, view a file. w = write - edit a file, add or delete files for directories. x = execute - run a
file, execute a program or script, CD to a different directory.
Owner
Group
Other
rwx
rwx
rwx
Viewing the permissions on Linux command-line:
ls -l-rwxrwxr-x 1 user user 31337 Feb 11 13:13 File
Using chmod
chmod is the command and system call which is used to change the access permissions of file system objects on Unix
and Unix-like OS.
Clear out the permissions of the File to have no read, write and execute permissions on Other:
(The flag equals to nothing[o=] deny the permissions)
ls -l-rwxrwxr-x 1 user user 31337 Feb 11 13:13 File
chmod o= File
ls -l-rwxrwx--- 1 user user 31337 Feb 11 13:13 File
Giving read and write permissions to Group:
115 of 178
ls -l
-rwx---r-- 1 user user 31337 Feb 11 13:13 File
chmod g=rw File
ls -l-rwxrw-r-- 1 user user 31337 Feb 11 13:13 File
Giving all permissions to everybody(Owner,Group and Other):
ls -l-rwx---r-- 1 user user 31337 Feb 11 13:13 File
chmod a=rwx File
ls -l-rwxrwxrwx 1 user user 31337 Feb 11 13:13 File
Using chmod on oldschool way:
The chmod command will take the octal value and combine them to associate the permissions on three different
positions for the Owner, Group and Other/Everyone. This boils down to a simple binary rule: 0 = off | 1 = on.
Octal
Binary
Permissions
0
000--
1
001--x
2
010-w
3
011-wx
4
100
r-
5
101
r-x
6
110
rw
7
111
rwx
If you want to give all permissions to a group for example, the number will be 7 (4 + 2 + 1).
116 of 178
Read Write Execute
Read
Write
Execute
r---w---x
4
2
1
Examples:
Giving read, write and execute permission to everybody:
ls -l-rwx---r-- 1 user user 31337 Feb 11 13:13 File
chmod 777 File
ls -l-rwxrwxrwx 1 user user 31337 Feb 11 13:13 File
Giving all permissions to the owner, read and write to group and no permissions to other/everyone:
ls -l-r-x---r-- 1 user user 31337 Feb 11 13:13 File
chmod 760 File
ls -l-rwxrw---- 1 user user 31337 Feb 11 13:13 File
Linux - File Ownership using chown (change file owner and
group)
ls -l-rwxrwxrwx 1 user001 user001 31337 Feb 11 13:13 File
sudo chown root File
117 of 178
ls -l
-rwxrwxrwx 1 root user001 31337 Feb 11 13:13 File
The chown command requires sudo
Linux - Changing the Password using passwd
sudo passwd
