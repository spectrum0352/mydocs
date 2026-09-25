Protecting Servers
SSL Accelerator
92 of 178
Dedicated card placed behind the gateweay router between the internet, to handle all SSL/TLS encryption
& decryption going across the network.
Can be done on a dedicated machine
The SSL Accelerator offloads the handshake process to hardware
🛑 SSL Offloading and SSL Termination are the same thing.
Load Balancer
Load balancer is actually a proxy because he takes all the incoming requests for the Web site and then distributes
it around to the servers
Enhance security and efficiency
Distribute the load for multiple servers
Large-scale implementtions
Fault tolerance
Server outages have no effects
Very fast convergence
93 of 178
TCP offload
protocol overhead
SSL offload
offloads the encryption process
Caching
Fast response
Load Balancer - Scheduling
Round-robin: each server is selected in turn
Additional round-robin options
Weighted round-robin: Prioritize the server use
Dynamic round-robin: Monitor the server load and distribute to the server with the lowest use
DDoS Mitigator
A box that can detect when denial of service attacks are coming through.
Will send an alert to emergency response services which assist in traffic flow to the site under attack
Act like a proxy for websites
94 of 178
Other Methods to Mitigate DDoS
Cloud-base provider
Internet provider or reverse proxy service
On-site tools
DDoS filtering in a Firewall or IPS
Positioned between you and the internet
