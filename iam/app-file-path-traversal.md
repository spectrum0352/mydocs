## 1\. File Path Traversal (Directory Traversal)

**Goal:** Access files and directories outside the intended restricted directory by manipulating file paths.

**Common Attack Vectors:**

* **Web Application Input Fields:**

  * URL parameters (e.g., GET /view?file=../../../../etc/passwd)
  * Form inputs that accept filenames or paths
  * HTTP headers that might be interpreted as paths (less common)
* **API Endpoints:**

  * APIs that fetch or serve files based on user input
  * REST endpoints with path parameters
* **File Upload Features:**

  * When the server constructs file paths dynamically from user input
* **Configuration \& Logs Access:**

  * Trying to read sensitive system files (e.g., /etc/passwd,
C:\\Windows\\System32\\drivers\\etc\\hosts)
  * Accessing application config files, logs, backup files, or source
code files
* **Authentication Bypass:**

  * Accessing protected files by breaking out of sandboxed directories



