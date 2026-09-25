Disaster Recovery - Evacuation Plan
Backup Sites:
🔵 Cold site
144 of 178
Empty site, no hardware, no data, no people
It takes weeks to bring online
Basic office spaces (e.g building, chairs, AC...)
No operational equipment
Cheapest recovery site
🟡 Warm site
Somewhere between cold and hot - Just enough to get going (Big room with rack space, you bring the
hardware)
Hardware is ready and waiting - you bring the software and data
It takes days to bring online
Operational equipment but little or no data
🔴 Hot site
145 of 178
Exact replica of production systems
Applications and software are constantly updated
Flip a switch and everyting moves
It take hours to bring online
Real-time synchronization
Almost all data ready to go - often just a quick update
Very expensive
Order of Restoration
1. Power
2. Wired LAN (is open and running)
3. ISP link (running)
4. Active Directory/DNS/DHCP server (up and cooking)
5. Account servers
6. Sales and account workstations
7. Production servers
8. Production workstation
9. Wireless access
10. Peripherals (Printers, Camers, Scanners, faxes...)
Annual exercises - Continuity of Operations
Failover
Simple means the process of making recovery site happen.
Alternative Processing Sites
Different types of processing sites
Alternative Business Practices
Manual transactions, paper receipts, phone calls for transaction approvals
These must be documented and tested before problem occurs
After-action Reports (AAR)
A clear and detailed documentation of everything that happened so that if it ever happens again you'll be
ready to handle any form of business contingency planning.
🛑 Through planning and practice is what makes recovery plans successful when disasters occur
🛑 A fail-safe device responds by not doing anything to cause harm when the failure occurs.
🛑 A fail-secure device responds by making sure the device is using a secure state when a failure occurs.
Backups 
146 of 178
📑
Media for Backups
External hard-drive
Tape
Cloud
Offsite Backup
Remote backup is good for natural disasters in general (fire, flood, water pipe burst, hurricane, tornando).
Vaulting
Send your backup media to an outside storage facility
E-valuating - Send the data electronically
Organization-owned site or 3rd-party
Usually a secure facility
Backups require extensive protection
Data loss and thef is a significant concern
Many compliance mandates (SOX, HIPAA, etc)
🛑 Location selection have legal implications and Data sovereignty (data that resides in a country is subject
to the laws of that country)
Cloud Backup
Cloud backups work beautifully, however, they have one big downside and that is they take up a tremendous amount of
time to get the initial backups going.
Snapshots
Snapshots typically under virtual machines and they are an absolute perfect way of making a copy of something that's
happened in the past.
Backup Utilities
Protect from unexpected downtime
Malware infection
Ransomware
Server defacement
Real-time file sync
rsync
Regular partial backups - hourly incremental backups
Full backups - complete file backups
Complete coverage, fast recovery
Differential Backup
Backup all the changes since the last full backup
147 of 178
�
� Differential there are less backup sets but they get bigger.
Incremental Backup
Only backs up changes made from last backup
🛑 Incremental more backup sets but smaller.
Type
Data Selection
Backup
Restore
Time
Archive
Attribute
Full
All selected data
High (one tape set)
Low
Cleared
Incremental
New files and files modified since
the last backup
Low (multiple tape
sets)
High
Cleared
148 of 178
Type
Data Selection
Backup
Restore
Time
Archive
Attribute
Differential
All data modified since the last full
backup
Moderate (no more
than 2 sets)
Moderate
Not cleared
