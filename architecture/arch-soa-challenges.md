4️⃣ What special security challenges do SOA present?
Service-Oriented Architecture (SOA) exposes services via APIs.
Key Challenges:
Expanded Attack Surface
Multiple exposed services.
Insecure Service Communication
Unencrypted SOAP/REST.
Authentication Weakness
Token replay, JWT misuse.
Service Trust Relationships
Compromise of one service affects others.
XML Attacks
XXE
XML bomb
Lack of API Rate Limiting
DDoS risk.
Mitigation:
API Gateway
mTLS
OAuth2
Zero Trust
Service mesh (Istio)
