## DNS Watermarking attack
Attackers embed malicious code or information into DNS responses, allowing them to track user behaviour, compromise systems, or launch other attacks. 
Impact: Can lead to data breaches, malware infections, and other security risks. 

## DNS Hijacking
Attackers intercept and modify DNS requests or responses, redirecting users to malicious websites or servers.

Impact: Can lead to data theft, identity theft, and financial loss.   
To protect against these attacks, organizations should implement robust DNS security measures, such as DNSSEC (Domain Name System Security Extensions), DNS Firewall, and regular security audits.   

## DNS Amplification Attacks
Attackers exploit the DNS protocol's amplification factor to launch DDoS attacks.
They send small DNS queries to numerous DNS resolvers.
Resolvers respond with larger responses, overwhelming the target.

Impact: 
* Can disrupt services and cause downtime.
* Damages a target's reputation.

## DNS Tunnelling
Attackers use the DNS protocol to encrypt and exfiltrate data from a compromised network, bypassing firewalls, and intrusion detection systems.   
Impact: Can lead to data breaches, intellectual property theft, and other security risks.   

## NXDOMAIN Attacks
Attackers exploit the DNS protocol's NXDOMAIN response (Non-Existent Domain) to launch DDoS attacks against a target. They send many requests for non-existent domains, forcing the target to process and respond to each request. 
Impact: Can exhaust a target's resources and cause service disruptions.   

## DNS Spoofing or Cache Poisoning
DNS poisoning is a cyberattack where malicious actors manipulate a DNS server to provide incorrect information. This deception causes users to be redirected to fake websites instead of their intended destinations. By replacing legitimate IP addresses with those controlled by the attacker, DNS poisoning allows hackers to steal sensitive information, spread malware, or disrupt services. This attack exploits vulnerabilities in the DNS system to compromise user trust and security.

DNS spoofing is a type of attack where an attacker manipulates the Domain Name System (DNS) to redirect users to a malicious website.
Attackers inject false DNS records into a DNS resolver's cache, redirecting users to malicious websites or servers.   
Impact: Users are tricked into visiting fraudulent websites, potentially leading to data theft, malware infections, or financial loss. 

Types of DNS Spoofing:
* Local Network Spoofing: This occurs within a local network and often involves ARP poisoning.
* Remote Network Spoofing: This targets individual users by infecting their machines with malware to redirect DNS queries.

### Intranet DNS Spoofing (Local Network) 
For this technique, you must be connected to the local area network (LAN) and be able to sniff packets. It works well against switches with ARP poisoning the router.  
•	Requires LAN access: Attacker must be connected to the same local network as the targets.
•	Packet sniffing: Attacker needs to be able to capture network traffic.
•	ARP poisoning: Attacker manipulates the router's ARP cache to redirect traffic to their machine.
•	Man-in-the-middle position: Attacker becomes the intermediary between network devices and the internet.
•	DNS manipulation: Attacker can intercept and modify DNS requests, redirecting users to malicious websites.
•	Potential consequences: Theft of sensitive data, malware installation, and other malicious activities.

### Internet DNS Spoofing (Remote Network) 
Internet DNS Spoofing, the attacker infects Rebecca's machine with a Trojan and changes her DNS IP address to that of the attacker's. 
•	Target compromise: Attacker infects a victim's machine (e.g., Rebecca's) with malware (Trojan).
•	DNS redirection: Attacker modifies the victim's DNS settings to point to their own malicious server.
•	Man-in-the-middle: All internet traffic from the victim is routed through the attacker's server.
•	Potential consequences: Data interception, identity theft, malware installation, and other malicious activities.

### Proxy Server DNS Poisoning 
Attacker sends a Trojan to Rebecca's machine that changes her proxy server settings in Internet Explorer to that of the attacker's and redirects to a fake website.  
* Victim compromise: Attacker infects the victim's machine (e.g., Rebecca's) with malware (Trojan).
* Proxy server modification: Trojan changes the victim's internet browser (e.g., Internet Explorer) proxy settings to point to the attacker's server.
* Traffic redirection: All internet traffic from the victim is routed through the attacker's proxy server.
* Website redirection: Attacker can redirect the victim to fake or malicious websites.
* Potential consequences: Data interception, identity theft, malware installation, and other malicious activities.

### DNS Cache Poisoning 
DNS cache poisoning refers to altering or adding forged DNS records into the DNS resolver cache so that a DNS query is redirected to a malicious site. If the DNS resolver cannot validate that the DNS responses have come from an authoritative source, it will cache the incorrect entries locally and serve them to users who make the same request.  
* False information: Attacker introduces incorrect DNS records into a DNS resolver's cache.
* Redirected traffic: DNS queries are misdirected to a malicious website.
* Lack of validation: DNS resolver fails to verify the authenticity of DNS responses.
* Cached data: Incorrect DNS information is stored locally and served to multiple users.
* Consequences: Users are unknowingly directed to fraudulent or harmful websites.

### DNS Poisoning Techniques 
* DNS poisoning is a technique that tricks a DNS server into believing that it has received authentic information when it has not. 
* It results in substitution of a false IP address at the DNS level where web addresses are converted into numeric IP addresses. 
* It allows an attacker to replace IP address entries for a target site on a given DNS server with the IP address of the server he/she controls. 
* Attackers can create fake DNS entries for the server (containing malicious content) with the same names as that of the target server. 

### Intranet DNS Spoofing (Local Network) 
* For this technique, you must be connected to the local area network (LAN) and be able to sniff packets. 
* It works well against switches with ARP poisoning the router.  

### Internet DNS Spoofing (Remote Network) 
Internet DNS Spoofing, the attacker infects Rebecca's machine with a Trojan and changes her DNS IP address to that of the attacker's.  

### Proxy Server DNS Poisoning 
Attacker sends a Trojan to Rebecca's machine that changes her proxy server settings in Internet Explorer to that of the attacker's and redirects to a fake website.  

### DNS Cache Poisoning 
DNS cache poisoning refers to altering or adding forged DNS records into the DNS resolver cache so that a DNS query is redirected to a malicious site. If the DNS resolver cannot validate that the DNS responses have come from an authoritative source, it will cache the incorrect entries locally and serve them to users who make the same request.  


