# VM running DB which must be migrated to new region for disaster recovery

Scenario: Azure VM running a production database must be migrated to a new region for Disaster Recovery


1. Azure Services & Tools to Use

Primary Migration / DR Services

Azure Site Recovery (ASR) – VM-level replication across regions, supports near-zero-downtime cutover
Azure Backup – point-in-time recovery and fallback
Azure Migrate – assessment + discovery before move
Azure Storage Replication – underlying disk replication for ASR
Azure Traffic Manager / Azure Front Door – redirect application traffic after failover
Azure Load Balancer – regional routing
 

Database-Specific Replication (Preferred When Supported)

If SQL Server on VM:

SQL Server Always On Availability Groups
Failover Cluster Instance (FCI) with stretched cluster
Transactional Replication (limited DR use cases)
Log Shipping (simple DR)
If Oracle on VM:

Oracle Data Guard
If MySQL/Postgres on VM:

Native engine replication
Azure Database Migration Service (if modernizing)
2. Steps to Minimize Downtime During Migration

Phase 1 – Assessment & Preparation

Inventory VM and DB using Azure Migrate
Verify disk throughput / latency requirements
Size target VM in DR region
Ensure same OS, DB version, patch level
Deploy VNet/subnets/NSGs/Private Endpoints in DR region
Open replication ports
Enable Azure Site Recovery replication
Configure DB-level replication in parallel if required
Phase 2 – Continuous Replication

Allow ASR to complete initial sync
Monitor replication health and RPO
Run test failover in isolated network
Validate DB integrity and application connectivity
Keep production active
Phase 3 – Planned Failover (Cutover Window)

Freeze application writes / enable read-only mode
Force final replication sync
Take final DB log backup
Execute Planned Failover in ASR
Bring up VM in DR region
Switch DNS / Traffic Manager endpoint
Resume application writes
3. Ensuring Database Replication Is Working After Migration

Infrastructure Level (ASR)

Confirm Replication Health = Protected
RPO within SLA
No backlog in change rate
Validate disks attached and consistent
Run post-failover ASR health checks
Database Level Validation

SQL Server:

Check AG synchronization state = SYNCHRONIZED
Validate last log sequence number (LSN)
Run DBCC CHECKDB
Validate replication latency
Query sys.dm_hadr_database_replica_states
Oracle:

Verify Data Guard broker status
Check apply lag / transport lag
MySQL/Postgres:

Check replication slots
Verify replica lag = 0
Test write/read consistency
Application & Functional Testing

Execute application smoke tests
Validate transactions committed before cutover
Run data row counts / checksums
Verify backup jobs running in new region
Confirm monitoring alerts
4. Enterprise-Grade DR Controls (Post-Migration)

Re-enable Azure Backup in target region
Configure reverse replication (DR → Primary)
Update runbooks
Update CMDB
Update firewall rules / private endpoints
Update Key Vault references
Enable Defender for SQL / Defender for Servers
Validate monitoring in Log Analytics