RAID - (Redudant Array of Independent
Disks)
Different levels of RAID arrays or combination is for:
Improve disk access.
Improve fault tolerance and data integrity.
Or both
7 of 178
RAID 0
Has no data integrity.
Improves speed - data striping(divide the data into pieces in X hard drives); RAID0 speeds up performance but
has no integrity, because if one of these hard drives fail, the data is lost.
RAID 1
Has data integrity - but doesn't have performance ; slow process because the data processed in all hard drives.
RAID 5
Has disk striping with parity - parity information is spread across all disks evenly; 1/n of the total disk space
available is used for parity. You can only loose one drive and keep the data, the problem is if you loose more than
one drive.
RAID 6
Disk parity with double distributed parity - Same as RAID 5 but has one more parity which you can loos two
drives and keep your data safe.
RAID 0+1 (01)
Disk striping with mirroring - combines both RAID levels 0 and 1 for performance and redundancy; a mirror of
two striped arrays.
RAID 1+0 (10)
Disk mirroring with striping - combines both RAID level 0 and 1 for performance and redundancy; a strip of two
mirrored arrays.
🛑 The most common RAID styles includes 0, 1, 5 and 10.
🛑 RAID 1 and RAID 0 requires at least 2 drives.
🛑 RAID 5 requires 3 or more drives and RAID 10 requires 4 drives


RAID Level 
RAID O 
RAID 1 
RAID 5 
RAID 0+1, RAID 1+0, 
RAID 5+1, etc. 
Description 
Striping without parity 
Mirroring 
Striping with parity 
Multiple RAID types 
Details 
High performance, 
no fault tolerance 
Duplicates data for fault 
tolerance, but requires 
twice the disk space 
Fault tolerant, 
only requires an additional 
disk for redundancy 
Combine RAID methods to 
increase redundancy
