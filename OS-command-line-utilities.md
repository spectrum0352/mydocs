OS Utilities - Command Line (Linux &
Windows)
Security+ covers simple Linux and Windows commands.
To understand the functionality behind the commands I recommend to test them at your own.
ping
Can be handful for DNS checks (up / or down) | is a DNS tool to resolves web addresses to an IP address.
Test reachability - determine round-trip time, and uses ICMP protocol.
~#: ping www.google.com 
PING www.google.com (172.217.168.164): 56 data bytes
64 bytes from 172.217.168.164: icmp_seq=0 ttl=55 time=25.981 ms
64 bytes from 172.217.168.164: icmp_seq=1 ttl=55 time=25.236 ms--- www.google.com ping statistics --
28 of 178
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 25.236/25.608/25.981/0.373 ms
🛑 In Windows you need to add a -t flag to keep running.
Most useful switches for Ping command - Windows:
Switch
Description-a
Resolve address to hostnames-f
Set don't fragment flag in packet (IPv4 only)-4
Force using IPv4-6
Force using IPv4
netstat
Network statistics
Get info on host system TCP / UDP connections and status of all open and listening ports and routing table.
Who you talking to?
Who trying talking to you?
netstat -a # (show all active connections) (servers)
netstat -n # (hosts)
netstat -b # (Show binaries Windows)
tracert | traceroute
Traceroute - how packets get from host to another endpoint. Traceroute is helpful to see what routers are being hit,
both internal and external.
tracert - Windows
traceroute - Linux
Take advantage of ICMP Time to Live (TTL) Exceeded error message
The time in TTL refers to hops, not seconds or minutes.
TTL=1 is the first router.
TTL=2 is the second router, and so on


