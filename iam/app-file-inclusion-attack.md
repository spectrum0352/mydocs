## 2\. File Inclusion Vulnerabilities

These usually happen in **server-side scripting languages** (PHP, JSP, etc.), where the app includes files dynamically.

**Types:**

* **Local File Inclusion (LFI):** Include files on the local server
* **Remote File Inclusion (RFI):** Include files from an external URL (less common now due to default security settings)

**Common Attack Vectors:**

* **Dynamic Include/Require Parameters:**

  * URL parameters (e.g., GET /page.php?include=../../../../etc/passwd)
  * POST parameters or cookies that are used in include statements without proper sanitization
* **Log Poisoning + LFI:** Inject code into log files or other writable files, then include them to execute code
* **User-Supplied URLs:** If remote URLs can be included (RFI), attackers can include malicious scripts hosted elsewhere
* **Traversal to Sensitive Files:** Access application source code, config files, or sensitive data
* **Executing Arbitrary Code:** If combined with LFI and log poisoning or upload, attackers can achieve Remote Code Execution (RCE)

**Summary Table**

|**Vulnerability**|**Input Vector Examples**|**Targeted Files / Outcome**|
|-|-|-|
|**File Path Traversal**|URL params, form inputs, API file parameters|System files (/etc/passwd), configs, logs, backups|
|**Local File Inclusion**|URL params, POST data, cookies|Local source code, config files, logs, code execution via log poisoning|
|**Remote File Inclusion**|URL params (allowing external URLs)|External malicious scripts for RCE|

## Context: File Path Traversal \& File Inclusion attacks in Azure environments

### Primary Target: Web Applications Running in Azure

**1. Azure App Service (PaaS):**

Web apps hosted on Azure App Service are the **most common target** for these vulnerabilities.

* If the app accepts user input for file paths (e.g., viewing files, including templates), and input is not sanitized, attackers can exploit path traversal or inclusion.
* Attack targets files inside the app’s sandboxed file system, including configs, source code, or sensitive files.

**2. Azure Virtual Machines (IaaS) Running Web Servers**

* If you deploy your own VM running IIS, Apache, Nginx, or custom web apps, the same vulnerabilities apply.
* Attackers target the web server or web application running on the VM.
* They try to access files on the VM’s disk or execute code by including malicious files.

**3. Azure Kubernetes Service (AKS) or Container Apps**

* Containers running web applications can have these vulnerabilities if they accept unsafe file path input.
* Attackers exploit the container’s filesystem or app files.

\---

**2. Indirect or Less Common Targets**

* **Azure Functions (Serverless / PaaS Functions)**

  * If Azure Functions use dynamic includes or read files based on user input, similar vulnerabilities can exist.
  * But Functions typically have a limited filesystem, making some attacks harder.
* **Cloud SaaS Services (e.g., Office 365, Dynamics 365)**

  * These managed SaaS platforms are generally **not vulnerable** to classic path traversal or file inclusion vulnerabilities because you
don’t control the underlying code or file system.
  * Attacks here would be different, more focused on API abuse, misconfigurations, or business logic flaws.
* **Azure Blob Storage / File Storage**

  * Not a direct target for these specific code-level vulnerabilities since these are storage services, but poorly configured access can
expose files.

**Summary for Azure Context:**

|**Vulnerability**|**Typical Azure Targets**|
|-|-|
|**File Path Traversal**|Azure App Service web apps, Web servers on Azure VMs, AKS containers running web apps|
|**File Inclusion (LFI/RFI)**|Azure App Service, Azure VMs with web servers, Containers with vulnerable app code|
|**Not Typical Targets**|Azure SaaS services (Office365, Dynamics), Azure Storage (unless misconfigured)|

**Example:**

* If you have a **PHP web app deployed on Azure App Service** that includes a file based on a user-supplied parameter without validation,
attacker uses File Inclusion to read source code or get code execution.
* If you have an **IIS web server on an Azure VM** hosting an ASP.NET app that uses file paths from user input, attacker uses Path Traversal
to read web.config or system files.
* **File Path Traversal and File Inclusion vulnerabilities are attacks on the web app or web server layer, whether hosted on Azure App Service (PaaS), Azure VMs (IaaS), or containers (AKS).**
* They do **not** target the Azure cloud platform itself, but rather the application code or server hosting environment inside Azure.
* 



