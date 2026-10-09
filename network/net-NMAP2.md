- Ping sweep for network: nmap -sn -PE \<target\>

- Scan and show open ports: nmap --open \<target\>

- Determine open services: nmap -sV \<target\>

- Scan two open ports HTTP and HTTPS: nmap -p 80, 443 \<target\>

- Scan common UDP ports DNS: nmap -sU -p 53 \<target\>

- Scan TCP/UDP together, be verbose on a single host and include optional skip ping: nmap -v -Pn -sU -sT -p U:53, 111, 137, T:25, 80, 139, 8080 \<target\>

135/tcp msrpc

139/tcp netbios-ssn

445/tcp microsoft-ds

902/tcp iss-realsecure

912/tcp apex-mesh

**Scanning Port & Service in Comprehensive Mode**

1.  TCP Connect Scan with Wireshark

2.  Network Sweeping with Wireshark

3.  SYN Scan with Wireshark

4.  UDP Scan with Wireshark

5.  FIN Scan with Wireshark

6.  Null Scan with Wireshark

7.  OS Discovery with Wireshark

8.  NSE Scripts with Wireshark

9.  Nmap Firewall Scan

# Timing Options 

## Defeat Reset Rate Limits 

**\# nmap --defeat-rst-ratelimit scanme.insecure.org**

**Usage syntax:** nmap --defeat-rst-ratelimit \[target\]

# Evading Firewalls 

Firewalls and intrusion prevention systems are designed to prevent tools like Nmap from getting an accurate picture of the systems they are protecting. Nmap includes several features designed to circumvent these defenses. This section discusses the various evasion techniques built into Nmap.

<table style="width:34%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><strong>Flags</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Fragment Packets</td>
<td style="text-align: center;"><strong>-f</strong></td>
</tr>
<tr>
<td>Specify a Specific MTU</td>
<td style="text-align: center;"><strong>--mtu</strong></td>
</tr>
<tr>
<td>Use a Decoy</td>
<td style="text-align: center;"><strong>-D</strong></td>
</tr>
<tr>
<td>Idle Zombie Scan</td>
<td style="text-align: center;"><strong>-sI</strong></td>
</tr>
<tr>
<td>Manually Specify a Source Port</td>
<td style="text-align: center;"><strong>--source-port</strong></td>
</tr>
<tr>
<td>Append Random Data</td>
<td style="text-align: center;"><strong>--data-length</strong></td>
</tr>
<tr>
<td>Randomize Target Scan Order</td>
<td style="text-align: center;"><blockquote>
<p><strong>--randomize-hosts</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Spoof MAC Address</td>
<td style="text-align: center;"><strong>--spoof-mac</strong></td>
</tr>
<tr>
<td>Send Bad Checksums</td>
<td style="text-align: center;"><strong>--badsum</strong></td>
</tr>
</tbody>
</table>

Fragment Packets

The **-f** option is used to fragment probes into 8-byte packets. Scanning a target using fragmented packets

**\# nmap -f 10.10.1.48**

The **-f** option instructs Nmap to send small 8-byte packets thus fragmenting the probe into many very small packets. This option isn’t particularly useful in everyday situations; however, it may be helpful when attempting to evade some older or improperly configured firewalls. Some host operating systems may require the use of --send-eth combined with -f for fragmented packets to be properly transmitted.

Specify MTU (Maximum Transmission Unit)

The **--mtu** option is used to specify a custom MTU (Maximum Transmission Unit).

\# nmap --mtu 16 10.10.1.48

The **--mtu** option is similar to the **-f** option (discussed on page 117) except it allows you to specify your own MTU to be used during scanning. This creates fragmented packets that can potentially confuse some firewalls. In the above example, the **--mtu 16** argument instructs Nmap to use tiny 16-byte packets for the scan. *The MTU must be a multiple of 8 (example 8, 16, 24, 32, etc).*

*Some host operating systems may require the use of **--send-eth** combined with **--mtu** for fragmented packets to be properly transmitted.*

Use a Decoy

The **-D** option is used to mask an Nmap scan by using one or more decoys.

**Usage syntax:** nmap -D \[decoy1,decoy2,etc\|RND:number\] \[target\]

\# nmap -D RND:10 10.10.1.48

When performing a decoy scan Nmap will spoof additional packets from the specified number of decoy addresses. This effectively makes it appear that the target is being scanned by multiple systems simultaneously. Using decoys allows the actual source of the scan to “blend into the crowd” which makes it harder to trace where the scan is coming from.

In the above example **nmap -D RND:10** instructs Nmap to generate 10 random decoys. You can also specify decoy addresses manually using the following syntax: **nmap -D decoy1,decoy2,decoy3,etc**.

*Using too many decoys can cause network congestion and reduce the effectiveness of a scan. Additionally, some internet service providers may filter spoofed traffic which will reduce the effectiveness of using decoys to cloak your scanning activity.*

Idle Zombie Scan

The **-sI** option is used to perform an idle zombie scan.

**Usage syntax:** nmap -sI \[zombie host\] \[target\]

\# nmap -sI 10.10.1.41 10.10.1.252

The idle zombie scan is a unique scanning technique that allows you to exploit an idle system and use it to scan a target system for you. In this example 10.10.1.41 is the zombie and 10.10.1.252 is the target system. The scan works by exploiting the predictable IP sequence ID generation employed by some systems. In order for an idle scan to be successful, the zombie system must truly be idle at the time of scanning.

With this scan no probe packets are sent from your system to the target; although an initial ping packet will be sent to the target unless you combine -PN with -sI.

More information about the idle zombie scan can be found on the Nmap website at www.nmap.org/book/idlescan.html.

Specify Source Port Number

The **--source-port** option is used to manually specify the source port number of a probe.

**\# nmap --source-port 53 scanme.insecure.org**

**Usage syntax:** nmap --source-port \[port\] \[target\]

Every TCP segment contains a source port number in addition to a destination. By default, Nmap will randomly pick an available outgoing source port to probe a target. The **--source-port** option will force Nmap to use the specified port as the source for all packets. This technique can be used to exploit weaknesses in firewalls that are improperly configured to blindly accept incoming traffic based on a specific port number. Port 20 (FTP), port 53 (DNS), and 67 (DHCP) are common ports susceptible to this type of scan. *The **-g** option is a shortcut that is synonymous with **--source-port**.*

Append Random Data

The **--data-length** option can be used to append random data to probe packets.

> **\# nmap --data-length 25 10.10.1.252**

**Usage syntax:** nmap --data-length \[number\] \[target\]

Nmap transmits packets which are generally a specific size. Some firewall vendors know to look for this type of predictable packet size. The **--data-length** option adds the specified amount of additional data to probes in an effort to circumvent these types of checks. In the above example 25 additional bytes are added to all packets sent to the target.

Randomize Target Scan Order

The **--randomize-hosts** option is used to randomize the scanning order of the specified targets.

**\$ nmap --randomize-hosts 10.10.1.100-254**

**Usage syntax:** nmap --randomize-hosts \[targets\]

The **--randomize-hosts** option helps prevent scans of multiple targets from being detected by firewalls and intrusion detection systems. This is done by scanning them in a random order instead of sequential.

Spoof MAC Address

The **--spoof-mac** is used to spoof the MAC (Media Access Control) address of an ethernet device.

**Usage syntax:** nmap --spoof-mac \[vendor\|MAC\|0\] \[target\]

**\# nmap -sT -PN --spoof-mac 0 192.168.1.1**

In this example, Nmap is instructed to forge a randomly generated 3com MAC address. This makes your scanning activity harder to trace by preventing your MAC address from being logged on the target system.

The **--spoof-mac** option can be controlled by the following parameters:

<table style="width:49%;">
<colgroup>
<col style="width: 14%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Argument</strong></th>
<th style="text-align: center;"><strong>Function</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><strong>0 (zero)</strong></td>
<td>Generates a random MAC address</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>Specific MAC Address</strong></p>
</blockquote></td>
<td>Uses the specified MAC address</td>
</tr>
<tr>
<td style="text-align: center;"><strong>Vendor Name</strong></td>
<td><p>Generates a MAC address from the specified vendor</p>
<p>(such as Apple, Dell, 3Com, etc)</p></td>
</tr>
</tbody>
</table>

Send Bad Checksums

The **--badsum** option is used to send packets with incorrect checksums to the specified host.

\# nmap --badsum 10.10.1.41

**Usage syntax:** nmap --badsum \[target\]

The TCP/IP protocol uses checksums to ensure data integrity. Crafting packets with bad checksums can, in some rare occasions, produce a response from a poorly configured system. In the above example we did not receive any results, meaning the target system is configured correctly. This is a typical result when using the **--badsum** option.

Only a poorly configured system would respond to a packet with a bad checksum. Nevertheless, it is a good tool to use when auditing network security or attempting to evade firewalls.

# Output Options 

Nmap offers several options for creating formatted output. In addition to displaying the standard output on a screen, you can also save scan results in a text file, XML file, or a single line grepable file. This feature can be helpful when scanning a large number of systems or for comparing the results of two scans using the **ndiff** utility (discussed in Section 13).

The grep pattern matching utility is only available on Unix, Linux, and Mac OS X systems by default. Windows users can download a Win32 port of the GNU grep program at http://gnuwin32.sourceforge.net to use with the examples discussed in this section.

Summary of features covered in this section:

<table style="width:32%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><strong>Option</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Save Output to a Text File</td>
<td style="text-align: center;"><strong>-oN</strong></td>
</tr>
<tr>
<td>Save Output to a XML File</td>
<td style="text-align: center;"><strong>-oX</strong></td>
</tr>
<tr>
<td>Grepable Output</td>
<td style="text-align: center;"><strong>-oG</strong></td>
</tr>
<tr>
<td>Output All Supported File Types</td>
<td style="text-align: center;"><strong>-oA</strong></td>
</tr>
<tr>
<td>Periodically Display Statistics</td>
<td style="text-align: center;"><blockquote>
<p><strong>--stats-every</strong></p>
</blockquote></td>
</tr>
<tr>
<td>133t Output</td>
<td style="text-align: center;"><strong>-oS</strong></td>
</tr>
</tbody>
</table>

Save Output to a Text File

The **-oN** parameter saves the results of a scan in a plain text file.

> **\$ nmap -oN scan.txt 10.10.1.1**

**Usage syntax:** nmap -oN \[scan.txt\] \[target\]

The results of the above scan are saved to the scan.txt file shown below.

**\$ cat scan.txt**

*Nmap will overwrite an existing output file unless the **--append-output** option is combined with **-oN**.*

Save Output to a XML File

The **-oX** parameter saves the results of a scan in a XML file.

**\$ nmap -oX scan.xml 10.10.1.1**

**Usage syntax:** nmap -oX \[scan.xml\] \[target\]

The results of the above scan are saved to the scan.xml file shown below.

> **\$ cat scan.xml**
>
> \<?xml version="1.0" ?\>
>
> \<?xml-stylesheet href="file:///usr/local/share/nmap/nmap.xsl" type="text/xsl"?\>
>
> \<!-- Nmap 5.00 scan initiated Thu Aug 13 15:19:44 2009 as: nmap -oX scan.xml 10.10.1.1 --\>
>
> \<nmaprun scanner="nmap" args="nmap -oX scan.xml 10.10.1.1" start="1250194784" startstr="Thu Aug 13 15:19:44 2009" version="5.00" ...
>
> **Viewing the contents of the XML output file**

The resulting XML file has hardcoded file paths which may only work the system where the file was created. The **--webxml** parameter can be combined with **-oX** to create a portable file for any system (with internet access). You can also specify an alternative style sheet using the **--stylesheet** parameter. To avoid referencing a style sheet at all, use the **--no-stylesheet** parameter.

## Grepable Output 

The **-oG** option enables grepable output.

**Usage syntax:** nmap -oG \[scan.txt\] \[target\]

> **\$ nmap -oG scan.txt -F -O 10.10.1.1/24**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 15:50 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https ...
>
> **Creating a grepable output file**

The resulting scan is saved to the specified text file, which can be useful when combined with text parsing tools like Perl or **grep** (as displayed below).

> **\$ grep "Windows 98" scan.txt**
>
> Host: 10.10.1.217 Ports: 139/open/tcp//netbios-ssn///,
>
> 5800/open/tcp//vnc-http///, 5900/open/tcp//vnc/// Ignored State:
>
> closed (97) OS: Microsoft Windows 98 SE Seq Index: 18 IP ID
>
> Seq: Broken little-endian incremental ...
>
> **Using the grep utility to review a Nmap output file**

In the above example, the **grep** utility will display all instances of the specified text found in the scan.txt file. This makes it simple to quickly search for specific information when analyzing results from a large scan.

## Output All Supported File Types 

The **-oA** parameter saves the output of a scan in text, grepable, and XML formats.

**Usage syntax:** nmap -oA \[filename\] \[target\]

> **\$ nmap -oA scans 10.10.1.1**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 16:10 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.66 seconds
>
> **Creating output files for all available formats**

The resulting scan’s output files are created with their respective extensions as displayed below.

> **\$ ls -l scans.\***
>
> -rw-r--r-- 1 nick nick 284 2009-08-13 16:22 scans.gnmap
>
> -rw-r--r-- 1 nick nick 307 2009-08-13 16:22 scans.nmap
>
> -rw-r--r-- 1 nick nick 5150 2009-08-13 16:22 scans.xml
>
> **Directory listing of the resulting output files**

<table style="width:28%;">
<colgroup>
<col style="width: 14%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>File</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Contents</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>scans.gnmap</strong></p>
</blockquote></td>
<td>Grepable output</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>scans.nmap</strong></p>
</blockquote></td>
<td>Plain text output</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>scans.xml</strong></p>
</blockquote></td>
<td>XML output</td>
</tr>
</tbody>
</table>

> **Nmap output files**

## Display Scan Statistics 

The **--stats-every** option can be used to periodically display the status of the current scan.

**Usage syntax:** nmap --stats-every \[time\] \[target\]

> **\$ nmap --stats-every 5s 10.10.1.41**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 16:30 CDT
>
> Stats: 0:00:07 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 55.00% done; ETC: 16:30 (0:00:05 remaining)
>
> Stats: 0:00:12 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 85.00% done; ETC: 16:30 (0:00:02 remaining)
>
> Stats: 0:00:17 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 90.00% done; ETC: 16:30 (0:00:02 remaining)
>
> Stats: 0:00:22 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 90.00% done; ETC: 16:30 (0:00:02 remaining)
>
> Stats: 0:00:27 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 90.00% done; ETC: 16:30 (0:00:03 remaining) Stats: 0:00:32 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan ...
>
> **Nmap scan status output**

On slow scans you may get bored looking at your screen doing nothing for long periods of time. The **--stats-every** option can alleviate this problem. In the above example, **--stats-every 5s** instructs Nmap to display the status of the current scan every five seconds. Timing parameters can be specified in seconds (s), minutes (m), or hours (h) by appending an s, m, or h to the interval number as described on page 99.

## 133t Output 

The **-oS** option enables “script kiddie” output.

**Usage syntax:** nmap -oS \[scan.txt\] \[target\]

> **\$ nmap -oS scan.txt 10.10.1.1**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 15:45 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.48 seconds
>
> **Creating a “133t” output file**

Script kiddie or “leet” speak is output is a cryptic form of typing used mostly by immature teenagers on message boards and chat sites. This option is included as a joke and isn’t really useful for anything other than a good laugh. The results of the **-oS** option are saved in scan.txt file displayed below.

> **\$ cat scan.txt**
>
> StaRtING NMap 5.00 ( htTp://nmap.oRg ) aT 2009-08-13 15:45 CDT !nt3r3St\|ng pOrts 0n 10.10.1.1:
>
> n0t \$h0wn: 998 cl0\$3d p0rt\$
>
> P0RT \$TATE seRV!CE
>
> 80/tcp Open hTtp
>
> 443/tcp 0pen httpS
>
> Nmap DOnE: 1 Ip addresz (1 host up) \$canned iN 0.48 \$3c0nds
>
> **Nmap script kiddie output**

# Troubleshooting and Debugging 

Technical problems are an inherent part of using computers. Nmap is no exception. Occasionally a scan may not produce the output you expected; you may receive an error – or you may not receive any output at all. Nmap offers several options for tracing and debugging a scan which can help identify why this happens. The following section describes these troubleshooting and debugging features in detail.

> **Summary of features covered in this section:**

<table style="width:31%;">
<colgroup>
<col style="width: 20%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><strong>Option</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Getting Help</td>
<td style="text-align: center;"><strong>-h</strong></td>
</tr>
<tr>
<td>Display Nmap Version</td>
<td style="text-align: center;"><strong>-V</strong></td>
</tr>
<tr>
<td>Verbose Output</td>
<td style="text-align: center;"><strong>-v</strong></td>
</tr>
<tr>
<td>Debugging</td>
<td style="text-align: center;"><strong>-d</strong></td>
</tr>
<tr>
<td>Display Port State Reason</td>
<td style="text-align: center;"><strong>--reason</strong></td>
</tr>
<tr>
<td>Only Display Open Ports</td>
<td style="text-align: center;"><strong>--open</strong></td>
</tr>
<tr>
<td>Trace Packets</td>
<td style="text-align: center;"><blockquote>
<p><strong>--packet-trace</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Display Host Networking</td>
<td style="text-align: center;"><strong>--iflist</strong></td>
</tr>
<tr>
<td>Specify a Network Interface</td>
<td style="text-align: center;"><strong>-e</strong></td>
</tr>
</tbody>
</table>

## Getting Help 

Executing **nmap -h** will display a summary of available options.

### Usage syntax: nmap -h 

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -h</strong></p>
<p>Nmap 5.00 ( http://nmap.org )</p>
<p>Usage: nmap [Scan Type(s)] {target specification} TARGET SPECIFICATION:</p>
<p>Can pass hostnames, IP addresses, networks, etc.</p>
<p>Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254</p>
<p>-iL &lt;inputfilename&gt;: Input from list of hosts/networks</p>
<p>-iR &lt;num hosts&gt;: Choose random targets</p>
<p>--exclude &lt;host1[,host2][,host3],...&gt;: Exclude hosts/networks</p>
<p>--excludefile &lt;exclude_file&gt;: Exclude list from file</p>
<p>...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Displaying Nmap help information**

For more detailed information you can read the Nmap manual page by typing **man nmap** on the command line.

> **\$ man nmap**
>
> **Accessing the Nmap man page on Unix and Linux systems**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>The <strong>man</strong> command is only available on Unix, Linux, and Mac OS X based systems. Windows users can read the Nmap manual online at www.nmap.org/book/man.html.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Tip** | *You can also find help online by subscribing to the Nmap mailing list at www.seclists.org.* |
|----|----|

## Display Nmap Version 

The **-V** option is used to display the installed version of Nmap.

### Usage syntax: nmap -V 

> **\$ nmap -V**
>
> Nmap version 5.00 ( http://nmap.org )
>
> **Displaying the installed version of Nmap**

When troubleshooting Nmap problems you should always make sure you have the most up-to-date version installed. Open source programs like Nmap are developed at a rapid pace and bugs are typically fixed as soon as they are discovered. Compare your installed version to the latest version available on the Nmap website at www.nmap.org to make sure you are running the most up-to-date version available. This will ensure that you have access to the latest features as well as the most bugfree version available.

## Verbose Output 

The **-v** option is used to enable verbose output.

**Usage syntax:** nmap -v \[target\]

> **\$ nmap -v scanme.insecure.org**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-12 15:06 CDT NSE: Loaded 0 scripts for scanning.
>
> Initiating Ping Scan at 15:06
>
> Scanning 64.13.134.52 \[2 ports\]
>
> Completed Ping Scan at 15:06, 1.87s elapsed (1 total hosts)
>
> Initiating Parallel DNS resolution of 1 host. at 15:06
>
> Completed Parallel DNS resolution of 1 host. at 15:06, 0.16s elapsed
>
> Initiating Connect Scan at 15:06
>
> Scanning scanme.nmap.org (64.13.134.52) \[1000 ports\]
>
> Discovered open port 53/tcp on 64.13.134.52
>
> Discovered open port 80/tcp on 64.13.134.52
>
> Completed Connect Scan at 15:06, 7.00s elapsed (1000 total ports) Host scanme.nmap.org (64.13.134.52) is up (0.087s latency).
>
> Interesting ports on scanme.nmap.org (64.13.134.52):
>
> Not shown: 998 filtered ports
>
> PORT STATE SERVICE
>
> 53/tcp open domain
>
> 80/tcp open http
>
> Read data files from: /usr/local/share/nmap
>
> Nmap done: 1 IP address (1 host up) scanned in 9.41 seconds
>
> **Nmap scan with verbose output enabled**

Verbose output can be useful when troubleshooting connectivity problems, or if you are simply interested in what’s going on behind the scenes of your scan.

| **Tip** | *You can use the **-v** option twice (**-v -v** or **-vv**) to enable additional verbose output.* |
|----|----|

## Debugging 

The **-d** option enables debugging output.

**Usage syntax:** nmap -d\[1-9\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -d scanme.insecure.org</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-12 15:26 CDT</p>
<p>PORTS: Using top 1000 ports found open (TCP:1000, UDP:0, SCTP:0)</p>
<p>--------------- Timing report --------------- hostgroups: min 1, max 100000</p>
<p>rtt-timeouts: init 1000, min 100, max 10000 max-scan-delay: TCP 1000, UDP 1000, SCTP 1000 parallelism: min 0, max 0 max-retries: 10, host-timeout: 0 min-rate: 0, max-rate: 0</p>
<p>--------------------------------------------- NSE: Loaded 0 scripts for scanning.</p>
<p>Initiating Ping Scan at 15:26</p>
<p>Scanning 64.13.134.52 [2 ports]</p>
<p>Completed Ping Scan at 15:26, 2.83s elapsed (1 total hosts) Overall sending rates: 1.06 packets / s. mass_rdns: Using DNS server 10.10.1.44 mass_rdns: Using DNS server 10.10.1.45</p>
<p>Initiating Parallel DNS resolution of 1 host. at 15:26 mass_rdns: 0.00s 0/1 [#: 2, OK: 0, NX: 0, DR: 0, SF: 0, TR: 1] Completed Parallel DNS resolution of 1 host. at 15:26, 0.00s elapsed ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Nmap debugging output**

Debugging output provides additional information that can be use to trace bugs or troubleshoot problems. The default **-d** output provides a fair amount of debugging information. You can also specify a debugging level of 1-9 to be used with the **-d** parameter to increase or decrease the amount of output. For example: **-d1** provides the lowest amount of debugging output and **-d9** is the highest.

## Trace Packets 

The **--packet-trace** parameter instructs Nmap to display a summary of all packets sent and received.

**Usage syntax:** nmap --packet-trace \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap --packet-trace 10.10.1.1</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 17:14 CDT</p>
<p>CONN (0.1600s) TCP localhost &gt; 10.10.1.1:80 =&gt; Operation now in progress</p>
<p>CONN (0.1600s) TCP localhost &gt; 10.10.1.1:443 =&gt; Operation now in progress</p>
<p>NSOCK (0.1610s) UDP connection requested to 10.10.1.45:53 (IOD #1) EID 8</p>
<p>NSOCK (0.1610s) Read request from IOD #1 [10.10.1.45:53] (timeout: -1ms) EID 18 NSOCK (0.1610s) UDP connection requested to 10.10.1.44:53 (IOD #2) EID 24 NSOCK (0.1610s) Read request from IOD #2 [10.10.1.44:53] (timeout: -1ms) EID 34 NSOCK (0.1610s) Write request for 40 bytes to IOD #1 EID 43 [10.10.1.45:53]:</p>
<p>V!...........1.1.10.10.in-addr.arpa.....</p>
<p>NSOCK (0.1610s) nsock_loop() started (timeout=500ms). 5 events pending</p>
<p>NSOCK (0.1610s) Callback: CONNECT SUCCESS for EID 8 [10.10.1.45:53]</p>
<p>NSOCK (0.1610s) Callback: CONNECT SUCCESS for EID 24 [10.10.1.44:53]</p>
<p>NSOCK (0.1610s) Callback: WRITE SUCCESS for EID 43 [10.10.1.45:53] ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Packet trace output**

The **--packet-trace** parameter is another useful tool for troubleshooting connectivity issues. The example above displays detailed information about every packet sent to and received from the target system.

| **Tip** | *Trace information will rapidly scroll across the screen. See page 129 for information about saving trace data to a file for easier viewing.* |
|----|----|

## Display Host Networking Configuration 

The **--iflist** option displays the network interfaces and routes configured on the local system.

**Usage syntax:** nmap --iflist

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap --iflist</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 17:03 CDT</p>
<p>************************INTERFACES************************ DEV (SHORT) IP/MASK TYPE UP MAC lo (lo) 127.0.0.1/8 loopback up</p>
<p>eth0 (eth0) 10.10.1.107/24 ethernet up 00:21:70:AC:F7:E7 wlan0 (wlan0) 10.10.1.176/24 ethernet up 00:16:EA:F0:92:50</p>
<p>**************************ROUTES**************************</p>
<p>DST/MASK DEV GATEWAY</p>
<p>10.10.1.0/0 eth0</p>
<p>10.10.1.0/0 wlan0</p>
<p>169.254.0.0/0 wlan0</p>
<p>0.0.0.0/0 eth0 10.10.1.1</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Interface list output**

The above example displays the general network and routing information for the local system. This option can be helpful for quickly identifying network information or troubleshooting connectivity issues.

| **Tip** | *Additional commands that are helpful for troubleshooting networking configuration include **ifconfig** (Unix/Linux) and **ipconfig** (Windows). Most Windows and Unix based systems also include the **netstat** command which can provide additional network information.* |
|----|----|

## Specify Which Network Interface to Use 

The **-e** option is used to manually specify which network interface Nmap should use.

**Usage syntax:** nmap -e \[interface\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -e eth0 10.10.1.48</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-25 08:30 CDT Interesting ports on 10.10.1.48:</p>
<p>Not shown: 994 closed ports</p>
<p>PORT STATE SERVICE</p>
<p>21/tcp open ftp 22/tcp open ssh</p>
<p>25/tcp open smtp 80/tcp open http</p>
<p>111/tcp open rpcbind</p>
<p>2049/tcp open nfs</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 0.41 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Manually specifying a network interface**

Many systems have multiple network interfaces. Most modern laptops, for example, have both a regular ethernet jack and a wireless card. If you want to ensure Nmap is using your preferred interface you can use **-e** to specify it on the command line. In this example **-e** is used to force Nmap to scan via the *eth0* interface on the multihomed host system.

> 146

# Nmap Scripting Engine (NSE) 

The Nmap Scripting Engine (NSE) is a powerful tool that allows users to develop custom scripts which can be used to harness Nmap’s advanced scanning functions. In addition to the ability to write your own custom scripts, there are also a number of standard built-in scripts that offer some interesting features such as vulnerability detection and exploitation. This section covers the basic usage of these built-in scripts.

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>Scripts for NSE are written in the Lua programming language. Unfortunately, programming in Lua is outside the scope of this book. For more information about Lua visit www.lua.org.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col style="width: 7%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Warning</strong></p>
</blockquote></th>
<th><em>The NSE uses aggressive scanning techniques which (in some rare cases) can cause undesirable results like system downtime and data loss. Additionally, NSE vulnerability exploitation features could get you into legal trouble if you don’t have permission to scan the target systems</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Summary of features covered in this section:**

<table style="width:42%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><blockquote>
<p><strong>Option</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Execute Individual Scripts</td>
<td style="text-align: center;"><strong>--script [script]</strong></td>
</tr>
<tr>
<td>Execute Multiple Scripts</td>
<td style="text-align: center;"><strong>--script [script1,script2,etc]</strong></td>
</tr>
<tr>
<td>Execute Scripts by Category</td>
<td style="text-align: center;"><strong>--script [category]</strong></td>
</tr>
<tr>
<td>Execute Multiple Script Categories</td>
<td style="text-align: center;"><blockquote>
<p><strong>--script [category1, category2]</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Troubleshoot Scripts</td>
<td style="text-align: center;"><strong>--script-trace</strong></td>
</tr>
<tr>
<td>Update the Script Database</td>
<td style="text-align: center;"><strong>--script-updatedb</strong></td>
</tr>
</tbody>
</table>

## Execute Individual Scripts 

The **--script** argument is used to execute NSE scripts.

**Usage syntax:** nmap --script \[script.nse\] \[target\]

> **\# nmap --script whois.nse scanme.insecure.org**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-13 15:27 CST Interesting ports on scanme.nmap.org (64.13.134.52):
>
> Not shown: 996 filtered ports
>
> PORT STATE SERVICE
>
> 25/tcp closed smtp
>
> 53/tcp open domain
>
> 70/tcp closed gopher
>
> 80/tcp open http
>
> Host script results:
>
> \| whois: Record found at whois.arin.net
>
> \| netrange: 64.13.134.0 - 64.13.134.63
>
> \| netname: NET-64-13-143-0-26
>
> \| orgname: Titan Networks
>
> \| orgid: INSEC
>
> \|\_ country: US stateprov: CA
>
> Nmap done: 1 IP address (1 host up) scanned in 8.12 seconds
>
> **Executing a NSE script**

Script results are displayed under the heading “Host script results”. In the example above, the **--script** option is used to execute a script called whois.nse. The built-in whois.nse script retrieves information about the public IP address of the specified target from ARIN (American Registry for Internet Numbers). This is just one of the many built-in NSE scripts.

| **Tip** | *A complete list of the built-in scripts for Nmap 5.00 can be found online at www.nmap.org/nsedoc/.* |
|----|----|

## Execute Multiple Scripts 

The Nmap Scripting Engine supports the ability to run multiple scripts concurrently.

**Usage syntax:** nmap --script \[script1,script2,etc\|"expression"\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap --script "smtp*" 10.10.1.44</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-15 14:24 CST Interesting ports on 10.10.1.44:</p>
<p>...</p>
<p>| smtp-commands: EHLO exchange-01.dontfearthecommandline.com Hello</p>
<p>[10.10.1.173], TURN, SIZE, ETRN, PIPELINING, DSN, ENHANCEDSTATUSCODES,</p>
<p>8bitmime, BINARYMIME, CHUNKING, VRFY, X-EXPS GSSAPI NTLM LOGIN, X-</p>
<p>EXPS=LOGIN, AUTH GSSAPI NTLM LOGIN, AUTH=LOGIN, X-LINK2STATE, XEXCH50</p>
<p>|_ HELP This server supports the following commands: HELO EHLO STARTTLS RCPT DATA RSET MAIL QUIT HELP AUTH TURN ETRN BDAT VRFY |_ smtp-open-relay: OPEN RELAY found.</p>
<p>...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Executing all SMTP scripts**

In this example, the asterisks wildcard character is used to execute all scripts that begin with *smtp*. You can also provide a comma-separated list of individual scripts to run using the following syntax: **nmap --script script1,script2,script3,etc.**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>When using wildcards, the expression must be enclosed in quotes such as “smtp*” or “ftp*”.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Tip** | *Some Nmap scripts accept arguments using the **--script-args** option. This allows you to specify specific parameters for a script. A complete list of arguments for each script can be found at www.nmap.org/nsedoc/.* |
|----|----|

## Script Categories 

You can use the **--script** option to execute NSE scripts based on category. The table below describes the available categories:

<table style="width:51%;">
<colgroup>
<col style="width: 10%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Categories</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Purpose</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>all</strong></p>
</blockquote></td>
<td>Runs all available NSE scripts</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>auth</strong></p>
</blockquote></td>
<td>Scripts related to authentication</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>default</strong></p>
</blockquote></td>
<td>Runs a basic set of default scripts</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>discovery</strong></p>
</blockquote></td>
<td>Attempts to discover in depth information about a target</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>external</strong></p>
</blockquote></td>
<td>Scripts that contact external sources (such as the whois database)</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>intrusive</strong></p>
</blockquote></td>
<td>Scripts which may be considered intrusive by the target system</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>malware</strong></p>
</blockquote></td>
<td>Scripts that check for open backdoors and malware</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>safe</strong></p>
</blockquote></td>
<td>Basic scripts that are not intrusive</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>vuln</strong></p>
</blockquote></td>
<td>Checks target for commonly exploited vulnerabilities</td>
</tr>
</tbody>
</table>

> **NSE script categories**

Using script categories is the easiest way to launch NSE built-in scripts − unless you know the specific script you want to run. Executing scripts by category, however, can take longer to complete since each category contains numerous scripts.

| **Tip** | *A complete list of the NSE scripts in each category can be found online at www.nmap.org/nsedoc/.* |
|----|----|

## Execute Scripts by Category 

The **--script** option can be used to execute multiple scripts based on their category.

**Usage syntax:** nmap --script \[category\] \[target\]

> **\# nmap --script default 10.10.1.70**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-13 15:09 CST Interesting ports on 10.10.1.70:
>
> Not shown: 997 filtered ports
>
> PORT STATE SERVICE
>
> 139/tcp open netbios-ssn
>
> 445/tcp open microsoft-ds
>
> 5900/tcp open vnc
>
> MAC Address: 00:0C:F1:A6:1F:16 (Intel)
>
> Host script results:
>
> \|\_ nbstat: NetBIOS name: AXIS-01, NetBIOS user: \<unknown\>, NetBIOS
>
> MAC: 00:0c:f1:a6:1f:16
>
> \| smb-os-discovery: Windows XP
>
> \| LAN Manager: Windows 2000 LAN Manager
>
> \| Name: WORKGROUP\AXIS-01
>
> \|\_ System time: 2009-11-13 15:09:12 UTC-6
>
> Nmap done: 1 IP address (1 host up) scanned in 52.40 seconds
>
> **Executing all scripts in the default category**

By specifying a category (see page 165) with the **--script** option Nmap will execute every script in that category. In the example above, the results of the scripts in the default category are displayed under the “*Host script results”* heading.

| **Tip** | *The **-sC** option is a shortcut for **--script default** which will execute all of the NSE scripts in the default category.* |
|----|----|

## Execute Multiple Script Categories 

Multiple script categories can be executed concurrently using one of the following syntax structures:

### nmap --script category1,category2,etc 

Specifying multiple script categories as a comma-separated list would execute all scripts in the defined categories. For example, executing **nmap --script malware,vuln** would run all scripts in the malware and vulnerabilities categories.

### nmap --script "category1 and category2" 

NSE scripts can belong to more than one category. Using this syntax would execute all that belong to both the specified categories. For example, **nmap --script "default and safe"** would only execute scripts that belong to both the default *and* safe categories.

### nmap --script "category1 or category2" 

The ***or*** operator can be used to run scripts that belong to either of the specified

categories. For example, **nmap --script "default or safe"** would execute all scripts that belong to either the default *or* safe categories.

### nmap --script "not category" 

The ***not*** operator is used to exclude scripts that belong to the specified category. For example, executing **nmap --script "not intrusive"** would run all scripts that do not belong to the intrusive category.

## Troubleshoot Scripts 

The **--script-trace** option is used to trace NSE scripts.

**Usage syntax:** nmap --script \[script(s)\] --script-trace \[target\]

> **\# nmap --script default --script-trace 10.10.1.70**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-14 13:51 CST
>
> NSOCK (5.1060s) nsock_loop() started (timeout=50ms). 0 events pending
>
> NSOCK (5.1060s) UDP connection requested to 10.10.1.70:137 (IOD \#1) EID 8
>
> NSOCK (5.1070s) TCP connection requested to 10.10.1.70:5900 (IOD \#2) EID 16
>
> NSOCK (5.1070s) UDP connection requested to 10.10.1.70:137 (IOD \#3) EID 24
>
> NSOCK (5.1080s) nsock_loop() started (timeout=50ms). 3 events pending
>
> NSOCK (5.1080s) Callback: CONNECT SUCCESS for EID 8 \[10.10.1.70:137\]
>
> NSE: UDP 10.10.1.173:56824 \> 10.10.1.70:137 \| CONNECT
>
> NSOCK (5.1080s) Callback: CONNECT SUCCESS for EID 16 \[10.10.1.70:5900\]
>
> NSE: TCP 10.10.1.173:49401 \> 10.10.1.70:5900 \| CONNECT
>
> NSOCK (5.1080s) Callback: CONNECT SUCCESS for EID 24 \[10.10.1.70:137\] ...
>
> **NSE trace output**

The **--script-trace** option displays all packets sent and received by an NSE script and is useful for troubleshooting problems related to scripts.

Some scripts can generate thousands of lines of output when using the script trace option. In most cases, it is better to redirect the output to a file for later review. The example below demonstrates how to do this.

> **\# nmap --script default 10.10.1.70 --script-trace \> trace.txt**
>
> **Redirecting the output of a NSE trace**

The resulting trace.txt file will contain all of the trace data and can be viewed in a standard text editor.

## Update the Script Database 

The **--script-updatedb** option is used to update the script database.

**Usage syntax:** nmap --script-updatedb

> **\# nmap --script-updatedb**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-14 13:42 CST NSE: Updating rule database.
>
> NSE script database updated successfully.
>
> Nmap done: 0 IP addresses (0 hosts up) scanned in 0.38 seconds
>
> **Updating the NSE script database**

Nmap maintains a database of scripts that is used to facilitate the option of executing multiple scripts via category (discussed on page 164). Most Unix-like systems store scripts in the **/usr/share/nmap/scripts/** directory. Windows systems store these files in **C:\Program Files\Nmap\scripts**. If you add or remove scripts from the scripts directory you must run **nmap --script-updatedb** to apply the changes to the script database.

> 170

# Ndiff 

Ndiff is a tool within the Nmap suite that allows you to compare two scans and flag any changes between them. It accepts two Nmap XML output files (discussed on page 130) and highlights the differences between each file for easy comparison. Ndiff can be used on the command line or in GUI form within the Zenmap application (see page 159).

> **Summary of features covered in this section:**

<table style="width:32%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Feature</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Option</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Comparison Using Ndiff</td>
<td style="text-align: center;"><blockquote>
<p><strong>ndiff</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Ndiff Verbose Mode</td>
<td style="text-align: center;"><blockquote>
<p><strong>-v</strong></p>
</blockquote></td>
</tr>
<tr>
<td>XML Output Mode</td>
<td style="text-align: center;"><blockquote>
<p><strong>--xml</strong></p>
</blockquote></td>
</tr>
</tbody>
</table>

> 172

## Scan Comparison Using Ndiff 

The **ndiff** utility is used to perform a comparison of two Nmap scans.

**Usage syntax:** ndiff \[file1.xml file2.xml\]

> **\# ndiff scan1.xml scan2.xml**
>
> -Nmap 5.00 at 2009-12-17 09:18 +Nmap 5.00 at 2009-12-18 12:44
>
> 10.10.1.48, 00:0C:29:D5:38:F4:
>
> -Not shown: 994 closed ports +Not shown: 995 closed ports
>
> PORT STATE SERVICE VERSION
>
> -80/tcp open http
>
> **Comparison of two Nmap scans**

Basic usage of the Ndiff utility consists of comparing two Nmap XML output files (discussed on page 130). Differences between the two files are highlighted with a minus sign indicating the information in the first file and the plus sign indicating the changes within the second file. In the above example we see that port 80 on the second scan has changed states from *open* to *closed*.

## Ndiff Verbose Mode 

The **-v** option is used to display verbose output with Ndiff.

**Usage syntax:** ndiff -v \[file1.xml file2.xml\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># ndiff -v scan1.xml scan2.xml</strong> -Nmap 5.00 at 2009-12-17 09:18 +Nmap 5.00 at 2009-12-18 12:44</p>
<p>10.10.1.48, 00:0C:29:D5:38:F4:</p>
<p>Host is up.</p>
<p>-Not shown: 994 closed ports</p>
<p>+Not shown: 995 closed ports</p>
<p>PORT STATE SERVICE VERSION</p>
<p>21/tcp open ftp</p>
<p>22/tcp open ssh</p>
<p>25/tcp open smtp -80/tcp open http</p>
<p>111/tcp open rpcbind</p>
<p>2049/tcp open nfs</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Output of a Ndiff scan in verbose mode**

The verbose output displays all lines of both XML files and highlights the differences with a minus sign indicating the information in the first file and the plus sign indicating the changes within the second file. This is in contrast to the default Ndiff behavior (described on page 173) which only displays the differences between the two files. Verbose output is often more helpful than the default output as it displays all information from the original scan.

> 174

## XML Output Mode 

The **-xml** option is used to generate XML output with Ndiff.

**Usage syntax:** ndiff --xml \[file1.xml\] \[file2.xml\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># ndiff --xml scan1.xml scan2.xml</strong></p>
<p>&lt;?xml version="1.0" encoding="UTF-8"?&gt;</p>
<p>&lt;nmapdiff version="1"&gt;</p>
<p>&lt;scandiff&gt;</p>
<p>&lt;hostdiff&gt;</p>
<p>&lt;host&gt;</p>
<p>&lt;address addr="10.10.1.48" addrtype="ipv4"/&gt;</p>
<p>&lt;address addr="00:0C:29:D5:38:F4" addrtype="mac"/&gt;</p>
<p>&lt;ports&gt;</p>
<p>&lt;a&gt;</p>
<p>&lt;extraports count="994" state="closed"/&gt;</p>
<p>&lt;/a&gt;</p>
<p>&lt;b&gt;</p>
<p>&lt;extraports count="995" state="closed"/&gt; &lt;/b&gt;</p>
<p>&lt;portdiff&gt;</p>
<p>&lt;a&gt;</p>
<p>&lt;port portid="80" protocol="tcp"&gt;</p>
<p>&lt;state state="open"/&gt;</p>
<p>&lt;service name="http"/&gt; ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Ndiff XML output**

XML output is a great tool for feeding information from Ndiff into a third party program using a widely supported format.

| **Tip** | *The default **--xml** output displays the XML code on the screen. To save this information file, type **ndiff --xml scan1.xml scan2.xml \>ndiff.xml** which will redirect the output to a file called ndiff.xml.* |
|----|----|

> 176

# Tips and Tricks 

This section provides several helpful tips and tricks for getting the most out of Nmap. It also incorporates the use of third party programs that work in conjunction with Nmap to help you analyse your network.

> **Summary of topics discussed in this section:**

<table style="width:33%;">
<colgroup>
<col style="width: 23%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Topic</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Page</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Combine Multiple Options</td>
<td style="text-align: center;"><blockquote>
<p><strong>179</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Scan Using Interactive Mode</td>
<td style="text-align: center;"><blockquote>
<p><strong>180</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Runtime Interaction</td>
<td style="text-align: center;"><blockquote>
<p><strong>181</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Remotely Scan Your Network</td>
<td style="text-align: center;"><blockquote>
<p><strong>182</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Wireshark</td>
<td style="text-align: center;"><blockquote>
<p><strong>183</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Scanme.Insecure.org</td>
<td style="text-align: center;"><blockquote>
<p><strong>184</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Nmap Online Resources</td>
<td style="text-align: center;"><blockquote>
<p><strong>185</strong></p>
</blockquote></td>
</tr>
</tbody>
</table>

## Combine Multiple Options 

If you haven’t already noticed, Nmap allows you to combine multiple options to produce a custom scan unique to your needs.

**Usage syntax:** nmap \[options\] \[target\]

> **\# nmap --reason -F --open -T3 -O scanme.insecure.org**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-12-17 16:01 CST Interesting ports on scanme.nmap.org (64.13.134.52):
>
> Not shown: 95 filtered ports, 3 closed ports
>
> Reason: 95 no-responses and 3 resets
>
> PORT STATE SERVICE REASON
>
> 53/tcp open domain syn-ack 80/tcp open http syn-ack
>
> Device type: general purpose\|WAP\|firewall\|router
>
> Running (JUST GUESSING) : Linux 2.6.X\|2.4.X (95%), Linksys Linux 2.4.X ...
>
> **Combining multiple Nmap options**

In the above example, many different options are combined to produce the desired results. As you can see, the possibilities are nearly limitless. You should note, however, that not all options are compatible with each other, as illustrated in the next example.

> **\# nmap -PN -sP 10.10.1.\***
>
> -PN (skip ping) is incompatible with -sP (ping scan). If you only want to enumerate hosts, try list scan (-sL)
>
> **Nmap warning with combining incompatible options**

In this example, the **-PN** option (don’t ping) and **-sP** option (ping only) are obviously not compatible with each other. Fortunately, Nmap provides a friendly and informative error message and thus no harm is done.

## Scan Using Interactive Mode 

The **--interactive** option enables the Nmap interactive shell.

**Usage syntax:** nmap --interactive

> **\$ nmap --interactive**
>
> Starting Nmap V. 5.00 ( http://nmap.org )
>
> Welcome to Interactive Mode -- press h \<enter\> for help nmap\>
>
> **Nmap interactive mode shell**

Once in interactive mode, you can launch a scan by simply typing the letter **n** followed by the target address and any standard Nmap options. The example below demonstrates using interactive mode to perform a simple **-F** scan.

**Usage syntax:** n \[options\] \[target\]

> **nmap\> n -F 10.10.1.1**
>
> Interesting ports on 10.10.1.1:
>
> Not shown: 98 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.19 seconds
>
> **Example scan using Nmap in interactive mode**

When you are done scanning, simply type ***x*** to exit the interactive shell.

| **Tip** | *Pressing the **h** key in interactive mode displays a help menu which describes the available options.* |
|----|----|

## Runtime Interaction 

Nmap offers several runtime interaction keystrokes that can modify an in progress scan. The table below lists Nmap’s runtime interaction keys.

| **Key** | **Function** |
|:--:|----|
| **v** | Pressing lowercase **v** during a scan will increase the verbosity level. |
| **V** | Pressing uppercase **V** during a scan will increase the verbosity level. |
| **d** | Pressing lowercase **d** during a scan will increase the debugging level. |
| **D** | Pressing uppercase **D** during a scan will increase the debugging level. |
| **p** | Pressing lowercase **p** during a scan will enable packet tracing. |
| **P** | Pressing uppercase **P** during a scan will disable packet tracing. |
| **?** | Pressing **?** during a scan will display the runtime interaction help. |
| **Any other key not listed above** | Pressing key other than the ones defined above during a scan will print a status message indicating the progress of the scan and how much time is remaining. |

> **Nmap runtime interaction keys**

Runtime interaction is very useful getting status updates when performing a scan on a large number of hosts. The example below displays the status of the current scan when the space bar pressed.

> **\# nmap -T2 10.10.1.\***
>
> \[space\]
>
> Stats: 0:06:45 elapsed; 18 hosts completed (30 up), 30 undergoing SYN
>
> Stealth Scan
>
> SYN Stealth Scan Timing: About 38.44% done; ETC: 16:56 (0:10:26 remaining) ...
>
> **Using runtime interaction keys to display scan status**

In addition to being able to display status updates, run time interaction keys can also adjust verbosity, tracing, and debugging settings without interrupting the scan in progress.

## Remotely Scan Your Network 

Nmap Online is a website that provides (free) Nmap scanning functionality via a web browser. This can be useful for remotely scanning your network or troubleshooting connectivity problems from an external source. Simply visit **www.nmap-online.com** and enter your IP address or the address of the target system you wish to scan.

<img src="media/image1.jpg" style="width:4.75in;height:4.29653in" />

> **Nmap online home page**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>To prevent abuse, Nmap Online allows a maximum of 5 scan requests from one IP address every 24 hours and a maximum of 20 scans every 7 days. You must also agree with the terms of service before you can execute a scan.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## Wireshark 

Wireshark is an excellent addition to any system administrator’s toolkit. It is a sophisticated (yet easy to use) network protocol analyser. You can use Wireshark to capture and analyse network traffic and it works hand in hand with Nmap allowing you to see each packet sent and received while scanning.

<img src="media/image2.jpg" style="width:4.75in;height:4.04028in" />

> **Wireshark network protocol analyzer**

Wireshark is available for Windows, Linux, and Mac OS X and can be downloaded for free at www.wireshark.org.

## Scanme.Insecure.org 

The scanme.insecure.org server is a common example target used throughout this guide. This system is hosted by the Nmap project and can be freely scanned by Nmap users.

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap -F scanme.insecure.org</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-12-18 16:52 CST Interesting ports on scanme.nmap.org (64.13.134.52):</p>
<p>Not shown: 95 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>25/tcp closed smtp</p>
<p>53/tcp open domain</p>
<p>80/tcp open http 110/tcp closed pop3 113/tcp closed auth</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 2.63 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Example scan using scanme.insecure.org as the target**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>The good people of the Nmap project provide this valuable service as an education and troubleshooting tool and request that you be polite by not aggressively scanning it hundreds of times a day or with other tools not related to Nmap.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Appendix

## Nmap Online Resources 

- *Fyodor’s Nmap Book www.nmap.org/book/man.html*

- *Nmap Install Guide www.nmap.org/book/install.html*

- *Nmap Scripting Engine Documentation www.nmap.org/nsedoc/*

- *Zenmap Reference Guide www.nmap.org/book/zenmap.html*

- *Nmap Change Log www.nmap.org/changelog.html*

- *Nmap Mailing Lists www.seclists.org*

- *Nmap Online Scan www.nmap-online.com*

- *Security Tools www.sectools.org*

- *Nmap Mailing Lists www.seclists.org*

- *Nmap Facebook www.nmap.org/fb*

- *Nmap Twitter www.twitter.com/nmap*

- *Nmap Cookbook www.nmapcookbook.com*

# Nmap stealth scanning

Spoof MAC address to avoid logging MAC address by generating random MAC \>nmap -sT -PN --spoof-mac 0 192.168.1.1

Spoof MAC address to avoid logging MAC address by generating specific MAC \>nmap -sT -PN --spoof-mac \<\> 192.168.1.1

Spoof MAC address to avoid logging MAC address by generating vendor MAC \>nmap -sT -PN --spoof-mac \<\> 192.168.1.1

Avoid firewall and IDS-Randomize target scan order \>nmap --randomize-hosts 172.16.1.30-100

Avoid firewall checks by appending random data \> nmap - -data-length 25 172.16.1.10

NMAP Port States

- **Open**: A port that actively responds to an incoming connection. means that an application on the target machine is listening for connections/packets on that port

- **Closed**: A port on a target that actively responds to a probe but does not have any service running on the port. Closed ports are commonly found on systems where no firewall is in place to filter incoming traffic. means ports have no application listening on them, though they could open up at any time.

- **Filtered**: Filtered ports are ports that are typically protected by a firewall of some sort that prevents Nmap from determining whether or not the port is open or closed. means that a firewall, filter, or other network obstacle is blocking the port so that Nmap cannot tell whether it is open or closed.

- **Unfiltered**: An unfiltered port is a port that Nmap can access but is unable to determine whether it is open or closed. Ports are classified as unfiltered when they are responsive to Nmap’s probes, but Nmap cannot determine whether they are open/ closed

- **Open \| filtered**: An open \| filtered port is a port which Nmap believes to be open or filtered but cannot determine which exact state the port is actually in. This indicates that the port was filtered or open but Nmap couldn’t establish the state

- **Closed \| filtered**: A closed \| filtered port is a port that Nmap believes to be closed or filtered but cannot determine which respective state the port is actually in. This indicates that the port was filtered or closed but Nmap couldn’t establish the state.

**Basic Scanning Techniques**

- **Scan Single Target** (*By default Scan only first 1000 TCP/IP ports*): \#nmap 172.16.1.0

- **Scan Multiple Targets**: \#nmap 172.16.1.0 172.16.1.1 172.16.1.2

- **Scan IP Ranges/Subnet**: \#nmap 172.16.1.1-15 <span class="mark">OR</span> \#nmap 10.10.10.\* <span class="mark">OR</span> \#nmap 10.10.10.10-10.10.\* <span class="mark">OR</span> \#nmap 10.10.10.10/24

- **Scan List of Targets** (Each entry in list.txt file must be separated by a space, tab, or newline): \#nmap -iL list.txt

- **Random Scan** (Randomly generates specified number of targets and scan them. Not Recommended): \#nmao -iR 5

- **Aggressive Scan** (-A parameter is a synonym for several advanced options like -O -sC --traceroute): \#nmap -A 10.10.10.10

- **Scan IPv6 target** (-6 parameter is used to perform a scan of an IPv6 target): \#nmap -6 fe80::29aa:9db9:4164:d80e

**Exclude Target from Scanning**

- Exclude target from scan (Accept single hosts, ranges, or entire network blocks): \#nmap 172.16.1.0/24 --exclude 172.16.1.25

- Exclude Targets Using List: \#nmap 172.16.1.0/24 --excludefile list.txt

**Discovery Options**

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Do not Ping:** | \#nmap 10.10.10.10 -PN | While scanning ports first nmap ping the target to see if it is online then it scans. -PN option instructs Nmap to skip the default discovery check and perform a complete port scan on the target. Nmap is able to produce a list of open ports on the unpingable system. |
| **Perform a Ping Only Scan:** | \#nmap 10.10.10.0/24 -sP | Used to perform quick search of the target in the network. -sP option will perform ARP ping and produces MAC addresses. |
| **TCP SYN Ping:** | \#nmap 10.10.10.10 -PS | It sends a SYN packet to target systems. Useful when standard ICMP pings are blocked. Default port for -PS is 80 |
| **TCP ACK Ping** | \#nmap 10.10.10.10 -PA | Used to send ACK packets to target systems. Useful when standard ICMP pings are blocked. Default port for -PS is 80 |
| **UDP Ping** | \#nmap 10.10.10.10 -PU | Used to send UDP packets to target systems. Useful when TCP connections are blocked. Default port for -PS is 40125 |
| **SCTP INIT Ping** | \#nmap 10.10.10.10 -PY | Used to locate hosts using the Stream Control Transmission Protocol (SCTP). Default port for -PS is 80 |
| **ICMP Echo Ping** | \#nmap 10.10.10.10 -PE | Used to send standard ICMP ping to target. -PE option is automatically implied if no other ping options are specified. |
| **ICMP Timestamp Ping** | \#nmap 10.10.10.10 -PP | Useful when ICMP pings are blocked |
| **ICMP Address Mask Ping** | \#nmap 10.10.10.10 -PM | Used to ping specified host using alternative ICMP registers. Useful when ICMP echo pings are blocked |
| **IP Protocol Ping** | \#nmap 10.10.10.10 -PO 1, 2, 4 | Used to sends packets with the specified protocol to the target. If no protocols are specified then default protocols 1 (ICMP), 2 (IGMP), and 4 (IP-in-IP) are used |
| **ARP Ping** | \#nmap 10.10.10.10 -PR | The -PR option is automatically implied when scanning the local network. It is much faster than the other ping methods. It is more accurate because LAN hosts can’t block ARP requests. |
| **Traceroute** | \#nmap 10.10.10.10 --traceroute | Used to trace the network path to the specified host |
| **Force Reverse DNS Resolution** | \#nmap 10.10.10.10 -R | Used to perform reverse DNS resolution on the every target IP address. By default, Nmap will only do reverse DNS for hosts that appear to be online. Reduces performance of scan. |
| **Disable Reverse DNS Resolution** | \#nmap 10.10.10.10 -n | Used to Disable Reverse DNS Resolution. Reduces scanning time when scanning large number of hosts. Used when you don’t care of DNS information |
| **Alternative DNS Lookup** | \#nmap 10.10.10.10 --system-dns | It instructs Nmap to use the host system’s DNS resolver instead of its own internal method. Useful when troubleshooting DNS problems |
| **Manually Specify DNS Server(s)** | \#nmap 10.10.10.10 --dns-servers | Used to manually specify DNS servers to be queried when scanning |
| **Create a Host List** | \#nmap 10.10.10.0/24 -sL | The -sL option will display a list and performs a reverse DNS lookup of the specified IP addresses. Useful for identifying the IP addresses and DNS names for the specified targets without sending any packets to them |

**Port Scanning Options**

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Fast Scan:** | \#nmap 10.10.10.10 -F | Scan only 100 most commonly used ports |
| **Scan specific ports:** | \#nmap 10.10.10.10 -p 80, 443, 21-25 |   |
| **Scan ports by name:** | \#nmap 10.10.10.10 -p http, smtp, ftp |   |
| **Scan ports for multiple services by name** | \#nmap 10.10.10.10 -p "http\*" |   |
| **Scan ports by protocol:** | \#nmap 10.10.10.10 -p U:80,T:80 | U:UDP port, T:TCP port |
| **Scan All ports:** | \#nmap 10.10.10.10 -p \* |   |
| **Show Open Ports:** | \#nmap 10.10.10.10 --open |   |
| **Reason for Port State:** | \#nmap 10.10.10.10 --reason | "syn-ack" means ports are open, "conn-refused or reset" means closed |
| **Scan Top ports:** | \#nmap 10.10.10.10 --top-ports 20 | Scans specified number of ports |
| **Sequential port scan:** | \#nmap 10.10.10.10 -r | By default Nmap’s randomizes port scan order. -r overrides this. |
| **Scan Flags** | \#nmap 10.10.10.10 --scan-flags |   |

# Advanced Scanning

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th><strong>Technique</strong></th>
<th><strong>Command</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>TCP SYN Scan: Half open scanning</strong></td>
<td>#nmap 10.10.10.10 -sS</td>
<td>because only send syn packets and it does not attempt to open a full-fledged connection to the remote host. Prevents connection logging. (Modern firewall able to detect it) Stealth scan.</td>
</tr>
<tr>
<td><strong>TCP Connect Scan:</strong></td>
<td>#nmap 10.10.10.10 -sT</td>
<td>attempts to directly connect to the remote system without using any</td>
</tr>
<tr>
<td><strong>UDP Scan:</strong></td>
<td>#nmap 10.10.10.10 -sU</td>
<td>Many services still utilize UDP like DNS, DHCP, SNMP</td>
</tr>
<tr>
<td><strong>TCP Null Scan: .</strong></td>
<td>#nmap 10.10.10.10 -sN</td>
<td>used to send packets with no TCP flags enabled. This is done by setting the packet header to 0. Sending NULL packets to a target is a method of tricking a firewalled system to generate a response</td>
</tr>
<tr>
<td><strong>TCP FIN Scan</strong></td>
<td>#nmap 10.10.10.10 -sF</td>
<td>In a -sF scan, Nmap marks the TCP FIN bit active when sending packets in an attempt to solicit a TCP ACK from the specified target system. This is another method of sending unexpected packets to a target in an attempt to produce results from a system protected by a firewall.</td>
</tr>
<tr>
<td><strong>Xmas Scan</strong></td>
<td>#nmap 10.10.10.10 -sX</td>
<td>Nmap sends packets with URG, FIN, and PSH, and flags activated. This has the effect of “lighting the packet up like a Christmas tree” and can occasionally solicit a response from a firewalled system.</td>
</tr>
<tr>
<td><strong>TCP ACK Scan</strong></td>
<td>#nmap 10.10.10.10 -sA</td>
<td>The -sA option can be used to determine if the target system is protected by a firewall. When performing a TCP ACK scan, Nmap will probe a target and look for RST responses. If no response is received the system is considered to be filtered. If the system does return an RST packet, then it is labelled as unfiltered. In the above example 994 ports are labelled as filtered meaning that the system is likely protected by a firewall. The 6 unfiltered ports displayed are likely to have special rules in the target’s firewall that enable them to be open or closed. The -sA option does not display whether or not the unfiltered ports are open or closed. Its only purpose is to determine whether or not the system is filtering ports.</td>
</tr>
<tr>
<td rowspan="2"><strong>Custom TCP Scan</strong></td>
<td rowspan="2">#nmap 10.10.10.10 --scanflags FINACK</td>
<td>The --scanflags option allows users to define a custom scan using one or more TCP header flags. Any combination of flags listed in the table below can be used with the --scanflags option.</td>
</tr>
<tr>
<td>SYN=Synchronize, ACK=Acknowledgment, PSH=Push, URG=Urgent, RST=Reset, FIN=Finished</td>
</tr>
<tr>
<td><strong>IP Protocol Scan</strong></td>
<td>#nmap 10.10.10.10 -sO</td>
<td>Displays the IP protocols that are supported on the target system. Used to find what types of scans you want to perform on the selected target.</td>
</tr>
<tr>
<td><strong>Send Raw Ethernet Packets</strong></td>
<td>#nmap 10.10.10.10 --send-eth</td>
<td>Used to bypass the IP layer on your system and send raw ethernet packets on the data link layer</td>
</tr>
<tr>
<td><strong>Send IP Packets</strong></td>
<td>#nmap 10.10.10.10 --send-ip</td>
<td>Used to scan using the local system’s IP stack instead of generating raw ethernet packets</td>
</tr>
</tbody>
</table>

**OS and Service Detection**

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Operating System Detection** | \#nmap 10.10.10.10 -O | OS detection is performed by analysing responses from the target for a set of predictable characteristics which can be used to identify the type of OS on the remote system. In order for OS detection to work properly there must be at least one open and one closed port on the target system. When scanning multiple targets, the --osscan-limit option can be combined with -O to instruct Nmap not to OS scan hosts that do not meet this criteria. The -v option can be combined with -O to display additional information |
| **Submit TCP/IP Fingerprints** | \#nmap 10.10.10.10 -O | <u>www.nmap.org/submit/</u> If Nmap is unable to determine the operating system on a target, it will provide a fingerprint which can be submitted to Nmap’s OS database at <u>www.nmap.org/submit/</u>. The example below demonstrates Nmap’s output in this scenario. |
| **Attempt to Guess an Unknown OS** | \#nmap 10.10.10.10 -O --osscan-guess | Displays a list of possible matches for the target’s operating system |
| **Service Version Detection** | \#nmap 10.10.10.10 -sV | Nmap version detection purposely skips some problematic ports (specifically 9100-9107). This can be overridden by combining the --allports parameter with -sV which instructs Nmap not to exclude any ports from version detection |
| **Troubleshooting Version Scans** | \#nmap 10.10.10.10 -sV --version-trace | The --version-trace option can be helpful for debugging problems or to gain additional information about the target system |
| **Perform a RPC Scan** | \#nmap 10.10.10.10 -sR | The -sR option performs a RPC (Remote Procedure Call) scan on the specified target. |

**Timing Options**

<table style="width:69%;">
<colgroup>
<col style="width: 8%" />
<col style="width: 7%" />
<col style="width: 52%" />
</colgroup>
<thead>
<tr>
<th><strong>Technique</strong></th>
<th><strong>Command</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="7"><strong>Timing Templates</strong></td>
<td>#nmap 10.10.10.10 -T0</td>
<td>All timing parameters are accepted as milliseconds. 1ms = (1/1000sec), s=seconds, m=minutes, h=hours</td>
</tr>
<tr>
<td>#nmap 10.10.10.10 -T1</td>
<td><ul>
<li></li>
</ul></td>
</tr>
<tr>
<td>#nmap 10.10.10.10 -T2</td>
<td><ul>
<li></li>
</ul></td>
</tr>
<tr>
<td>#nmap 10.10.10.10 -T3</td>
<td><ul>
<li></li>
</ul></td>
</tr>
<tr>
<td>#nmap 10.10.10.10 -T4</td>
<td><ul>
<li></li>
</ul></td>
</tr>
<tr>
<td>#nmap 10.10.10.10 -T5</td>
<td><ul>
<li></li>
</ul></td>
</tr>
<tr>
<td> </td>
<td><ul>
<li></li>
</ul></td>
</tr>
<tr>
<td><strong>Set the Packet TTL</strong></td>
<td>#nmap 10.10.10.10 --ttl 500</td>
<td>The --ttl option is used to specify the TTL (time-to-live) for the specified scan (in milliseconds). Packets sent using this option will have the specified TTL value. This option is useful when scanning targets on slow connections where normal packets may time out before receiving a response.</td>
</tr>
<tr>
<td><strong>Minimum # of Parallel Operations</strong></td>
<td>#nmap 10.10.10.10 --min-parallelism 25</td>
<td>Nmap automatically adjusts parallel scanning options based on network conditions. This command instructs nmap to perform 25 parallel operations at any given time. Setting it high may produce wrong results</td>
</tr>
<tr>
<td><strong>Maximum # of Parallel Operations</strong></td>
<td>#nmap 10.10.10.10 --max-parallelism 200</td>
<td>--max-parallelism 1 is used to restrict Nmap so that only one operation is performed at a time</td>
</tr>
<tr>
<td><strong>Minimum Host Group Size</strong></td>
<td>#nmap 10.10.10.10 --min-hostgroup 3</td>
<td>Nmap will perform scans in parallel to save time when scanning multiple targets such as a range or entire subnet. By default, Nmap will automatically adjust the size of the host groups based on the type of scan being performed and network conditions. By specifying the --min-hostgroup option, Nmap will attempt to keep the group sizes above the specified number.</td>
</tr>
<tr>
<td><strong>Maximum Host Group Size</strong></td>
<td>#nmap 10.10.10.10 --max-hostgroup 5</td>
<td>--max-hostgroup option controls the maximum number of hosts in a group.</td>
</tr>
<tr>
<td rowspan="2"><strong>Maximum RTT Timeout</strong></td>
<td rowspan="2">#nmap 10.10.10.10 --initial-rtt-timeout 5000</td>
<td>The --initial-rtt-timeout option controls the initial RTT (round-trip time) timeout value used by Nmap.</td>
</tr>
<tr>
<td>retransmissions due to timeouts. By decreasing the value you can speed up scans; but do so with caution. Setting the RTT timeout value too low can negate any potential performance gains and lead to inaccurate results.</td>
</tr>
</tbody>
</table>

**Timing Options**

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Initial RTT Timeout** | \#nmap 10.10.10.10 --max-rtt-timeout 400 | The --max-rtt-timeout option is used to specify the maximum RTT (Round-Trip Time) timeout for a packet response. Nmap dynamically adjusts RTT timeout options for best results by default. The default maximum RTT timeout is 10 seconds. Manually adjusting the maximum RTT timeout lower will allow for faster scan times (especially when scanning large blocks of addresses). Specifying a high maximum RTT timeout will prevent Nmap from giving up too soon when scanning over slow/unreliable connections. Typical values are between 100 milliseconds for fast/reliable networks and 10000 milliseconds for slow/unreliable connections. |
| **Maximum Retries** | \#nmap 10.10.10.10 --max-retries 5 | The --max-retries option is used to control the maximum number of probe retransmissions Nmap will attempt to perform. By default, Nmap will automatically adjust the number of probe retransmissions based on network conditions. The --max-retries option can be used if you want to override the default settings or troubleshoot a connectivity problem. Specifying a high number can increase the time it takes for a scan to complete, but will produce more accurate results. By lowering the --max-retries you can speed up a scan – although you may not get accurate results if Nmap gives up too quickly. |
| **Host Timeout** | \#nmap 10.10.10.10 --host-timeout 5m | The --host-timeout option causes Nmap to give up on slow hosts after the specified time. A host may take a long time to scan if it is located on a slow or unreliable network. Systems that are protected by rate limiting firewalls may also take a considerable amount of time to scan. The --host-timeout option instructs Nmap to give up on the target system if it fails to complete after the specified time interval. In the above example, the scan takes longer than one minute to complete (as specified by the 1m parameter) which causes Nmap to terminate the scan. This option is particularly useful when scanning multiple systems across a WAN or internet connection. Nmap performs parallel operations when scanning multiple targets. In the event that one host is taking a long time to respond, Nmap is likely scanning other hosts during that time. This reduces potential bottlenecks that slow hosts can create |
| **Minimum Scan Delay** | \#nmap 10.10.10.10 --scan-delay 5s | The --scan-delay option instructs Nmap to pause for the specified time interval between probes. Some systems employ rate limiting which can hamper Nmap scanning attempts. Nmap will automatically adjust the scan delay by default on systems where rate limiting is detected. In some cases it may be useful to specify your own scan delay if you know that rate limiting or IDS (Intrusion Detection Systems) are in use. In the example above the scan delay of 5s instructs Nmap to wait five seconds between probes. |

**Timing Options**

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Maximum Scan Delay** | \#nmap 10.10.10.10 --max-scan-delay 10s | The --max-scan-delay is used to specify the maximum amount of time Nmap should wait between probes |
| **Minimum Packet Rate** | \#nmap 10.10.10.10 --min-rate 30 | The --min-rate option is used to specify the minimum number of packets Nmap should send per second. Nmap, by default, will automatically adjust the packet rate for a scan based on network conditions. In some cases, you may want to specify your own minimum rate - although this is generally not recommended. In the above example --min-rate 30 instructs Nmap to send at least 30 packets per a second. Nmap will use the number as a low threshold but may scan faster than this if network conditions allow. |
| **Maximum Packet Rate** | \#nmap 10.10.10.10 --max-rate 50 | The --max-rate option is used to specify the maximum number of packets Nmap should send per second. To perform a very sneaky scan use --max-rate 0.1 which instructs Nmap to send one packet every ten seconds. |
| **Defeat Reset Rate Limits** | \#nmap 10.10.10.10 --defeat-rst-ratelimit | The --defeat-rst-ratelimit is used to defeat targets that apply rate limiting to RST (reset) packets. The --defeat-rst-ratelimit option can be useful if you want to speed up scans on targets that implement RST packet rate limits. It can, however, lead to inaccurate results and as such it is rarely used. The --defeat-rst-ratelimit option is rarely used because, in most cases, Nmap will automatically detect rate limiting hosts and adjust itself accordingly. |

<table style="width:49%;">
<colgroup>
<col style="width: 15%" />
<col style="width: 2%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th colspan="3" style="text-align: center;"><blockquote>
<p><strong>Output Options</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2">Save Output to a Text File</td>
<td><blockquote>
<p>nmap -oN [scan.txt] [target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2">Save Output to a XML File</td>
<td><blockquote>
<p>nmap -oX [scan.xml] [target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2">Grepable Output</td>
<td><blockquote>
<p>nmap -oG [scan.txt] [targets]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Output All Supported File Types</p>
</blockquote></td>
<td><blockquote>
<p>nmap -oA [path/filename] [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Periodically Display Statistics</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --stats-every [time] [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>133t Output</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -oS [scan.txt] [target]</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td style="text-align: right;"><strong>Tr</strong></td>
<td><strong>oubleshooting and debugging</strong></td>
</tr>
<tr>
<td>Getting Help</td>
<td></td>
<td><blockquote>
<p>nmap -h</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Display Nmap Version</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -V</p>
</blockquote></td>
</tr>
<tr>
<td>Verbose Output</td>
<td></td>
<td><blockquote>
<p>nmap -v [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Debugging</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -d [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Display Port State Reason</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --reason [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Only Display Open Ports</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --open [target]</p>
</blockquote></td>
</tr>
<tr>
<td>Trace Packets</td>
<td></td>
<td><blockquote>
<p>nmap --packet-trace [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Display Host Networking</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --iflist</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Specify a Network Interface</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -e [interface] [target]</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td></td>
<td><blockquote>
<p><strong>Nmap Scripting Engine</strong></p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Execute Individual Scripts</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --script [script.nse] [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Execute Multiple Scripts</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --script [expression] [target]</p>
</blockquote></td>
</tr>
<tr>
<td>Script Categories</td>
<td></td>
<td><blockquote>
<p>all, auth, default, discovery, external, intrusive, malware, safe, vuln</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Execute Scripts by Category</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --script [category] [target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Execute Multiple Script Categories</p>
</blockquote></td>
<td><blockquote>
<p>nmap --script [category1,category2,etc]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Troubleshoot Scripts</p>
</blockquote></td>
<td><blockquote>
<p>nmap --script [script] --script-trace</p>
<p>[target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Update the Script Database</p>
</blockquote></td>
<td><blockquote>
<p>nmap --script-updatedb</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"></td>
<td><blockquote>
<p><strong>Ndiff</strong></p>
</blockquote></td>
</tr>
<tr>
<td colspan="2">Comparison Using Ndiff</td>
<td><blockquote>
<p>ndiff [scan1.xml] [scan2.xml]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Ndiff Verbose Mode</p>
</blockquote></td>
<td><blockquote>
<p>ndiff -v [scan1.xml] [scan2.xml]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>XML Output Mode</p>
</blockquote></td>
<td><blockquote>
<p>ndiff --xml [scan1.xml] [scan2.xml]</p>
</blockquote></td>
</tr>
</tbody>
</table>

# Firewall Evasion

Firewalls and intrusion prevention systems are designed to prevent tools like Nmap from getting an accurate picture of the systems they are protecting. Nmap includes several features designed to circumvent these defenses. This section discusses the various evasion techniques built into Nmap.

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Manually Specify a Source Port** | nmap --source-port \[port\] \[target\] |  The --source-port option is used to manually specify the source port number of a probe. Every TCP segment contains a source port number in addition to a destination. By default, Nmap will randomly pick an available outgoing source port to probe a target. The --source-port option will force Nmap to use the specified port as the source for all packets. This technique can be used to exploit weaknesses in firewalls that are improperly configured to blindly accept incoming traffic based on a specific port number. Port 20 (FTP), port 53 (DNS), and 67 (DHCP) are common ports susceptible to this type of scan. |
| **Append Random Data** | nmap --data-length \[size\] \[target\] |  The --data-length option can be used to append random data to probe packets. |
| **Randomize Target Scan Order** | nmap --randomize-hosts \[target\] |  The --randomize-hosts option is used to randomize the scanning order of the specified targets. |
| **Spoof MAC Address** | nmap --spoof-mac \[MAC\|0\|vendor\] \[target\] |  The --spoof-mac is used to spoof the MAC (Media Access Control) address of an ethernet device. |
| **Send Bad Checksums** | nmap --badsum \[target\] |  The --badsum option is used to send packets with incorrect checksums to the specified host. |

| **Technique** | **Command** | **Description** |
|----|----|----|
| **Fragment Packets** | nmap -f \[target\] |  The -f option is used to fragment probes into 8-byte packets. The -f option instructs Nmap to send small 8-byte packets thus fragmenting the probe into many very small packets. This option isn’t particularly useful in everyday situations; however, it may be helpful when attempting to evade some older or improperly configured firewalls. |
| **Specify a Specific MTU** | nmap --mtu \[MTU\] \[target\] |  The --mtu option is used to specify a custom MTU (Maximum Transmission Unit). |
| **Use a Decoy** | nmap -D RND:\[number\] \[target\] |  The -D option is used to mask an Nmap scan by using one or more decoys. |
| **Idle Zombie Scan** | nmap -sI \[zombie\] \[target\] | The -sI option is used to perform an idle zombie scan. The idle zombie scan is a unique scanning technique that allows you to exploit an idle system and use it to scan a target system for you. In this example 10.10.1.41 is the zombie and 10.10.1.252 is the target system. The scan works by exploiting the predictable IP sequence ID generation employed by some systems. In order for an idle scan to be successful, the zombie system must truly be idle at the time of scanning. |

# Timing Options 

### Timing Options Overview 

### Defeat Reset Rate Limits 

**Usage syntax:** nmap --defeat-rst-ratelimit \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap --defeat-rst-ratelimit scanme.insecure.org</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-10 15:14 CST Interesting ports on scanme.nmap.org (64.13.134.52):</p>
<p>Not shown: 993 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>25/tcp closed smtp</p>
<p>53/tcp open domain</p>
<p>70/tcp closed gopher</p>
<p>80/tcp open http</p>
<p>110/tcp closed pop3 113/tcp closed auth</p>
<p>31337/tcp closed Elite</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 7.71 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Defeating RST rate limits**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Evading Firewalls 

### Firewall Evasion Techniques Overview 

Firewalls and intrusion prevention systems are designed to prevent tools like Nmap from getting an accurate picture of the systems they are protecting. Nmap includes a number of features designed to circumvent these defenses. This section discusses the various evasion techniques built into Nmap.

> **Summary of features covered in this section:**

<table style="width:34%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><strong>Option</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Fragment Packets</td>
<td style="text-align: center;"><strong>-f</strong></td>
</tr>
<tr>
<td>Specify a Specific MTU</td>
<td style="text-align: center;"><strong>--mtu</strong></td>
</tr>
<tr>
<td>Use a Decoy</td>
<td style="text-align: center;"><strong>-D</strong></td>
</tr>
<tr>
<td>Idle Zombie Scan</td>
<td style="text-align: center;"><strong>-sI</strong></td>
</tr>
<tr>
<td>Manually Specify a Source Port</td>
<td style="text-align: center;"><strong>--source-port</strong></td>
</tr>
<tr>
<td>Append Random Data</td>
<td style="text-align: center;"><strong>--data-length</strong></td>
</tr>
<tr>
<td>Randomize Target Scan Order</td>
<td style="text-align: center;"><blockquote>
<p><strong>--randomize-hosts</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Spoof MAC Address</td>
<td style="text-align: center;"><strong>--spoof-mac</strong></td>
</tr>
<tr>
<td>Send Bad Checksums</td>
<td style="text-align: center;"><strong>--badsum</strong></td>
</tr>
</tbody>
</table>

### Fragment Packets 

The **-f** option is used to fragment probes into 8-byte packets.

**Usage syntax:** nmap -f \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap -f 10.10.1.48</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-11 10:10 CST Interesting ports on 10.10.1.48:</p>
<p>Not shown: 994 closed ports</p>
<p>PORT STATE SERVICE</p>
<p>21/tcp open ftp 22/tcp open ssh</p>
<p>25/tcp open smtp 80/tcp open http</p>
<p>111/tcp open rpcbind</p>
<p>2049/tcp open nfs</p>
<p>MAC Address: 00:0C:29:D5:38:F4 (VMware)</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 1.52 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Scanning a target using fragmented packets**

The **-f** option instructs Nmap to send small 8-byte packets thus fragmenting the probe into many very small packets. This option isn’t particularly useful in everyday situations; however, it may be helpful when attempting to evade some older or improperly configured firewalls.

| **Tip** | *Some host operating systems may require the use of **--send-eth** combined with **-f** for fragmented packets to be properly transmitted.* |
|----|----|

### Specify a Specific MTU 

The **--mtu** option is used to specify a custom MTU (Maximum Transmission Unit).

**Usage syntax:** nmap --mtu \[number\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap --mtu 16 10.10.1.48</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-11 10:11 CST Interesting ports on 10.10.1.48:</p>
<p>Not shown: 994 closed ports</p>
<p>PORT STATE SERVICE</p>
<p>21/tcp open ftp 22/tcp open ssh</p>
<p>25/tcp open smtp 80/tcp open http</p>
<p>111/tcp open rpcbind</p>
<p>2049/tcp open nfs</p>
<p>MAC Address: 00:0C:29:D5:38:F4 (VMware)</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 0.34 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Specifying a specific MTU**

The **--mtu** option is similar to the **-f** option (discussed on page 117) except it allows you to specify your own MTU to be used during scanning. This creates fragmented packets that can potentially confuse some firewalls. In the above example, the **--mtu 16** argument instructs Nmap to use tiny 16-byte packets for the scan.

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><blockquote>
<p><em>The MTU must be a multiple of 8 (example 8, 16, 24, 32, etc).</em></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>Tip</strong></p>
</blockquote></td>
<td><blockquote>
<p><em>Some host operating systems may require the use of <strong>--send-eth</strong> combined with <strong>--mtu</strong> for fragmented packets to be properly transmitted.</em></p>
</blockquote></td>
</tr>
</tbody>
</table>

### Use a Decoy 

The **-D** option is used to mask an Nmap scan by using one or more decoys.

**Usage syntax:** nmap -D \[decoy1,decoy2,etc\|RND:number\] \[target\]

> **\# nmap -D RND:10 10.10.1.48**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-02 16:41 CST ...
>
> **Masking a scan using 10 randomly generated decoy IP addresses**

When performing a decoy scan Nmap will spoof additional packets from the specified number of decoy addresses. This effectively makes it appear that the target is being scanned by multiple systems simultaneously. Using decoys allows the actual source of the scan to “blend into the crowd” which makes it harder to trace where the scan is coming from.

In the above example **nmap -D RND:10** instructs Nmap to generate 10 random decoys. You can also specify decoy addresses manually using the following syntax: **nmap -D decoy1,decoy2,decoy3,etc**.

<table style="width:49%;">
<colgroup>
<col style="width: 7%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Warning</strong></p>
</blockquote></th>
<th><em>Using too many decoys can cause network congestion and reduce the effectiveness of a scan. Additionally, some internet service providers may filter spoofed traffic which will reduce the effectiveness of using decoys to cloak your scanning activity.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

### Idle Zombie Scan 

The **-sI** option is used to perform an idle zombie scan.

**Usage syntax:** nmap -sI \[zombie host\] \[target\]

> **\# nmap -sI 10.10.1.41 10.10.1.252**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-14 18:35 CST Idle scan using zombie 10.10.1.41 (10.10.1.41:443); Class: Incremental Interesting ports on 10.10.1.252:
>
> Not shown: 997 closed\|filtered ports
>
> PORT STATE SERVICE
>
> 135/tcp open msrpc
>
> 139/tcp open netbios-ssn
>
> 445/tcp open microsoft-ds
>
> MAC Address: 00:25:64:D7:FF:59 (Dell)
>
> Nmap done: 1 IP address (1 host up) scanned in 8.29 seconds
>
> **Using an idle “zombie” to scan a target**

The idle zombie scan is a unique scanning technique that allows you to exploit an idle system and use it to scan a target system for you. In this example 10.10.1.41 is the zombie and 10.10.1.252 is the target system. The scan works by exploiting the predictable IP sequence ID generation employed by some systems. In order for an idle scan to be successful, the zombie system must truly be idle at the time of scanning.

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>With this scan no probe packets are sent from your system to the target; although an initial ping packet will be sent to the target unless you combine <strong>-PN</strong> with <strong>-sI</strong>.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

More information about the idle zombie scan can be found on the Nmap website at www.nmap.org/book/idlescan.html.

### Manually Specify a Source Port Number 

The **--source-port** option is used to manually specify the source port number of a probe.

**Usage syntax:** nmap --source-port \[port\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap --source-port 53 scanme.insecure.org</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-12-16 16:41 CST Interesting ports on scanme.nmap.org (64.13.134.52):</p>
<p>Not shown: 993 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>25/tcp closed smtp</p>
<p>53/tcp open domain</p>
<p>70/tcp closed gopher</p>
<p>80/tcp open http</p>
<p>110/tcp closed pop3 113/tcp closed auth</p>
<p>31337/tcp closed Elite</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 7.59 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Manually specifying the packet source port number**

Every TCP segment contains a source port number in addition to a destination. By default, Nmap will randomly pick an available outgoing source port to probe a target. The **--source-port** option will force Nmap to use the specified port as the source for all packets. This technique can be used to exploit weaknesses in firewalls that are improperly configured to blindly accept incoming traffic based on a specific port number. Port 20 (FTP), port 53 (DNS), and 67 (DHCP) are common ports susceptible to this type of scan.

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Tip</strong></p>
</blockquote></th>
<th><em>The <strong>-g</strong> option is a shortcut that is synonymous with <strong>--source-port</strong>.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

### Append Random Data 

The **--data-length** option can be used to append random data to probe packets.

**Usage syntax:** nmap --data-length \[number\] \[target\]

> **\# nmap --data-length 25 10.10.1.252**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-14 18:41 CST Interesting ports on 10.10.1.252:
>
> Not shown: 995 filtered ports
>
> PORT STATE SERVICE
>
> 135/tcp open msrpc
>
> 139/tcp open netbios-ssn
>
> 445/tcp open microsoft-ds
>
> 5800/tcp open vnc-http
>
> 5900/tcp open vnc
>
> MAC Address: 00:25:64:D7:FF:59 (Dell)
>
> Nmap done: 1 IP address (1 host up) scanned in 5.17 seconds
>
> **Padding a scan with random data to avoid detection**

Nmap transmits packets which are generally a specific size. Some firewall vendors know to look for this type of predictable packet size. The **--data-length** option adds the specified amount of additional data to probes in an effort to circumvent these types of checks. In the above example 25 additional bytes are added to all packets sent to the target.

### Randomize Target Scan Order 

The **--randomize-hosts** option is used to randomize the scanning order of the specified targets.

**Usage syntax:** nmap --randomize-hosts \[targets\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap --randomize-hosts 10.10.1.100-254</strong></p>
<p>Interesting ports on 10.10.1.109:</p>
<p>Not shown: 996 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>139/tcp open netbios-ssn</p>
<p>445/tcp open microsoft-ds</p>
<p>5800/tcp open vnc-http</p>
<p>5900/tcp open vnc</p>
<p>MAC Address: 00:1C:23:49:75:0C (Dell)</p>
<p>Interesting ports on 10.10.1.100:</p>
<p>Not shown: 996 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>139/tcp open netbios-ssn</p>
<p>445/tcp open microsoft-ds</p>
<p>5800/tcp open vnc-http</p>
<p>5900/tcp open vnc</p>
<p>MAC Address: 00:21:9B:3F:AC:EC (Dell)</p>
<p>Interesting ports on 10.10.1.107:</p>
<p>Not shown: 997 closed ports</p>
<p>PORT STATE SERVICE</p>
<p>22/tcp open ssh</p>
<p>139/tcp open netbios-ssn ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Scanning systems in a random order**

The **--randomize-hosts** option helps prevent scans of multiple targets from being detected by firewalls and intrusion detection systems. This is done by scanning them in a random order instead of sequential.

### Spoof MAC Address 

The **--spoof-mac** is used to spoof the MAC (Media Access Control) address of an ethernet device.

**Usage syntax:** nmap --spoof-mac \[vendor\|MAC\|0\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap -sT -PN --spoof-mac 0 192.168.1.1</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2010-01-15 19:48 CST</p>
<p>Spoofing MAC address 00:01:02:25:56:AE (3com) Interesting ports on 192.168.1.1:</p>
<p>Not shown: 995 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>20/tcp closed ftp-data</p>
<p>21/tcp closed ftp</p>
<p>23/tcp closed telnet</p>
<p>80/tcp open http</p>
<p>2869/tcp open unknown</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 4.78 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Using a spoofed MAC address**

In this example, Nmap is instructed to forge a randomly generated 3com MAC address. This makes your scanning activity harder to trace by preventing your MAC address from being logged on the target system.

The **--spoof-mac** option can be controlled by the following parameters:

<table style="width:49%;">
<colgroup>
<col style="width: 14%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Argument</strong></th>
<th style="text-align: center;"><strong>Function</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><strong>0 (zero)</strong></td>
<td>Generates a random MAC address</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>Specific MAC Address</strong></p>
</blockquote></td>
<td>Uses the specified MAC address</td>
</tr>
<tr>
<td style="text-align: center;"><strong>Vendor Name</strong></td>
<td><p>Generates a MAC address from the specified vendor</p>
<p>(such as Apple, Dell, 3Com, etc)</p></td>
</tr>
</tbody>
</table>

> **MAC address spoofing options**

### Send Bad Checksums 

The **--badsum** option is used to send packets with incorrect checksums to the specified host.

**Usage syntax:** nmap --badsum \[target\]

> **\# nmap --badsum 10.10.1.41**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-24 16:19 CDT
>
> All 1000 scanned ports on 10.10.1.41 are filtered
>
> MAC Address: 00:60:B0:59:B6:14 (Hewlett-packard CO.)
>
> Nmap done: 1 IP address (1 host up) scanned in 21.40 seconds
>
> **Scanning a target using bad checksums**

The TCP/IP protocol uses checksums to ensure data integrity. Crafting packets with bad checksums can, in some rare occasions, produce a response from a poorly configured system. In the above example we did not receive any results, meaning the target system is configured correctly. This is a typical result when using the **--badsum** option.

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>Only a poorly configured system would respond to a packet with a bad checksum. Nevertheless, it is a good tool to use when auditing network security or attempting to evade firewalls.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> 126

## Output Options 

Nmap offers several options for creating formatted output. In addition to displaying the standard output on a screen, you can also save scan results in a text file, XML file, or a single line grepable file. This feature can be helpful when scanning a large number of systems or for comparing the results of two scans using the **ndiff** utility (discussed in Section 13).

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>The <strong>grep</strong> pattern matching utility is only available on Unix, Linux, and Mac OS X systems by default. Windows users can download a Win32 port of the GNU grep program at http://gnuwin32.sourceforge.net to use with the examples discussed in this section<strong>. </strong></em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Summary of features covered in this section:**

<table style="width:32%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><strong>Option</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Save Output to a Text File</td>
<td style="text-align: center;"><strong>-oN</strong></td>
</tr>
<tr>
<td>Save Output to a XML File</td>
<td style="text-align: center;"><strong>-oX</strong></td>
</tr>
<tr>
<td>Grepable Output</td>
<td style="text-align: center;"><strong>-oG</strong></td>
</tr>
<tr>
<td>Output All Supported File Types</td>
<td style="text-align: center;"><strong>-oA</strong></td>
</tr>
<tr>
<td>Periodically Display Statistics</td>
<td style="text-align: center;"><blockquote>
<p><strong>--stats-every</strong></p>
</blockquote></td>
</tr>
<tr>
<td>133t Output</td>
<td style="text-align: center;"><strong>-oS</strong></td>
</tr>
</tbody>
</table>

### Save Output to a Text File 

The **-oN** parameter saves the results of a scan in a plain text file.

**Usage syntax:** nmap -oN \[scan.txt\] \[target\]

> **\$ nmap -oN scan.txt 10.10.1.1**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 15:17 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.47 seconds
>
> **Saving Nmap output in a text file**

The results of the above scan are saved to the scan.txt file shown below.

> **\$ cat scan.txt**
>
> \# Nmap 5.00 scan initiated Thu Aug 13 15:17:16 2009 as: nmap -oN scan.txt 10.10.1.1
>
> Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> \# Nmap done at Thu Aug 13 15:17:17 2009 -- 1 IP address (1 host up) scanned in 0.47 seconds
>
> **Reviewing the contents of the scan.txt file**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>Nmap will overwrite an existing output file unless the <strong>--append-output</strong> option is combined with <strong>-oN</strong>.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

### Save Output to a XML File 

The **-oX** parameter saves the results of a scan in a XML file.

**Usage syntax:** nmap -oX \[scan.xml\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -oX scan.xml 10.10.1.1</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 15:19 CDT Interesting ports on 10.10.1.1:</p>
<p>Not shown: 998 closed ports</p>
<p>PORT STATE SERVICE</p>
<p>80/tcp open http</p>
<p>443/tcp open https ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Creating a XML output file**

The results of the above scan are saved to the scan.xml file shown below.

> **\$ cat scan.xml**
>
> \<?xml version="1.0" ?\>
>
> \<?xml-stylesheet href="file:///usr/local/share/nmap/nmap.xsl" type="text/xsl"?\>
>
> \<!-- Nmap 5.00 scan initiated Thu Aug 13 15:19:44 2009 as: nmap -oX scan.xml 10.10.1.1 --\>
>
> \<nmaprun scanner="nmap" args="nmap -oX scan.xml 10.10.1.1" start="1250194784" startstr="Thu Aug 13 15:19:44 2009" version="5.00" ...
>
> **Viewing the contents of the XML output file**

The resulting XML file has hardcoded file paths which may only work the system where the file was created. The **--webxml** parameter can be combined with **-oX** to create a portable file for any system (with internet access). You can also specify an alternative style sheet using the **--stylesheet** parameter. To avoid referencing a style sheet at all, use the **--no-stylesheet** parameter.

### Grepable Output 

The **-oG** option enables grepable output.

**Usage syntax:** nmap -oG \[scan.txt\] \[target\]

> **\$ nmap -oG scan.txt -F -O 10.10.1.1/24**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 15:50 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https ...
>
> **Creating a grepable output file**

The resulting scan is saved to the specified text file, which can be useful when combined with text parsing tools like Perl or **grep** (as displayed below).

> **\$ grep "Windows 98" scan.txt**
>
> Host: 10.10.1.217 Ports: 139/open/tcp//netbios-ssn///,
>
> 5800/open/tcp//vnc-http///, 5900/open/tcp//vnc/// Ignored State:
>
> closed (97) OS: Microsoft Windows 98 SE Seq Index: 18 IP ID
>
> Seq: Broken little-endian incremental ...
>
> **Using the grep utility to review a Nmap output file**

In the above example, the **grep** utility will display all instances of the specified text found in the scan.txt file. This makes it simple to quickly search for specific information when analyzing results from a large scan.

### Output All Supported File Types 

The **-oA** parameter saves the output of a scan in text, grepable, and XML formats.

**Usage syntax:** nmap -oA \[filename\] \[target\]

> **\$ nmap -oA scans 10.10.1.1**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 16:10 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.66 seconds
>
> **Creating output files for all available formats**

The resulting scan’s output files are created with their respective extensions as displayed below.

> **\$ ls -l scans.\***
>
> -rw-r--r-- 1 nick nick 284 2009-08-13 16:22 scans.gnmap
>
> -rw-r--r-- 1 nick nick 307 2009-08-13 16:22 scans.nmap
>
> -rw-r--r-- 1 nick nick 5150 2009-08-13 16:22 scans.xml
>
> **Directory listing of the resulting output files**

<table style="width:28%;">
<colgroup>
<col style="width: 14%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>File</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Contents</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>scans.gnmap</strong></p>
</blockquote></td>
<td>Grepable output</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>scans.nmap</strong></p>
</blockquote></td>
<td>Plain text output</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>scans.xml</strong></p>
</blockquote></td>
<td>XML output</td>
</tr>
</tbody>
</table>

> **Nmap output files**

### Display Scan Statistics 

The **--stats-every** option can be used to periodically display the status of the current scan.

**Usage syntax:** nmap --stats-every \[time\] \[target\]

> **\$ nmap --stats-every 5s 10.10.1.41**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 16:30 CDT
>
> Stats: 0:00:07 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 55.00% done; ETC: 16:30 (0:00:05 remaining)
>
> Stats: 0:00:12 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 85.00% done; ETC: 16:30 (0:00:02 remaining)
>
> Stats: 0:00:17 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 90.00% done; ETC: 16:30 (0:00:02 remaining)
>
> Stats: 0:00:22 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 90.00% done; ETC: 16:30 (0:00:02 remaining)
>
> Stats: 0:00:27 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan Service scan Timing: About 90.00% done; ETC: 16:30 (0:00:03 remaining) Stats: 0:00:32 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan ...
>
> **Nmap scan status output**

On slow scans you may get bored looking at your screen doing nothing for long periods of time. The **--stats-every** option can alleviate this problem. In the above example, **--stats-every 5s** instructs Nmap to display the status of the current scan every five seconds. Timing parameters can be specified in seconds (s), minutes (m), or hours (h) by appending an s, m, or h to the interval number as described on page 99.

### 133t Output 

The **-oS** option enables “script kiddie” output.

**Usage syntax:** nmap -oS \[scan.txt\] \[target\]

> **\$ nmap -oS scan.txt 10.10.1.1**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 15:45 CDT Interesting ports on 10.10.1.1:
>
> Not shown: 998 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.48 seconds
>
> **Creating a “133t” output file**

Script kiddie or “leet” speak is output is a cryptic form of typing used mostly by immature teenagers on message boards and chat sites. This option is included as a joke and isn’t really useful for anything other than a good laugh. The results of the **-oS** option are saved in scan.txt file displayed below.

> **\$ cat scan.txt**
>
> StaRtING NMap 5.00 ( htTp://nmap.oRg ) aT 2009-08-13 15:45 CDT !nt3r3St\|ng pOrts 0n 10.10.1.1:
>
> n0t \$h0wn: 998 cl0\$3d p0rt\$
>
> P0RT \$TATE seRV!CE
>
> 80/tcp Open hTtp
>
> 443/tcp 0pen httpS
>
> Nmap DOnE: 1 Ip addresz (1 host up) \$canned iN 0.48 \$3c0nds
>
> **Nmap script kiddie output**

## Troubleshooting and Debugging 

Technical problems are an inherent part of using computers. Nmap is no exception. Occasionally a scan may not produce the output you expected; you may receive an error – or you may not receive any output at all. Nmap offers several options for tracing and debugging a scan which can help identify why this happens. The following section describes these troubleshooting and debugging features in detail.

> **Summary of features covered in this section:**

<table style="width:31%;">
<colgroup>
<col style="width: 20%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><strong>Option</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Getting Help</td>
<td style="text-align: center;"><strong>-h</strong></td>
</tr>
<tr>
<td>Display Nmap Version</td>
<td style="text-align: center;"><strong>-V</strong></td>
</tr>
<tr>
<td>Verbose Output</td>
<td style="text-align: center;"><strong>-v</strong></td>
</tr>
<tr>
<td>Debugging</td>
<td style="text-align: center;"><strong>-d</strong></td>
</tr>
<tr>
<td>Display Port State Reason</td>
<td style="text-align: center;"><strong>--reason</strong></td>
</tr>
<tr>
<td>Only Display Open Ports</td>
<td style="text-align: center;"><strong>--open</strong></td>
</tr>
<tr>
<td>Trace Packets</td>
<td style="text-align: center;"><blockquote>
<p><strong>--packet-trace</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Display Host Networking</td>
<td style="text-align: center;"><strong>--iflist</strong></td>
</tr>
<tr>
<td>Specify a Network Interface</td>
<td style="text-align: center;"><strong>-e</strong></td>
</tr>
</tbody>
</table>

### Getting Help 

Executing **nmap -h** will display a summary of available options.

#### Usage syntax: nmap -h 

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -h</strong></p>
<p>Nmap 5.00 ( http://nmap.org )</p>
<p>Usage: nmap [Scan Type(s)] {target specification} TARGET SPECIFICATION:</p>
<p>Can pass hostnames, IP addresses, networks, etc.</p>
<p>Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254</p>
<p>-iL &lt;inputfilename&gt;: Input from list of hosts/networks</p>
<p>-iR &lt;num hosts&gt;: Choose random targets</p>
<p>--exclude &lt;host1[,host2][,host3],...&gt;: Exclude hosts/networks</p>
<p>--excludefile &lt;exclude_file&gt;: Exclude list from file</p>
<p>...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Displaying Nmap help information**

For more detailed information you can read the Nmap manual page by typing **man nmap** on the command line.

> **\$ man nmap**
>
> **Accessing the Nmap man page on Unix and Linux systems**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>The <strong>man</strong> command is only available on Unix, Linux, and Mac OS X based systems. Windows users can read the Nmap manual online at www.nmap.org/book/man.html.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Tip** | *You can also find help online by subscribing to the Nmap mailing list at www.seclists.org.* |
|----|----|

### Display Nmap Version 

The **-V** option is used to display the installed version of Nmap.

#### Usage syntax: nmap -V 

> **\$ nmap -V**
>
> Nmap version 5.00 ( http://nmap.org )
>
> **Displaying the installed version of Nmap**

When troubleshooting Nmap problems you should always make sure you have the most up-to-date version installed. Open source programs like Nmap are developed at a rapid pace and bugs are typically fixed as soon as they are discovered. Compare your installed version to the latest version available on the Nmap website at www.nmap.org to make sure you are running the most up-to-date version available. This will ensure that you have access to the latest features as well as the most bugfree version available.

### Verbose Output 

The **-v** option is used to enable verbose output.

**Usage syntax:** nmap -v \[target\]

> **\$ nmap -v scanme.insecure.org**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-12 15:06 CDT NSE: Loaded 0 scripts for scanning.
>
> Initiating Ping Scan at 15:06
>
> Scanning 64.13.134.52 \[2 ports\]
>
> Completed Ping Scan at 15:06, 1.87s elapsed (1 total hosts)
>
> Initiating Parallel DNS resolution of 1 host. at 15:06
>
> Completed Parallel DNS resolution of 1 host. at 15:06, 0.16s elapsed
>
> Initiating Connect Scan at 15:06
>
> Scanning scanme.nmap.org (64.13.134.52) \[1000 ports\]
>
> Discovered open port 53/tcp on 64.13.134.52
>
> Discovered open port 80/tcp on 64.13.134.52
>
> Completed Connect Scan at 15:06, 7.00s elapsed (1000 total ports) Host scanme.nmap.org (64.13.134.52) is up (0.087s latency).
>
> Interesting ports on scanme.nmap.org (64.13.134.52):
>
> Not shown: 998 filtered ports
>
> PORT STATE SERVICE
>
> 53/tcp open domain
>
> 80/tcp open http
>
> Read data files from: /usr/local/share/nmap
>
> Nmap done: 1 IP address (1 host up) scanned in 9.41 seconds
>
> **Nmap scan with verbose output enabled**

Verbose output can be useful when troubleshooting connectivity problems, or if you are simply interested in what’s going on behind the scenes of your scan.

| **Tip** | *You can use the **-v** option twice (**-v -v** or **-vv**) to enable additional verbose output.* |
|----|----|

### Debugging 

The **-d** option enables debugging output.

**Usage syntax:** nmap -d\[1-9\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -d scanme.insecure.org</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-12 15:26 CDT</p>
<p>PORTS: Using top 1000 ports found open (TCP:1000, UDP:0, SCTP:0)</p>
<p>--------------- Timing report --------------- hostgroups: min 1, max 100000</p>
<p>rtt-timeouts: init 1000, min 100, max 10000 max-scan-delay: TCP 1000, UDP 1000, SCTP 1000 parallelism: min 0, max 0 max-retries: 10, host-timeout: 0 min-rate: 0, max-rate: 0</p>
<p>--------------------------------------------- NSE: Loaded 0 scripts for scanning.</p>
<p>Initiating Ping Scan at 15:26</p>
<p>Scanning 64.13.134.52 [2 ports]</p>
<p>Completed Ping Scan at 15:26, 2.83s elapsed (1 total hosts) Overall sending rates: 1.06 packets / s. mass_rdns: Using DNS server 10.10.1.44 mass_rdns: Using DNS server 10.10.1.45</p>
<p>Initiating Parallel DNS resolution of 1 host. at 15:26 mass_rdns: 0.00s 0/1 [#: 2, OK: 0, NX: 0, DR: 0, SF: 0, TR: 1] Completed Parallel DNS resolution of 1 host. at 15:26, 0.00s elapsed ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Nmap debugging output**

Debugging output provides additional information that can be use to trace bugs or troubleshoot problems. The default **-d** output provides a fair amount of debugging information. You can also specify a debugging level of 1-9 to be used with the **-d** parameter to increase or decrease the amount of output. For example: **-d1** provides the lowest amount of debugging output and **-d9** is the highest.

### Trace Packets 

The **--packet-trace** parameter instructs Nmap to display a summary of all packets sent and received.

**Usage syntax:** nmap --packet-trace \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap --packet-trace 10.10.1.1</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 17:14 CDT</p>
<p>CONN (0.1600s) TCP localhost &gt; 10.10.1.1:80 =&gt; Operation now in progress</p>
<p>CONN (0.1600s) TCP localhost &gt; 10.10.1.1:443 =&gt; Operation now in progress</p>
<p>NSOCK (0.1610s) UDP connection requested to 10.10.1.45:53 (IOD #1) EID 8</p>
<p>NSOCK (0.1610s) Read request from IOD #1 [10.10.1.45:53] (timeout: -1ms) EID 18 NSOCK (0.1610s) UDP connection requested to 10.10.1.44:53 (IOD #2) EID 24 NSOCK (0.1610s) Read request from IOD #2 [10.10.1.44:53] (timeout: -1ms) EID 34 NSOCK (0.1610s) Write request for 40 bytes to IOD #1 EID 43 [10.10.1.45:53]:</p>
<p>V!...........1.1.10.10.in-addr.arpa.....</p>
<p>NSOCK (0.1610s) nsock_loop() started (timeout=500ms). 5 events pending</p>
<p>NSOCK (0.1610s) Callback: CONNECT SUCCESS for EID 8 [10.10.1.45:53]</p>
<p>NSOCK (0.1610s) Callback: CONNECT SUCCESS for EID 24 [10.10.1.44:53]</p>
<p>NSOCK (0.1610s) Callback: WRITE SUCCESS for EID 43 [10.10.1.45:53] ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Packet trace output**

The **--packet-trace** parameter is another useful tool for troubleshooting connectivity issues. The example above displays detailed information about every packet sent to and received from the target system.

| **Tip** | *Trace information will rapidly scroll across the screen. See page 129 for information about saving trace data to a file for easier viewing.* |
|----|----|

### Display Host Networking Configuration 

The **--iflist** option displays the network interfaces and routes configured on the local system.

**Usage syntax:** nmap --iflist

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap --iflist</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-13 17:03 CDT</p>
<p>************************INTERFACES************************ DEV (SHORT) IP/MASK TYPE UP MAC lo (lo) 127.0.0.1/8 loopback up</p>
<p>eth0 (eth0) 10.10.1.107/24 ethernet up 00:21:70:AC:F7:E7 wlan0 (wlan0) 10.10.1.176/24 ethernet up 00:16:EA:F0:92:50</p>
<p>**************************ROUTES**************************</p>
<p>DST/MASK DEV GATEWAY</p>
<p>10.10.1.0/0 eth0</p>
<p>10.10.1.0/0 wlan0</p>
<p>169.254.0.0/0 wlan0</p>
<p>0.0.0.0/0 eth0 10.10.1.1</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Interface list output**

The above example displays the general network and routing information for the local system. This option can be helpful for quickly identifying network information or troubleshooting connectivity issues.

| **Tip** | *Additional commands that are helpful for troubleshooting networking configuration include **ifconfig** (Unix/Linux) and **ipconfig** (Windows). Most Windows and Unix based systems also include the **netstat** command which can provide additional network information.* |
|----|----|

### Specify Which Network Interface to Use 

The **-e** option is used to manually specify which network interface Nmap should use.

**Usage syntax:** nmap -e \[interface\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong>$ nmap -e eth0 10.10.1.48</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-08-25 08:30 CDT Interesting ports on 10.10.1.48:</p>
<p>Not shown: 994 closed ports</p>
<p>PORT STATE SERVICE</p>
<p>21/tcp open ftp 22/tcp open ssh</p>
<p>25/tcp open smtp 80/tcp open http</p>
<p>111/tcp open rpcbind</p>
<p>2049/tcp open nfs</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 0.41 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Manually specifying a network interface**

Many systems have multiple network interfaces. Most modern laptops, for example, have both a regular ethernet jack and a wireless card. If you want to ensure Nmap is using your preferred interface you can use **-e** to specify it on the command line. In this example **-e** is used to force Nmap to scan via the *eth0* interface on the multihomed host system.

> 146

## Nmap Scripting Engine (NSE) 

The Nmap Scripting Engine (NSE) is a powerful tool that allows users to develop custom scripts which can be used to harness Nmap’s advanced scanning functions. In addition to the ability to write your own custom scripts, there are also a number of standard built-in scripts that offer some interesting features such as vulnerability detection and exploitation. This section covers the basic usage of these built-in scripts.

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>Scripts for NSE are written in the Lua programming language. Unfortunately, programming in Lua is outside the scope of this book. For more information about Lua visit www.lua.org.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col style="width: 7%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Warning</strong></p>
</blockquote></th>
<th><em>The NSE uses aggressive scanning techniques which (in some rare cases) can cause undesirable results like system downtime and data loss. Additionally, NSE vulnerability exploitation features could get you into legal trouble if you don’t have permission to scan the target systems</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Summary of features covered in this section:**

<table style="width:42%;">
<colgroup>
<col style="width: 21%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Feature</strong></th>
<th style="text-align: center;"><blockquote>
<p><strong>Option</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Execute Individual Scripts</td>
<td style="text-align: center;"><strong>--script [script]</strong></td>
</tr>
<tr>
<td>Execute Multiple Scripts</td>
<td style="text-align: center;"><strong>--script [script1,script2,etc]</strong></td>
</tr>
<tr>
<td>Execute Scripts by Category</td>
<td style="text-align: center;"><strong>--script [category]</strong></td>
</tr>
<tr>
<td>Execute Multiple Script Categories</td>
<td style="text-align: center;"><blockquote>
<p><strong>--script [category1, category2]</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Troubleshoot Scripts</td>
<td style="text-align: center;"><strong>--script-trace</strong></td>
</tr>
<tr>
<td>Update the Script Database</td>
<td style="text-align: center;"><strong>--script-updatedb</strong></td>
</tr>
</tbody>
</table>

### Execute Individual Scripts 

The **--script** argument is used to execute NSE scripts.

**Usage syntax:** nmap --script \[script.nse\] \[target\]

> **\# nmap --script whois.nse scanme.insecure.org**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-13 15:27 CST Interesting ports on scanme.nmap.org (64.13.134.52):
>
> Not shown: 996 filtered ports
>
> PORT STATE SERVICE
>
> 25/tcp closed smtp
>
> 53/tcp open domain
>
> 70/tcp closed gopher
>
> 80/tcp open http
>
> Host script results:
>
> \| whois: Record found at whois.arin.net
>
> \| netrange: 64.13.134.0 - 64.13.134.63
>
> \| netname: NET-64-13-143-0-26
>
> \| orgname: Titan Networks
>
> \| orgid: INSEC
>
> \|\_ country: US stateprov: CA
>
> Nmap done: 1 IP address (1 host up) scanned in 8.12 seconds
>
> **Executing a NSE script**

Script results are displayed under the heading “Host script results”. In the example above, the **--script** option is used to execute a script called whois.nse. The built-in whois.nse script retrieves information about the public IP address of the specified target from ARIN (American Registry for Internet Numbers). This is just one of the many built-in NSE scripts.

| **Tip** | *A complete list of the built-in scripts for Nmap 5.00 can be found online at www.nmap.org/nsedoc/.* |
|----|----|

### Execute Multiple Scripts 

The Nmap Scripting Engine supports the ability to run multiple scripts concurrently.

**Usage syntax:** nmap --script \[script1,script2,etc\|"expression"\] \[target\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap --script "smtp*" 10.10.1.44</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-15 14:24 CST Interesting ports on 10.10.1.44:</p>
<p>...</p>
<p>| smtp-commands: EHLO exchange-01.dontfearthecommandline.com Hello</p>
<p>[10.10.1.173], TURN, SIZE, ETRN, PIPELINING, DSN, ENHANCEDSTATUSCODES,</p>
<p>8bitmime, BINARYMIME, CHUNKING, VRFY, X-EXPS GSSAPI NTLM LOGIN, X-</p>
<p>EXPS=LOGIN, AUTH GSSAPI NTLM LOGIN, AUTH=LOGIN, X-LINK2STATE, XEXCH50</p>
<p>|_ HELP This server supports the following commands: HELO EHLO STARTTLS RCPT DATA RSET MAIL QUIT HELP AUTH TURN ETRN BDAT VRFY |_ smtp-open-relay: OPEN RELAY found.</p>
<p>...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Executing all SMTP scripts**

In this example, the asterisks wildcard character is used to execute all scripts that begin with *smtp*. You can also provide a comma-separated list of individual scripts to run using the following syntax: **nmap --script script1,script2,script3,etc.**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>When using wildcards, the expression must be enclosed in quotes such as “smtp*” or “ftp*”.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Tip** | *Some Nmap scripts accept arguments using the **--script-args** option. This allows you to specify specific parameters for a script. A complete list of arguments for each script can be found at www.nmap.org/nsedoc/.* |
|----|----|

### Script Categories 

You can use the **--script** option to execute NSE scripts based on category. The table below describes the available categories:

<table style="width:51%;">
<colgroup>
<col style="width: 10%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Categories</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Purpose</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>all</strong></p>
</blockquote></td>
<td>Runs all available NSE scripts</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>auth</strong></p>
</blockquote></td>
<td>Scripts related to authentication</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>default</strong></p>
</blockquote></td>
<td>Runs a basic set of default scripts</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>discovery</strong></p>
</blockquote></td>
<td>Attempts to discover in depth information about a target</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>external</strong></p>
</blockquote></td>
<td>Scripts that contact external sources (such as the whois database)</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>intrusive</strong></p>
</blockquote></td>
<td>Scripts which may be considered intrusive by the target system</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>malware</strong></p>
</blockquote></td>
<td>Scripts that check for open backdoors and malware</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>safe</strong></p>
</blockquote></td>
<td>Basic scripts that are not intrusive</td>
</tr>
<tr>
<td style="text-align: center;"><blockquote>
<p><strong>vuln</strong></p>
</blockquote></td>
<td>Checks target for commonly exploited vulnerabilities</td>
</tr>
</tbody>
</table>

> **NSE script categories**

Using script categories is the easiest way to launch NSE built-in scripts − unless you know the specific script you want to run. Executing scripts by category, however, can take longer to complete since each category contains numerous scripts.

| **Tip** | *A complete list of the NSE scripts in each category can be found online at www.nmap.org/nsedoc/.* |
|----|----|

### Execute Scripts by Category 

The **--script** option can be used to execute multiple scripts based on their category.

**Usage syntax:** nmap --script \[category\] \[target\]

> **\# nmap --script default 10.10.1.70**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-13 15:09 CST Interesting ports on 10.10.1.70:
>
> Not shown: 997 filtered ports
>
> PORT STATE SERVICE
>
> 139/tcp open netbios-ssn
>
> 445/tcp open microsoft-ds
>
> 5900/tcp open vnc
>
> MAC Address: 00:0C:F1:A6:1F:16 (Intel)
>
> Host script results:
>
> \|\_ nbstat: NetBIOS name: AXIS-01, NetBIOS user: \<unknown\>, NetBIOS
>
> MAC: 00:0c:f1:a6:1f:16
>
> \| smb-os-discovery: Windows XP
>
> \| LAN Manager: Windows 2000 LAN Manager
>
> \| Name: WORKGROUP\AXIS-01
>
> \|\_ System time: 2009-11-13 15:09:12 UTC-6
>
> Nmap done: 1 IP address (1 host up) scanned in 52.40 seconds
>
> **Executing all scripts in the default category**

By specifying a category (see page 165) with the **--script** option Nmap will execute every script in that category. In the example above, the results of the scripts in the default category are displayed under the “*Host script results”* heading.

| **Tip** | *The **-sC** option is a shortcut for **--script default** which will execute all of the NSE scripts in the default category.* |
|----|----|

### Execute Multiple Script Categories 

Multiple script categories can be executed concurrently using one of the following syntax structures:

#### nmap --script category1,category2,etc 

Specifying multiple script categories as a comma-separated list would execute all scripts in the defined categories. For example, executing **nmap --script malware,vuln** would run all scripts in the malware and vulnerabilities categories.

#### nmap --script "category1 and category2" 

NSE scripts can belong to more than one category. Using this syntax would execute all that belong to both the specified categories. For example, **nmap --script "default and safe"** would only execute scripts that belong to both the default *and* safe categories.

#### nmap --script "category1 or category2" 

The ***or*** operator can be used to run scripts that belong to either of the specified

categories. For example, **nmap --script "default or safe"** would execute all scripts that belong to either the default *or* safe categories.

#### nmap --script "not category" 

The ***not*** operator is used to exclude scripts that belong to the specified category. For example, executing **nmap --script "not intrusive"** would run all scripts that do not belong to the intrusive category.

### Troubleshoot Scripts 

The **--script-trace** option is used to trace NSE scripts.

**Usage syntax:** nmap --script \[script(s)\] --script-trace \[target\]

> **\# nmap --script default --script-trace 10.10.1.70**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-14 13:51 CST
>
> NSOCK (5.1060s) nsock_loop() started (timeout=50ms). 0 events pending
>
> NSOCK (5.1060s) UDP connection requested to 10.10.1.70:137 (IOD \#1) EID 8
>
> NSOCK (5.1070s) TCP connection requested to 10.10.1.70:5900 (IOD \#2) EID 16
>
> NSOCK (5.1070s) UDP connection requested to 10.10.1.70:137 (IOD \#3) EID 24
>
> NSOCK (5.1080s) nsock_loop() started (timeout=50ms). 3 events pending
>
> NSOCK (5.1080s) Callback: CONNECT SUCCESS for EID 8 \[10.10.1.70:137\]
>
> NSE: UDP 10.10.1.173:56824 \> 10.10.1.70:137 \| CONNECT
>
> NSOCK (5.1080s) Callback: CONNECT SUCCESS for EID 16 \[10.10.1.70:5900\]
>
> NSE: TCP 10.10.1.173:49401 \> 10.10.1.70:5900 \| CONNECT
>
> NSOCK (5.1080s) Callback: CONNECT SUCCESS for EID 24 \[10.10.1.70:137\] ...
>
> **NSE trace output**

The **--script-trace** option displays all packets sent and received by an NSE script and is useful for troubleshooting problems related to scripts.

Some scripts can generate thousands of lines of output when using the script trace option. In most cases, it is better to redirect the output to a file for later review. The example below demonstrates how to do this.

> **\# nmap --script default 10.10.1.70 --script-trace \> trace.txt**
>
> **Redirecting the output of a NSE trace**

The resulting trace.txt file will contain all of the trace data and can be viewed in a standard text editor.

### Update the Script Database 

The **--script-updatedb** option is used to update the script database.

**Usage syntax:** nmap --script-updatedb

> **\# nmap --script-updatedb**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-11-14 13:42 CST NSE: Updating rule database.
>
> NSE script database updated successfully.
>
> Nmap done: 0 IP addresses (0 hosts up) scanned in 0.38 seconds
>
> **Updating the NSE script database**

Nmap maintains a database of scripts that is used to facilitate the option of executing multiple scripts via category (discussed on page 164). Most Unix-like systems store scripts in the **/usr/share/nmap/scripts/** directory. Windows systems store these files in **C:\Program Files\Nmap\scripts**. If you add or remove scripts from the scripts directory you must run **nmap --script-updatedb** to apply the changes to the script database.

> 170

## Ndiff 

Ndiff is a tool within the Nmap suite that allows you to compare two scans and flag any changes between them. It accepts two Nmap XML output files (discussed on page 130) and highlights the differences between each file for easy comparison. Ndiff can be used on the command line or in GUI form within the Zenmap application (see page 159).

> **Summary of features covered in this section:**

<table style="width:32%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Feature</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Option</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Comparison Using Ndiff</td>
<td style="text-align: center;"><blockquote>
<p><strong>ndiff</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Ndiff Verbose Mode</td>
<td style="text-align: center;"><blockquote>
<p><strong>-v</strong></p>
</blockquote></td>
</tr>
<tr>
<td>XML Output Mode</td>
<td style="text-align: center;"><blockquote>
<p><strong>--xml</strong></p>
</blockquote></td>
</tr>
</tbody>
</table>

> 172

### Scan Comparison Using Ndiff 

The **ndiff** utility is used to perform a comparison of two Nmap scans.

**Usage syntax:** ndiff \[file1.xml file2.xml\]

> **\# ndiff scan1.xml scan2.xml**
>
> -Nmap 5.00 at 2009-12-17 09:18 +Nmap 5.00 at 2009-12-18 12:44
>
> 10.10.1.48, 00:0C:29:D5:38:F4:
>
> -Not shown: 994 closed ports +Not shown: 995 closed ports
>
> PORT STATE SERVICE VERSION
>
> -80/tcp open http
>
> **Comparison of two Nmap scans**

Basic usage of the Ndiff utility consists of comparing two Nmap XML output files (discussed on page 130). Differences between the two files are highlighted with a minus sign indicating the information in the first file and the plus sign indicating the changes within the second file. In the above example we see that port 80 on the second scan has changed states from *open* to *closed*.

### Ndiff Verbose Mode 

The **-v** option is used to display verbose output with Ndiff.

**Usage syntax:** ndiff -v \[file1.xml file2.xml\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># ndiff -v scan1.xml scan2.xml</strong> -Nmap 5.00 at 2009-12-17 09:18 +Nmap 5.00 at 2009-12-18 12:44</p>
<p>10.10.1.48, 00:0C:29:D5:38:F4:</p>
<p>Host is up.</p>
<p>-Not shown: 994 closed ports</p>
<p>+Not shown: 995 closed ports</p>
<p>PORT STATE SERVICE VERSION</p>
<p>21/tcp open ftp</p>
<p>22/tcp open ssh</p>
<p>25/tcp open smtp -80/tcp open http</p>
<p>111/tcp open rpcbind</p>
<p>2049/tcp open nfs</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Output of a Ndiff scan in verbose mode**

The verbose output displays all lines of both XML files and highlights the differences with a minus sign indicating the information in the first file and the plus sign indicating the changes within the second file. This is in contrast to the default Ndiff behavior (described on page 173) which only displays the differences between the two files. Verbose output is often more helpful than the default output as it displays all information from the original scan.

> 174

### XML Output Mode 

The **-xml** option is used to generate XML output with Ndiff.

**Usage syntax:** ndiff --xml \[file1.xml\] \[file2.xml\]

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># ndiff --xml scan1.xml scan2.xml</strong></p>
<p>&lt;?xml version="1.0" encoding="UTF-8"?&gt;</p>
<p>&lt;nmapdiff version="1"&gt;</p>
<p>&lt;scandiff&gt;</p>
<p>&lt;hostdiff&gt;</p>
<p>&lt;host&gt;</p>
<p>&lt;address addr="10.10.1.48" addrtype="ipv4"/&gt;</p>
<p>&lt;address addr="00:0C:29:D5:38:F4" addrtype="mac"/&gt;</p>
<p>&lt;ports&gt;</p>
<p>&lt;a&gt;</p>
<p>&lt;extraports count="994" state="closed"/&gt;</p>
<p>&lt;/a&gt;</p>
<p>&lt;b&gt;</p>
<p>&lt;extraports count="995" state="closed"/&gt; &lt;/b&gt;</p>
<p>&lt;portdiff&gt;</p>
<p>&lt;a&gt;</p>
<p>&lt;port portid="80" protocol="tcp"&gt;</p>
<p>&lt;state state="open"/&gt;</p>
<p>&lt;service name="http"/&gt; ...</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Ndiff XML output**

XML output is a great tool for feeding information from Ndiff into a third party program using a widely supported format.

| **Tip** | *The default **--xml** output displays the XML code on the screen. To save this information file, type **ndiff --xml scan1.xml scan2.xml \>ndiff.xml** which will redirect the output to a file called ndiff.xml.* |
|----|----|

> 176

## Tips and Tricks 

This section provides several helpful tips and tricks for getting the most out of Nmap. It also incorporates the use of third party programs that work in conjunction with Nmap to help you analyse your network.

> **Summary of topics discussed in this section:**

<table style="width:33%;">
<colgroup>
<col style="width: 23%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><blockquote>
<p><strong>Topic</strong></p>
</blockquote></th>
<th style="text-align: center;"><blockquote>
<p><strong>Page</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td>Combine Multiple Options</td>
<td style="text-align: center;"><blockquote>
<p><strong>179</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Scan Using Interactive Mode</td>
<td style="text-align: center;"><blockquote>
<p><strong>180</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Runtime Interaction</td>
<td style="text-align: center;"><blockquote>
<p><strong>181</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Remotely Scan Your Network</td>
<td style="text-align: center;"><blockquote>
<p><strong>182</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Wireshark</td>
<td style="text-align: center;"><blockquote>
<p><strong>183</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Scanme.Insecure.org</td>
<td style="text-align: center;"><blockquote>
<p><strong>184</strong></p>
</blockquote></td>
</tr>
<tr>
<td>Nmap Online Resources</td>
<td style="text-align: center;"><blockquote>
<p><strong>185</strong></p>
</blockquote></td>
</tr>
</tbody>
</table>

### Combine Multiple Options 

If you haven’t already noticed, Nmap allows you to combine multiple options to produce a custom scan unique to your needs.

**Usage syntax:** nmap \[options\] \[target\]

> **\# nmap --reason -F --open -T3 -O scanme.insecure.org**
>
> Starting Nmap 5.00 ( http://nmap.org ) at 2009-12-17 16:01 CST Interesting ports on scanme.nmap.org (64.13.134.52):
>
> Not shown: 95 filtered ports, 3 closed ports
>
> Reason: 95 no-responses and 3 resets
>
> PORT STATE SERVICE REASON
>
> 53/tcp open domain syn-ack 80/tcp open http syn-ack
>
> Device type: general purpose\|WAP\|firewall\|router
>
> Running (JUST GUESSING) : Linux 2.6.X\|2.4.X (95%), Linksys Linux 2.4.X ...
>
> **Combining multiple Nmap options**

In the above example, many different options are combined to produce the desired results. As you can see, the possibilities are nearly limitless. You should note, however, that not all options are compatible with each other, as illustrated in the next example.

> **\# nmap -PN -sP 10.10.1.\***
>
> -PN (skip ping) is incompatible with -sP (ping scan). If you only want to enumerate hosts, try list scan (-sL)
>
> **Nmap warning with combining incompatible options**

In this example, the **-PN** option (don’t ping) and **-sP** option (ping only) are obviously not compatible with each other. Fortunately, Nmap provides a friendly and informative error message and thus no harm is done.

### Scan Using Interactive Mode 

The **--interactive** option enables the Nmap interactive shell.

**Usage syntax:** nmap --interactive

> **\$ nmap --interactive**
>
> Starting Nmap V. 5.00 ( http://nmap.org )
>
> Welcome to Interactive Mode -- press h \<enter\> for help nmap\>
>
> **Nmap interactive mode shell**

Once in interactive mode, you can launch a scan by simply typing the letter **n** followed by the target address and any standard Nmap options. The example below demonstrates using interactive mode to perform a simple **-F** scan.

**Usage syntax:** n \[options\] \[target\]

> **nmap\> n -F 10.10.1.1**
>
> Interesting ports on 10.10.1.1:
>
> Not shown: 98 closed ports
>
> PORT STATE SERVICE
>
> 80/tcp open http
>
> 443/tcp open https
>
> Nmap done: 1 IP address (1 host up) scanned in 0.19 seconds
>
> **Example scan using Nmap in interactive mode**

When you are done scanning, simply type ***x*** to exit the interactive shell.

| **Tip** | *Pressing the **h** key in interactive mode displays a help menu which describes the available options.* |
|----|----|

### Runtime Interaction 

Nmap offers several runtime interaction keystrokes that can modify an in progress scan. The table below lists Nmap’s runtime interaction keys.

| **Key** | **Function** |
|:--:|----|
| **v** | Pressing lowercase **v** during a scan will increase the verbosity level. |
| **V** | Pressing uppercase **V** during a scan will increase the verbosity level. |
| **d** | Pressing lowercase **d** during a scan will increase the debugging level. |
| **D** | Pressing uppercase **D** during a scan will increase the debugging level. |
| **p** | Pressing lowercase **p** during a scan will enable packet tracing. |
| **P** | Pressing uppercase **P** during a scan will disable packet tracing. |
| **?** | Pressing **?** during a scan will display the runtime interaction help. |
| **Any other key not listed above** | Pressing key other than the ones defined above during a scan will print a status message indicating the progress of the scan and how much time is remaining. |

> **Nmap runtime interaction keys**

Runtime interaction is very useful getting status updates when performing a scan on a large number of hosts. The example below displays the status of the current scan when the space bar pressed.

> **\# nmap -T2 10.10.1.\***
>
> \[space\]
>
> Stats: 0:06:45 elapsed; 18 hosts completed (30 up), 30 undergoing SYN
>
> Stealth Scan
>
> SYN Stealth Scan Timing: About 38.44% done; ETC: 16:56 (0:10:26 remaining) ...
>
> **Using runtime interaction keys to display scan status**

In addition to being able to display status updates, run time interaction keys can also adjust verbosity, tracing, and debugging settings without interrupting the scan in progress.

### Remotely Scan Your Network 

Nmap Online is a website that provides (free) Nmap scanning functionality via a web browser. This can be useful for remotely scanning your network or troubleshooting connectivity problems from an external source. Simply visit **www.nmap-online.com** and enter your IP address or the address of the target system you wish to scan.

<img src="media/image1.jpg" style="width:4.75in;height:4.29653in" />

> **Nmap online home page**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>To prevent abuse, Nmap Online allows a maximum of 5 scan requests from one IP address every 24 hours and a maximum of 20 scans every 7 days. You must also agree with the terms of service before you can execute a scan.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

### Wireshark 

Wireshark is an excellent addition to any system administrator’s toolkit. It is a sophisticated (yet easy to use) network protocol analyser. You can use Wireshark to capture and analyse network traffic and it works hand in hand with Nmap allowing you to see each packet sent and received while scanning.

<img src="media/image2.jpg" style="width:4.75in;height:4.04028in" />

> **Wireshark network protocol analyzer**

Wireshark is available for Windows, Linux, and Mac OS X and can be downloaded for free at www.wireshark.org.

### Scanme.Insecure.org 

The scanme.insecure.org server is a common example target used throughout this guide. This system is hosted by the Nmap project and can be freely scanned by Nmap users.

<table style="width:49%;">
<colgroup>
<col style="width: 49%" />
</colgroup>
<thead>
<tr>
<th><p><strong># nmap -F scanme.insecure.org</strong></p>
<p>Starting Nmap 5.00 ( http://nmap.org ) at 2009-12-18 16:52 CST Interesting ports on scanme.nmap.org (64.13.134.52):</p>
<p>Not shown: 95 filtered ports</p>
<p>PORT STATE SERVICE</p>
<p>25/tcp closed smtp</p>
<p>53/tcp open domain</p>
<p>80/tcp open http 110/tcp closed pop3 113/tcp closed auth</p>
<p>Nmap done: 1 IP address (1 host up) scanned in 2.63 seconds</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

> **Example scan using scanme.insecure.org as the target**

<table style="width:49%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th><blockquote>
<p><strong>Note</strong></p>
</blockquote></th>
<th><em>The good people of the Nmap project provide this valuable service as an education and troubleshooting tool and request that you be polite by not aggressively scanning it hundreds of times a day or with other tools not related to Nmap.</em></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## Appendix

### Nmap Online Resources 

- *Fyodor’s Nmap Book www.nmap.org/book/man.html*

- *Nmap Install Guide www.nmap.org/book/install.html*

- *Nmap Scripting Engine Documentation www.nmap.org/nsedoc/*

- *Zenmap Reference Guide www.nmap.org/book/zenmap.html*

- *Nmap Change Log www.nmap.org/changelog.html*

- *Nmap Mailing Lists www.seclists.org*

- *Nmap Online Scan www.nmap-online.com*

- *Security Tools www.sectools.org*

- *Nmap Mailing Lists www.seclists.org*

- *Nmap Facebook www.nmap.org/fb*

- *Nmap Twitter www.twitter.com/nmap*

- *Nmap Cookbook www.nmapcookbook.com*

### Appendix A - Nmap Cheat Sheet 

<table style="width:81%;">
<colgroup>
<col style="width: 16%" />
<col style="width: 22%" />
<col style="width: 41%" />
</colgroup>
<thead>
<tr>
<th><strong>Technique</strong></th>
<th><strong>Command</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Basic Scanning Techniques</strong></td>
<td> </td>
<td> </td>
</tr>
<tr>
<td>Scan Single Target:</td>
<td>#nmap 10.10.10.10</td>
<td><em>By default Nmap scan will check for the 1000 most commonly used TCP/IP ports</em></td>
</tr>
<tr>
<td>Scan Multiple Targets:</td>
<td>#nmap 10.10.10.10 10.10.10.11 10.10.10.12</td>
<td> </td>
</tr>
<tr>
<td><p>Scan IP Address Range:</p>
<p>Scan entire Subnet:</p></td>
<td><p>#nmap 10.10.10<mark>.10-12</mark></p>
<p>#nmap 10.10.10<mark>.*</mark></p>
<p>#nmap 10.10.10<mark>.10-10.10.*</mark></p>
<p>#nmap 10.10.10<mark>.10/24</mark></p></td>
<td><em>Nmap can be used to scan an entire subnet using CIDR (Classless Inter-Domain Routing) notation.</em></td>
</tr>
<tr>
<td>Scan list of targets:</td>
<td>#nmap list.txt <mark>-iL</mark></td>
<td><em>Each entry in the list.txt file must be separated by a space, tab, or newline</em></td>
</tr>
<tr>
<td>Random Scan</td>
<td>#nmap <mark>-iR 5</mark></td>
<td><em>It will randomly generate specified number of targets and scan them. <strong>Not Recommended</strong></em></td>
</tr>
<tr>
<td>Exclude Targets from Scan:</td>
<td>#nmap 10.10.10.0/24 --exclude 10.10.10.140</td>
<td><em>This option accepts single hosts, ranges, or entire network blocks</em></td>
</tr>
<tr>
<td>Exclude Targets Using List:</td>
<td>#nmap 10.10.10.0/24 --excludefile list.txt</td>
<td> </td>
</tr>
<tr>
<td>Aggressive Scan:</td>
<td>#nmap -A 10.10.10.10</td>
<td><em><strong>-A</strong> parameter is a synonym for several advanced options like <strong>-O -sC --traceroute</strong></em></td>
</tr>
<tr>
<td>Scan IPv6 target:</td>
<td>#nmap -6 fe80::29aa:9db9:4164:d80e</td>
<td><em>-6 parameter is used to perform a scan of an IPv6 target</em></td>
</tr>
<tr>
<td><strong>Discovery Options</strong></td>
<td></td>
<td> </td>
</tr>
<tr>
<td>Don’t Ping:</td>
<td>#nmap 10.10.10.10 -PN</td>
<td><em>While scanning ports first nmap ping the target to see if it is online then it scans. <strong>-PN</strong> option instructs Nmap to skip the default discovery check and perform a complete port scan on the target. Nmap is able to produce a list of open ports on the unpingable system.</em></td>
</tr>
<tr>
<td>Perform a Ping Only Scan<em>:</em></td>
<td>#nmap 10.10.10.0/24 -sP</td>
<td><em>Used to perform quick search of the target in the network. <strong>-sP option will perform ARP ping</strong> and produces MAC addresses.</em></td>
</tr>
<tr>
<td>TCP SYN Ping:</td>
<td>#nmap 10.10.10.10 -PS</td>
<td><em>It sends a SYN packet to target systems. Useful when standard ICMP pings are blocked. Default port for <strong>-PS</strong> is 80</em></td>
</tr>
<tr>
<td>TCP ACK Ping</td>
<td>#nmap 10.10.10.10 -PA</td>
<td><em>Used to send ACK packets to target systems. Useful when standard ICMP pings are blocked. Default port for <strong>-PS</strong> is 80</em></td>
</tr>
<tr>
<td>UDP Ping</td>
<td>#nmap 10.10.10.10 -PU</td>
<td><em>Used to send UDP packets to target systems. Useful when TCP connections are blocked. Default port for <strong>-PS</strong> is 40125</em></td>
</tr>
<tr>
<td>SCTP INIT Ping</td>
<td>#nmap 10.10.10.10 -PY</td>
<td><em>Used to locate hosts using the Stream Control Transmission Protocol (SCTP). Default port for <strong>-PS</strong> is 80</em></td>
</tr>
<tr>
<td>ICMP Echo Ping</td>
<td>#nmap 10.10.10.10 -PE</td>
<td><em>Used to send standard ICMP ping to target. <strong>-PE</strong> option is automatically implied if no other ping options are specified.</em></td>
</tr>
<tr>
<td>ICMP Timestamp Ping</td>
<td>#nmap 10.10.10.10 -PP</td>
<td><em>Useful when ICMP pings are blocked</em></td>
</tr>
<tr>
<td>ICMP Address Mask Ping</td>
<td>#nmap 10.10.10.10 -PM</td>
<td><em>Used to ping specified host using alternative ICMP registers. Useful when ICMP echo pings are blocked</em></td>
</tr>
<tr>
<td>IP Protocol Ping</td>
<td>#nmap 10.10.10.10 -PO 1, 2, 4</td>
<td><em>Used to sends packets with the specified protocol to the target. If no protocols are specified then default protocols 1 (ICMP), 2 (IGMP), and 4 (IP-in-IP) are used</em></td>
</tr>
<tr>
<td>ARP Ping</td>
<td>#nmap 10.10.10.10 -PR</td>
<td><em>The -PR option is automatically implied when scanning the local network. It is much faster than the other ping methods. It is more accurate because LAN hosts can’t block ARP requests.</em></td>
</tr>
<tr>
<td>Traceroute</td>
<td>#nmap 10.10.10.10 --traceroute</td>
<td><em>Used to trace the network path to the specified host</em></td>
</tr>
<tr>
<td>Force Reverse DNS Resolution</td>
<td>#nmap 10.10.10.10 -R</td>
<td><em>Used to perform reverse DNS resolution on the every target IP address. By default, Nmap will only do reverse DNS for hosts that appear to be online. <strong>Reduces performance of scan.</strong></em></td>
</tr>
<tr>
<td>Disable Reverse DNS Resolution</td>
<td>#nmap 10.10.10.10 -n</td>
<td><em>Used to Disable Reverse DNS Resolution. Reduces scanning time when scanning large number of hosts. Used when you don’t care of DNS information</em></td>
</tr>
<tr>
<td>Alternative DNS Lookup</td>
<td>#nmap 10.10.10.10 --system-dns</td>
<td><em>It instructs Nmap to use the host system’s DNS resolver instead of its own internal method. Useful when troubleshooting DNS problems</em></td>
</tr>
<tr>
<td>Manually Specify DNS Server(s)</td>
<td>#nmap 10.10.10.10 --dns-servers</td>
<td><em>Used to manually specify DNS servers to be queried when scanning</em></td>
</tr>
<tr>
<td>Create a Host List</td>
<td>#nmap 10.10.10.0/24 -sL</td>
<td><em>The -sL option will display a list and performs a reverse DNS lookup of the specified IP addresses. Useful for identifying the IP addresses and DNS names for the specified targets without sending any packets to them</em></td>
</tr>
<tr>
<td><strong>Port Scanning Options</strong></td>
<td> </td>
<td> </td>
</tr>
<tr>
<td>Fast Scan:</td>
<td>#nmap 10.10.10.10 -F</td>
<td>Scan only 100 most commonly used ports</td>
</tr>
<tr>
<td>Scan specific ports:</td>
<td>#nmap 10.10.10.10 -p 80, 443, 21-25</td>
<td> </td>
</tr>
<tr>
<td>Scan ports by name:</td>
<td>#nmap 10.10.10.10 -p http, smtp, ftp</td>
<td> </td>
</tr>
<tr>
<td>Scan ports for multiple services by name</td>
<td>#nmap 10.10.10.10 -p "http<mark>*</mark>"</td>
<td> </td>
</tr>
<tr>
<td>Scan ports by protocol:</td>
<td>#nmap 10.10.10.10 -p U:80,T:80</td>
<td>U:UDP port, T:TCP port</td>
</tr>
<tr>
<td>Scan All ports:</td>
<td>#nmap 10.10.10.10 -p *</td>
<td> </td>
</tr>
<tr>
<td>Show Open Ports:</td>
<td>#nmap 10.10.10.10 --open</td>
<td> </td>
</tr>
<tr>
<td>Reason for Port State:</td>
<td>#nmap 10.10.10.10 --reason</td>
<td><em>"syn-ack" means ports are open, "conn-refused or reset" means closed</em></td>
</tr>
<tr>
<td>Scan Top ports:</td>
<td>#nmap 10.10.10.10 --top-ports 20</td>
<td><em>Scans specified number of ports</em></td>
</tr>
<tr>
<td>Sequential port scan:</td>
<td>#nmap 10.10.10.10 -r</td>
<td><em>By default Nmap’s randomizes port scan order. -r overrides this.</em></td>
</tr>
<tr>
<td>Scan Flags</td>
<td>#nmap 10.10.10.10 --scan-flags</td>
<td> </td>
</tr>
<tr>
<td><strong>Advanced Scanning</strong></td>
<td> </td>
<td> </td>
</tr>
<tr>
<td>TCP SYN Scan: Half open scanning</td>
<td>#nmap 10.10.10.10 -sS</td>
<td><em>because only send syn packets and it does not attempt to open a full-fledged connection to the remote host. Prevents connection logging. (Modern firewall able to detect it) <strong>Stealth scan.</strong></em></td>
</tr>
<tr>
<td>TCP Connect Scan:</td>
<td>#nmap 10.10.10.10 -sT</td>
<td><em>attempts to directly connect to the remote system without using any</em></td>
</tr>
<tr>
<td>UDP Scan:</td>
<td>#nmap 10.10.10.10 -sU</td>
<td><em>Many services still utilize UDP like DNS, DHCP, SNMP</em></td>
</tr>
<tr>
<td>TCP Null Scan: .</td>
<td>#nmap 10.10.10.10 -sN</td>
<td><em>used to send packets with no TCP flags enabled. This is done by setting the packet header to 0. Sending NULL packets to a target is a method of tricking a firewalled system to generate a response</em></td>
</tr>
<tr>
<td>TCP FIN Scan</td>
<td>#nmap 10.10.10.10 -sF</td>
<td><em>In a -sF scan, Nmap marks the TCP FIN bit active when sending packets in an attempt to solicit a TCP ACK from the specified target system. This is another method of sending unexpected packets to a target in an attempt to produce results from a system protected by a firewall.</em></td>
</tr>
<tr>
<td>Xmas Scan</td>
<td>#nmap 10.10.10.10 -sX</td>
<td><em>Nmap sends packets with URG, FIN, and PSH, and flags activated. This has the effect of “lighting the packet up like a Christmas tree” and can occasionally solicit a response from a firewalled system.</em></td>
</tr>
<tr>
<td>TCP ACK Scan</td>
<td>#nmap 10.10.10.10 -sA</td>
<td><em>The <strong>-sA</strong> option can be used to determine if the target system is protected by a firewall. When performing a TCP ACK scan, Nmap will probe a target and look for RST responses. If no response is received the system is considered to be filtered. If the system does return an RST packet, then it is labelled as unfiltered. In the above example 994 ports are labelled as filtered meaning that the system is likely protected by a firewall. The 6 unfiltered ports displayed are likely to have special rules in the target’s firewall that enable them to be open or closed. The <strong>-sA</strong> option does not display whether or not the unfiltered ports are open or closed. Its only purpose is to determine whether or not the system is filtering ports.</em></td>
</tr>
<tr>
<td>Custom TCP Scan</td>
<td>#nmap 10.10.10.10 --scanflags FINACK</td>
<td><p><em>The <strong>--scanflags</strong> option allows users to define a custom scan using one or more TCP header flags. Any combination of flags listed in the table below can be used with the <strong>--scanflags</strong> option.</em></p>
<p><em><strong>SYN=</strong>Synchronize, <strong>ACK=</strong>Acknowledgment, <strong>PSH</strong>=Push, <strong>URG</strong>=Urgent, <strong>RST</strong>=Reset, <strong>FIN</strong>=Finished</em></p></td>
</tr>
<tr>
<td>IP Protocol Scan</td>
<td>#nmap 10.10.10.10 -sO</td>
<td><em>Displays the IP protocols that are supported on the target system. Used to find what types of scans you want to perform on the selected target.</em></td>
</tr>
<tr>
<td>Send Raw Ethernet Packets</td>
<td>#nmap 10.10.10.10 --send-eth</td>
<td><em>Used to bypass the IP layer on your system and send raw ethernet packets on the data link layer</em></td>
</tr>
<tr>
<td>Send IP Packets</td>
<td>#nmap 10.10.10.10 --send-ip</td>
<td><em>Used to scan using the local system’s IP stack instead of generating raw ethernet packets</em></td>
</tr>
<tr>
<td><strong>OS and Service Detection</strong></td>
<td> </td>
<td> </td>
</tr>
<tr>
<td>Operating System Detection</td>
<td>#nmap 10.10.10.10 -O</td>
<td><em>OS detection is performed by analysing responses from the target for a set of predictable characteristics which can be used to identify the type of OS on the remote system. In order for OS detection to work properly there must be at least one open and one closed port on the target system. When scanning multiple targets, the <strong>--osscan-limit</strong> option can be combined with <strong>-O</strong> to instruct Nmap not to OS scan hosts that do not meet this criteria. The -v option can be combined with -O to display additional information</em></td>
</tr>
<tr>
<td>Submit TCP/IP Fingerprints</td>
<td>#nmap 10.10.10.10 -O</td>
<td><a href="http://www.nmap.org/submit/"><u>www.nmap.org/submit/</u></a> <em>If Nmap is unable to determine the operating system on a target, it will provide a fingerprint which can be submitted to Nmap’s OS database at <a href="http://www.nmap.org/submit/"><u>www.nmap.org/submit/</u></a>. The example below demonstrates Nmap’s output in this scenario.</em></td>
</tr>
<tr>
<td>Attempt to Guess an Unknown OS</td>
<td>#nmap 10.10.10.10 -O --osscan-guess</td>
<td><em>Displays a list of possible matches for the target’s operating system</em></td>
</tr>
<tr>
<td>Service Version Detection</td>
<td>#nmap 10.10.10.10 -sV</td>
<td><em>Nmap version detection purposely skips some problematic ports (specifically 9100-9107). This can be overridden by combining the <strong>--allports</strong> parameter with <strong>-sV</strong> which instructs Nmap not to exclude any ports from version detection</em></td>
</tr>
<tr>
<td>Troubleshooting Version Scans</td>
<td>#nmap 10.10.10.10 -sV --version-trace</td>
<td><em>The <strong>--version-trace</strong> option can be helpful for debugging problems or to gain additional information about the target system</em></td>
</tr>
<tr>
<td>Perform a RPC Scan</td>
<td>#nmap 10.10.10.10 -sR</td>
<td><em>The <strong>-sR</strong> option performs a RPC (Remote Procedure Call) scan on the specified target.</em></td>
</tr>
<tr>
<td><strong>Timing Options</strong></td>
<td> </td>
<td> </td>
</tr>
<tr>
<td>Timing Templates</td>
<td><p>#nmap 10.10.10.10 -T0</p>
<p>#nmap 10.10.10.10 -T1</p>
<p>#nmap 10.10.10.10 -T2</p>
<p>#nmap 10.10.10.10 -T3</p>
<p>#nmap 10.10.10.10 -T4</p>
<p>#nmap 10.10.10.10 -T5</p></td>
<td><p><em>All timing parameters are accepted as milliseconds. 1ms = (1/1000sec), s=seconds, m=minutes, h=hours</em></p>
<ul>
<li><p><em><strong>Paranoid</strong>: Extremely slowly <strong><mark>T0 Evade Firewall</mark></strong></em></p></li>
<li><p><em><strong>Sneaky</strong>: Useful for avoiding intrusion detection systems <strong>T1</strong></em></p></li>
<li><p><em><strong>Polite</strong>: Unlikely to interfere with the target system <strong>T2</strong></em></p></li>
<li><p><em><strong>Normal</strong>: This is the default timing template <strong>T3</strong></em></p></li>
<li><p><em><strong>Aggressive</strong>: Produces faster results on local networks <strong>T4</strong></em></p></li>
<li><p><em><strong>Insane</strong>: Very fast and aggressive scan <strong>T5 --&gt;Faster result</strong></em></p></li>
</ul></td>
</tr>
<tr>
<td>Set the Packet TTL</td>
<td>#nmap 10.10.10.10 --ttl 500</td>
<td><em>The <strong>--ttl</strong> option is used to specify the TTL (time-to-live) for the specified scan (in milliseconds). Packets sent using this option will have the specified TTL value. This option is useful when scanning targets on slow connections where normal packets may time out before receiving a response.</em></td>
</tr>
<tr>
<td>Minimum # of Parallel Operations</td>
<td>#nmap 10.10.10.10 --min-parallelism 25</td>
<td><em>Nmap automatically adjusts parallel scanning options based on network conditions. This command instructs nmap to perform 25 parallel operations at any given time. <strong>Setting it high may produce wrong results</strong></em></td>
</tr>
<tr>
<td>Maximum # of Parallel Operations</td>
<td>#nmap 10.10.10.10 --max-parallelism 200</td>
<td><em><strong>--max-parallelism 1</strong> is used to restrict Nmap so that only one operation is performed at a time</em></td>
</tr>
<tr>
<td>Minimum Host Group Size</td>
<td>#nmap 10.10.10.10 --min-hostgroup 3</td>
<td><em>Nmap will perform scans in parallel to save time when scanning multiple targets such as a range or entire subnet. By default, Nmap will automatically adjust the size of the host groups based on the type of scan being performed and network conditions. By specifying the <strong>--min-hostgroup</strong> option, Nmap will attempt to keep the group sizes above the specified number.</em></td>
</tr>
<tr>
<td>Maximum Host Group Size</td>
<td>#nmap 10.10.10.10 --max-hostgroup 5</td>
<td><em><strong>--max-hostgroup</strong> option controls the maximum number of hosts in a group.</em></td>
</tr>
<tr>
<td>Maximum RTT Timeout</td>
<td>#nmap 10.10.10.10 --initial-rtt-timeout 5000</td>
<td><p><em>The <strong>--initial-rtt-timeout</strong> option controls the initial RTT (round-trip time) timeout value used by Nmap.</em></p>
<p><em>retransmissions due to timeouts. By decreasing the value you can speed up scans; but do so with caution. Setting the RTT timeout value too low can negate any potential performance gains and lead to inaccurate results.</em></p></td>
</tr>
<tr>
<td>Initial RTT Timeout</td>
<td>#nmap 10.10.10.10 --max-rtt-timeout 400</td>
<td><em>The <strong>--max-rtt-timeout</strong> option is used to specify the maximum RTT (Round-Trip Time) timeout for a packet response. Nmap dynamically adjusts RTT timeout options for best results by default. The default maximum RTT timeout is 10 seconds. Manually adjusting the maximum RTT timeout lower will allow for faster scan times (especially when scanning large blocks of addresses). Specifying a high maximum RTT timeout will prevent Nmap from giving up too soon when scanning over slow/unreliable connections. Typical values are between 100 milliseconds for fast/reliable networks and 10000 milliseconds for slow/unreliable connections.</em></td>
</tr>
<tr>
<td>Maximum Retries</td>
<td>#nmap 10.10.10.10 --max-retries 5</td>
<td><em>The <strong>--max-retries</strong> option is used to control the maximum number of probe retransmissions Nmap will attempt to perform. By default, Nmap will automatically adjust the number of probe retransmissions based on network conditions. The --max-retries option can be used if you want to override the default settings or troubleshoot a connectivity problem. Specifying a high number can increase the time it takes for a scan to complete, but will produce more accurate results. By lowering the --max-retries you can speed up a scan – although you may not get accurate results if Nmap gives up too quickly.</em></td>
</tr>
<tr>
<td>Host Timeout</td>
<td>#nmap 10.10.10.10 --host-timeout 5m</td>
<td><em>The <strong>--host-timeout</strong> option causes Nmap to give up on slow hosts after the specified time. A host may take a long time to scan if it is located on a slow or unreliable network. Systems that are protected by rate limiting firewalls may also take a considerable amount of time to scan. The <strong>--host-timeout</strong> option instructs Nmap to give up on the target system if it fails to complete after the specified time interval. In the above example, the scan takes longer than one minute to complete (as specified by the 1m parameter) which causes Nmap to terminate the scan. This option is particularly useful when scanning multiple systems across a WAN or internet connection. Nmap performs parallel operations when scanning multiple targets. In the event that one host is taking a long time to respond, Nmap is likely scanning other hosts during that time. This reduces potential bottlenecks that slow hosts can create</em></td>
</tr>
<tr>
<td>Minimum Scan Delay</td>
<td>#nmap 10.10.10.10 --scan-delay 5s</td>
<td><em>The <strong>--scan-delay</strong> option instructs Nmap to pause for the specified time interval between probes. Some systems employ rate limiting which can hamper Nmap scanning attempts. Nmap will automatically adjust the scan delay by default on systems where rate limiting is detected. In some cases it may be useful to specify your own scan delay if you know that rate limiting or IDS (Intrusion Detection Systems) are in use. In the example above the scan delay of <strong>5s</strong> instructs Nmap to wait five seconds between probes.</em></td>
</tr>
<tr>
<td>Maximum Scan Delay</td>
<td>#nmap 10.10.10.10 --max-scan-delay 10s</td>
<td><em>The <strong>--max-scan-delay</strong> is used to specify the maximum amount of time Nmap should wait between probes</em></td>
</tr>
<tr>
<td>Minimum Packet Rate</td>
<td>#nmap 10.10.10.10 --min-rate 30</td>
<td><em>The <strong>--min-rate</strong> option is used to specify the minimum number of packets Nmap should send per second. Nmap, by default, will automatically adjust the packet rate for a scan based on network conditions. In some cases, you may want to specify your own minimum rate - although this is generally not recommended. In the above example --<strong>min-rate 30</strong> instructs Nmap to send at least 30 packets per a second. Nmap will use the number as a low threshold but may scan faster than this if network conditions allow.</em></td>
</tr>
<tr>
<td>Maximum Packet Rate</td>
<td>#nmap 10.10.10.10 --max-rate 50</td>
<td><em>The <strong>--max-rate</strong> option is used to specify the maximum number of packets Nmap should send per second. To perform a very sneaky scan use <strong>--max-rate 0.1</strong> which instructs Nmap to send one packet every ten seconds.</em></td>
</tr>
<tr>
<td>Defeat Reset Rate Limits</td>
<td>#nmap 10.10.10.10 --defeat-rst-ratelimit</td>
<td><em>The <strong>--defeat-rst-ratelimit</strong> is used to defeat targets that apply rate limiting to RST (reset) packets. The <strong>--defeat-rst-ratelimit</strong> option can be useful if you want to speed up scans on targets that implement RST packet rate limits. It can, however, lead to inaccurate results and as such it is rarely used. The <strong>--defeat-rst-ratelimit</strong> option is rarely used because, in most cases, Nmap will automatically detect rate limiting hosts and adjust itself accordingly.</em></td>
</tr>
<tr>
<td><strong>Firewall Evasion</strong></td>
<td></td>
<td> </td>
</tr>
<tr>
<td>Fragment Packets</td>
<td>nmap -f [target]</td>
<td> </td>
</tr>
<tr>
<td>Specify a Specific MTU</td>
<td>nmap --mtu [MTU] [target]</td>
<td> </td>
</tr>
<tr>
<td>Use a Decoy</td>
<td>nmap -D RND:[number] [target]</td>
<td> </td>
</tr>
<tr>
<td>Idle Zombie Scan</td>
<td>nmap -sI [zombie] [target]</td>
<td> </td>
</tr>
<tr>
<td>Manually Specify a Source Port</td>
<td>nmap --source-port [port] [target]</td>
<td> </td>
</tr>
<tr>
<td>Append Random Data</td>
<td>nmap --data-length [size] [target]</td>
<td> </td>
</tr>
<tr>
<td>Randomize Target Scan Order</td>
<td>nmap --randomize-hosts [target]</td>
<td> </td>
</tr>
<tr>
<td>Spoof MAC Address</td>
<td>nmap --spoof-mac [MAC|0|vendor] [target]</td>
<td> </td>
</tr>
<tr>
<td>Send Bad Checksums</td>
<td>nmap --badsum [target]</td>
<td> </td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col style="width: 15%" />
<col style="width: 2%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th colspan="3" style="text-align: center;"><blockquote>
<p><strong>Output Options</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2">Save Output to a Text File</td>
<td><blockquote>
<p>nmap -oN [scan.txt] [target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2">Save Output to a XML File</td>
<td><blockquote>
<p>nmap -oX [scan.xml] [target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2">Grepable Output</td>
<td><blockquote>
<p>nmap -oG [scan.txt] [targets]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Output All Supported File Types</p>
</blockquote></td>
<td><blockquote>
<p>nmap -oA [path/filename] [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Periodically Display Statistics</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --stats-every [time] [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>133t Output</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -oS [scan.txt] [target]</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td style="text-align: right;"><strong>Tr</strong></td>
<td><strong>oubleshooting and debugging</strong></td>
</tr>
<tr>
<td>Getting Help</td>
<td></td>
<td><blockquote>
<p>nmap -h</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Display Nmap Version</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -V</p>
</blockquote></td>
</tr>
<tr>
<td>Verbose Output</td>
<td></td>
<td><blockquote>
<p>nmap -v [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Debugging</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -d [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Display Port State Reason</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --reason [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Only Display Open Ports</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --open [target]</p>
</blockquote></td>
</tr>
<tr>
<td>Trace Packets</td>
<td></td>
<td><blockquote>
<p>nmap --packet-trace [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Display Host Networking</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --iflist</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Specify a Network Interface</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap -e [interface] [target]</p>
</blockquote></td>
</tr>
<tr>
<td></td>
<td></td>
<td><blockquote>
<p><strong>Nmap Scripting Engine</strong></p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Execute Individual Scripts</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --script [script.nse] [target]</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Execute Multiple Scripts</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --script [expression] [target]</p>
</blockquote></td>
</tr>
<tr>
<td>Script Categories</td>
<td></td>
<td><blockquote>
<p>all, auth, default, discovery, external, intrusive, malware, safe, vuln</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p>Execute Scripts by Category</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>nmap --script [category] [target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Execute Multiple Script Categories</p>
</blockquote></td>
<td><blockquote>
<p>nmap --script [category1,category2,etc]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Troubleshoot Scripts</p>
</blockquote></td>
<td><blockquote>
<p>nmap --script [script] --script-trace</p>
<p>[target]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Update the Script Database</p>
</blockquote></td>
<td><blockquote>
<p>nmap --script-updatedb</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"></td>
<td><blockquote>
<p><strong>Ndiff</strong></p>
</blockquote></td>
</tr>
<tr>
<td colspan="2">Comparison Using Ndiff</td>
<td><blockquote>
<p>ndiff [scan1.xml] [scan2.xml]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>Ndiff Verbose Mode</p>
</blockquote></td>
<td><blockquote>
<p>ndiff -v [scan1.xml] [scan2.xml]</p>
</blockquote></td>
</tr>
<tr>
<td colspan="2"><blockquote>
<p>XML Output Mode</p>
</blockquote></td>
<td><blockquote>
<p>ndiff --xml [scan1.xml] [scan2.xml]</p>
</blockquote></td>
</tr>
</tbody>
</table>

# Network VAPT

- Planning

- Discovery

- Reconnaissance

- Vulnerability Analysis

- Exploitation

- Reporting

**Network VAPT**

What is Nmap and mention the uses of Nmap

Nmap is short for Network Mapper. It is an open-source Linux command-line tool that is used

to scan IP addresses and ports in a network and to detect installed applications 12. Nmap

allows network admins to find which devices are running on their network, discover open ports

and services, and detect vulnerabilities.

Some of the uses of Nmap are:

**Nmap** (Network Mapper) is an open-source command-line tool used for network discovery,

security scanning, and auditing. It's designed to provide information about hosts, services, and

potential vulnerabilities within a network. Here are some common uses of Nmap along with

examples:

1\. Network Discovery:

\- Example: Discover all active hosts on a local network.

nmap -sn 192.168.1.0/24

2\. Port Scanning:

\- Example: Perform a TCP SYN scan to identify open ports on a target host.

nmap -sS target.com

3\. Service Version Detection:

\- Example: Perform a service scan to determine the versions of services running on open

ports.

nmap -sV target.com

4\. Operating System Detection:

\- Example: Attempt to identify the operating system of a target host.

nmap -O target.com

5\. Vulnerability Assessment:

\- Example: Use Nmap's NSE scripts to scan for common vulnerabilities.

nmap --script vuln target.com

6\. Firewall Testing:

\- Example: Test if a target host's firewall allows certain types of packets.

nmap -p 80,443 --source-port 53 target.com

7\. Network Mapping:

\- Example: Create a network map of interconnected hosts.

nmap -sn -oN network_map.txt 192.168.1.0/24

8\. Scriptable Interaction:

\- Example: Use a custom NSE script to gather specific information from a target.

nmap --script myscript.nse target.com

9\. Penetration Testing:

\- Example: Identify potential entry points and vulnerabilities in a target network.

nmap -p 1-1000 --top-ports 10 target.com

10\. Security Auditing:

\- Example: Regularly audit the security of network devices and services.

nmap -A -T4 target.com

These are just a few examples of how Nmap can be used. It's important to remember that

Nmap's capabilities are extensive, and its usage should always adhere to ethical and legal

guidelines. Always obtain proper authorization before scanning networks or hosts that you do

not own or have permission to scan.

Why the nmap script is use ?

Nmap scripts are used to extend the functionality of Nmap and automate various tasks related

to network scanning and security. Nmap scripts can perform actions such as:

• Detecting vulnerabilities in network services and applications.

• Gathering information about hosts, ports, protocols, and configurations.

• Exploiting known weaknesses or misconfigurations in network devices.

• Testing the security posture and compliance of a network.

Nmap scripts are written in Lua, a lightweight and powerful scripting language. Nmap provides

a scripting engine (NSE) that allows users to run scripts with various options and arguments.

Nmap also offers a large collection of scripts that are categorized by their purpose and

functionality. Users can also create their own scripts or modify existing ones to suit their needs.

Nmap scripts are useful tools for network administrators and security professionals who want

to automate and enhance their network scanning and analysis capabilities.

There are four types of NSE scripts, namely:

• Prerule scripts – are scripts that run before any of Nmap’s scan operations, they are

executed when Nmap hasn’t gathered any information about a target yet.

• Host scripts – are scripts executed after Nmap has performed normal operations such as

host discovery, port scanning, version detection, and OS detection against a target host.

• Service scripts – are scripts run against specific services listening on a target host.

• Postrule scripts – are scripts run after Nmap has scanned all of its target hosts.

Then these scripts are grouped under various categories including those for authentication

(auth), discovering of hosts (broadcast), brute force attacks to guess authentication credentials

(brute), discovering more about a network (discovery), causing a denial of service (dos),

exploiting some vulnerability (exploit), etc. A number of scripts belong to the default category.

NSE scripts are loaded using the --script flag, which also allows you to run your own scripts by

providing categories, script file names, or the name of directories where your scripts are

located.

Reference and Resources:

How to Use Nmap Script Engine (NSE) Scripts in Linux (tecmint.com)

How to Use Nmap for Vulnerability Scan? - Geekflare

5 scripts for getting started with the Nmap Scripting Engine \| Enable Sysadmin (redhat.com)

What is Nmap and How to Use it – A Tutorial for the Greatest Scanning Tool of All Time

(freecodecamp.org)

Nmap \| What is Nmap - Javatpoint
