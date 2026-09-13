Purpose
While batch files are not inherently malicious, it is uncommon to see them created after OS installation, especially in the Windows directory. This analytic looks for the suspicious activity of a batch file being created within the C:\Windows\System32 directory tree. There will be only occasional false positives due to administrator actions

Query
| tstats count min(_time) as firstTime max(_time) as lastTime values(Filesystem.dest) as dest values(Filesystem.file_name) as file_name values(Filesystem.user) as user from datamodel=Endpoint.Filesystem by Filesystem.file_path | rex field=file_name "(?\.[^\.]+)$" | search file_path=*system32* AND file_extension=.bat

Outcome
Monitors for any modifications to critical files or directories. Detects unauthorized or suspicious file permission changes
