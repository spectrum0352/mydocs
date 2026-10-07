# Web server log collection through the Azure Monitor DCR and AMA

Install nginx: sudo apt install nginx -y

sudo apt update

 

 

Verify nginx: sudo systemctl status nginx

Verify nginx logs:

/var/log/nginx/access.log

/var/log/nginx/error.log

 

 

 

 

If we want get the application logs as part of the Syslog table of Log analytics workspace only:

 

Enabled Syslog DCR to collect the Local-0 to Local-7 Facilities

Edited file /etc/nginx/nginx.conf

 

Added following lines in the http {} bracket

access_log syslog:server=unix:/dev/log,facility=local0,tag=nginx_access;

error_log syslog:server=unix:/dev/log,facility=local0,tag=nginx_error;

 

 

Restart Nginx

 

sudo systemctl restart nginx

 

Tested #curl http://localhost

 

Check latest syslogs for:

 

sudo tail -f /var/log/syslog

 



 

 

 

 

If we want to get application logs in separate tables of log analytics workspace:

 

To create nginx specific tables in LAW:

NginxAccess_CL
NginxErrorLogs_CL
 

Create and new custom table in Log analytics workspace:

LAW -> New Custom Log (Direct Ingest)

Table name: NginxAccess_CL or NginxErrorLogs_CL

Table plan: Analytics

Create separate DCRs for the Nginx Access & Error logs

Select existing DCE

Upload JSON schema of the Access and Error logs:

 

SampleErrorLogs.json

{

  "TimeGenerated": "2026-02-25T19:21:56Z",

  "RawData": "2026/02/25 19:21:56 [debug] 17995#17995: *4 http keepalive handler"

}

 

SampleAccessLogs.json

{

  "TimeGenerated": "2026-02-25T00:00:00Z",

  "RawData": "::1 - - [25/Feb/2026:17:08:04 +0000] \"HEAD / HTTP/1.1\" 200 0 \"-\" \"curl/8.5.0\""

}

 

Associate both DCRs with the Required VMs

 

 

 

Perfect — below is the clean, structured configuration in table format for collecting Nginx Access and Error logs into separate Log Analytics Workspace tables using:

✅ Azure Monitor Agent (AMA)
✅ Data Collection Rules (DCR)
✅ Data Collection Endpoint (DCE)
✅ Direct Ingest custom tables
 

🔷 1️⃣️⃣ Custom Tables Configuration (Log Analytics Workspace)

Setting

Nginx Access Logs

Nginx Error Logs

LAW Path

LAW → Tables → New Custom Log (Direct Ingest)

LAW → Tables → New Custom Log (Direct Ingest)

Table Name

NginxAccess_CL

NginxErrorLogs_CL

Table Plan

Analytics

Analytics

Schema Source

Upload JSON sample

Upload JSON sample

Required Columns

TimeGenerated (datetime)RawData (string)

TimeGenerated (datetime)RawData (string)

 

🔹 SampleAccessLogs.json

{
  "TimeGenerated": "2026-02-25T00:00:00Z",
  "RawData": "::1 - - [25/Feb/2026:17:08:04 +0000] \"HEAD / HTTP/1.1\" 200 0 \"-\" \"curl/8.5.0\""
}

 

🔹 SampleErrorLogs.json

{
  "TimeGenerated": "2026-02-25T19:21:56Z",
  "RawData": "2026/02/25 19:21:56 [debug] 17995#17995: *4 http keepalive handler"
}

 

🔷 2️⃣️⃣ Data Collection Endpoint (DCE) Configuration

Setting

Value

Resource Type

Data Collection Endpoint

Region

Same as LAW & VM

Network

Public (or Private Link if secured)

Usage

Selected during DCR creation

 

🔷 3️⃣️⃣ Data Collection Rules (DCR) Configuration

You will create two separate DCRs.

 

🔹 DCR 1 – Nginx Access Logs

Setting

Value

DCR Name

DCR-Nginx-Access

Resource

Target Ubuntu VM

Data Source Type

Custom Text Logs

File Path

/var/log/nginx/access.log

Stream Name

Custom-NginxAccess_CL (auto-generated)

Destination

Log Analytics Workspace

Table Mapping

NginxAccess_CL

DCE

Select existing DCE

 

🔹 DCR 2 – Nginx Error Logs

Setting

Value

DCR Name

DCR-Nginx-Error

Resource

Target Ubuntu VM

Data Source Type

Custom Text Logs

File Path

/var/log/nginx/error.log

Stream Name

Custom-NginxErrorLogs_CL (auto-generated)

Destination

Log Analytics Workspace

Table Mapping

NginxErrorLogs_CL

DCE

Select existing DCE

 

🔷 4️⃣️⃣ VM & Agent Configuration

Setting

Value

OS

Ubuntu

Agent

Azure Monitor Agent (AMA) Installed

Service Status

systemctl status azuremonitoragent → running

Permissions

Nginx log files readable

DCR Association

Both DCRs attached to VM

 

🔷 5️⃣️⃣ Log Validation Queries (LAW)

🔹 Access Logs

NginxAccess_CL
| sort by TimeGenerated desc
| take 10

🔹 Error Logs

NginxErrorLogs_CL
| sort by TimeGenerated desc
| take 10

 

🔷 Final Architecture Flow

Nginx → /var/log/nginx/access.log

→ AMA

→ DCR-Nginx-Access

→ Stream Custom-NginxAccess_CL

→ Table NginxAccess_CL

Nginx → /var/log/nginx/error.log

→ AMA

→ DCR-Nginx-Error

→ Stream Custom-NginxErrorLogs_CL

→ Table NginxErrorLogs_CL

 

🔷 Production Best Practice Notes

Recommendation

Reason

Keep separate tables

Better querying & retention control

Use Analytics plan

Required for alerts & KQL

Ensure same region (VM, DCR, LAW, DCE)

Avoid ingestion failure

Use wildcard only if combining logs

Simplifies config

 

If you want next, I can provide:

🔹 Structured ingestion-time parsing for Nginx
🔹 Alert rule examples for 5xx & critical errors
🔹 Security monitoring KQL queries
🔹 Architecture diagram explanation for interview
Let me know your next objective.

 

From <https://chatgpt.com/c/699f28ca-7fa8-8324-b750-4e0f095b3d10>

 

 

 

 

 

 

Great — I'll extend your configuration with a clear permissions section, because this is often the hidden cause of ingestion failures.

Below is the complete configuration summary including required VM permission checks.

 

🔷 1️⃣️⃣ Custom Table– Log Analytics Workspacece

Setting

Nginx Access Logs

Nginx Error Logs

Create Path

LAW → Tables → New Custom Log (Direct Ingest)

LAW → Tables → New Custom Log (Direct Ingest)

Table Name

NginxAccess_CL

NginxErrorLogs_CL

Table Plan

Analytics

Analytics

Required Columns

TimeGenerated (datetime)RawData (string)

TimeGenerated (datetime)RawData (string)

Ingestion Type

DCR-based (Modern)

DCR-based (Modern)

 

🔷 2️⃣️⃣ Data Collection Endpoint (DCE)

Setting

Value

Required

Yes (for Direct Ingest tables)

Region

Same as LAW & VM

Selected in

Both DCRs

 

🔷 3️⃣️⃣ Data Collection Rules (DCR)

🔹 DCR – Nginx Access

Setting

Value

Name

DCR-Nginx-Access

Data Source

Custom Text Logs

File Path

/var/log/nginx/access.log

Stream

Custom-NginxAccess_CL

Destination

LAW

Table

NginxAccess_CL

DCE

Selected

Associated VM

Yes

 

🔹 DCR – Nginx Error

Setting

Value

Name

DCR-Nginx-Error

Data Source

Custom Text Logs

File Path

/var/log/nginx/error.log

Stream

Custom-NginxErrorLogs_CL

Destination

LAW

Table

NginxErrorLogs_CL

DCE

Selected

Associated VM

Yes

 

🔷 4️⃣️⃣ VM Configuration (Critical)

Component

Requirement

OS

Ubuntu

Agent

Azure Monitor Agent (AMA) Installed

Service Status

systemctl status azuremonitoragent = running

DCR Attached

Both DCRs associated to VM

 

🔷 5️⃣️⃣ Required File Permission Checks (IMPORTANT)

Azure Monitor Agent runs with elevated system privileges, but log files must still be readable.

 

🔹 Step 1 – Check Permissions

ls -l /var/log/nginx/access.log
ls -l /var/log/nginx/error.log

Typical output:

-rw-r----- 1 www-data adm access.log
-rw-r----- 1 www-data adm error.log

This is usually sufficient.

 

🔹 If Logs Are Not Readable

Temporarily test with:

sudo chmod 644 /var/log/nginx/access.log
sudo chmod 644 /var/log/nginx/error.log

This ensures read permission for all users.

 

🔹 Log Rotation File Permissions

Also verify rotated logs:

ls -l /var/log/nginx/

If using wildcard in DCR (*.log), rotated files must also be readable.

 

🔹 Restart Agent After Permission Change

sudo systemctl restart azuremonitoragent

 

🔷 6️⃣️⃣ Validation Queries

Access Logs

NginxAccess_CL
| sort by TimeGenerated desc
| take 10

Error Logs

NginxErrorLogs_CL
| sort by TimeGenerated desc
| take 10

 

🔷 7️⃣️⃣ Common Permission-Related Issues

Issue

Fix

Permission denied in mdsd.err

Adjust file mode

Logs rotate but new file not read

Check logrotate permissions

DCR correct but no ingestion

Restart AMA

Wrong file path

Verify exact path in DCR

 

🔷 8️⃣️⃣ Final Architecture Flow

Nginx

→ /var/log/nginx/access.log

→ AMA

→ DCR-Nginx-Access

→ NginxAccess_CL

Nginx

→ /var/log/nginx/error.log
→ AMA
→ DCR-Nginx-Error
→ NginxErrorLogs_CL

We can also:

🔹 Production-grade parsing (structured columns instead of RawData)
🔹 Security monitoring queries (5xx spikes, suspicious IPs)
🔹 Alert rule configuration
🔹 Troubleshooting checklist if logs still don't appear
