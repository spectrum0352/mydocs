Proxy Servers
A box/piece of software running on a computer acts an intermediary between two different devices having a session.
Useful for caching information, access control, URL filtering, content scanning.
Most proxies in use are application proxies; Many proxies are multipurpose proxies (HTTP, HTTPS, FTP, etc)
Application-specific
Web proxy
FTP proxy
VOIP proxy
🛑 One of the simplest 'proxies' is NAT (Network Address Translation) - a Network-level proxy.
Forward Proxy - Client
The proxy simply forward the requests of respective client and retrieve the response back to the client.
48 of 178
Hides the client
Provides:
Caching
Content filtering
Acts similar to firewall (block based on URL, content filtering and so on).
Reverse Proxy - Server
Like a forward proxy but complete reverse.
Hides the servers
Provides
High security
Protect the servers
Handle DoS attacks
Load balancing
Caching
Encryption acceleration
Open Proxy
A third-party, uncrontrolled proxy
Can be a significant security concern
Often used to circumvent existing security controls
A significant security concern about open proxies, is that the owner of the proxy can add whatever they'd like
into the network communication. They can send URL request and response with malicious code or redirection to
another malicious website
