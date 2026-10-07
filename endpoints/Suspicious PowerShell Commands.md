A

Suspicious PowerShell Activity: Detects and responds to malicious PowerShell commands.

# Purpose

Look for logs with commands that try to download external scripts/content or bypass PowerShell.

# Query

index=windows source="WinEventLog:Microsoft-Windows-PowerShell/Operational" EventCode=4104 AND ((ScriptBlockText=\*-noni\* \*iex\* \*New-Object\*) OR (ScriptBlockText=\*-ep\* \*bypass\* \*-Enc\*) OR (ScriptBlockText=\*powershell\* \*reg\* \*add\* \*HKCU\\software\\microsoft\\windows\\currentversion\\run\*) OR (ScriptBlockText=\*bypass\* \* noprofile\* \*-windowstyle\* \*hidden\* \*new-object\* \*system.net.webclient\* \*.download\*) OR (ScriptBlockText=\*iex\* \*New-Object\* \*Net.WebClient\* \*.Download\*)) \| table Computer, ScriptBlockText, UserID

# Outcome
