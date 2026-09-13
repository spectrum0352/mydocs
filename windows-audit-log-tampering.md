A

# Purpose

Check for any tampering done to Windows audit logs.

# Query

index=\_\_your_sysmon_index\_\_ (sourcetype=wineventlog AND
(EventCode=1102 OR EventCode=1100)) OR (sourcetype=wineventlog AND
EventCode=104) \| stats count by \_time EventCode Message sourcetype
host

Windows audit log cleared

Look for security logs filtered with EventCode 1102.

index=windows source="WinEventLog:Security" EventCode=1102 \| table
\_time, host, signature, user’

# Outcome
