Distributed Denial of Service (DDoS) Attacks
Attackers flood Azure resources (VMs, web apps, APIs) with excessive traffic, causing service disruption or downtime.
*Azure Context:* Azure services can be overwhelmed, especially public-facing endpoints like Azure App Service or Azure Front Door.

Mitigation:
Use Azure DDoS Protection Standard for automatic traffic filtering and mitigation.
Employ Azure Front Door or Azure Application Gateway with Web Application Firewall (WAF) to absorb and filter attacks.
Configure rate limiting via Azure API Management or WAF policies.
Architect for scalability and traffic spikes with autoscaling.
---





**2. Denial of Service (DoS)**

Overwhelms an Azure resource (e.g., web apps or VMs) with excessive
traffic, disrupting legitimate access.

**Mitigation:** Azure DDoS Protection Basic/Standard, autoscaling, Web
Application Firewall (WAF).

\---

**3. Distributed Denial of Service (DDoS)**

Coordinated DoS from multiple sources targeting Azure endpoints like
Application Gateway, Front Door, or APIs.

**Azure Defense:** Azure DDoS Protection + Azure Traffic Manager for
geo-distribution.





## DDOS Attack

* **27. Explain DDOS attack and how to prevent it?**

This again is an important Cybersecurity Interview Question. A **DDOS(Distributed Denial of Service)** attack is a cyberattack that causes the servers to refuse to provide services to genuine clients. DDOS attack can be classified into two types:

1. **Flooding attacks**: In this type, the hacker sends a huge amount of traffic to the server which the server cannot handle. And hence, the server stops functioning. This type of attack is usually executed by using automated programs that continuously send packets to the server.
2. **Crash attacks:** In this type, the hackers exploit a bug on the server resulting in the system to crash and hence the server is not able to provide service to the clients.

You can prevent DDOS attacks by using the following practices:

* Use Anti-DDOS services
* Configure Firewalls and Routers
* Use Front-End Hardware
* Use Load Balancing
* Handle Spikes in Traffic



* What is a DDoS attack?



* What is a DDoS attack?
* How can you prevent DOS/DDOS attack?
* **What is a DDOS attack and how to stop and prevent them?** A DDOS (distributed denial-of-service ) is a malicious attempt of disrupting regular traffic of a network by flooding with many requests and making the server unavailable to the appropriate requests. The requests come from several unauthorized sources and hence called distributed denial of service attack. The following methods will help you to stop and prevent DDOS attacks: Build a denial-of-service response plan, Protect your network infrastructure, Employ basic network security, Maintain strong network architecture, Understand the Warning Signs, Consider DDoS as a service
* What is a DDoS attack?
* **DDoS and its mitigation?** **🡪** DDoS stands for distributed denial of service. When a network/server/application is flooded with large number of requests which it is not designed to handle making the server unavailable to the legitimate requests. The requests can come from different not related sources hence it is a distributed denial of service attack. It can be mitigated by analysing and filtering the traffic in the scrubbing centres. The scrubbing centres are centralized data cleansing station wherein the traffic to a website is analysed and the malicious traffic is removed.
* **What is a denial of service (DOS) attack and what are the common forms?** DOS attacks involve flooding servers, systems, or networks with traffic to cause overconsumption of victim resources. This makes it difficult or impossible for legitimate users to access or use targeted sites. Common DOS attacks include: Buffer overflow attacks, ICMP flood, SYN flood, Teardrop attack, Smurf attack.
* What is a designated confirmer signature?
* **What is a distributed denial-of-service attack (DDoS)?** It is an attack in which multiple computers attack website, server, or any network resource.
* **Explain a buffer overflow attack.** Buffer overflow attack is an attack that takes advantage of a process that attempts to write more data to a fixed-length memory block.



