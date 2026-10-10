# Comprehensive Nmap Cheat Sheet

### Target Specification
- **Scan a single target**: `nmap [target]`
- **Scan multiple targets**: `nmap [target1] [target2]`
- **Scan a list of targets from a file**: `nmap -iL [file.txt]`
- **Scan a range of IP addresses**: `nmap [192.168.1.1-20]`
- **Scan an entire subnet (CIDR notation)**: `nmap [192.168.1.0/24]`
- **Scan random target hosts**: `nmap -iR [number]`
- **Exclude specific targets from a scan**: `nmap [targets] --exclude [targets]`
- **Exclude targets listed in a file**: `nmap [targets] --excludefile [list.txt]`
- **Scan an IPv6 target**: `nmap -6 [target]`

### Host Discovery & DNS Options
- **Perform a ping scan only (disable port scanning)**: `nmap -sn [target]` (legacy alias: `-sP`)
- **Disable host discovery (treat all hosts as online)**: `nmap -Pn [target]` (legacy alias: `-PN`)
- **Perform TCP SYN ping scan**: `nmap -PS[ports] [target]`
- **Perform TCP ACK ping scan**: `nmap -PA[ports] [target]`
- **Perform UDP ping scan**: `nmap -PU[ports] [target]`
- **Perform SCTP INIT ping scan**: `nmap -PY[ports] [target]`
- **Perform ICMP Echo ping scan**: `nmap -PE [target]`
- **Perform ICMP Timestamp ping scan**: `nmap -PP [target]`
- **Perform ICMP Address Mask ping scan**: `nmap -PM [target]`
- **Perform IP Protocol ping scan**: `nmap -PO[protocols] [target]`
- **Perform ARP ping scan (local network)**: `nmap -PR [target]`
- **Trace hop path to target**: `nmap --traceroute [target]`
- **Always perform reverse DNS resolution**: `nmap -R [target]`
- **Disable reverse DNS resolution**: `nmap -n [target]`
- **Use system DNS resolver**: `nmap --system-dns [target]`

### Port Specification & Scan Types
- **Scan specific ports**: `nmap -p [port(s)] [target]` (e.g., `nmap -p 80,443 [target]`)
- **Scan a port range**: `nmap -p [start-end] [target]` (e.g., `nmap -p 1-1000 [target]`)
- **Scan all 65,535 ports**: `nmap -p- [target]`
- **Fast scan (top 100 ports)**: `nmap -F [target]`
- **TCP SYN Stealth scan (default root scan)**: `nmap -sS [target]`
- **TCP Connect scan (default non-root scan)**: `nmap -sT [target]`
- **UDP scan**: `nmap -sU [target]`
- **TCP ACK scan (firewall rule detection)**: `nmap -sA [target]`
- **TCP NULL scan**: `nmap -sN [target]`
- **TCP FIN scan**: `nmap -sF [target]`
- **TCP Xmas scan**: `nmap -sX [target]`

### Version & OS Detection
- **Perform OS detection**: `nmap -O [target]`
- **Aggressively guess unknown OS versions**: `nmap -O --osscan-guess [target]`
- **Perform service version detection**: `nmap -sV [target]`
- **Troubleshoot service version scans**: `nmap -sV --version-trace [target]`
- **Perform RPC scan**: `nmap -sR [target]`

### Aggressive Scan Mode
- **Perform an aggressive scan (enables OS detection, version detection, script scanning, and traceroute)**: `nmap -A [target]`

### Firewall / IDS Evasion & Spoofing
- **Fragment IP packets**: `nmap -f [target]`
- **Specify custom MTU size**: `nmap --mtu [MTU] [target]` (must be a multiple of 8)
- **Cloak a scan with random decoys**: `nmap -D RND:[number] [target]`
- **Cloak a scan with specific decoys**: `nmap -D [decoy1,decoy2,ME] [target]`
- **Perform an Idle / Zombie scan**: `nmap -sI [zombie_host] [target]`
- **Manually specify a source port**: `nmap --source-port [port] [target]` (alias: `-g [port]`)
- **Append random payload data to packets**: `nmap --data-length [size] [target]`
- **Randomize target scan order**: `nmap --randomize-hosts [target]`
- **Spoof MAC address**: `nmap --spoof-mac [MAC|0|vendor] [target]`
- **Send packets with dummy/bad checksums**: `nmap --badsum [target]`

### Nmap Scripting Engine (NSE)
- **Run default safe scripts**: `nmap -sC [target]`
- **Run a specific script**: `nmap --script [script_name] [target]`
- **Run scripts by category (e.g., vuln, safe, discovery)**: `nmap --script [category] [target]`
- **Pass arguments to scripts**: `nmap --script [script_name] --script-args [key=value] [target]`

### Timing & Performance
- **Set timing template (0–5: Paranoid, Sneaky, Polite, Normal, Aggressive, Insane)**: `nmap -T[0-5] [target]`
- **Set minimum/maximum host group size**: `nmap --min-hostgroup [size] --max-hostgroup [size] [target]`
- **Set minimum/maximum parallel probes**: `nmap --min-parallelism [num] --max-parallelism [num] [target]`

### Output Options
- **Save standard output to a text file**: `nmap -oN [scan.txt] [target]`
- **Save output in XML format**: `nmap -oX [scan.xml] [target]`
- **Save output in Grepable format**: `nmap -oG [scan.txt] [target]`
- **Save output in 133t (s3r10u5 script k1dd13) format**: `nmap -oS [scan.txt] [target]`
- **Output in all primary formats simultaneously**: `nmap -oA [path/filename] [target]`
- **Periodically display scan statistics**: `nmap --stats-every [time] [target]` (e.g., `10s`, `1m`)
- **Increase verbosity level**: `nmap -v [target]` (or `-vv` for higher detail)
- **Increase debugging level**: `nmap -d [target]` (or `-dd` for higher debug detail)

### Ndiff Scan Comparison Utility
- **Compare two XML scan files**: `ndiff [scan1.xml] [scan2.xml]`
- **Compare XML scan files in verbose mode**: `ndiff -v [scan1.xml] [scan2.xml]`
- **Output comparison results in XML format**: `ndiff --xml [scan1.xml] [scan2.xml]`
