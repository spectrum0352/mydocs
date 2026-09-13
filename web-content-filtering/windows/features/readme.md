A Windows URL filtering tool is feasible, but the approach matters.

Your current solution swaps the Windows **hosts** file to block/unblock YouTube. That works for basic domains, but it has several limitations:

* Easy to bypass using DNS over HTTPS (DoH)
* Cannot filter HTTPS URLs such as `youtube.com/shorts/...`
* Cannot block categories
* Doesn't support schedules or policies
* Requires Administrator privileges
* Doesn't log blocked attempts

## Recommended Architecture

For a professional Windows application, I recommend the following stack:

| Component            | Technology                                     |
| -------------------- | ---------------------------------------------- |
| GUI                  | C# (.NET 8 WinForms or WPF)                    |
| URL Filtering Engine | Windows Filtering Platform (WFP) or Hosts file |
| Configuration        | JSON                                           |
| Logging              | SQLite                                         |
| Background Service   | Windows Service                                |
| Notifications        | Windows Toast Notifications                    |
| Installer            | MSIX or Inno Setup                             |

This gives an application similar to enterprise parental-control or web-filtering software.

---

# Features

```
URL Filter
│
├── Dashboard
│     ├── Protection ON/OFF
│     ├── Number of blocked sites
│     ├── Logs
│
├── Categories
│     ├── Social Media
│     ├── Adult
│     ├── Gambling
│     ├── Games
│     ├── AI
│     ├── Custom
│
├── Schedule
│     ├── Block during office hours
│     ├── Daily timer
│
├── Blacklist
│     ├── youtube.com
│     ├── facebook.com
│     ├── instagram.com
│
├── Whitelist
│
├── Password Protection
│
└── Import/Export
```

---

# Folder Structure

```
URLFilter
│
├── URLFilter.exe
├── Config
│      config.json
│
├── Hosts
│      hosts.normal
│      hosts.blocked
│
├── Logs
│      filter.db
│
└── Service
       URLFilterService.exe
```

---

# Configuration File

```json
{
  "enabled": true,
  "blocked": [
    "youtube.com",
    "www.youtube.com",
    "m.youtube.com",
    "youtu.be",
    "facebook.com",
    "instagram.com"
  ],
  "whitelist": [
    "learn.microsoft.com"
  ]
}
```

---

# C# Blocking Engine

```csharp
using System.Diagnostics;
using System.IO;

public class HostManager
{
    private readonly string hostFile =
        @"C:\Windows\System32\drivers\etc\hosts";

    public void Block()
    {
        File.Copy("Hosts\\hosts.blocked", hostFile, true);

        Process.Start(new ProcessStartInfo
        {
            FileName = "ipconfig",
            Arguments = "/flushdns",
            Verb = "runas",
            CreateNoWindow = true,
            UseShellExecute = true
        });
    }

    public void Unblock()
    {
        File.Copy("Hosts\\hosts.normal", hostFile, true);

        Process.Start(new ProcessStartInfo
        {
            FileName = "ipconfig",
            Arguments = "/flushdns",
            Verb = "runas",
            CreateNoWindow = true,
            UseShellExecute = true
        });
    }
}
```

---

# Better Than Replacing Files

Instead of replacing the hosts file every time, update it dynamically.

```csharp
var hosts = File.ReadAllLines(hostPath).ToList();

hosts.RemoveAll(x => x.Contains("#URLFILTER"));

hosts.Add("127.0.0.1 youtube.com #URLFILTER");
hosts.Add("127.0.0.1 www.youtube.com #URLFILTER");
hosts.Add("127.0.0.1 m.youtube.com #URLFILTER");
hosts.Add("127.0.0.1 youtu.be #URLFILTER");

File.WriteAllLines(hostPath, hosts);
```

This preserves existing entries and makes adding/removing domains easier.

---

# PowerShell Version

```powershell
$hosts="$env:SystemRoot\System32\drivers\etc\hosts"

Add-Content $hosts "`n127.0.0.1 youtube.com #URLFILTER"
Add-Content $hosts "127.0.0.1 www.youtube.com #URLFILTER"
Add-Content $hosts "127.0.0.1 m.youtube.com #URLFILTER"
Add-Content $hosts "127.0.0.1 youtu.be #URLFILTER"

ipconfig /flushdns

Write-Host "Blocked"
```

---

# GUI Example

```
------------------------------------------
         URL FILTER
------------------------------------------

Protection

[ ON ]   [ OFF ]

------------------------------------------

Blocked Websites

☑ youtube.com
☑ facebook.com
☑ instagram.com
☑ twitter.com
☑ reddit.com

+ Add Site

------------------------------------------

Whitelist

learn.microsoft.com

------------------------------------------

[ Save ]

```

---

# Automatic Background Monitoring

The application can run as a Windows Service:

```
Windows starts

↓

URL Filter Service starts

↓

Loads config.json

↓

Checks if protection enabled

↓

Updates hosts

↓

Flushes DNS

↓

Runs silently
```

---

# Logging

```
2026-07-30 08:10 Enabled
2026-07-30 08:11 Added youtube.com
2026-07-30 08:12 DNS Flushed
2026-07-30 08:13 Disabled
```

---

# Enterprise-Level Enhancements

For a more robust solution, consider these capabilities:

* **Windows Filtering Platform (WFP):** Filter network traffic at the kernel level. This is harder to bypass than hosts-file blocking and can filter connections regardless of the application.
* **DNS filtering:** Run a local DNS proxy or use a secure DNS service that enforces policies.
* **Password-protected settings:** Prevent unauthorized users from disabling filtering.
* **Tamper protection:** Monitor and restore configuration if modified.
* **Group Policy support:** Allow centralized management in enterprise environments.
* **Signed Windows Service:** Run the filtering engine with appropriate privileges and start automatically.
* **SQLite logging:** Record policy changes and optionally blocked connection attempts (subject to the filtering method used).
* **Automatic updates:** Keep blocklists and the application up to date.

## Which technology should you choose?

| Option                                | Difficulty | Security  | Best For                              |
| ------------------------------------- | ---------: | --------- | ------------------------------------- |
| Hosts file                            |       Easy | Basic     | Personal use, simple domain blocking  |
| PowerShell                            |       Easy | Basic     | Automation scripts                    |
| C# (.NET) + Hosts                     |     Medium | Good      | Desktop application with GUI          |
| C# + Windows Filtering Platform (WFP) |   Advanced | Excellent | Enterprise-grade URL/domain filtering |
| Kernel driver (WFP callout driver)    |     Expert | Highest   | Commercial security software          |

For a Windows desktop application intended to be reliable and difficult to bypass, **C# (.NET 8) with a Windows Service and Windows Filtering Platform (WFP)** is the strongest architectural choice. It provides a modern GUI, good Windows integration, and a much more robust filtering mechanism than simply swapping the `hosts` file.
