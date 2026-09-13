### Powershell execution events that could involve download

Union DeviceProcessEvents, DeviceNetworkEvents
| where Timestamp \> ago(7d)
| where FileName in~ ("powershell.exe", "powershell_ise.exe")
| where ProcessCommandLine has_any ("WebClient", "DownloadFile", "DownloadData", "DownloadString", "WebRequest", "Shellcode", "http", "https", "Invoke-Expression", "IEX", "bitsadmin", "certutil", "ftp", "tftp", "curl", "wget")
| extend DownloadMethod = case(
ProcessCommandLine has "WebClient", "WebClient",
ProcessCommandLine has "DownloadFile", "DownloadFile",
ProcessCommandLine has "DownloadData", "DownloadData",
ProcessCommandLine has "DownloadString", "DownloadString",
ProcessCommandLine has "WebRequest", "WebRequest",
ProcessCommandLine has "Shellcode", "Shellcode",
ProcessCommandLine has "Invoke-Expression" or ProcessCommandLine has "IEX", "Invoke-Expression/IEX",
ProcessCommandLine has "bitsadmin", "bitsadmin",
ProcessCommandLine has "certutil", "certutil",
ProcessCommandLine has "ftp", "ftp",
ProcessCommandLine has "tftp", "tftp",
ProcessCommandLine has "curl", "curl",
ProcessCommandLine has "wget", "wget",
ProcessCommandLine has "http", "http/https", //Catch-all for http/https without other keywords
ProcessCommandLine has "https", "http/https",
"Other"
)
| project Timestamp, DeviceName, InitiatingProcessFileName, InitiatingProcessCommandLine, FileName, ProcessCommandLine, RemoteIP, RemoteUrl, RemotePort, RemoteIPType, DownloadMethod // Include the DownloadMethod
| top 100 by Timestamp