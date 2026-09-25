Mitre ATT&CK matrix is knowledge base of adversary tactics and
techniques based on real world observations. ATT&CK stands for
**A**dversarial **T**actics, **T**echniques, and **C**ommon
**K**nowledge. It documents tactics, techniques, and procedures (TTP)
that advanced persistent threats use. ATT&CK organizes Techniques into a
set of tactics to provide context. It can be used to profile each step
of a cyberattack operation.

**Fancy Bear Group Example**

- Understand the operating method of an attacker.

- Identify the techniques and tactics used.

- Assess defensive coverage and identify high priority gaps

**Tactics**

The way the attacker behaves in the different phases of his operation
represents the attacker’s goal or the objective he is trying to achieve
in a particular step. These are initial access, execution, persistence,
privilege escalation, defence evasion, credential access, discovery,
lateral movement, collection, command and control, exfiltration, and
impact.

Example: The attacker wants to execute malicious code.

**Technical**

How the attacker achieved the goal or task, what tools, technologies,
codes, exploits, utilities, etc. This is the part where the details are
used. Examples of procedures, depending on tactics, are included here.

Example: PowerShell - using PowerShell in an attack

**Procedures**

A set of information showing how and why the technique is used.
Procedures include information about attacker groups, descriptions of
associated groups, techniques used, version, creation and modification
dates, and software

Example: Detailed information on how the technique is executed

# Tactics, Techniques and Procedures

- TTP is military term describing the operations of enemy.

- In infosec TTP is an approach profiling and contextualizing
  Cybersecurity operations.

- Being able to breakdown complex TTP attacks will make detection much
  easier to understand.

**Tactics**: It describes how attacker operates during his operation.
Example infrastructure reused, amount of entry point, compromised
targets.

**Techniques**: It describes approach used to facilitate the tactical
phase. Example tools used, malware, phishing attacks.

**Procedures**: It describes a special sequence of actions used by
attackers to execute each step of their attack cycle.

**MITRE Attack Lifecycle**

Recon 🡪 Weaponize 🡪 Deliver 🡪 Exploit 🡪 Control 🡪 Execute 🡪 Maintain

**Attack Scenarios**

Imagine a <span class="mark">user receives a malicious password reset
email</span> in their mailbox:

- They **open that email** (1st click)

- They c**lick the URL embedded** in the email body or **download the
  file attachment** (2nd click)

- Then they either **enter their credentials on the redirected web
  page** or **open the downloaded document** (3rd click).

 

That's all it takes to gain foothold inside a network for attacker.

 

**WPAD Hijacking:** Web Proxy Auto-Discovery Protocol (WPAD) is used by
browsers to automatically retrieve HTTP proxy configuration. WPAD uses
several methods, including DHCP and DNS. To attack WPAD, an attacker
starts a proxy on the local network and announces it to the local
clients who look for it. It is the browser attack.

# Man-in-the-Middle Attack

Most attacks against transport-layer security come in the form of a
*man-in-the-middle.* (MITM) attack. What this means is that in addition
to the two parties involved in a conversation there is a malicious
party. If the attacker is just listening in on the conversation, we’re
talking about a *passive network attack*. If the attacker is actively
modifying the traffic or influencing the conversation in some other way,
we’re talking about an *active network attack*. In many cases, attacks
require proximity to the victim or the server or access to the
communication infrastructure. Whoever has access to the cables and
intermediary communication nodes (e.g., routers) can see the packets as
they travel across the wire and interfere with them. Access can be
obtained by tapping the cables,21 in collaboration with telecoms, 22 or
by hacking the equipment.23 Conceptually, the easiest way to execute a
MITM attack is by joining a network and rerouting the victims’ traffic
through a malicious node. Wireless networks without authentication,
which so many people use these days, are particularly vulnerable because
anyone can access them. Other ways to attack include interfering with
the routing infrastructure for domain name resolution, IP address
routing, and so on.

** **

**Explain MITM attacks:**

- **Explain MITM attack and how to prevent it?** A
  MITM(Man-in-the-Middle) attack is a type of attack where the hacker
  places himself in between the communication of two parties and steal
  the information. Suppose there are two parties A and B having a
  communication. Then the hacker joins this communication. He
  impersonates as party B to A and impersonates as party A in front
  of B. The data from both the parties are sent to the hacker and the
  hacker redirects the data to the destination party after stealing the
  data required. While the two parties think that they are communicating
  with each other they are communicating with the hacker. You can
  prevent MITM attack by using the following practices: Use VPN, use
  strong WEP/WPA encryption, Use Intrusion Detection Systems, Force
  HTTPS, Public Key Pair Based Authentication.

- **Explain MITM attack and how to prevent it?** A
  MITM(Man-in-the-Middle) attack is a type of attack where the hacker
  places himself in between the communication of two parties and steal
  the information. Suppose there are two parties A and B having a
  communication. Then the hacker joins this communication. He
  impersonates as party B to A and impersonates as party A in front
  of B. The data from both the parties are sent to the hacker and the
  hacker redirects the data to the destination party after stealing the
  data required. While the two parties think that they are communicating
  with each other they are communicating with the hacker. You can
  prevent MITM attack by using the following practices: Use VPN, use
  strong WEP/WPA encryption, Use Intrusion Detection Systems, Force
  HTTPS, Public Key Pair Based Authentication.

- **Explain MITM attack and how to prevent it?** A
  MITM(Man-in-the-Middle) attack is a type of attack where the hacker
  places himself in between the communication of two parties and steal
  the information. Suppose there are two parties A and B having a
  communication. Then the hacker joins this communication. He
  impersonates as party B to A and impersonates as party A in front
  of B. The data from both the parties are sent to the hacker and the
  hacker redirects the data to the destination party after stealing the
  data required. While the two parties think that they are communicating
  with each other they are communicating with the hacker. You can
  prevent MITM attack by using the following practices: Use VPN, use
  strong WEP/WPA encryption, Use Intrusion Detection Systems, Force
  HTTPS, Public Key Pair Based Authentication.

- **How can you prevent man in the middle (M.I.T.M) attack? Now to
  answer that question, allow me to first tell you what is MITM
  attack?** A MITM attack happens when a communication between two
  parties (systems) is intruded or intercepted by an outside entity.
  This can happen in any form of online communication such as email,
  social media web surfing etc. They are trying to eavesdrop on your
  private conversations, then they can also target all the information
  inside your devices and the outcome could be catastrophic. Now here
  are some methods to prevent such attack, The first method to prevent
  this attack would be an encryption (preferably public key encryption)
  between both the parties. This way, they both will have an idea with
  whom they are talking because of the digital verification. The second
  method is to avoid open Wi-Fi networks and if it is necessary then use
  plugins like HTTPS, Forced TLS etc.

- **Man-in-the-middle attack countermeasures** Have a stronger WAP/WEP
  Encryption on wireless access points avoids unauthorized users. Use a
  VPN for a secure environment to protect sensitive information. It uses
  key-based encryption. Public key pair-based authentication must be
  used in various layers of a stack for ensuring whether you are
  communicating the right things are not. HTTPS must be employed for
  securely communicating over HTTP through the public-private key
  exchange.

- Man-in-the-middle attack Prevention Have a stronger WAP/WEP Encryption
  on wireless access points avoids unauthorized users. Use a VPN for a
  secure environment to protect sensitive information. It uses key-based
  encryption. Public key pair-based authentication must be used in
  various layers of a stack for ensuring whether you are communicating
  the right things are not. HTTPS must be employed for securely
  communicating over HTTP through the public-private key exchange.

- Man-in-the-Middle Attack When users or devices access a remote system
  over the internet, they assume they are communicating directly with
  the server of the target system. In a Man in the M attack, attackers
  break this assumption, placing themselves in between the user and the
  target server. Once the attacker has intercepted communications, they
  may be able to compromise a user’s credentials, steal sensitive data,
  and return different responses to the user.

- **Man-in-the-middle attack** When users or devices access a remote
  system over the internet, they assume they are communicating directly
  with the server of the target system. In a Man in the Middle attack,
  attackers break this assumption, placing themselves in between the
  user and the target server. Once the attacker has intercepted
  communications, they may be able to compromise a user’s credentials,
  steal sensitive data, and return different responses to the user.

- **Man-in-the-Middle Attack-Prevention** Recommended to use VPN or
  Tunneling to prevent unauthorized interception of communication. This
  will prevent the manipulation of data sent between the two parties.
  Data encryption in transit

- **MITM attack** used to spy on SSL connections, interactive
  man-in-the-middle proxy, allows traffic to be inspected and edited on
  fly **mitmproxy.**

- **Session Hijacking-MITM attack** MITM attack is used to intrude into
  an existing connection between systems and to intercept messages being
  exchanged. Attackers use different techniques and split the TCP
  connection into two connections Client-to-attacker connection,
  Attacker-to-server connection. After the successful interception of
  TCP connection, an attacker can read, modify, and insert fraudulent
  data into the intercepted communication. In the case of an http
  transaction, the TCP connection between the client and the server
  becomes the target.

- **Web server attack-Man-in-the-Middle (MITM)** attacks allow an
  attacker to access sensitive information by intercepting and altering
  communications between an end-user and web servers. Attacker acts as a
  proxy such that all the communication between the user and web server
  passes through him.

# Broken Access Control 

Broken access control is a method used by attackers where a particular
flaw has been identified related to the access control, where
authentication is bypassed and the attacker compromises the network.

- **Broken Access Control** Most web applications verify function level
  access rights before making that functionality visible in the UI.
  However, applications need to perform the same access control checks
  on the server when each function is accessed. If requests are not
  verified, attackers will be able to forge requests in order to access
  functionality without proper authorization.

- **Broken Access Control** Most web applications verify function level
  access rights before making that functionality visible in the UI.
  However, applications need to perform the same access control checks
  on the server when each function is accessed. If requests are not
  verified, attackers will be able to forge requests in order to access
  functionality without proper authorization.

- **Broken Access Control vulnerability identification** Bypassing
  access control checks by modifying the URL, internal application
  state, or HTML page or using custom API attack tool. Allowing primary
  key to be changed to other users’ records, permitting viewing, or
  editing someone else’s account. Elevation of privilege, acting as a
  user without being logged in, or acting as admin when logged in as
  normal user. Metadata manipulation, such as replaying or tampering
  with JSON Web Token access control token or cookie, or hidden field,
  manipulated to elevate privilege or abusing JWT invalidation. Force
  browsing to authenticated pages as an unauthenticated user or to
  privilege pages as a standard user. Accessing API with missing access
  control for POST, PUT and DELETE.

- **How to identify the broken access control vulnerability?** Bypassing
  access control checks by modifying the URL, internal application
  state, or HTML page or using custom API attack tool. Allowing primary
  key to be changed to other users’ records, permitting viewing, or
  editing someone else’s account. Elevation of privilege, acting as a
  user without being logged in, or acting as admin when logged in as
  normal user. Metadata manipulation, such as replaying or tampering
  with JSON Web Token access control token or cookie, or hidden field,
  manipulated to elevate privilege or abusing JWT invalidation. Force
  browsing to authenticated pages as a unauthenticated user or to
  privilege pages as a standard user. Accessing API with missing access
  control for POST, PUT and DELETE.

**Concept:**

***Broken Access Control:** Most web applications verify function level
access rights before making that functionality visible in the UI.
However, applications need to perform the same access control checks on
the server when each function is accessed. If requests are not verified,
attackers will be able to forge requests in order to access
functionality without proper authorization.*

 

 

**How to identify the Broken Access Control vulnerability?**

- *Bypassing access control checks by modifying the URL, internal
  application state, or HTML page or using custom API attack tool.*

- *Allowing primary key to be changed to other users’ records,
  permitting viewing or editing someone else’s account.*

- *Elevation of privilege, acting as a user without being logged in, or
  acting as admin when logged in as normal user.*

- *Metadata manipulation, such as replaying or tampering with JSON Web
  Token access control token or cookie, or hidden field, manipulated to
  elevate privilege or abusing JWT invalidation*

- *Force browsing to authenticated pages as a unauthenticated user or to
  privilege pages as a standard user.*

- *Accessing API with missing access control for POST, PUT and DELETE.*

- **Broken Access Control**: Broken access control is a method used by
  attackers where a particular flaw has been identified related to the
  access control, where authentication is bypassed and the attacker
  compromises the network.

<!-- -->

- Most web applications verify function level access rights before
  making that functionality visible in the UI. However, applications
  need to perform the same access control checks on the server when each
  function is accessed. If requests are not verified, attackers will be
  able to forge requests to access functionality without proper
  authorization.

**How to identify the Broken Access Control vulnerability?**

- Bypassing access control checks by modifying the URL, internal
  application state, or HTML page or using custom API attack tool.

- Allowing primary key to be changed to other users’ records, permitting
  viewing or editing someone else’s account.

- Elevation of privilege, acting as a user without being logged in, or
  acting as admin when logged in as normal user.

- Metadata manipulation, such as replaying or tampering with JSON Web
  Token access control token or cookie, or hidden field, manipulated to
  elevate privilege or abusing JWT invalidation

- Force browsing to authenticated pages as a unauthenticated user or to
  privilege pages as a standard user.

- Accessing API with missing access control for POST, PUT and DELETE.

# MAC Attacks

- **MAC Address** is the acronym for Media Access Control address. MAC
  addresses are used to uniquely identify network interfaces for
  communication at the physical layer of the network.

- **MAC attacks countermeasures** Configuring Port Security on Cisco
  switch. Port security can be used to restrict inbound traffic from
  only a selected set of MAC addresses and limit MAC flooding attack.

- **MAC Flooding** MAC flooding involves flooding of CAM tables with
  fake MAC addresses and IP pairs until it is full. Switch then acts as
  a hub by broadcasting packets to all machines on the network and
  attackers can sniff the traffic easily. Fail Open mode the switch
  starts behaving as a hub and broadcasts the incoming traffic through
  all the ports in the network.

- **MAC spoofing countermeasures** Use DHCP Snooping Binding Table,
  Dynamic ARP Inspection, and IP Source Guard. Encryption, Retrieval of
  MAC Address  

- **MAC spoofing technique Windows**  

- **MAC spoofing tool-IRDP Spoofing** ICMP Router Discovery Protocol
  (IRDP) is a routing protocol that allows hosts to discover the IP
  addresses of active routers on their subnet by listening to router
  advertisement and solicitation messages on their network. Attacker
  sends spoofed IRDP router advertisement message to the host on the
  subnet, causing it to change its default router to whatever the
  attacker chooses. This attack allows attackers to sniff the traffic
  and collect the valuable information from the packets. Attackers can
  use IRDP spoofing to launch man-in-the-middle, denial-of-service, and
  passive sniffing attacks.

- **MAC spoofing tool-SMAC** is a MAC Address Changer (Spoofer) that
  allows users to change MAC addresses for any network interface cards
  (NIC) on the Windows systems.

- **MAC spoofing/duplicating attack** is launched by sniffing a network
  for MAC addresses of clients who are actively associated with a switch
  port and re-using one of those addresses. By listening to the traffic
  on the network, a malicious user can intercept and use a legitimate
  user's MAC address to receive all the traffic destined for the user.
  This attack allows an attacker to gain access to the network and take
  over someone's identity already on the network.

- **MAC spoofing-switch port stealing** sniffing technique uses MAC
  flooding to sniff the packets. Attacker floods the switch with forged
  gratuitous ARP packets with target MAC address as source and his own
  MAC address as destination. A race condition of the attacker's flooded
  packets and target host packets will occur and thus the switch must
  change his MAC address binding constantly between two different ports.
  In such a case if the attacker is fast enough, they will be able to
  direct the packets intended for the target host toward his switch
  port. Attacker now manages to steal the target host switch port and
  sends an ARP request to the stolen switch port to discover the target
  hosts' IP address. When an attacker gets an ARP reply, this indicates
  that the target host's switch port binding has been restored and the
  attacker is now able to sniff the packets sent toward the targeted
  host.

# The End

Mitre ATT&CK matrix is knowledge base of adversary tactics and
techniques based on real world observations. ATT&CK stands for
**A**dversarial **T**actics, **T**echniques, and **C**ommon
**K**nowledge. It documents tactics, techniques, and procedures (TTP)
that advanced persistent threats use. ATT&CK organizes Techniques into a
set of tactics to provide context. It can be used to profile each step
of a cyberattack operation.

**Fancy Bear Group Example**

- Understand the operating method of an attacker.

- Identify the techniques and tactics used.

- Assess defensive coverage and identify high priority gaps

**Tactics**

The way the attacker behaves in the different phases of his operation
represents the attacker’s goal or the objective he is trying to achieve
in a particular step. These are initial access, execution, persistence,
privilege escalation, defence evasion, credential access, discovery,
lateral movement, collection, command and control, exfiltration, and
impact.

Example: The attacker wants to execute malicious code.

**Technical**

How the attacker achieved the goal or task, what tools, technologies,
codes, exploits, utilities, etc. This is the part where the details are
used. Examples of procedures, depending on tactics, are included here.

Example: PowerShell - using PowerShell in an attack

**Procedures**

A set of information showing how and why the technique is used.
Procedures include information about attacker groups, descriptions of
associated groups, techniques used, version, creation and modification
dates, and software

Example: Detailed information on how the technique is executed

# Tactics, Techniques and Procedures

- TTP is military term describing the operations of enemy.

- In infosec TTP is an approach profiling and contextualizing
  Cybersecurity operations.

- Being able to breakdown complex TTP attacks will make detection much
  easier to understand.

**Tactics**: It describes how attacker operates during his operation.
Example infrastructure reused, amount of entry point, compromised
targets.

**Techniques**: It describes approach used to facilitate the tactical
phase. Example tools used, malware, phishing attacks.

**Procedures**: It describes a special sequence of actions used by
attackers to execute each step of their attack cycle.

**MITRE Attack Lifecycle**

Recon 🡪 Weaponize 🡪 Deliver 🡪 Exploit 🡪 Control 🡪 Execute 🡪 Maintain

**Attack Scenarios**

Imagine a <span class="mark">user receives a malicious password reset
email</span> in their mailbox:

- They **open that email** (1st click)

- They c**lick the URL embedded** in the email body or **download the
  file attachment** (2nd click)

- Then they either **enter their credentials on the redirected web
  page** or **open the downloaded document** (3rd click).

 

That's all it takes to gain foothold inside a network for attacker.

 

**WPAD Hijacking:** Web Proxy Auto-Discovery Protocol (WPAD) is used by
browsers to automatically retrieve HTTP proxy configuration. WPAD uses
several methods, including DHCP and DNS. To attack WPAD, an attacker
starts a proxy on the local network and announces it to the local
clients who look for it. It is the browser attack.

# Man-in-the-Middle Attack

Most attacks against transport-layer security come in the form of a
*man-in-the-middle.* (MITM) attack. What this means is that in addition
to the two parties involved in a conversation there is a malicious
party. If the attacker is just listening in on the conversation, we’re
talking about a *passive network attack*. If the attacker is actively
modifying the traffic or influencing the conversation in some other way,
we’re talking about an *active network attack*. In many cases, attacks
require proximity to the victim or the server or access to the
communication infrastructure. Whoever has access to the cables and
intermediary communication nodes (e.g., routers) can see the packets as
they travel across the wire and interfere with them. Access can be
obtained by tapping the cables,21 in collaboration with telecoms, 22 or
by hacking the equipment.23 Conceptually, the easiest way to execute a
MITM attack is by joining a network and rerouting the victims’ traffic
through a malicious node. Wireless networks without authentication,
which so many people use these days, are particularly vulnerable because
anyone can access them. Other ways to attack include interfering with
the routing infrastructure for domain name resolution, IP address
routing, and so on.

** **

**Explain MITM attacks:**

- **Explain MITM attack and how to prevent it?** A
  MITM(Man-in-the-Middle) attack is a type of attack where the hacker
  places himself in between the communication of two parties and steal
  the information. Suppose there are two parties A and B having a
  communication. Then the hacker joins this communication. He
  impersonates as party B to A and impersonates as party A in front
  of B. The data from both the parties are sent to the hacker and the
  hacker redirects the data to the destination party after stealing the
  data required. While the two parties think that they are communicating
  with each other they are communicating with the hacker. You can
  prevent MITM attack by using the following practices: Use VPN, use
  strong WEP/WPA encryption, Use Intrusion Detection Systems, Force
  HTTPS, Public Key Pair Based Authentication.

- **Explain MITM attack and how to prevent it?** A
  MITM(Man-in-the-Middle) attack is a type of attack where the hacker
  places himself in between the communication of two parties and steal
  the information. Suppose there are two parties A and B having a
  communication. Then the hacker joins this communication. He
  impersonates as party B to A and impersonates as party A in front
  of B. The data from both the parties are sent to the hacker and the
  hacker redirects the data to the destination party after stealing the
  data required. While the two parties think that they are communicating
  with each other they are communicating with the hacker. You can
  prevent MITM attack by using the following practices: Use VPN, use
  strong WEP/WPA encryption, Use Intrusion Detection Systems, Force
  HTTPS, Public Key Pair Based Authentication.

- **Explain MITM attack and how to prevent it?** A
  MITM(Man-in-the-Middle) attack is a type of attack where the hacker
  places himself in between the communication of two parties and steal
  the information. Suppose there are two parties A and B having a
  communication. Then the hacker joins this communication. He
  impersonates as party B to A and impersonates as party A in front
  of B. The data from both the parties are sent to the hacker and the
  hacker redirects the data to the destination party after stealing the
  data required. While the two parties think that they are communicating
  with each other they are communicating with the hacker. You can
  prevent MITM attack by using the following practices: Use VPN, use
  strong WEP/WPA encryption, Use Intrusion Detection Systems, Force
  HTTPS, Public Key Pair Based Authentication.

- **How can you prevent man in the middle (M.I.T.M) attack? Now to
  answer that question, allow me to first tell you what is MITM
  attack?** A MITM attack happens when a communication between two
  parties (systems) is intruded or intercepted by an outside entity.
  This can happen in any form of online communication such as email,
  social media web surfing etc. They are trying to eavesdrop on your
  private conversations, then they can also target all the information
  inside your devices and the outcome could be catastrophic. Now here
  are some methods to prevent such attack, The first method to prevent
  this attack would be an encryption (preferably public key encryption)
  between both the parties. This way, they both will have an idea with
  whom they are talking because of the digital verification. The second
  method is to avoid open Wi-Fi networks and if it is necessary then use
  plugins like HTTPS, Forced TLS etc.

- **Man-in-the-middle attack countermeasures** Have a stronger WAP/WEP
  Encryption on wireless access points avoids unauthorized users. Use a
  VPN for a secure environment to protect sensitive information. It uses
  key-based encryption. Public key pair-based authentication must be
  used in various layers of a stack for ensuring whether you are
  communicating the right things are not. HTTPS must be employed for
  securely communicating over HTTP through the public-private key
  exchange.

- Man-in-the-middle attack Prevention Have a stronger WAP/WEP Encryption
  on wireless access points avoids unauthorized users. Use a VPN for a
  secure environment to protect sensitive information. It uses key-based
  encryption. Public key pair-based authentication must be used in
  various layers of a stack for ensuring whether you are communicating
  the right things are not. HTTPS must be employed for securely
  communicating over HTTP through the public-private key exchange.

- Man-in-the-Middle Attack When users or devices access a remote system
  over the internet, they assume they are communicating directly with
  the server of the target system. In a Man in the M attack, attackers
  break this assumption, placing themselves in between the user and the
  target server. Once the attacker has intercepted communications, they
  may be able to compromise a user’s credentials, steal sensitive data,
  and return different responses to the user.

- **Man-in-the-middle attack** When users or devices access a remote
  system over the internet, they assume they are communicating directly
  with the server of the target system. In a Man in the Middle attack,
  attackers break this assumption, placing themselves in between the
  user and the target server. Once the attacker has intercepted
  communications, they may be able to compromise a user’s credentials,
  steal sensitive data, and return different responses to the user.

- **Man-in-the-Middle Attack-Prevention** Recommended to use VPN or
  Tunneling to prevent unauthorized interception of communication. This
  will prevent the manipulation of data sent between the two parties.
  Data encryption in transit

- **MITM attack** used to spy on SSL connections, interactive
  man-in-the-middle proxy, allows traffic to be inspected and edited on
  fly **mitmproxy.**

- **Session Hijacking-MITM attack** MITM attack is used to intrude into
  an existing connection between systems and to intercept messages being
  exchanged. Attackers use different techniques and split the TCP
  connection into two connections Client-to-attacker connection,
  Attacker-to-server connection. After the successful interception of
  TCP connection, an attacker can read, modify, and insert fraudulent
  data into the intercepted communication. In the case of an http
  transaction, the TCP connection between the client and the server
  becomes the target.

- **Web server attack-Man-in-the-Middle (MITM)** attacks allow an
  attacker to access sensitive information by intercepting and altering
  communications between an end-user and web servers. Attacker acts as a
  proxy such that all the communication between the user and web server
  passes through him.

# Broken Access Control 

Broken access control is a method used by attackers where a particular
flaw has been identified related to the access control, where
authentication is bypassed and the attacker compromises the network.

- **Broken Access Control** Most web applications verify function level
  access rights before making that functionality visible in the UI.
  However, applications need to perform the same access control checks
  on the server when each function is accessed. If requests are not
  verified, attackers will be able to forge requests in order to access
  functionality without proper authorization.

- **Broken Access Control** Most web applications verify function level
  access rights before making that functionality visible in the UI.
  However, applications need to perform the same access control checks
  on the server when each function is accessed. If requests are not
  verified, attackers will be able to forge requests in order to access
  functionality without proper authorization.

- **Broken Access Control vulnerability identification** Bypassing
  access control checks by modifying the URL, internal application
  state, or HTML page or using custom API attack tool. Allowing primary
  key to be changed to other users’ records, permitting viewing, or
  editing someone else’s account. Elevation of privilege, acting as a
  user without being logged in, or acting as admin when logged in as
  normal user. Metadata manipulation, such as replaying or tampering
  with JSON Web Token access control token or cookie, or hidden field,
  manipulated to elevate privilege or abusing JWT invalidation. Force
  browsing to authenticated pages as an unauthenticated user or to
  privilege pages as a standard user. Accessing API with missing access
  control for POST, PUT and DELETE.

- **How to identify the broken access control vulnerability?** Bypassing
  access control checks by modifying the URL, internal application
  state, or HTML page or using custom API attack tool. Allowing primary
  key to be changed to other users’ records, permitting viewing, or
  editing someone else’s account. Elevation of privilege, acting as a
  user without being logged in, or acting as admin when logged in as
  normal user. Metadata manipulation, such as replaying or tampering
  with JSON Web Token access control token or cookie, or hidden field,
  manipulated to elevate privilege or abusing JWT invalidation. Force
  browsing to authenticated pages as a unauthenticated user or to
  privilege pages as a standard user. Accessing API with missing access
  control for POST, PUT and DELETE.

**Concept:**

***Broken Access Control:** Most web applications verify function level
access rights before making that functionality visible in the UI.
However, applications need to perform the same access control checks on
the server when each function is accessed. If requests are not verified,
attackers will be able to forge requests in order to access
functionality without proper authorization.*

 

 

**How to identify the Broken Access Control vulnerability?**

- *Bypassing access control checks by modifying the URL, internal
  application state, or HTML page or using custom API attack tool.*

- *Allowing primary key to be changed to other users’ records,
  permitting viewing or editing someone else’s account.*

- *Elevation of privilege, acting as a user without being logged in, or
  acting as admin when logged in as normal user.*

- *Metadata manipulation, such as replaying or tampering with JSON Web
  Token access control token or cookie, or hidden field, manipulated to
  elevate privilege or abusing JWT invalidation*

- *Force browsing to authenticated pages as a unauthenticated user or to
  privilege pages as a standard user.*

- *Accessing API with missing access control for POST, PUT and DELETE.*

- **Broken Access Control**: Broken access control is a method used by
  attackers where a particular flaw has been identified related to the
  access control, where authentication is bypassed and the attacker
  compromises the network.

<!-- -->

- Most web applications verify function level access rights before
  making that functionality visible in the UI. However, applications
  need to perform the same access control checks on the server when each
  function is accessed. If requests are not verified, attackers will be
  able to forge requests to access functionality without proper
  authorization.

**How to identify the Broken Access Control vulnerability?**

- Bypassing access control checks by modifying the URL, internal
  application state, or HTML page or using custom API attack tool.

- Allowing primary key to be changed to other users’ records, permitting
  viewing or editing someone else’s account.

- Elevation of privilege, acting as a user without being logged in, or
  acting as admin when logged in as normal user.

- Metadata manipulation, such as replaying or tampering with JSON Web
  Token access control token or cookie, or hidden field, manipulated to
  elevate privilege or abusing JWT invalidation

- Force browsing to authenticated pages as a unauthenticated user or to
  privilege pages as a standard user.

- Accessing API with missing access control for POST, PUT and DELETE.

# MAC Attacks

- **MAC Address** is the acronym for Media Access Control address. MAC
  addresses are used to uniquely identify network interfaces for
  communication at the physical layer of the network.

- **MAC attacks countermeasures** Configuring Port Security on Cisco
  switch. Port security can be used to restrict inbound traffic from
  only a selected set of MAC addresses and limit MAC flooding attack.

- **MAC Flooding** MAC flooding involves flooding of CAM tables with
  fake MAC addresses and IP pairs until it is full. Switch then acts as
  a hub by broadcasting packets to all machines on the network and
  attackers can sniff the traffic easily. Fail Open mode the switch
  starts behaving as a hub and broadcasts the incoming traffic through
  all the ports in the network.

- **MAC spoofing countermeasures** Use DHCP Snooping Binding Table,
  Dynamic ARP Inspection, and IP Source Guard. Encryption, Retrieval of
  MAC Address  

- **MAC spoofing technique Windows**  

- **MAC spoofing tool-IRDP Spoofing** ICMP Router Discovery Protocol
  (IRDP) is a routing protocol that allows hosts to discover the IP
  addresses of active routers on their subnet by listening to router
  advertisement and solicitation messages on their network. Attacker
  sends spoofed IRDP router advertisement message to the host on the
  subnet, causing it to change its default router to whatever the
  attacker chooses. This attack allows attackers to sniff the traffic
  and collect the valuable information from the packets. Attackers can
  use IRDP spoofing to launch man-in-the-middle, denial-of-service, and
  passive sniffing attacks.

- **MAC spoofing tool-SMAC** is a MAC Address Changer (Spoofer) that
  allows users to change MAC addresses for any network interface cards
  (NIC) on the Windows systems.

- **MAC spoofing/duplicating attack** is launched by sniffing a network
  for MAC addresses of clients who are actively associated with a switch
  port and re-using one of those addresses. By listening to the traffic
  on the network, a malicious user can intercept and use a legitimate
  user's MAC address to receive all the traffic destined for the user.
  This attack allows an attacker to gain access to the network and take
  over someone's identity already on the network.

- **MAC spoofing-switch port stealing** sniffing technique uses MAC
  flooding to sniff the packets. Attacker floods the switch with forged
  gratuitous ARP packets with target MAC address as source and his own
  MAC address as destination. A race condition of the attacker's flooded
  packets and target host packets will occur and thus the switch must
  change his MAC address binding constantly between two different ports.
  In such a case if the attacker is fast enough, they will be able to
  direct the packets intended for the target host toward his switch
  port. Attacker now manages to steal the target host switch port and
  sends an ARP request to the stolen switch port to discover the target
  hosts' IP address. When an attacker gets an ARP reply, this indicates
  that the target host's switch port binding has been restored and the
  attacker is now able to sniff the packets sent toward the targeted
  host.

# The End
