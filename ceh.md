# Introduction

Welcome to CEH *Certified Ethical Hacker Exam Cram*. This book is
designed to prepare you to take—and pass—the CEH exam. The CEH exam has
become the leading introductory-level network certification available
today. It is recognized by both employers and industry giants as
providing candidates with a solid foundation of networking concepts,
terminology, and skills.

# Denial of Service

Denial of service (DoS) attacks, as the name suggests, are not about
breaking into a system but rather about denying legitimate users the
opportunity to use the system. In most cases, a DoS attack is easy to
execute. This makes DoS attacks a very serious problem. Every technology
has limits; if you can exceed those limits, then you can make a system
unusable.

> If you can correctly answer these CramSaver questions, save time by
> skimming the Exam Alerts in this section and then completing the Cram
> Quiz at the end of the section. If you are in any doubt at all, read
> everything in this chapter.

1.  Sharia has detected an attack on her company web server. In this
    attack, the message body is sent quite slowly. What best describes
    this attack?

    1.  Slowloris

    2.  HTTP post

    3.  Smurf

    4.  PDoS

2.  Todd is concerned about DoS attacks against his network. He is
    particularly worried about attacks that used malformed ICMP packets.
    What type of attack is Todd concerned about?

    1.  PoD

    2.  Teardrop

    3.  PDoS

    4.  Smurf

3.  How does SPI help mitigate DoS?

    1.  By detecting anomalies in the stream such as too many SYN
        packets from the same IP source

    2.  By blocking fake IP addresses and sending their traffic to a
        black hole

    3.  By carefully examining each packet and tracing back its origin

    4.  By encrypting traffic, preventing many attacks

> Answers

1.  **B.** This is an HTTP post attack. Slowloris involves partial HTTP
    requests.

2.  **A.** This is a PoD (ping of death) attack.

3.  **A.** SPI (stateful packet inspection) looks at not just the
    individual packet but all the packets that came before it in the
    session. It can detect a range of DoS attacks.

## Protocol Attacks

A protocol attack tries to exploit some vulnerability in the protocol
being used. Exploiting such vulnerabilities can cause a system to become
unresponsive. The magnitude of a protocol attack is measured in packets
per second (pps).

as well as how the magnitude is measured for each category.

### TCP SYN Flood Attacks

A TCP SYN flood attack is an older type of DoS attack, but it
illustrates the concepts of denial of service quite well. This
particular type of attack depends on the hacker’s knowledge of how
connections to a server are made. When a session is initiated between a
client and a server in a network using TCP, a packet is sent to the
server with a 1-bit flag called a SYN flag set. (SYN is short for
synchronize.) This packet is asking the target server to synchronize
communications. The server allocates appropriate resources and then
sends to the client a packet with both the SYN (synchronize) and ACK
(acknowledge) flags set. The client machine is then supposed to respond
with an ACK flag set. This process, called a three-way handshake, is
summarized as follows:

1.  The client sends a packet with the SYN flag set.

2.  The server allocates resources for the client and then responds with
    the SYN and ACK flags set.

3.  The client responds with the ACK flag set.

There have been a number of well-known SYN flood attacks on web servers.
This attack type is popular because any machine that engages in TCP
communication is vulnerable to it—and all machines connected to the
Internet engage in TCP communications. Such communication is obviously
the entire reason for web servers. The easiest way to block DoS attacks
is via firewall rules.

### Teardrop Attacks

Fragmentation attacks in general try to prevent targets from being able
to reassemble packet fragments. They usually involve sending a large
number of fragmented packets to the target. A teardrop attack is a
specific type of fragmentation attack. In a teardrop attack, the
attacker sends a fragmented message, where the two fragments overlap in
ways that make it impossible to reassemble them properly without
destroying the individual packet headers. Therefore, when the victim
attempts to reconstruct the message, the message is destroyed. This
causes the target system to halt or crash. There are a number of
variations on the basic teardrop attack, such as TearDrop2, Boink,
targa, Nestea Boink, NewTear, and SYNdrop.

### ACK Flood Attacks

As the name suggests, an ACK flood attack involves sending a flood of
TCP ACK packets. Normally an ACK packet is an acknowledgment of
something being received, be it data or a synchronization request. Some
devices or services are stateful, which means they process each packet.
When a target receives a flood of ACK packets, it tries to process it
but, because it is not actually an acknowledgment of anything, it can
overwhelm the target.

### TCP State Exhaustion Attacks

There are a variety of state exhaustion attacks, and the idea behind
them all is essentially the same. They attack weaknesses in Layers 3 and
4 of the protocol stack and overconsume resources. Invalid name queries
to a DNS server are a type of state exhaustion attack. TCP state
exhaustion attacks operate on some aspect of the TCP handshake. For
example, a SYN flood attack is a type of TCP state exhaustion.

## Application Layer Attacks

Application layer DoS attacks work to consume a given application’s
resources. The magnitude is usually measured in requests per second
(rps). Basically, overwhelming a target server with too many requests is
the basis for most application layer attacks.

### HTTP Post DoS Attacks

An HTTP post DoS attack involves sending a legitimate HTTP post message.
Part of the post message is the content length, which indicates the size
of the message to follow. In this type of attack, the attacker sends the
actual message body at an extremely slow rate. The web server is then
hung as it waits for the message to complete. For more robust servers,
the attacker needs to use multiple HTTP post attacks simultaneously.

### Slowloris Attacks

A Slowloris attack is another attack against web servers. The attacker
sends partial HTTP requests. When the target receives these requests, it
opens a connection and waits for the requests to complete. But rather
than complete a request, the attacker continues to send multiple partial
requests. Eventually, the server has opened so many connections that it
exhausts its maximum connection pool limit and can no longer respond to
legitimate requests.

## Volumetric Attacks

All volumetric attacks seek to overwhelm the target with an overwhelming
number of packets. These attacks are not particularly sophisticated or
difficult. They simply overwhelm the target. The magnitude of a
volumetric attack is usually measured in bits per second (bps).

### Smurf IP Attacks

A UDP attack is a type of volumetric attack, and a Smurf attack is a
very popular version of a DoS attack. An ICMP (Internet Control Message
Protocol) packet is sent out to the broadcast address of the network.
The network responds by echoing the packet out to the network hosts,
which then send it to the spoofed source address. Also, the spoofed
source address can be anywhere on the Internet, not just on the local
subnet. A hacker who can continually send such packets can cause the
network itself to perform a DoS attack on one or more of its member
servers. This attack is clever and rather simple. The only problem for
the hacker is getting the packets started on the target network. This
task can be accomplished via some software, such as a virus or Trojan
horse, that begins sending the packets.

In a Smurf attack, there are three people/systems involved: the
attacker, the intermediary (who can also be a victim), and the victim.
The attacker first sends an ICMP echo request packet to the
intermediary’s IP broadcast addresses. Since this is sent to the IP
broadcast address, many of the machines on the intermediary’s network
receive this request packet and send back an ICMP echo reply packet. If
all the machines on a network are responding to this request, the
network becomes congested, and there may be outages.

The attacker impacts the third party—the intended victim—by creating
forged packets that contain the spoofed source address of the victim.
Therefore, when all the machines on the intermediary’s network start
replying to the echo request, those replies flood the victim’s network.
Thus, another network becomes congested and could become unusable. This
type of attack is illustrated in Figure 4.4 in Chapter 4, “Malware.”

### UDP Flood Attacks

The UDP flood attack is another example of a volumetric attack. Keep in
mind that UDP (User Datagram Protocol) is a protocol that does not
verify each packet’s delivery. In a UDP flood attack, the attacker sends
a UDP packet to a random port on a target system. When the target system
receives a UDP packet, the attacker determines what application is
listening on the destination port. Then, if the attacker wants to attack
that application, he or she just starts a flood of UDP packets to the IP
address and port. If enough UDP packets are delivered to ports on the
target, the system becomes overloaded trying to determine awaiting
applications (which do not exist) and then generating and sending
packets back.

### ICMP Flood Attacks

The ICMP flood attack is another volumetric attack. ICMP flood attacks
are usually accomplished by broadcasting a large number of either pings
or UDP packets. Like other flood attacks, the idea is to send so much
data to the target system that the system slows down. If it can be
forced to slow down enough, the target will time out (i.e., not send
replies fast enough) and be disconnected from the Internet. This type of
attack is far less effective against modern computers than it was
against older ones. Even a low-end desktop PC now has 4 GB (or more) of
RAM and a dual-core processor, making it difficult to generate enough
pings to knock the machine offline. However, at one time, this was a
very common form of DoS attack.

### Ping of Death Attacks

A ping of death attack, often simply called a PoD attack, is
accomplished by sending malformed ICMP packets (e.g., sending a packet
that is 65,536 bytes in size). RFC 791 specifies a maximum packet size
of 65,535 bytes. A PoD attack can cause a vulnerable system to crash.

## Other DoS Attacks

Some DoS attack types don’t fit neatly into one of the previously
discussed categories. These attacks can nonetheless be quite effective
against target systems.

### Multi-Vector Attacks

As the name suggests, a multi-vector attack is a combination of two or
more of the other attacks (e.g., launching a SYN flood attack and a
teardrop attack at the same time). Another method is to launch one type
of attack and then, after a time, to shift to a different attack vector.
This method can overcome DoS countermeasures the target may have
implemented.

### DHCP Starvation Attacks

DHCP (Dynamic Host Configuration Protocol) is used to dynamically assign
IP addresses to systems on a network. If an attacker floods a target
network with DHCP requests for dynamic IP addresses, the attacker can
completely exhaust the address space allocated by the DHCP server. Then
legitimate users cannot get an IP address assigned and thus cannot
connect to the network. There are tools such as gobblers that can do
this for an attacker.

### PDoS Attacks

Though not terribly common, it is possible to have a DoS attack that
leaves the system either inoperable or needing the operating system
completely reinstalled. These are referred to as *permanent denial of
service* (*PDoS*) *attacks*, or plashing. Such attacks usually involve
DoS attacks on a device’s firmware.

### Registration DoS Attacks

A registration DoS attack is a very simplistic attack used against
websites. The attacker creates a script or program that just keeps
registering fake users on a website. This is one reason many
registration websites use CAPTCHA.

### Login DoS Attacks

Login DoS attacks are similar to registration DoS attacks and also
frequently use scripts or programs. The attacker tries to overload the
login process by continually sending login information. This can
overwhelm the target system or at least slow it down. Many websites use
CAPTCHA to prevent automated login attempts.

# DDoS Attacks

Perhaps the most common form of DoS attack today is the *DDoS attack*.
This type of attack is accomplished by getting various machines to
attack the target. This is commonly done by sending out a Trojan horse
that causes infected computers to attack a specified target at a
particular date and time—which is a very effective way to execute a DDoS
attack on any target. In this form of DDoS attack, the attacker does not
have direct control of the various machines used in the attack. These
machines are simply infected by some malware that causes them to
participate in the attack on a particular date and at a particular time.

Another method is to use a botnet to orchestrate a DDoS attack. A
*botnet* is a network of computers that have been compromised by an
attacker so that the attacker has control of the computers. This is
often accomplished via delivery of a Trojan horse. However, unlike in
the previous DDoS example, the attacker has direct control over the
attacking machines in the botnet.

A botnet usually has a command and control (C&C) that controls the
various compromised machines. Then the botnet can be used for whatever
the attacker wishes. DDoS is only one application of a botnet. Password
cracking and sending phishing emails are other uses. The compromised
systems can be attacked in any of the ways that malware is usually
distributed: via phishing emails, compromised websites, vulnerable
target systems, etc.

## Peer-to-Peer Attacks

While peer-to-peer (P2P) apps have become quite popular, so have P2P DoS
attacks. One method is to force the client to disconnect from the
legitimate P2P hub and get the client to connect to the attacker’s fake
hub. There have also been massive DDoS attacks on peer-to-peer networks.
In addition, attackers attempt to exploit flaws in the protocols used,
such as the Direct Connect (DC++) protocol that is used to share files
between peer-to-peer clients.

## Distributed Reflection DoS Attacks

As previously stated, DDoS attacks are becoming more common. Most such
attacks rely on getting various machines (i.e., servers or workstations)
to attack the target. A distributed reflection DoS attack is a special
type of DoS attack. As with all such attacks, it is accomplished by the
hacker getting a number of machines to attack the selected target.
However, this attack works a bit differently than other DoS attacks.
Rather than getting computers to attack the target, this method tricks
Internet routers into attacking a target.

Many of the routers on the Internet backbone communicate on port 179,
particularly using BGP (Border Gateway Protocol) to exchange routing
information. A distributed reflection DoS attack exploits that
communication line and gets routers to attack a target system. What
makes this attack particularly wicked is that it does not require the
routers in question to be compromised in any way. The attacker does not
need to get any sort of software on a router to get it to participate in
the attack. Instead, the hacker sends a stream of packets to the various
routers, requesting a connection. The packets have been altered so that
they appear to come from the target system’s IP address. The routers
respond by initiating connections with the target system. What occurs is
a flood of connections from multiple routers, all hitting the same
target system. This has the effect of rendering the target system
unreachable.

## Common Tools Used for DoS Attacks

As with any of the other security issues discussed in this book, you
will find that hackers have at their disposal a vast array of tools in
the DoS arena. While it is certainly well beyond the scope of this book
to begin to categorize or discuss all of these tools, a brief
introduction to just a few of them will prove useful.

## LOIC

LOIC (Low Orbit Ion Cannon) is one of the most widely known DoS tools
available. It has a very easy-to-use graphical user interface, shown in
Figure 6.1.

This tool is very easy to use. As you can see in Figure 6.1, it simply
requires the user to enter the target URL or IP address and then begin
the attack. Fortunately, this tool also does nothing to hide the
attacker’s address and thus makes it relatively easy to trace the attack
back to its source. It is an older tool but still widely used today.
There is a tool similar to this named HOIC, which we discuss later in
this section.

## DoSHTTP

DoSHTTP is another tool that is simple to use. You select the target,
the agent (i.e., the browser type to simulate), the number of sockets,
and the requests and then start the flood. You can see this in Figure
6.2.

## XOIC

XOIC, which is similar to LOIC, has three modes: send a message, execute
a brief test, or start a DoS attack. You can see these options in Figure
6.3.

Like LOIC, XOIC is very easy to use. It is just a point-and-click
graphical user interface. Even attackers with minimal skill can launch a
DoS attack using

## HOIC

HOIC (High Orbit Ion Cannon) was developed by the Anonymous collective
as an improvement on LOIC. It is available at
https://sourceforge.net/projects/ highorbitioncannon/. Although HOIC was
meant to be more powerful than

LOIC, it still has a very simple user interface, which can be seen in
Figure 6.4.

## Other Tools for DoS and DDoS Attacks

There are many other tools for DoS and DDoS. A few are listed here:

> ▶ **Hulk:** A Python script, available at
> https://github.com/grafov/hulk
>
> ▶ **DAVOSET:** A command line tool for DoS attacks, available at
> https://github.com/MustLive/DAVOSET
>
> ▶ **R-U-Dead-Yet (RUDY):** Tool that uses POST attacks, available at
> https://sourceforge.net/projects/r-u-dead-yet/
>
> ▶ **AnDOSid:** An Android tool for DoS, available at
> <https://www.hackingtools.in/free-download-andosid/>

## Countermeasures to DoS and DDoS Attacks

The CEH exam will ask you about countermeasures to DoS and DDoS attacks.
A few of them have already been discussed. For example, CAPTCHA can
mitigate web DoS attacks. In general, three categories can be used in
the case of overwhelming attacks:

> ▶ Simply shut down the targeted service. This is usually not a good
> choice, as it essentially means capitulating to the attack.
>
> ▶ Keep the critical services functioning by stopping noncritical
> services and use those resources for the critical services.
>
> ▶ Absorb the attack. This method is popular with internet service
> providers (ISPs; for an added charge). When the ISP detects a DoS or
> DDoS attack in progress, it allocates additional bandwidth to absorb
> that attack.

A good antivirus approach coupled with regular system updates can
prevent one of your systems from becoming compromised and becoming part
of a botnet. Filtering incoming and outgoing traffic to your network can
also mitigate DoS attacks. Rate limiting any service or IP address so
that it can consume only a finite percentage of resources also helps
mitigate DoS attacks.

Honeypots are gaining popularity in deflecting all sorts of attacks,
including DoS attacks. A *honeypot* is a fake system set up for the sole
purpose of attracting hackers. Essentially, if a honeypot looks
realistic enough, the attacker may go after it rather than after a real
system.

Robust network configuration can also help mitigate DoS attacks. Load
balancing critical services is a very good first step in helping
mitigate DoS attacks. Throttling or limiting traffic for a given service
can also help. Being able to drop incoming requests when a certain
threshold is reached is also helpful.

There is actually a standard for filtering. RFC 3704, “Ingress Filtering
for Multihomed Networks,” is a standard to help limit the impact of DDoS
attacks by blocking any traffic with spoofed IP addresses.

Black hole filtering is another common technique. A *black hole* is a
network location where traffic is simply discarded/dropped, typically by
sending traffic to an IP address that is not in use. When a DoS attack
is detected, suspected DoS traffic can be forwarded to the network black
hole.

As mentioned earlier in this book, the CEH exam has a strong emphasis on
Cisco. You therefore need to be familiar with a couple Cisco commands
that can help mitigate DoS attacks:

> ▶ **access-list access-list-number {deny \| permit} tcp any
> destination destination-wildcard:** Defines an IP extended access list
>
> ▶ **ip tcp Intercept list access-list-number:** Enables TCP intercept

There are also a number of devices that can be added to a network to
help mitigate DoS attacks, including:

> ▶ FortiDDoS-1200B
>
> ▶ Cisco Guard XT 5650
>
> ▶ Cisco IP reputation filtering
>
> ▶ Check Point DDoS Protector
>
> ▶ Active Reach DDoS mitigation device
> https://activereach.net/solutions/
> network-security/protect/ddos-mitigation/perimeter-ddos-mitigation/
>
> ▶ Verizon DDoS Shield https://www.verizon.com/business/products/
> security/network-cloud-security/ddos-shield/
>
> ▶ Netscout DDoS protection https://www.netscout.com/solutions/
> ddos-protection
>
> ▶ F5 DDoS protection
> https://www.f5.com/solutions/application-security/ ddos-protection
>
> ▶ DDoS Mitigation https://www.a10networks.com/products/thunder-tps/
> There are also software solutions that can help mitigate DoS attacks:
>
> ▶ **Anti DDoS Guardian:** http://www.beethink.com
>
> ▶ **DOSarrest’s DDoS Protection Service:** https://www.dosarrest.com
>
> ▶ **DDoS-GUARD:** https://ddos-guard.net

SPI (stateful packet inspection) is an excellent way to mitigate DoS
attacks. Many modern firewalls use SPI. These types of firewalls not
only apply rules to each packet but maintain the state of communication
between the client and the server. As an example of how this mitigates
attacks, the firewall realizes that multiple SYN packets are coming from
the same IP address and then blocks those packets. This is one major
reason SYN floods are not seen much today. In addition, next-generation
firewalls (NGFWs) combine traditional firewall capabilities and other
functions, such as those of an application firewall or an intrusion
detection system/prevention system (IDS/IPS). Using a modern advanced
firewall is an excellent way to mitigate DoS and DDoS attacks.

## DoS in the Real World

According to the security consulting firm Calyptix Security, the first
quarter of 2018 set records for DoS and DDoS attacks. This included a
massive DDoS attack against the GitHub site on February 28, 2018,
peaking at 1.3 Tbps. This illustrates how effective and damaging these
attacks can be, for the amount of data sent in DoS attacks is growing
all the time.

One creative example comes from 2017. In February 2017, a new DDoS
attack vector emerged. Attackers used memcache, a database caching
system, to amplify traffic volume. A request could be amplified by a
factor of several thousand by using this method. The aforementioned
GitHub attack involved memcaching. This illustrates that new methods of
DoS are being developed, and you should expect to see them out in the
real world (though not on the CEH exam).

## Session Hijacking

Answer these questions. The answers follow the last question. If you
cannot answer these questions correctly, consider reading this section
again until you can.

1.  What Cisco command enables TCP intercept?

- A. access-list access-list-number {deny \| permit} tcp any destination
  destination-wildcard

- B. ip tcp Intercept list access-list-number

- C. ip tcp Intercept-enable

- D. access-list access-list-number intercept-enable

2.  Which attack is based on an ICMP (Internet Control Message Protocol)
    packet sent to the broadcast address of the network?

- ❍ A. Teardrop attack

- ❍ B. Slowloris attack

- ❍ C. Smurf attack

- ❍ D. PDoS attack

3.  What is the most effective countermeasure for registration DoS
    attacks?

- ❍ A. Using an SPI firewall

- ❍ B. Using CAPTCHA

- ❍ C. Encrypting traffic

- ❍ D. Using Cisco configuration

1.  **C.** If you are not familiar with Cisco router/switch commands,
    this can be one of the more challenging parts of the CEH exam.

2.  **B.** A Smurf attack works by sending a flood of broadcast messages
    to the target system router, impersonating the target machine’s IP
    address.

3.  **B.** This is one reason so many sites use CAPTCHA: It prevents
    scripts from running registration DoS attacks.

# Session Hijacking

Conceptually, session hijacking is quite simple. The goal is to find an
authentic TCP session and to take over that session. This is possible
because, generally speaking, the session is authenticated at the
beginning. Clearly, session hijacking is easier with some systems than
with others.

If you can correctly answer these CramSaver questions, save time by
skimming the Exam Alerts in this section and then completing the Cram
Quiz at the end of the section. If you are in any doubt at all, read
everything in this chapter.

1.  What type of session hijacking begins with the attacker attempting
    to get the user to authenticate to the target server, using a
    session ID prechosen by the attacker?

    1.  Man-in-the-browser

    2.  Session fixation

    3.  Session replay

    4.  Man-in-the-middle

2.  Mohanned has discovered malware on a machine. This malware has an
    interface like a web browser library and appears to be intercepting
    browser calls. What type of attack is this?

    1.  Trojan horse

    2.  Session fixation

    3.  Man-in-the-middle

    4.  Man-in-the-browser

3.  Gerard, who is a web developer, is concerned about session hijacking
    and is using the HTTPOnly flag. What does this flag do?

    1.  Permits only HTTP and not HTTPS

    2.  Only allows cookies to be accessed via HTTP

    3.  Prevents scripts running on the client

    4.  Logs all HTTP request queries and nothing else

Answers

1.  **B.** This is a classic description of session fixation.

2.  **D.** This is a man-in-the-browser attack. A man-in-the-browser
    attack is a special type of man-in-the-middle attack, and it is
    possible that the malware was delivered via a Trojan horse, but the
    best answer is man-in-the-browser.

3.  **B.** Allowing cookies to be accessible only via HTTP prevents
    client-side scripts or malware from manipulating cookies.

Several factors can make a system more vulnerable to session hijacking.
Having a weak session ID generation algorithm is a common issue. This
makes predicting or guessing session IDs much easier. Having no
expiration or having a very long expiration on a session also increases
the possibilities for an attacker.

There are two types of session hijacking:

> ▶ **Active:** In active session hijacking, the attacker identifies an
> active session and takes over that session.
>
> ▶ **Passive:** In passive hijacking, the attacker just sniffs the
> traffic. This is not true session hijacking but is identified as
> passive session hijacking by the
>
> CEH exam.

## The Session Hijacking Process

The CEH exam defines a process of five steps for session hijacking. An
attacker won’t always follow this process, but you should know it for
the CEH exam:

1.  Sniff the traffic going to the target so you can learn about how
    sessions are handled. This involves using a packet sniffer such as
    Wireshark or tcpdump (discussed in Chapter 2, “Enumeration and
    Vulnerability Scanning”) to see what is being sent between a client
    and a server.

2.  Monitor the traffic to determine if you can predict the next valid
    sequence number or session ID.

3.  Break the connection to the legitimate client.

4.  Take over the session, posing as that client using a session and/or
    sequence ID that will appear legitimate to the target server.

5.  Perform command injection, or inject packets into the target server.

# Specific Session Hijacking Methods

There are a number of mechanisms for getting a session token in order to
take over a session. If data is unencrypted, you may be able to derive
this information through packet sniffing. Or if the target uses a simple
session ID, such as a date/time stamp, it is easy to predict the next
session ID. However, there are other methods, as described in the
following subsections.

## Web Session Hijacking

If the target is a web server, cross-site scripting (XSS) might be able
to derive a token. XSS uses malicious JavaScript. The most typical
method of XSS is to insert the JavaScript into a website in a place
where users normally enter text for other users to read, such as product
reviews. However, it is also possible to send malicious scripts as part
of an email. Or a phishing email may be able to get a user to a website
that has malicious JavaScript built in.

Cross-site request forgery (CSRF) attacks an active session with a
trusted site. The attacker might have a malicious link on some
compromised site. Often users have more than one browser open at a time.
If a user visits a compromised site and clicks on the link while they
also have an active session open, the attacker can get the user’s
session ID for the target site. Then the attacker sends requests to the
target website, posing as the user. Both XSS and CSRF are listed as
OWASP (Open Web Application Security Project) top 10 vulnerabilities.

Session fixation is another method of session hijacking. The attacker
tries to get the user to authenticate to the target server, using a
session ID prechosen by the attacker. This works only if the server has
a very weak session ID generation scheme—one that the attacker can
readily emulate to produce a session ID that appears legitimate to the
server.

Session replay attacks are still covered on the CEH exam, but they
rarely work today. Such an attack involves simply intercepting
authentication packets and re-sending them to the target. Although
modern authentication methods make such attempts ineffective, you should
be aware of this type of attack for the

CEH exam.

Variations of the man-in-the-middle attack work whether the target is a
web server or not. The attacker sits between the client and server, via
a fake access point, a fake website, or using one of many other methods.
One variation of the man-in-the-middle attack is the forbidden attack.
This is targeted to older, flawed implementations of TLS. Older TLS
versions would sometimes reuse a nonce (short for *number only used
once*) during the TLS handshake, which made them vulnerable. The
attacker would sniff the nonce and then use it to authenticate to the
server. (Remember that TLS \[Transport Layer Security\] is the successor
to SSL \[Secure Sockets Layer\] since 1999. However, many people still
simply say SSL when they mean TLS.)

With a man-in-the-browser attack, malicious software is on the client
machine and behaves like a software library or component that the
browser uses. Then that malware intercepts data going out from the
browser. This is a variation of a man-in-the-middle attack. A number of
malicious Chrome extensions and Firefox add-ins have been
man-in-the-browser malware.

Other attacks specifically target flaws in protocols such as SSL/TLS.
CRIME (Compression Ratio Info-Leak Made Easy) is one such attack.
Essentially, the compression used in earlier versions of TLS was flawed
and could lead to data leaks. There have been similar issues such as the
BREACH attack. BREACH (Browser Reconnaissance and Exfiltration via
Adaptive Compression of Hypertext) is an improvement over CRIME that
attacks an issue with the gzip compression algorithm.

## Network Session Hijacking

TCP/IP hijacking is the process of taking over a TCP connection between
a client and a target machine. It often uses spoofed packets. If the
attacker can cause the client machine to pause or hang, the attacker can
pretend to be the client and send spoofed packets. To do this, the
attacker must know the packet sequence number and be able to use the
next sequence number. Modern authentication methods periodically
re-authenticate, often rendering this type of attack unsuccessful.

RST hijacking is another method. The attacker uses an RST (reset) packet
to spoof the client’s IP address, but also uses the correct sequence
number to cause the connection to reset. This resets the connection and
allows the attacker to take over that session. A number of tools help
craft custom packets, such as Packet Builder from Colasoft.

Some attackers simply inject forged packets into a data stream, spoofing
the source IP address. With this method, the attacker cannot see the
response, and it is thus called *blind hijacking*.

UDP hijacking is similar to TCP/IP hijacking, but using UDP packets. The
attacker spoofs the server, sending the client a forged UDP reply, so
the client connects to the attacker’s machine.

There are a number of tools that can help perform any of these attacks.
One of the most widely used—and heavily emphasized on the CEH exam—is
Burp Suite. Burp Suite can be downloaded from
https://portswigger.net/burp. There is a free community edition, and
there are professional and enterprise editions. Using the default
settings, the main screen of the Burp Suite community edition looks as
shown in Figure 6.5.

The CEH exam won’t test you on all the uses of Burp Suite, but it is
probably a good idea to get familiar with this tool as it is very
helpful in conducting penetration tests. Fortunately, the internet is
replete with tutorials for Burp Suite.

There are other tools that can accomplish similar tasks:

> ▶ **OWASP ZAP:** A tool often touted as a website vulnerability
> scanner, which also allows you to intercept and alter packets,
> available at www.owasp.org
>
> ▶ **WebSploit Framework:** A tool explicitly designed for
> man-in-the-middle attacks, available at
> https://sourceforge.net/projects/websploit/
>
> ▶ **Bettercap:** A tool that is also useful for Bluetooth hacking,
> available at https://www.bettercap.org
>
> ▶ **DroidSheep:** A session hijacking tool that runs on Android,
> available at https://droidsheep.info
>
> ▶ **DroidSniff:** An Android tool designed for security scanning that
> can also be used for man-in-the-middle attacks, available at
> https://github.com/ evozi/DroidSniff

## Countermeasures for Session Hijacking

There are many different methods for mitigating session hijacking. One
of the easiest is to encrypt all data in transit. This includes using
SSH for any secure communications. In addition to ensuring that
communications are encrypted, you should ensure that you are using
up-to-date methods. Earlier in this chapter, we discussed attacks
against TLS vulnerabilities. Using the latest TLS version (which is 1.3
as of this writing) will mitigate or eliminate most of them.

Never use session ID numbers that are easy to predict. They should be
random numbers generated by a robust random number generation algorithm.
Also ensure that session IDs are transmitted securely and that sessions
time out.

Strong authentication techniques such as Kerberos will prevent at least
some session hijacking attacks. Also ensure that you are using the
normal antimalware protections, such as antivirus and intrusion
prevention systems.

Web developers can combat session hijacking attacks on their websites by
using a variety of additional techniques. For example, cookies with
session information should be stored securely (encrypted), and a website
should use the HTTPOnly attribute. HTTPOnly means the cookie can only be
accessed with the HTTP protocol; any script or malware on the client
computer cannot access it.

Websites should check to see that all traffic for a given session is
coming from the same IP address that initiated the session. This will at
least detect many session hijacking techniques. Always have timeouts for
cookies, sessions, and so on. The shorter, the better—but, of course, it
is important to keep user satisfaction in mind.

HTTP Strict-Transport-Security (HSTS) can also help mitigate session
hijacking attacks. HSTS is a server setting that requires browsers to
connect with HTTPS rather than HTTP. This makes all traffic encrypted.
HTTP Public Key Pinning (HPKP) allows a web client to associate a
specific public key with a specific server, so it is harder for an
attacker to spoof a legitimate web server.

Always use secure protocols. Table 6.1 summarizes them.

TABLE 6.1 **Secure Protocol Replacement**

<table style="width:67%;">
<colgroup>
<col style="width: 34%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Insecure Protocol</strong></p>
</blockquote></th>
<th><strong>Secure Replacement</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p>HTTP</p>
</blockquote></td>
<td>HTTPS</td>
</tr>
<tr>
<td><blockquote>
<p>Telnet, rlogin</p>
</blockquote></td>
<td>SSH</td>
</tr>
<tr>
<td><blockquote>
<p>Any TCP/IP traffic</p>
</blockquote></td>
<td>Encrypt with a VPN</td>
</tr>
<tr>
<td><blockquote>
<p>FTP</p>
</blockquote></td>
<td>SFTP or FTPS</td>
</tr>
</tbody>
</table>

Answer these questions. The answers follow the last question. If you
cannot answer these questions correctly, consider reading this section
again until you can.

1.  John is logged into his company web portal using a secure session.
    However, he is simultaneously logged into a site that he did not
    realize has been compromised. What attack might John be vulnerable
    to?

> **❍ A.** Session fixation
>
> **❍ B.** Man-in-the-middle
>
> **❍ C.** Cross-site scripting **❍ D.** Cross-site request forgery

2.  What is the key aspect of RST hijacking?

> **❍ A.** Intercepting RST packets
>
> **❍ B.** Spoofing RST packets to pretend to be the client
>
> **❍ C.** Spoofing RST packets from the client to reset the session
>
> **❍ D.** Blocking RST packets to force the session to stay active

3.  What is the basis of a CRIME attack?

> **❍ A.** Flaws in TLS compression
>
> **❍ B.** Flaws in gzip compression
>
> **❍ C.** Flaws in TLS authentication nonces
>
> **❍ D.** Flaws in cryptographic key generation

**Answers**

1.  **D.** This is a very good description of cross-site request
    forgery.

2.  **C.** Causing the session to reset, making it seem like the client
    sent the reset, can allow the attacker to attempt to hijack the
    session.

3.  **A.** CRIME (Compression Ratio Info-Leak Made Easy) is an attack
    that targets flaws in TLS compression. The compression used in
    earlier versions of TLS was flawed and could lead to data leaks.
