# HTTP response codes - Azure Diagnostics and WAF logs

Azure diagnostics and Web Application Firewall (WAF) logs capture HTTP response codes across all categories—1xx, 2xx, 3xx, 4xx, and 5xx—with a strong emphasis on 4xx and 5xx errors for security and troubleshooting. These logs help identify blocked requests, misconfigurations, and backend failures.

 

Here’s a structured breakdown of HTTP response types as they appear in Azure diagnostics and WAF logs:

Categories of HTTP Response Codes in Azure Diagnostics & WAF Logs

 

Category

Purpose

Common Codes Logged

Use in Azure/WAF

1xx Informational

Request received, continuing process

100, 101

Rarely logged; mostly internal protocol handling

2xx Success

Request processed successfully

200 OK, 201 Created, 204 No Content

Indicates allowed traffic; useful for baseline analysis

3xx Redirection

Further action needed

301, 302, 304

Logged when redirects occur; not blocked unless suspicious

4xx Client Errors

Client-side issues

400, 401, 403, 404, 405, 429

Heavily logged in WAF; used to detect malicious or malformed requests

5xx Server Errors

Server-side failures

500, 502, 503, 504

Critical for diagnostics; indicates backend or gateway issues

 

WAF-Specific Logging Highlights

Azure WAF logs include detailed fields such as:

httpStatusCode: Captures the exact HTTP response code.
action: Shows whether the request was Blocked, Logged, or Allowed.
ruleSetType and ruleSetVersion: Indicates which OWASP rules triggered the response.
message: Describes the reason for blocking (e.g., SQL injection, XSS).
Common WAF-triggered 4xx responses:

403 Forbidden: Blocked by WAF rule
404 Not Found: Often used to mask blocked endpoints
429 Too Many Requests: Rate limiting or bot protection
 

Azure Diagnostics Log Types That Include HTTP Responses

Access Logs (Application Gateway / Front Door)
Logs all HTTP requests and responses
Includes clientIP, httpMethod, httpStatus, backendStatus
Performance Logs
Tracks latency, throughput, and response codes
Firewall Logs
Captures WAF rule matches and resulting HTTP status codes
Activity Logs
High-level operations; not detailed HTTP responses
 

Example KQL Query for HTTP Status Analysis

AzureDiagnostics

| where ResourceType == "APPLICATIONGATEWAYS"

| summarize count() by httpStatus_d

 

This query helps you identify the distribution of HTTP response codes across your Application Gateway logs.

 

HTTP Response Codes in Azure Diagnostics & WAF Logs

 

2xx – Success (Allowed Traffic)

200 OK → Normal allowed request
201 Created / 202 Accepted → Resource creation or async acceptance
204 No Content → Successful but no body returned
206 Partial Content → Range requests (common in media streaming)
 

In WAF logs, these usually mean no rule triggered and traffic was passed.

 

3xx – Redirection

301 Moved Permanently / 302 Found → Redirects handled by backend or gateway
304 Not Modified → Cached response reused
 

Logged in access logs, but WAF rarely blocks unless redirect chains look suspicious.

 

4xx – Client Errors (Often WAF-Blocked)

400 Bad Request → Malformed request (common with attack payloads)
401 Unauthorized / 403 Forbidden → Authentication failure or blocked by WAF rule
404 Not Found → Resource missing (sometimes used to mask blocked endpoints)
405 Method Not Allowed → Disallowed HTTP verb (e.g., TRACE, PUT)
429 Too Many Requests → Rate limiting / bot protection
 

These are critical in WAF logs. You’ll often see action: Blocked with 403 when OWASP rules trigger.

 

⚠️ 5xx – Server Errors (Backend Failures)

500 Internal Server Error → Generic backend failure
502 Bad Gateway → Invalid response from upstream
503 Service Unavailable → Backend overloaded or down
504 Gateway Timeout → Upstream server timed out
 

In diagnostics logs, these indicate backend pool issues or misconfigurations. WAF doesn’t generate these, but it logs them if the gateway/backend fails.

 

WAF Log Fields to Watch

httpStatusCode → The response code (200, 403, 502, etc.)
action → Blocked, Allowed, or Logged
ruleSetType / ruleSetVersion → OWASP CRS version
message → Reason for block (e.g., SQL injection, XSS attempt)
 