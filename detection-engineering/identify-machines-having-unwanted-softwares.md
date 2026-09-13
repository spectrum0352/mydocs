# Identify machines having unwanted software

DeviceProcessEvents
| where ProcessName in (unwantedSoftwareList)
| project DeviceName

This query will return a list of all machines that have any of the processes in the unwantedSoftwareList list running. The unwantedSoftwareList can be populated with a list of known unwanted software processes, such as malware or cryptocurrency miners.

> Get a list of all known unwanted software processes
> Search for machines that have unwanted software installed

let unwantedSoftwareList = securityDatabase \| project ProcessName;
let machinesWithUnwantedSoftware = DeviceProcessEvents
| where ProcessName in (unwantedSoftwareList)
| project DeviceName

The machinesWithUnwantedSoftware list can then be used to investigate further and take appropriate actions, such as removing the unwanted software from the affected machines.


- **Identify machines that may have unwanted software installed**