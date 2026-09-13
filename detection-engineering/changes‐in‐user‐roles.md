
Purpose
Monitor changes to user roles and permissions (SOC2 CC6.1- Logical Access).

Query
index=windows EventCode=4728 OR EventCode=4732 | stats count by Group_Name, Account_Name

Outcome
Tracks changes in user groups and roles across Windows environments. Helps identify unauthorized privilege changes or misuse.


