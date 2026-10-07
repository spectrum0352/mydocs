SMTP 

SMTP (Simple Mail Transfer Protocol) can be exploited for network reconnaissance. Three SMTP commands are particularly useful for attackers:
•	VRFY: Verifies usernames. Servers respond differently to valid and invalid usernames, revealing which accounts exist.
•	EXPN: Reveals the actual delivery addresses of aliases and mailing lists.
•	RCPT TO: Defines message recipients. Similar to VRFY, server responses can distinguish valid from invalid recipients.

Attackers can use these commands via Telnet to interact directly with an SMTP server and gather lists of valid users. The examples provided demonstrate how a server might respond to valid and invalid usernames with each command.

Tools like NetScanTools Pro can automate this process. Specifically, its SMTP Email Generator and Email Relay Testing Tools are designed for this purpose. smtp-user-enum is another tool specifically designed for enumerating OS-level user accounts on Solaris (via sendmail) by analyzing VRFY, EXPN, and RCPT TO responses.

Beyond SMTP, DNS zone transfer enumeration using nslookup is another reconnaissance technique. It involves retrieving a copy of the entire zone file for a domain, which can expose valuable information like DNS server names, hostnames, usernames, and IP addresses.



 
 
 
SMTP Enumeration 
●	SMTP provides 3 built-in-commands: 
○ VRFY: Validates users 
○ EXPN: Tells the actual delivery addresses of aliases and mailing lists 
○ RCPT TO: Defines the recipients of the message 
●	SMTP servers respond differently to VRFY, EXPN, and RCPT TO commands for valid and invalid users from which we can determine valid users on SMTP server. 
●	Attackers can directly interact with SMTP via the telnet prompt and collect a list of valid users on the SMTP server. 
Using the SMTP VRFY command: 
$ telnet 192.168.168.1 25 
... 
VRFY Jonathan 
250 Super-User 
<Jonathan@NYmailserver> 
VRFY Smith 
550 Smith... User unknown 
 
Using the SMTP EXPN command: 
$ telnet 192.168.168.1 25 
... 
EXPN Jonathan 
250 Super-User 
<Jonathan@NYmailserver> 
EXPN Smith 
550 Smith... User unknown 
 
Using the SMTP RCPT TO command: 
$ telnet 192.168.168.1 25 
... 
MAIL FROM:Jonathan 
250 Jonathan... Sender ok 
RCPT TO:Ryder 
250 Ryder... Recipient ok 
RCPT TO: Smith 
550 Smith... User unknown 
 
SMTP Enumeration Tool: NetScanTools Pro 
●	NetScanTools Pro's SMTP Email Generator and Email Relay Testing Tools are designed for testing the process of sending an email message through an SMTP server and performing relay tests by communicating with a SMTP server. 
SMTP Enumeration Tools 

Telnet: 
○	Telnet can be used to probe an SMTP server using VRFY, EXPN and RCPT TO parameters and enumerate users. 
●	smtp-user-enum: 
○	It is a tool for enumerating OS-level user accounts on Solaris via the SMTP service (sendmail) 
○ Enumeration is performed by inspecting the responses to VRFY, EXPN and RCPT TO commands 
DNS Zone Transfer Enumeration Using NSlookup 
●	It is a process of locating the DNS server and the records of a target network. 
●	An attacker can gather valuable network information such as DNS server names, hostnames, machine names, user names, IP addresses, etc. of the potential targets. 
●	In a DNS zone transfer enumeration, an attacker tries to retrieve a copy of the entire zone file for a domain from the DNS server. 
 
 
SMTP provides 3 built-in-commands: 
○ VRFY: Validates users 
○ EXPN: Tells the actual delivery addresses of aliases and mailing lists 
○ RCPT TO: Defines the recipients of the message 
●	SMTP servers respond differently to VRFY, EXPN, and RCPT TO commands for valid and invalid users from which we can determine valid users on SMTP server. 
●	Attackers can directly interact with SMTP via the telnet prompt and collect a list of valid users on the SMTP server. 
Using the SMTP VRFY command: 
$ telnet 192.168.168.1 25 
... 
VRFY Jonathan 
250 Super-User 
<Jonathan@NYmailserver> 
VRFY Smith 
550 Smith... User unknown 
 
Using the SMTP EXPN command: 
$ telnet 192.168.168.1 25 
... 
EXPN Jonathan 
250 Super-User 
<Jonathan@NYmailserver> 
EXPN Smith 
550 Smith... User unknown 
 
Using the SMTP RCPT TO command: 
$ telnet 192.168.168.1 25 
... 
MAIL FROM:Jonathan 
250 Jonathan... Sender ok 
RCPT TO:Ryder 
250 Ryder... Recipient ok 
RCPT TO: Smith 
550 Smith... User unknown 
 
SMTP Enumeration Tool: NetScanTools Pro 
●	NetScanTools Pro's SMTP Email Generator and Email Relay Testing Tools are designed for testing the process of sending an email message through an SMTP server and performing relay tests by communicating with a SMTP server. 
SMTP Enumeration Tools 

Telnet: 
○	Telnet can be used to probe an SMTP server using VRFY, EXPN and RCPT TO parameters and enumerate users. 
●	smtp-user-enum: 
○	It is a tool for enumerating OS-level user accounts on Solaris via the SMTP service (sendmail) 
○ Enumeration is performed by inspecting the responses to VRFY, EXPN and RCPT TO commands 
DNS Zone Transfer Enumeration Using NSlookup 
●	It is a process of locating the DNS server and the records of a target network. 
●	An attacker can gather valuable network information such as DNS server names, hostnames, machine names, user names, IP addresses, etc. of the potential targets. 
●	In a DNS zone transfer enumeration, an attacker tries to retrieve a copy of the entire zone file for a domain from the DNS server. 
 
 
●	SMTP provides 3 built-in-commands: 
○ VRFY: Validates users 
○ EXPN: Tells the actual delivery addresses of aliases and mailing lists 
○ RCPT TO: Defines the recipients of the message 
●	SMTP servers respond differently to VRFY, EXPN, and RCPT TO commands for valid and invalid users from which we can determine valid users on SMTP server. 
●	Attackers can directly interact with SMTP via the telnet prompt and collect a list of valid users on the SMTP server. 
Using the SMTP VRFY command: 
$ telnet 192.168.168.1 25 
... 
VRFY Jonathan 
250 Super-User 
<Jonathan@NYmailserver> 
VRFY Smith 
550 Smith... User unknown 
 
Using the SMTP EXPN command: 
$ telnet 192.168.168.1 25 
... 
EXPN Jonathan 
250 Super-User 
<Jonathan@NYmailserver> 
EXPN Smith 
550 Smith... User unknown 
 
Using the SMTP RCPT TO command: 
$ telnet 192.168.168.1 25 
... 
MAIL FROM:Jonathan 
250 Jonathan... Sender ok 
RCPT TO:Ryder 
250 Ryder... Recipient ok 
RCPT TO: Smith 
550 Smith... User unknown 
 
SMTP Enumeration Tool: NetScanTools Pro 
●	NetScanTools Pro's SMTP Email Generator and Email Relay Testing Tools are designed for testing the process of sending an email message through an SMTP server and performing relay tests by communicating with a SMTP server. 
SMTP Enumeration Tools 

Telnet: 
○	Telnet can be used to probe an SMTP server using VRFY, EXPN and RCPT TO parameters and enumerate users. 
●	smtp-user-enum: 
○	It is a tool for enumerating OS-level user accounts on Solaris via the SMTP service (sendmail) 
○ Enumeration is performed by inspecting the responses to VRFY, EXPN and RCPT TO commands 
DNS Zone Transfer Enumeration Using NSlookup 
●	It is a process of locating the DNS server and the records of a target network. 
●	An attacker can gather valuable network information such as DNS server names, hostnames, machine names, user names, IP addresses, etc. of the potential targets. 
●	In a DNS zone transfer enumeration, an attacker tries to retrieve a copy of the entire zone file for a domain from the DNS server. 
 




SMTP Enumeration 

SMTP enumeration is a technique used by attackers to gather information about users and systems on a target network by exploiting vulnerabilities in SMTP servers.

Key Techniques:
1.	Leveraging SMTP Commands:
o	VRFY: Validates user accounts.
o	EXPN: Expands aliases and mailing lists.
o	RCPT TO: Specifies message recipients.
By carefully analysing server responses to these commands, attackers can determine valid user accounts.
2.	Direct Interaction with SMTP Servers:
o	Telnet: Attackers can use Telnet to directly interact with SMTP servers and send these commands manually.
o	Specialized Tools: Tools like smtp-user-enum automate this process, making it more efficient.
3.	DNS Zone Transfer Enumeration:
o	Attackers can exploit vulnerabilities in DNS servers to obtain sensitive information like hostnames, IP addresses, and user accounts.
o	Tools like nslookup can be used to perform zone transfers.

Mitigation Strategies:
•	Disable Unnecessary Commands: Disable VRFY and EXPN commands on SMTP servers to prevent information leakage.
•	Implement Strong Access Controls: Restrict access to SMTP servers and configuration files.
•	Keep Software Up-to-Date: Regularly update SMTP servers and DNS servers with the latest security patches.
•	Monitor Network Traffic: Use network intrusion detection systems (IDS) to detect and block suspicious activity.
•	Limit DNS Zone Transfers: Configure DNS servers to restrict zone transfers to authorized servers.
By understanding these techniques and implementing effective security measures, organizations can significantly reduce the risk of successful SMTP enumeration attacks.


 
3. SMTP Enumeration
•	Purpose: Gathering information about SMTP (Simple Mail Transfer Protocol) servers and users.
•	Methods: 
o	VRFY Command: 
	Checks if a specific username exists on the SMTP server.
	Often disabled due to security concerns.
o	EXPN Command: 
	Expands mailing lists or aliases.
	Also often disabled.
o	RCPT TO Command: 
	Attempts to send an email to a specific address. If the server responds with an error indicating the user doesn't exist, you know the username is invalid. If there is no error, the user may exist.
	Tools: nmap, telnet.
	Example (telnet): 
	telnet <target_ip> 25
	RCPT TO: test@example.com
•	Information Extracted: 
o	Valid usernames.
o	SMTP server version.
o	Whether VRFY/EXPN are enabled.
•	Port: 
o	SMTP typically uses port 25.
Key Takeaways
•	Network enumeration is a vital part of security assessments.
•	DNS, SNMP, and SMTP enumeration techniques can reveal valuable information about a target network.
•	Security professionals must be aware of these techniques to protect their networks.
•	DNS is port 53, SNMP is ports 161 and 162, and SMTP is port 25.

Countermeasures to SMTP Recon
Configure SMTP servers to:
•	Ignore email messages to unknown recipients 
•	Not include sensitive mail server and local host information in mail responses ○ Disable open relay feature ● LDAP: 
•	By default, LDAP traffic is transmitted unsecured; use SSL technology to encrypt the traffic 
•	Select a user name different from your email address and enable account lockout 
•	SMTP (Simple Mail Transfer Protocol):
o	Reject Unknown Recipients: Configure your SMTP server to ignore emails sent to unknown recipients.
o	Hide Sensitive Information: Don't include sensitive server information in email responses.
o	Disable Open Relay: Disable the open relay feature to prevent your server from being misused for spam.
SMTP Enumeration Countermeasures
Configure SMTP servers to: 
●	Ignore email messages to unknown recipients 
●	Not include sensitive mail server and local host information in mail responses ○ Disable open relay feature 



