# API security checklist

API SECURITY – 355 CONTROL MASTER MATRIX

API SECURITY – 355 CONTROL MASTER MATRIX - Structured for Audit | VAPT | DevSecOps | Cloud | Production Governance



SECTION 1 – Authentication Controls (AUTH-01 to AUTH-40)
 

Control ID

Domain

Control Name

Control Description

Risk Addressed

Validation Method

Severity

OWASP Mapping

AUTH-01

Authentication

Disable Basic Authentication

Basic authentication must not be enabled in production

Credential theft

Config Review

High

OWASP API2

AUTH-02

Authentication

Enforce OAuth 2.0

OAuth 2.0 must be used for authentication

Token abuse

Architecture Review

High

OWASP API2

AUTH-03

Authentication

Secure JWT Implementation

JWT must comply with RFC 7519

Token forgery

Code Review

High

OWASP API2

AUTH-04

Authentication

Strong Password Hashing

Use bcrypt or Argon2 for password storage

Password cracking

Code Review

High

OWASP API2

AUTH-05

Authentication

Account Lockout

Lock account after defined failed attempts

Brute force

Functional Test

High

OWASP API4

AUTH-06

Authentication

CAPTCHA Enforcement

CAPTCHA after retry threshold

Automation abuse

Functional Test

Medium

OWASP API4

AUTH-07

Authentication

MFA Enforcement

Multi-factor authentication enabled

Credential stuffing

Functional Test

High

OWASP API2

AUTH-08

Authentication

Token Revocation

Token revocation capability available

Session abuse

Functional Test

High

OWASP API2

AUTH-09

Authentication

Refresh Token Rotation

Refresh tokens must rotate

Replay attack

Code Review

High

OWASP API2

AUTH-10

Authentication

Password Complexity Policy

Enforce strong password policy

Weak passwords

Policy Review

Medium

OWASP API2

 

Continue AUTH-11 to AUTH-40 covering:
Device binding
IP anomaly detection
Login alerts
Biometric authentication
Session timeout
Re-authentication for sensitive actions
Service-to-service authentication
Client certificate auth
Secret storage in vault
API key rotation
Default credential removal
Idle session invalidation
Geo-based login detection
Adaptive authentication
Credential stuffing detection
Password history enforcement
Temporary account suspension
OAuth token introspection
Key rotation policies
Secret scanning in repos
SECTION 2 – Authorization Controls (AUTHZ-01 to AUTHZ-45)
 

Control ID

Domain

Control Name

Control Description

Risk Addressed

Validation Method

Severity

OWASP Mapping

AUTHZ-01

Authorization

Object-Level Authorization

Validate object ownership per request

BOLA

API Testing

Critical

OWASP API1

AUTHZ-02

Authorization

Function-Level Authorization

Validate role for each API function

Privilege escalation

API Testing

Critical

OWASP API5

AUTHZ-03

Authorization

RBAC Enforcement

Role-based access control implemented

Unauthorized access

Architecture Review

High

OWASP API1

AUTHZ-04

Authorization

Least Privilege

Default minimal access

Data leakage

Config Review

High

OWASP API1

AUTHZ-05

Authorization

Admin API Isolation

Separate admin APIs from public APIs

Privilege abuse

Pen Test

Critical

OWASP API5

 

Continue AUTHZ-06 to AUTHZ-45 covering:
ABAC enforcement
Policy engine validation
Resource-level access checks
Horizontal privilege escalation checks
Vertical privilege escalation prevention
Service-to-service authorization
Microservice segmentation
API gateway policy validation
Access review audits
Break-glass access controls
Sensitive endpoint tagging
Privilege approval workflow
Role hierarchy validation
Token scope validation
Cross-tenant isolation
Multi-tenant boundary enforcement
Access expiry enforcement
Temporary privilege elevation logging
Admin action audit trail
SECTION 3 – Input Validation Controls (INP-01 to INP-35)
Control ID

Domain

Control Name

Control Description

Risk Addressed

Validation Method

Severity

OWASP Mapping

INP-01

Input

Server-Side Validation

Strict input validation on server

Injection

Code Review

Critical

OWASP API8

INP-02

Input

SQL Injection Protection

Parameterized queries enforced

SQLi

Code Review

Critical

OWASP API8

INP-03

Input

NoSQL Injection Protection

Query sanitization implemented

NoSQLi

Code Review

Critical

OWASP API8

INP-04

Input

File Upload Validation

Validate file type, size, and content

RCE

Functional Test

High

OWASP API8

INP-05

Input

Content-Type Enforcement

Validate request content type

Deserialization attack

API Testing

High

OWASP API8

 

Continue INP-06 to INP-35 covering:
JSON schema validation
XML schema validation
XXE protection
Payload size limits
Request parameter allow-list
Output encoding
Path traversal prevention
Deserialization protection
Command injection prevention
HTTP parameter pollution protection
GraphQL query depth limiting
Unicode normalization
CRLF injection prevention
Regex validation limits
 

SECTION 4 – Rate Limiting & Abuse Controls (RATE-01 to RATE-25)
Global rate limiting
Per-user throttling
IP-based throttling
Burst control
Concurrency limits
Quota enforcement
Bot detection
Geo-based filtering
CAPTCHA integration
API key request caps
Abuse anomaly detection
WAF rate rules
Retry-after headers
Exponential backoff enforcement
Credential stuffing detection
 

SECTION 5 – Transport & Network Security (NET-01 to NET-35)
HTTPS enforcement
TLS 1.2+ only
HSTS enabled
Mutual TLS (mTLS)
Certificate rotation
DDoS protection
WAF enabled
IP whitelisting
Private endpoint enforcement
DNSSEC enabled
Secure cipher suites
Firewall segmentation
Zero-trust networking
API gateway isolation
Internal vs external endpoint separation
 

SECTION 6 – JWT Security (JWT-01 to JWT-25)
Strong secret key (256-bit minimum)
Backend algorithm enforcement
Token expiry <= 15 mins
No PII in payload
Signature verification mandatory
Audience validation
Issuer validation
Token blacklist support
Key rotation
JTI replay prevention
Encrypted JWT (JWE) if required
Refresh token storage security
Token binding enforcement
 

SECTION 7 – OAuth Security (OAUTH-01 to OAUTH-25)
Authorization Code Flow only
PKCE enforced
Redirect URI strict validation
Scope validation
State parameter validation
CSRF protection
Client secret rotation
Device flow protection
Consent screen validation
Token introspection endpoint security
Revocation endpoint protection
Open redirect prevention
Confidential client enforcement
 

SECTION 8 – Logging & Monitoring (LOG-01 to LOG-30)
Authentication logging
Authorization failure logging
Admin activity logging
Token misuse detection
SIEM integration
Tamper-proof logs
Log retention policy
Real-time alerts
Anomaly detection
API abuse alerts
Error rate monitoring
Suspicious IP alerts
Privilege escalation alerts
 

SECTION 9 – Configuration & Hardening (CONF-01 to CONF-25)
Disable directory listing
Secure HTTP headers
Disable debug mode
Remove default credentials
Harden server configs
Minimal services enabled
Secure container configs
Patch management
Secure environment variables
Secrets in vault only
 

SECTION 10 – Asset & Version Management (ASSET-01 to ASSET-20)
Maintain API inventory
Remove deprecated APIs
Versioning strategy implemented
Shadow API detection
API discovery scans
API documentation review
API lifecycle tracking
Change approval process
Contract testing
Endpoint ownership mapping
 

SECTION 11 – Cloud & Azure Controls (CLOUD-01 to CLOUD-20)
VNet deployment
Private endpoints
Key Vault integration
Azure RBAC enforcement
Managed identity usage
NSG restrictions
Azure WAF
Azure DDoS protection
Storage encryption
APIM policy enforcement
 

SECTION 12 – Secure SDLC & DevSecOps (SDLC-01 to SDLC-30)
SAST integrated
DAST integrated
IAST enabled
SCA dependency scanning
Container scanning
Secrets scanning
IaC scanning
Pre-commit hooks
Security gates in CI/CD
Threat modeling
Secure code review checklist
Security training for developers
SBOM generation
Build artifact signing

 API SECURITY – MASTER CHECKLIST
1️⃣ API Fundamentals (Consolidated)
API (Application Programming Interface)
A set of definitions and protocols that allow software applications to communicate.

Defines how requests and responses are formatted.

Acts as an interface between client and backend systems.

API Components
API Endpoint – URL where requests are sent.

API Call – Request sent to server.

API Gateway – Proxy layer managing routing, auth, throttling, logging.

API Keys – Identifier used to authenticate applications.

API Lifecycle – Design → Develop → Test → Deploy → Monitor → Retire.

Pagination – Splitting large data into smaller chunks.

Payload – Data sent in request/response body.

Query Parameters – Filters in URL.

Rate Limiting – Restricts number of API calls per timeframe.

2️⃣ API Security Checklist (Consolidated & Clean)
🔐 Authentication
Do NOT use Basic Authentication.

Use standard mechanisms (JWT, OAuth 2.0).

Do not create custom authentication logic.

Use strong password hashing algorithms.

Implement account lockout after failed attempts.

Enforce max retry limits.

Encrypt all sensitive data.

Use MFA where possible.

🔑 JWT (JSON Web Token)
Use strong, random secret keys.

Do NOT allow algorithm switching from header.

Force backend-defined algorithm (HS256 / RS256).

Set short expiration times (TTL).

Avoid storing sensitive data in payload.

Keep token size minimal.

Implement refresh token rotation.

Revoke compromised tokens.

🔓 OAuth 2.0
Validate redirect_uri strictly (whitelist).

Use Authorization Code Flow (avoid implicit flow).

Use state parameter to prevent CSRF.

Define and validate scopes.

Protect client secrets securely.

Use PKCE for public clients.

🌐 Transport & Network Security
Enforce HTTPS (TLS 1.2+).

Enable HSTS.

Disable weak ciphers.

Turn off directory listing.

Restrict private APIs by IP allowlist.

Deploy WAF (e.g., API Gateway + WAF).

Protect against MITM.

🚦 Rate Limiting & Abuse Prevention
Implement rate limiting.

Protect against brute force.

Set payload size limits.

Restrict concurrent requests.

Implement CAPTCHA for login endpoints.

🧾 Input Validation & HTTP Controls
Validate input strictly (allowlists preferred).

Use correct HTTP methods:

GET (Read)

POST (Create)

PUT/PATCH (Update)

DELETE (Remove)

Return 405 for invalid method usage.

Validate Content-Type headers.

Enforce proper content negotiation.

Sanitize all inputs.

Prevent injection attacks.

🛡 Authorization
Enforce object-level authorization (BOLA).

Enforce function-level authorization.

Validate role-based access.

Follow least privilege principle.

Do not rely on client-side authorization.

📊 Logging & Monitoring
Log authentication attempts.

Log failed authorization.

Log critical actions.

Integrate logs with SIEM.

Monitor anomalies.

Implement alerting.

Ensure logs do not expose secrets.

📦 Asset & Version Management
Maintain API inventory.

Remove deprecated API versions.

Disable debug endpoints.

Maintain documentation.

Use versioning (/v1/, /v2/).

🔒 Configuration Security
Remove default credentials.

Disable unnecessary HTTP methods.

Configure secure headers.

Restrict CORS properly.

Avoid verbose error messages.

Store secrets in secure vaults.

3️⃣ OWASP API Security Top 10 (Deduplicated)
Broken Object Level Authorization (BOLA)

Broken User Authentication

Excessive Data Exposure

Lack of Resources & Rate Limiting

Broken Function Level Authorization

Mass Assignment

Security Misconfiguration

Injection

Improper Assets Management

Insufficient Logging & Monitoring

4️⃣ API Testing (Consolidated)
What to Verify in API Testing
Data accuracy

HTTP status codes

Authorization checks

Authentication validation

Response time

Error handling

Performance

Security vulnerabilities

Common API Testing Types
Unit Testing

Functional Testing

Load Testing

Runtime/Error Testing

Security Testing

Penetration Testing

Fuzz Testing

Interoperability Testing

Common Protocols
HTTP

REST

SOAP

JMS

UDDI

Popular API Testing Tools
Postman

SoapUI

JMeter

Apigee

OWASP ZAP

Burp Suite

5️⃣ REST vs SOAP (Clean Version)
REST
Architectural style

Uses HTTP

Supports JSON, XML, etc.

Lightweight and scalable

SOAP
Protocol

XML-only

Strict standards

More heavyweight

6️⃣ Azure API Management Security (Cleaned)
Network Security
Deploy inside VNet

Use NSGs

Place WAF in front

Identity Management
Use Microsoft Entra ID

Implement RBAC

Use Conditional Access

Store secrets in Azure Key Vault

Privileged Access
Avoid local admin accounts

Use Azure RBAC

Use Customer Lockbox

Logging
Enable Azure Resource Logs

Monitor with Sentinel

Backup
Regular backups

Store in secure storage accounts

🎯 What Was Removed
Repeated Authentication/JWT/OAuth sections

Repeated Top 10 API Security blocks

Repeated SOAP definitions

Repeated API definitions

Repeated API Testing descriptions

Repeated REST explanations

Repeated rate limiting explanations

If you'd like, I can now convert this into:

📊 Excel Audit Sheet

📑 Interview Preparation Sheet

📋 300+ Control Detailed Matrix

🛡 OWASP Mapped Version with Controls

🔍 DevSecOps CI/CD Integrated Checklist

📘 Training Material Version

Just tell me the format you need.


