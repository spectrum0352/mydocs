

# **AD Domain Trusts Attacks**
At a high level, a domain trust establishes the ability for users in one domain to authenticate to resources or act as a security principal in another domain, a trust does is link up the authentication systems of two domains and allows authentication tra ic to flow between them through a system of referrals. If a user requests access to a service principal name (SPN) of a resource that resides outside of the domain they’re current in, their domain controller will return a special referral ticket that points to the key distribution center (KDC, in the Windows case the domain controller) of the foreign domain.
Tools:
1.mimikatz # lsadump::dcsync /user: 
2.mimikatz # kerberos::golden /user: /domain: /sid:

Solution:
Remove local admin rights from low privileged users in the domain, disable winrm service if not required and if the service is necessary, lock down critical enclaves with separate WinRM accounts and permissions

# **AD Vulnerable GPO Abusing**
Group Policies are part of every Active Directory. GP is designed to be able to change every system’s configuration, from list to most privileged layer. Since it is so fundamental in the network management process, it is also very powerful for attackers to use as an attack vector

Tools: 1..\SharpGPOAbuse.exe --AddComputerTask -- Taskname "Update" --Author DOMAIN\ - -Command "cmd.exe" --Arguments "/c net user Administrator Password!@# /domain" -- GPOName "ADDITIONAL DC CONFIGURATION"

Solutions:
Attackers use network mapping techniques as the first step of their attack, but this same technique can be also used for mitigation. You must know and reassess who has access to your GPOs. Using free tools, such as BloodHound, can help you understand who has access to a GPO and who inherits and access. It will help you spot potential lateral movement paths and reevaluate if your current state is answering a “list privileges” method

# **AS-REP Roasting**
An attack to retrieve the user hashes that can be brute-forced offline.
DC Backdoor with Skeleton Key
Dumping Domain Hashes

AS-REP Roasting is an attack against Kerberos for user accounts that do not require pre-authentication. Pre-authentication is the first step in Kerberos authentication, and is designed to prevent brute-force password guessing attacks

Tools: 
•	1.Rebeus.exe asreproast 
•	2.John

Solution:
The obvious protections from this type of attack are to find and remove any instances of user accounts that are set to not require Kerberos pre-authentication

# **Dictionary Attacks**
•	Hydra: Hydra is a parallelized network login cracker built in various operating systems like Kali Linux. For more information refer:  - https://en.wikipedia.org/wiki/Hydra_(software), - www.thc.org/thc-hydra/
•	Crunch - In-built password attack tool in Kali Linux
•	CeWL - In-built password attack tool in Kali Linux
•	Cupp
•	Medusa
•	Online Attacks

# **ForceChange Password Attack**
If we have ExtendedRight on User-ForceChange-Password object type, we can reset the user’s password without knowing their current password

Tools:
•	1.. .\PowerView.ps1 
•	2.Set-DomainUserPassword - Identity User -Verbose

Solutions:
It is recommended to do regular audits to check the delegations and group permissions in nested groups.

# **GenericWrite**
If we have ExtendedRight on User-ForceChange-Password object type, we can reset the user’s password without knowing their current password

Tools:
1.. .\PowerView.ps1 2.Set-DomainUserPassword - Identity User -Verbose
Solutions:
It is recommended to do regular audits to check the delegations and group permissions in nested groups

# **Golden Ticket Attack**
Golden Ticket: Access the Application Service through Impersonate user account that does not exist in Domain.

# **LLMNR Poisoning_Privilege Escalation**
LLMNR Poisoning or Link-Local Multicast Name Resolution Poisoning is a very commonly used attack when it comes to running a penetration test against a local network. LLMNR and NBT-NS (NetBIOS Name Service) attacks go hand-in-hand as they can be performed by the same tool. The Link-Local Multicast Name Resolution protocol itself is based on DNS and allows hosts to resolve other hostnames on the same local link.

Tools used: 
•	1.nmap -Pn -n -p 139,445 --script smb-enum-shares.nse 10.10.10.10 
•	2.responder 
•	3.smbclient //10.10.10.10/share

Solutions
LLMNR can be turned-o through the group policy editor, under the “policy setting” menu under Local Computer Policy -> Computer Configuration -> Administrative Templates -> Network -> DNS Client.

# **Pass the Ticket Attack**
Pass-the-Ticket attacks take aim at Kerberos much in the same way as Golden Ticket and Silver Ticket attacks, both of which exploit unfixable weaknesses in the authentication protocol.
Tools: 1..\Rubeus.exe asktgt /user: $ /rc4: /ptt 2.klist
Solution: Upon detecting a Pass-the-Ticket attack, your response depends on the level of access the attack provided. If the compromised account from which the TGT or service ticket was stolen was a low privilege account with limited or no permissions outside of the compromised system, mitigation could be as simple as resetting the user’s Active Directory password. That would invalidate the stolen TGT or service tickets and prevent the attacker from generating new tickets using the stolen password hash


# **Password Spraying**
Able to get access to the internal network host using the credentials

Tools: 1.crackmapexec winrm ips -u users -p pass

Solutions:
Disable unwanted authentication services like WinRM and also restrict unauthorized remote desktop connection with the private instances

# **RunForPrivilege Esc.exe**
There was a uncommon executable running as SYSTEM on the machine which was then reversed and analysed and manipulated for our benefits
Tools: 1.dnSpy
Solution: Avoid using unsecurely coded applications with high privileges



## Kerberos Authentication Process

## Golden Ticket Attack
Golden Ticket: Access the Application Service through Impersonate user account that does not exist in Domain.


## Kerberos Brute Force
Kerberoasting: An attack to retrieve the Application Service hashes that can be brute-forced offline.

## AS-REP Roasting
An attack to retrieve the user hashes that can be brute-forced offline.


## DC Backdoor with Skeleton Key
Dumping Domain Hashes




## LLMNR Poisoning
LLMNR Poisoning or Link-Local Multicast Name Resolution Poisoning is a very commonly used attack when it comes to running a penetration test against a local network. LLMNR and NBT-NS (NetBIOS Name Service) attacks go hand-in-hand as they can be performed by the same tool. The Link-Local Multicast Name Resolution protocol itself is based on DNS and allows hosts to resolve other hostnames on the same local link.

**Tools used: **
•	1.nmap -Pn -n -p 139,445 --script smb-enum-shares.nse 10.10.10.10 
•	2.responder 
•	3.smbclient //10.10.10.10/share

**Solutions**
LLMNR can be turned-o through the group policy editor, under the “policy setting” menu under Local Computer Policy -> Computer Configuration -> Administrative Templates -> Network -> DNS Client.

**Countermeasures**
Issue: LLMNR Poisoning (Link-Local Multicast Name Resolution)
•	Description: Tricking systems into resolving hostnames to attacker-controlled IP addresses. Often used in conjunction with NBT-NS poisoning.
•	Actions/Tools: Tools designed for LLMNR and NBT-NS poisoning (e.g., Responder)
•	Solution: Disable LLMNR and NBT-NS if not required. Implement proper network segmentation and firewall rules.



## AS-REP Roast
AS-REP Roasting is an attack against Kerberos for user accounts that do not require pre-authentication. Pre-authentication is the first step in Kerberos authentication, and is designed to prevent brute-force password guessing attacks

Tools: 
•	1.Rebeus.exe asreproast 
•	2.John

Solution:
The obvious protections from this type of attack are to find and remove any instances of user accounts that are set to not require Kerberos pre-authentication

Countermeasures
Issue: AS-REP Roasting
•	Description: Exploiting Kerberos accounts that do not require pre-authentication to brute-force password hashes.
•	Actions/Tools: (Not specified, but tools for Kerberos attacks)
•	Solution: Enforce pre-authentication for all user accounts.


## ForceChange Password
If we have ExtendedRight on User-ForceChange-Password object type, we can reset the user’s password without knowing their current password

Tools:
•	1.. .\PowerView.ps1 
•	2.Set-DomainUserPassword - Identity User -Verbose

Solutions:
It is recommended to do regular audits to check the delegations and group permissions in nested groups.

Countermeasures
Issue: ForceChange Password
•	Description: Resetting user passwords without knowing the current password by exploiting ExtendedRight permissions on the User-Force-Change-Password object.
•	Actions/Tools: (Likely tools for manipulating Active Directory permissions)
•	Solution: Restrict ExtendedRight permissions on the User-Force-Change-Password object to only authorized administrators.


## GenericWrite
If we have ExtendedRight on User-ForceChange-Password object type, we can reset the user’s password without knowing their current password

Tools:
1.. .\PowerView.ps1 2.Set-DomainUserPassword - Identity User -Verbose
Solutions:
It is recommended to do regular audits to check the delegations and group permissions in nested groups

Countermeasures
Issue: GenericWrite
•	Description: Similar to ForceChange Password, exploiting ExtendedRight permissions to reset user passwords.
•	Actions/Tools: (Likely tools for manipulating Active Directory permissions)
•	Solution: Restrict ExtendedRight permissions on sensitive Active Directory objects. Regularly audit these permissions.


## Password Spraying
Able to get access to the internal network host using the credentials

Tools: 1. crackmapexec winrm ips -u users -p pass

Solutions:
Disable unwanted authentication services like WinRM and also restrict unauthorized remote desktop connection with the private instances

Countermeasures
Issue: Password Spraying
•	Description: Attempting to log in to multiple accounts with a small number of commonly used passwords.
•	Actions/Tools: (Tools for password spraying)
•	Solution: Implement account lockout policies, multi-factor authentication, and password complexity requirements. Monitor for suspicious login attempts.

## RunForPrivilege Esc.exe
There was an uncommon executable running as SYSTEM on the machine which was then reversed and analysed and manipulated for our benefits
Tools: 1. dnSpy
Solution: Avoid using insecurely coded applications with high privileges

Countermeasures
Issue: RunForPrivilege Esc.exe
•	Description: Exploiting a vulnerable executable running with SYSTEM privileges.
•	Actions/Tools: dnSpy (for reverse engineering)
•	Solution: (The solution depends on the specific vulnerability. Generally, involves patching the vulnerable software or removing the executable.) Regularly patch systems and applications.


## Pass the Ticket Attack
Pass-the-Ticket attacks take aim at Kerberos much in the same way as Golden Ticket and Silver Ticket attacks, both of which exploit unfixable weaknesses in the authentication protocol.
Tools: 1..\Rubeus.exe asktgt /user: $ /rc4: /ptt 2. klist
Solution: Upon detecting a Pass-the-Ticket attack, your response depends on the level of access the attack provided. If the compromised account from which the TGT or service ticket was stolen was a low privilege account with limited or no permissions outside of the compromised system, mitigation could be as simple as resetting the user’s Active Directory password. That would invalidate the stolen TGT or service tickets and prevent the attacker from generating new tickets using the stolen password hash

Countermeasures
Issue: Pass the Ticket Attack
•	Description: Stealing Kerberos tickets (TGTs or service tickets) to impersonate users.
•	Actions/Tools: (Tools for Kerberos attacks)
•	Solution: Reset the password of the compromised account. Implement strong password policies and multi-factor authentication. Monitor for suspicious Kerberos activity.


## Abusing Vulnerable GPO
Group Policies are part of every Active Directory. GP is designed to be able to change every system’s configuration, from list to most privileged layer. Since it is so fundamental in the network management process, it is also very powerful for attackers to use as an attack vector

Tools: 1..\SharpGPOAbuse.exe --AddComputerTask -- Taskname "Update" --Author DOMAIN\ - -Command "cmd.exe" --Arguments "/c net user Administrator Password!@# /domain" -- GPOName "ADDITIONAL DC CONFIGURATION"

Solutions:
Attackers use network mapping techniques as the first step of their attack, but this same technique can be also used for mitigation. You must know and reassess who has access to your GPOs. Using free tools, such as BloodHound, can help you understand who has access to a GPO and who inherits and access. It will help you spot potential lateral movement paths and re-evaluate if your current state is answering a “list privileges” method

Countermeasures
Issue: Abusing Vulnerable GPO (Group Policy Object)
•	Description: Compromising GPOs to modify system configurations and escalate privileges.
•	Actions/Tools: SharpGPOAbuse.exe, BloodHound
•	Solution: Regularly audit and reassess GPO permissions. Use tools like BloodHound to analyze access and identify potential attack paths. Implement the principle of least privilege for GPO management.



## Abusing MSSQL Service Database
MS SQL Server is widely used in enterprise networks. Due to its use by third party applications, support for legacy applications and use as a database, SQL Server is a treasure trove for attackers. It gets integrated with in an active directory environment very well, which makes it an attractive target for abuse of features and privileges.

Tools:
1.PowerUPSQL.ps1 2.Get-SQLInstanceLocal -Verbose 3.(Get-SQLServerLinkCrawl -Verbose -Instance "10.10.10.20" -Query 'select * from master..sysservers').customquery Import-Module .\powercat.ps1 powercat -l -v -p 443 -t 10000

Solution:
You can use the TRUSTWORTHY database setting to indicate whether the instance of Microsoft SQL Server trusts the database and the contents within the database. By default, this setting is set to OFF. However, you can set it to ON by using the ALTER DATABASE statement. I recommend that you leave this setting set to OFF to mitigate certain threats that may be present when a database is attached to the server


countermeasures

Issue: Abusing MSSQL Service Database
•	Description: Exploiting vulnerabilities in MSSQL Server, often due to its integration with Active Directory and use by various applications.
•	Actions/Tools: PowerUPSQL.ps1
•	Solution: Set the TRUSTWORTHY database setting to OFF. This helps mitigate risks associated with attached databases.


## Abusing Domain Trusts
At a high level, a domain trust establishes the ability for users in one domain to authenticate to resources or act as a security principal in another domain, a trust does is link up the authentication systems of two domains and allows authentication traffic to flow between them through a system of referrals. If a user requests access to a service principal name (SPN) of a resource that resides outside of the domain they’re current in, their domain controller will return a special referral ticket that points to the key distribution center (KDC, in the Windows case the domain controller) of the foreign domain.
Tools:
1.mimikatz # lsadump::dcsync /user: 
2.mimikatz # kerberos::golden /user: /domain: /sid:

Solution:
Remove local admin rights from low privileged users in the domain, disable WinRM service if not required and if the service is necessary, lock down critical enclaves with separate WinRM accounts and permissions


Countermeasures
Issue: Abusing Domain Trusts
•	Description: Exploiting trust relationships between domains to gain access to resources in another domain. Attackers can use referral tickets to target the KDC of the foreign domain.
•	Actions/Tools: (Not explicitly mentioned, but likely involves tools for manipulating trust relationships and Kerberos tickets)
•	Solution: Restrict local administrator rights for low-privileged users, disable WinRM (Windows Remote Management) if unnecessary, and if WinRM is required, secure critical systems with dedicated WinRM accounts and strict permissions.









