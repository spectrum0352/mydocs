
MS SQL Server is widely used in enterprise networks. Due to its use by third party applications, support for legacy applications and use as a database, SQL Server is a treasure trove for attackers. It gets integrated with in an active directory environment very well, which makes it an attractive target for abuse of features and privileges.

Tools:
1.PowerUPSQL.ps1 2.Get-SQLInstanceLocal -Verbose 3.(Get-SQLServerLinkCrawl -Verbose -Instance "10.10.10.20" -Query 'select * from master..sysservers').customquery Import-Module .\powercat.ps1 powercat -l -v -p 443 -t 10000

Solution:
You can use the TRUSTWORTHY database setting to indicate whether the instance of Microso SQL Server trusts the database and the contents within the database. By default, this setting is set to OFF. However, you can set it to ON by using the ALTER DATABASE statement. I recommend that you leave this setting set to OFF to mitigate certain threats that may be present when a database is attached to the server
