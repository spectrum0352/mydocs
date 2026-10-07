# Malicious File Uploads in Azure

## Attack Surface

File upload vulnerabilities are often found in:

- Azure-hosted web applications (e.g., App Service, Azure Static Web Apps)
- Features like *profile picture uploads*, *document submission portals*, or *image processing endpoints*
- APIs (Azure Functions, Logic Apps, etc.) handling file inputs

## Exploitation Techniques

Here is how attackers may abuse insecure upload mechanisms:

1. **Bypass Techniques**
  
  - Content-Type Spoofing: Upload a malicious PHP/ASP script but set Content-Type: image/jpeg to bypass checks.
  - Example: Upload shell.php but declare it as image/png.

2. **File Extension Tricks**

- Upload shell.php.jpg or shell.pHp5 to bypass extension blacklists.
- Use uncommon extensions: .php5, .phtml, .phar, etc.
- Null byte or special character injection: shell.php%00.jpg, shell.php#.png

3. **Payload Wrapping**

- Embed code after valid headers (e.g., GIF89a; \<?phpsystem(\$\_GET\['cmd'\]); ?\>) and claim it's an image.
- Used to fool content inspection logic.

4. **Size & Length Manipulation**

- Use *tiny PHP payloads* like \<?=\\\_GET\[x\]\`?\>\` to bypass content length checks.

5. **Exotic MIME Types and Extensions**

- Upload .svg, .csv, .xml, .js, or .html files for XSS, SSRF, XXE, or CSRF attacks.

## Payloads by File Type ⚔️

    | **Extension** | **Risk**             |
    |---------------|----------------------|
    | .php, .asp    | RCE / Web shell      |
    | .svg          | XSS, SSRF, XXE       |
    | .gif          | XSS, spoofing        |
    | .csv          | Formula injection    |
    | .xml          | XXE                  |
    | .zip          | Zip Slip, LFI, RCE   |
    | .html, .js    | XSS, open redirects  |
    | .jpeg, .png   | Pixel flooding (DoS) |

## Vulnerabilities to Test For 💣

- **Directory Traversal**: ../../../logo.png
- **SQL Injection**: Filename-based payloads like 'sleep(10)--.jpg
- **Command Injection**: Filename ; sleep 10;
- **SSRF**: Abuse "Upload from URL" features or .svg files with embedded requests.
- **XSS**: SVG and GIF with JS or event handlers.
- **XXE**: Injected entities via .xml or .svg
- **Zip Slip**: Upload ZIP with ../../webshell.php inside.

## Testing Azure-Specific Upload Scenarios 🧪

- **Azure Blob Storage**: Verify if uploaded files are public or accessible through predictable URLs.
- **Azure Function or Logic App APIs**: Inspect input validation, content-type checks, and logging.
- **App Service & Web Apps**: Look for upload endpoints backed by PHP/.NET runtimes that may process uploaded files.
- **App Gateway or WAF**: Test for bypasses against Azure WAF if in use (e.g., base64 encoding, chunked transfer).
- **Exif Injection**: Inject PHP/JS payloads into image metadata using exiftool.
- **Oversized File/Name DoS**: Upload extremely large files or names to crash parsers.
- **Content-Type & Shell Bypass**:

## Combine Techniques for Maximum Effect 🔄

Mix file extension tricks, content-type spoofing, and metadata injection to bypass multiple layers of validation.

## Key Takeaways for Pentesters ✅

- Always test file upload endpoints for execution, parsing, or external inclusion vulnerabilities.
- Use Azure tools like **Azure Defender for App Services**, **App Insights**, and **Storage Analytics** to monitor for suspicious uploads.
- Upload abuse in Azure can lead to full compromise if web shells are executed or files are made public.

Azure-pentest-file-uploads

# File Upload

Here is a **corrected, summarized, and rewritten version** of your
content, tailored specifically to **Azure Penetration Testing** and how
**file upload vulnerabilities** can be discovered and abused in
Azure-hosted applications:

------------------------------------------------------------------------

**🔐 Azure Penetration Testing: File Upload Vulnerability Cheatsheet**

**📍 Where to Look in Azure Environments**

File upload vulnerabilities are often found in:

- Azure-hosted web applications (e.g., App Service, Azure Static Web
  Apps)

- Features like **profile picture uploads**, **document submission
  portals**, or **image processing endpoints**

- APIs (Azure Functions, Logic Apps, etc.) handling file inputs

**🎯 Common Exploitation Techniques**

Here’s how attackers may abuse insecure upload mechanisms:

**🛠 Bypass Techniques**

1.  **Content-Type Spoofing**

    - Upload a malicious PHP/ASP script but set Content-Type: image/jpeg
      to bypass checks.

    - Example: Upload shell.php but declare it as image/png.

2.  **File Extension Tricks**

    - Upload shell.php.jpg or shell.pHp5 to bypass extension blacklists.

    - Use uncommon extensions: .php5, .phtml, .phar, etc.

    - Null byte or special character injection: shell.php%00.jpg,
      shell.php#.png

3.  **Payload Wrapping**

    - Embed code after valid headers (e.g., GIF89a; \<?php
      system(\$\_GET\['cmd'\]); ?\>) and claim it's an image.

    - Used to fool content inspection logic.

4.  **Size & Length Manipulation**

    - Use **tiny PHP payloads** like \<?=\\\_GET\[x\]\`?\>\` to bypass
      content length checks.

5.  **Exotic MIME Types and Extensions**

    - Upload .svg, .csv, .xml, .js, or .html files for XSS, SSRF, XXE,
      or CSRF attacks.

**⚔️ Payloads by File Type**

| **Extension** | **Risk**             |
|---------------|----------------------|
| .php, .asp    | RCE / Web shell      |
| .svg          | XSS, SSRF, XXE       |
| .gif          | XSS, spoofing        |
| .csv          | Formula injection    |
| .xml          | XXE                  |
| .zip          | Zip Slip, LFI, RCE   |
| .html, .js    | XSS, open redirects  |
| .jpeg, .png   | Pixel flooding (DoS) |

**💣 Vulnerabilities to Test For**

- **Directory Traversal**: ../../../logo.png

- **SQL Injection**: Filename-based payloads like 'sleep(10)--.jpg

- **Command Injection**: Filename ; sleep 10;

- **SSRF**: Abuse "Upload from URL" features or .svg files with embedded
  requests.

- **XSS**: SVG and GIF with JS or event handlers.

- **XXE**: Injected entities via .xml or .svg

- **Zip Slip**: Upload ZIP with ../../webshell.php inside.

**🧪 Testing Azure-Specific Upload Scenarios**

- **Azure Blob Storage**: Verify if uploaded files are public or
  accessible through predictable URLs.

- **Azure Function or Logic App APIs**: Inspect input validation,
  content-type checks, and logging.

- **App Service & Web Apps**: Look for upload endpoints backed by
  PHP/.NET runtimes that may process uploaded files.

- **App Gateway or WAF**: Test for bypasses against Azure WAF if in use
  (e.g., base64 encoding, chunked transfer).

**🧰 Additional Techniques**

- **Exif Injection**: Inject PHP/JS payloads into image metadata using
  exiftool.

- **Oversized File/Name DoS**: Upload extremely large files or names to
  crash parsers.

- **Content-Type & Shell Bypass**:

- // Content-Type: image/gif

- GIF89a; \<?php system(\$\_GET\['cmd'\]); ?\>

**🔄 Combine Techniques for Maximum Effect**

Mix file extension tricks, content-type spoofing, and metadata injection
to bypass multiple layers of validation.

------------------------------------------------------------------------

**✅ Key Takeaways for Azure Pentesters**

- Always test file upload endpoints for execution, parsing, or external
  inclusion vulnerabilities.

- Use Azure tools like **Azure Defender for App Services**, **App
  Insights**, and **Storage Analytics** to monitor for suspicious
  uploads.

- Upload abuse in Azure can lead to full compromise if web shells are
  executed or files are made public.

Would you like a ready-made script or Burp Suite extension configuration
to automate some of these tests in Azure targets?
