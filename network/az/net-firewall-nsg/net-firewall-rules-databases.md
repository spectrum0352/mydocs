### SQL Server Port Configuration Table

|Protocol|Port(s)|Description|Purpose|Notes|
|-|-|-|-|-|
|TCP|1433|SQL Server Instance / Availability Group Listener|Default port for SQL Server connections and AG listener communication.|Can be changed. Most common port.|
|TCP/UDP|1434|SQL Server Browser|Discovery of named SQL Server instances.|Essential for named instances; can be disabled.|
|TCP|5022|Database Mirroring / Availability Group Endpoint|Communication for database mirroring and AG replication.|Default, but configurable. Crucial for High Availability.|
|TCP/UDP|49152-65535|Dynamic Port Range|Dynamic allocation for various SQL Server operations.|Configurable; adjust based on security policies.|
|UDP|2382|SQL Server Analysis Services Browser|Discovery of Analysis Services instances.|Used by Analysis Services.|
|TCP|2383|SQL Server Analysis Services Listener|Connections to Analysis Services.|Used by Analysis Services.|
|TCP|80/443|HTTP/HTTPS Endpoints|Web-based access to SQL Server instances.|Used for web connections.|
|TCP|443|Default Instance HTTPS Endpoint|Secure web connections to the default instance.|Used for secure web connections.|
|TCP|4022|SQL Server Service Broker|Communication for Service Broker.|Commonly used, but not a default port.|

### SQL Server Security and Configuration Rules

|Rule|Description|Notes|
|-|-|-|
|Firewall Configuration|Open only necessary ports based on services used. Implement IP whitelisting.|Regularly review and update rules.|
|Dynamic Port Management|Adjust the dynamic port range according to security policies.|Limit the range to reduce attack surface.|
|Named Instances|Ensure TCP/UDP 1434 is open if using named instances. Disable SQL Server Browser if not used.|Consult error logs for specific port numbers.|
|Availability Groups|Open TCP 1433 and 5022.|Avoid interrupting port 5022 to prevent quorum issues.|
|Analysis Services|Open UDP 2382 and TCP 2383 if used.|Ensure proper configuration.|
|Additional Security|Implement network segmentation, strong authentication, NSGs, and access controls.|Mitigate risks and enhance protection.|
|Port Configuration|Document all port configurations.|Some ports are configurable.|
|Regular Reviews|Regularly review and update firewall rules and security configurations.|Adapt to system changes.|

 

 



