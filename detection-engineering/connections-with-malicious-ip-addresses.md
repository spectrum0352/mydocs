# Get a list of all malicious IP addresses from a threat intelligence feed

```
let maliciousIPAddresses = threatIntelligenceFeed | project IPAddress;
DeviceProcessEvents
| where RemoteIP in (maliciousIPAddresses)
| project DeviceName, RemoteIP
// Search for machines which have connections with malicious IP addresses
let machinesWithMaliciousConnections = DeviceProcessEvents
| where RemoteIP in (maliciousIPAddresses)
| project DeviceName, RemoteIP
```

### List of machines having connections with malicious IP address

DeviceProcessEvents
| where RemoteIP in (maliciousIPAddresses)
| project DeviceName, RemoteIP

The maliciousIPAddresses list can be populated with known malicious IP addresses from a variety of sources, such as threat intelligence feeds or internal security databases.

Get a list of all malicious IP addresses from a threat intelligence feed

let maliciousIPAddresses = threatIntelligenceFeed \| project IPAddress;
// Search for machines which have connections with malicious IP addresses
let machinesWithMaliciousConnections = DeviceProcessEvents
| where RemoteIP in (maliciousIPAddresses)
| project DeviceName, RemoteIP

The machinesWithMaliciousConnections list can then be used to investigate further and take appropriate actions, such as isolating the affected machines or blocking the malicious IP addresses.
