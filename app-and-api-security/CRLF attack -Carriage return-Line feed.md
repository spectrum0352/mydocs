# CRLF attack (Carriage return/Line feed)

CRLF Injection: Understanding and Testing
What is CRLF?
CRLF stands for Carriage Return (CR, ASCII 13, \r) and Line Feed (LF, ASCII 10, \n). In the context of the HTTP protocol, these characters serve as the standard "end-of-line" marker.

Header Separation: A single CRLF (\r\n) separates individual HTTP headers.

Body Separation: A double CRLF (\r\n\r\n) signals the end of the header section and the beginning of the message body.

What is CRLF Injection?
A CRLF Injection vulnerability occurs when an application unsafely includes user-supplied data in an HTTP response header. By inserting encoded CRLF characters (e.g., %0D%0A), an attacker can terminate the current header and start a new one, or even terminate the entire header section to begin writing directly into the HTML body.

Key Exploitation Vectors:

HTTP Response Splitting: Breaking one HTTP response into two, allowing the attacker to control the second response.

Header Manipulation: Injecting headers like Set-Cookie (Session Fixation) or Access-Control-Allow-Origin (CORS bypass).

XSS Chaining: Injecting a script into the response body after forcing a double CRLF.

Impact of CRLF Injection
The severity of CRLF injection is often underestimated, but it acts as a gateway to several high-impact attacks:

Attack Type

Description

Session Hijacking

Injecting Set-Cookie headers to overwrite or fixate a user's session.

Phishing / Defacement

Forcing the page to display malicious content or fake login forms.

Cache Poisoning

Tricking intermediate caches (CDNs/Proxies) into storing a malicious version of a page.

WAF Bypassing

Using line breaks to "hide" malicious payloads from security filters that only scan single lines.



Tool Spotlight: CRLFsuite
CRLFsuite is a powerful Python-based automation tool used to discover and exploit these vulnerabilities across large attack surfaces.

Key Features
WAF Evasion: Uses sophisticated payload generation to bypass common Web Application Firewalls.

Concurrency: Scans multiple threads simultaneously for high-speed testing.

Flexible Methods: Supports both GET and POST requests.

XSS Chaining: Specifically looks for ways to turn a CRLF injection into a Cross-Site Scripting attack.

Installation
Bash

# Method 1: Via pip
pip3 install crlfsuite

# Method 2: From Source
git clone https://github.com/Nefcore/CRLFsuite.git
cd CRLFsuite
python3 setup.py install
Practical Usage Examples
Single Target: crlfsuite -t http://example.com/

List of Targets: crlfsuite -iT targets.txt

Using Cookies (Authenticated): crlfsuite -t http://example.com/ -c "session=12345"

Silent Mode (Clean Output): crlfsuite -t http://example.com/ -sL

Platform-Specific Considerations
1. Windows (IIS Servers)
In IIS environments, CRLF is often used to bypass "Request Filtering." If an admin has blocked specific keywords, an attacker might use CRLF characters to break the keyword across two lines, potentially bypassing the filter while still being processed by the underlying application (like ASP.NET).

2. Linux (Apache/Nginx)
Linux-based servers are frequently used as Reverse Proxies. CRLF injection here is particularly dangerous for Log Injection. An attacker can inject CRLF characters into a URL to create fake log entries, making it appear as though a different user performed a specific action, thereby throwing off forensic investigations.

3. Azure Cloud
In Azure, the impact scales with the infrastructure:

Azure Front Door & Application Gateway: CRLF can be used to perform Cache Poisoning. If an attacker injects a malicious header that gets cached by Azure’s global edge nodes, every subsequent user visiting that URL will receive the malicious payload.

Azure Functions: Since these are often triggered by HTTP requests, a CRLF injection can manipulate the headers passed to downstream services, potentially leading to unauthorized data access in integrated storage accounts.

App Services: Vulnerabilities in the application code (Node.js, Python, .NET) running on App Services can be exploited to bypass Azure-specific identity headers.

Conclusion
While modern frameworks have built-in protections against header injection, legacy systems and custom-built APIs remain highly susceptible. Using tools like CRLFsuite during a penetration test ensures that these "simple" character-based flaws don't become the entry point for a full-scale compromise.

===========================================================================================



To secure your infrastructure, especially when dealing with cloud-native environments like Azure, here is a targeted audit checklist. These configurations specifically address the root causes and the potential impacts (like Cache Poisoning and XSS) of CRLF Injection.

Azure Audit Checklist: Preventing Header Manipulation
1. Azure Front Door & CDN (Cache Security)
Since CRLF is the primary vector for Cache Poisoning, ensuring your edge nodes don't cache malicious headers is critical.

[ ] Enable "Cache Key" Refinement: Ensure that the Query String and relevant headers are part of the cache key. If an attacker injects a CRLF into a query parameter, Front Door should treat it as a unique (and likely invalid) request rather than serving it to others.

[ ] WAF Policy - Default Rule Set (DRS): Verify that the Default Rule Set 2.0 or higher is enabled on your Front Door. Azure’s managed rules specifically include checks for "Common Header Injections."

[ ] Restrict Supported Protocols: Ensure that only HTTPS is allowed to prevent man-in-the-middle attacks from injecting characters during the handshake.

2. Azure Application Gateway
[ ] Rewrite Rules Validation: If you use "Rewrite Sets" to modify headers, ensure you are not using unvalidated variables like {http_resp_HeaderName} directly from a user request into a new header.

[ ] WAF Prevention Mode: Ensure the WAF is set to Prevention rather than Detection. In Detection mode, the CRLF injection will be logged, but the malicious header will still reach your backend.

3. Azure App Services (Internal Logic)
[ ] Validate System.Net / Language Headers: For .NET apps, ensure enableHeaderChecking="true" is set in the web.config. This is the default in modern versions, but legacy apps migrated to Azure may have it disabled.

[ ] HTTP Strict Transport Security (HSTS): Enable HSTS in the "TLS/SSL settings." This prevents attackers from trying to downgrade the connection to inject headers via a proxy.

4. Azure Functions (Serverless)
[ ] Input Validation at the Trigger: Use a validation layer (like FluentValidation for C# or Joi for Node.js) to strip \r and \n characters from any string that is eventually used in an HttpResponse object.

[ ] API Management (APIM) Integration: Place an Azure API Management instance in front of your functions. Use a Validate Content policy to ensure that no unexpected control characters exist in the headers of incoming requests.

Remediation: Code-Level Fix
If your penetration test identifies a CRLF vulnerability, the fix is straightforward: Sanitize and Encode.

The Golden Rule: Never pass user input directly into a function that sets an HTTP header (like res.setHeader() in Node or header() in PHP) without stripping out newline characters first.



Attack Flows
 

To understand how CRLF injection scales, it helps to look at how it interacts with different architectures. On-premises attacks usually target the local server’s logic, while Azure attacks target the shared infrastructure (like CDNs and Load Balancers) to affect multiple users at once.

1. On-Premises Attack Flow

In a traditional environment (Windows/IIS or Linux/Apache), the attack is usually direct. The goal is to manipulate the server's immediate response to a single victim.

Step 1: Reconnaissance: The attacker identifies a parameter (like a redirect URL or a search query) that is reflected in the HTTP headers.
Step 2: Payload Crafting: The attacker creates a URL containing %0d%0a.
Example: ?url=index.php%0d%0aSet-Cookie:session=malicious_val
Step 3: Direct Injection: The user clicks the link. The local web server (IIS/Apache) fails to sanitize the input.
Step 4: Response Splitting: The server sends a response where the Set-Cookie header is treated as a valid header by the user's browser.
Outcome: The attacker fixates the user's session or triggers an XSS payload in the browser.
2. Azure Cloud Attack Flow (Infrastructure-Wide)

In Azure, the attack often targets the Azure Front Door (AFD) or Azure Content Delivery Network (CDN). This moves the attack from a "one-to-one" scenario to a "one-to-many" scenario via Cache Poisoning.

Step 1: Target Identification: The attacker looks for an Azure-hosted application behind a CDN or Front Door that reflects headers (e.g., a "Language" header or "Location" header).
Step 2: Cache Poisoning Payload: The attacker sends a request designed to force a double CRLF, followed by a malicious body.
Example: GET /index.php HTTP/1.1
Injected Header: X-Forwarded-Host: victim.com%0d%0a%0d%0a<script>alert('Hacked')</script>
Step 3: Poisoning the Edge: The Azure Front Door receives this request. If the backend server responds with the injected script in the body, the Azure Edge Node caches that response.
Step 4: Mass Distribution: Because the edge node now has the "poisoned" version of the page in its cache, every legitimate user who visits that URL for the next several minutes (until the TTL expires) receives the malicious script.
Outcome: A single request by the attacker compromises thousands of users across the Azure global network.
 

Summary Comparison

 

Feature

On-Premises Flow

Azure Cloud Flow

Primary Target

The Web Server (IIS/Nginx)

Edge Infrastructure (Front Door/CDN)

Attack Reach

Targeted (Individual Users)

Wide-Scale (All users hitting that Edge)

Complexity

Simple (Header injection)

High (Requires understanding Cache Keys)

Primary Risk

Session Hijacking / XSS

Global Cache Poisoning

 

 

Key Penetration Testing Tip

When testing in Azure, always check if the X-Forwarded-For or X-Cloud-Trace-Context headers are vulnerable to CRLF. Since these are used by Azure for logging and routing, injecting line breaks there can lead to Log Injection, where you can "ghost" entries into the Azure Monitor logs to hide your activity.


 



