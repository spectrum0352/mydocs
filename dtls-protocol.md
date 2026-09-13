
# DTLS Protocol

**DTLS** (Datagram Transport Layer Security) is a protocol designed to
provide security for applications that use UDP, a connectionless
protocol. It is essentially a version of TLS adapted for UDP-based
communication.

Why DTLS?

- **UDP-based applications:** Many applications, like streaming media
 and online gaming, rely on UDP for its low latency. However, UDP does
 not guarantee delivery or order of packets.

- **Limitations of TLS:** TLS is built for TCP, which is
 connection-oriented and reliable. This makes it unsuitable for UDP.

- **IPsec/IKE complexity:** Using IPsec/IKE for security adds complexity
 and is not always practical.

- **Custom protocol development:** Creating a security protocol from
 scratch is time-consuming and error-prone.

Challenges in Adapting TLS to UDP

- **Unreliable transport:** UDP does not guarantee packet delivery,
 order, or uniqueness, unlike TCP.

- **State management:** TLS relies on state information between packets,
 which is challenging with UDP's unreliability.

DTLS Solution

- **Like TLS:** DTLS shares many concepts with TLS to minimize
 development effort.

- **Handles unreliability:** DTLS incorporates mechanisms to deal with
 lost, reordered, or duplicated packets.

- **Handshake modifications:** The DTLS handshake protocol is adapted to
 handle unreliable UDP communication.

**In essence**, DTLS provides a secure foundation for UDP-based
applications by addressing the challenges of unreliable transport and
maintaining compatibility with TLS where possible.
