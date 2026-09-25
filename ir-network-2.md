# Indicators of Compromise

- **Anomalous Ports, Services, and Unpatched Hosts/Devices:**

  - Example: A web server (port 80/443) suddenly communicating on port
    6667 (IRC).

  - Example: A server that should only be running standard services now
    has a previously unseen service listening on an unusual port.

  - Example: Many machines on the network are running an old, vulnerable
    version of an operating system or application.

- **Mismatched port application traffic:**

  - Example: Traffic that appears to be HTTP (port 80) but contains data
    characteristic of SSH (port 22).

- **Unusual outbound network traffic:**

  - Example: A workstation sending large amounts of data to an unknown
    external IP address.

  - Example: Internal servers communicating with many random external IP
    addresses.

- **Web traffic with unhuman behaviour:**

  - Example: Rapid, automated requests to web pages that resemble a bot
    attempting to exploit a vulnerability.

  - Example: A single IP address making an excessive number of logins
    attempts within a short timeframe.

- **Network admin notices unusual deviation in network traffic flows:**

  - Example: A sudden, unexplained spike in bandwidth usage.

  - Example: A change in the typical patterns of data transfer between
    specific servers.

- **Systems using many different protocols:**

  - Example: A workstation communicating using a wide variety of network
    protocols (e.g., HTTP, FTP, SMB, IRC) when it normally only uses a
    few.

- **Long Duration Flow Involving a Remote Host:**

  - Example: A connection between an internal server and a remote IP
    address that remains active for days, transferring data
    continuously.

- **Long Duration ICMP Flows:**

  - Example: A constant stream of ICMP echo requests (pings) between two
    hosts for an extended period, which is not typical.

- **Excessive Firewall Accepts Across Multiple Hosts:**

  - Example: The firewall logs show many successful connections to many
    different internal servers within a short time.

- **Excessive Firewall Accepts from Multiple Sources to a Single
  Destination:**

  - Example: A single internal database server receiving a very high
    volume of connection requests from many different external IP
    addresses.

- **Excessive Firewall Denies from Single Source:**

  - Example: A single external IP address repeatedly attempting to
    connect to an internal server, resulting in numerous firewall denial
    events.

<!-- -->

- **DNS Activity:**

  - **Tampered domain name servers (DNS) and Unusual DNS requests:**

    - Example: DNS requests for unusual or suspicious domain names.

    - Example: DNS queries resolving to IP addresses known to host
      malicious content.

    - Example: A sudden increase in DNS requests for a specific, rarely
      accessed domain.

  - **Redirected internet searches:**

    - Example: Users being redirected to unintended websites when
      performing search engine queries.

- **Geographic Anomalies:**

  - **Remote Inbound Communication from a Foreign Country:**

    - Example: Login attempts from IP addresses located in countries
      where the organization has no legitimate business presence.

  - **Outbound Connection to a Foreign Country:**

    - Example: A local workstation establishing a connection to a server
      in a country known for hosting malicious infrastructure.

  - **Remote Access from Foreign Country:**

    - Example: Successful VPN logins from IP addresses in countries
      where the company has no employees or offices.

- **Intrusion Attempts/Exploits:**

  - **Signs of DDoS activity:**

    - Example: A sudden and overwhelming influx of traffic to a web
      server, causing it to become unavailable.

  - **Network Intrusion Detection Sensor alerts when buffer overflow
    attempt occurs against DB server:**

    - Example: NIDS detecting an attempt to send overly long data to a
      database server, potentially exploiting a buffer overflow
      vulnerability.

  - **Potential Honeypot Access:**

    - Example: An attempt to connect to a server specifically set up as
      a honeypot to attract and detect attackers.

- **Authentication/Access Issues:**

  - **Excessive Database Connections:**

    - Example: A sudden surge in database connections, potentially
      indicating a brute-force attack or a compromised application.

  - **VPN Sneak Attack:**

    - Example: A user connecting to the corporate VPN from an unusual
      location and then accessing sensitive resources.

  - **Single IP with Multiple MAC Addresses:**

    - Example: A single IP address associated with multiple different
      MAC addresses within a short timeframe, which can indicate MAC
      address spoofing.

- **Financial Irregularities:**

  - **Requests for unauthorized payments:**

    - Example: Network traffic suggesting attempts to access or
      manipulate online banking or payment systems.

**Categorization of Indicators of Compromise**

To make this more manageable, we'll categorize the IOCs into these
groups:

1.  **Network Traffic Anomalies:** Unusual patterns in network
    communication.

2.  **Firewall Events:** Suspicious activities observed by firewalls.

3.  **Authentication/Access Anomalies:** Irregular login and access
    attempts.

4.  **Host-Based Anomalies:** Unusual behavior on individual systems.

5.  **DNS Anomalies:** Suspicious activity related to Domain Name
    System.

6.  **Intrusion Detection/Prevention (IDP/IDS) Alerts:** Signatures and
    behavior-based detection events.

7.  **Data/Application Anomalies:** Suspicious changes to data or
    application behavior.

8.  **User/Behavioral Anomalies:** Unusual user actions.

**Corrected and Deduplicated IOCs with Real-Life Examples**

**1. Network Traffic Anomalies**

- **Unusual Outbound Network Traffic:**

  - **Description:** Significant and unexpected data leaving the
    network, often to unknown or suspicious destinations.

  - **Real-Life Example:** A workstation that typically uses 10MB of
    outbound traffic per day suddenly sends 2GB of data to an IP address
    in a known botnet range.

- **Long Duration Flow Involving a Remote Host:**

  - **Description:** Extended communication sessions with external
    hosts, potentially indicating command-and-control (C2) activity.

  - **Real-Life Example:** A server maintains a continuous connection to
    a foreign IP address for over 72 hours, transferring small packets
    of data at regular intervals, which is not normal for the server's
    function.

- **Long Duration ICMP Flows:**

  - **Description:** Sustained ICMP (ping) traffic, which is rarely
    legitimate.

  - **Real-Life Example:** A host sends a constant stream of ICMP echo
    requests to an external server for several hours, indicating a
    possible tunneling or data exfiltration attempt.

- **Signs of DDoS Activity:**

  - **Description:** High volumes of traffic targeting a specific server
    or service, leading to service disruption.

  - **Real-Life Example:** A web server experiences a sudden surge in
    HTTP requests from thousands of unique IP addresses, overwhelming
    its resources and causing it to become unresponsive.

- **Systems Using Many Different Protocols:**

  - **Description:** A system initiating connections using an unusually
    wide range of network protocols.

  - **Real-Life Example:** A user's laptop connects to remote hosts
    using protocols like FTP, Telnet, and various custom ports within a
    short period, which is not typical for their work.

- **Single IP with Multiple MAC Addresses:**

  - **Description:** A single IP address appearing with multiple MAC
    addresses, suggesting MAC address spoofing or ARP poisoning.

  - **Real-Life Example:** A network monitoring tool detects that the
    same IP address is associated with three different MAC addresses
    within a few minutes, indicating a potential man-in-the-middle
    attack.

- **Unusual traffic is identified as a potential intrusion; no
  signatures are involved in the process, so it is more likely to detect
  new attacks for which signatures are yet to be developed. (Anomalous
  Ports, Services and Unpatched Hosts or Network Devices)**

  - **Description:** Behavioural based detection of unusual traffic
    patterns.

  - **Real Life Example:** A network monitoring system detects a server
    communicating on a non standard port with a server that is known to
    have unpatched vulnerabilities. This communication does not match
    any known attack signatures.

- **Network admin notices unusual deviation in network traffic flows:**

  - **Description:** Human based detection of network anomalies.

  - **Real Life Example:** A network administrator notices a large
    increase in traffic going to the companies print server at 3 am,
    when no one is normally in the office.

**2. Firewall Events**

- **Excessive Firewall Denies from Single Source:**

  - **Description:** A single source attempting to connect to a
    destination repeatedly, but being blocked by the firewall.

  - **Real-Life Example:** A single IP address generates 500 failed SSH
    login attempts to a server within 10 minutes, triggering firewall
    blocks.

- **Firewall accepts excessive traffic from multiple sources to single
  destination:**

  - **Description:** Many sources connecting to a single destination,
    potentially indicating a distributed attack or unauthorized access.

  - **Real-Life Example:** A web server receives connections from 200
    different IP addresses within 5 minutes, all attempting to access a
    specific vulnerable PHP script.

- **Firewall accepts excessive traffic on multiple hosts:**

  - **Description:** A large number of connections spread across many
    internal hosts, possibly indicating lateral movement.

  - **Real-Life Example:** A firewall logs connections from various
    external IPs to 150 different internal workstations within 5
    minutes, suggesting a widespread scanning or attack attempt.

- **Firewall denies excessive traffic from single source:**

  - **Description:** Same as "Excessive Firewall Denies from Single
    Source"

  - **Real Life Example:** same as "Excessive Firewall Denies from
    Single Source"

**3. Authentication/Access Anomalies**

- **Outbound Connection to a Foreign Country/Remote Access from Foreign
  Country/Remote Inbound Communication from a Foreign Country:**

  - **Description:** Connections or logins originating from countries
    where remote access is not authorized.

  - **Real-Life Example:** An employee's account logs in from an IP
    address in Russia, even though the employee is located in the United
    States and has no business reason to travel there.

- **Potential Honeypot Access:**

  - **Description:** Attempts to access systems designed to trap
    attackers.

  - **Real-Life Example:** A security alert triggers when an IP address
    attempts to connect to a honeypot server simulating a vulnerable
    database.

- **VPN Sneak Attack:**

  - **Description:** Misuse of VPN access to gain unauthorized access to
    internal resources.

  - **Real-Life Example:** A compromised VPN account is used to access
    sensitive internal file shares from a remote location outside of
    normal business hours.

- **Excessive database connections:**

  - **Description:** A large number of connections to a database, that
    is outside of normal parameters.

  - **Real life example:** A database server that normally has 100
    concurrent connections, suddenly has 10,000 connections, causing a
    denial of service.

**4. Host-Based Anomalies**

- **Mismatched port application traffic:**

  - **Description:** Traffic observed on ports that do not match the
    expected application protocols.

  - **Real-Life Example:** SSH traffic (port 22) being detected on port
    80, suggesting tunneling or an attempt to bypass firewall rules.

- **Redirected internet searches:**

  - **Description:** Web searches being redirected to unexpected or
    malicious websites.

  - **Real-Life Example:** A user searching for "online banking" is
    redirected to a phishing site that mimics their bank's login page.

- **Web traffic with unhuman behaviour:**

  - **Description:** Automated or scripted web activity that deviates
    from typical user behavior.

  - **Real-Life Example:** A web server logs hundreds of rapid requests
    from a single IP address, accessing random pages and submitting form
    data at an impossible speed for a human user.

**5. DNS Anomalies**

- **Tampered domain name servers DNS:**

  - **Description:** Changes to DNS records that redirect traffic to
    malicious servers.

  - **Real-Life Example:** DNS records for a company's website are
    modified to point to a fake login page hosted on a malicious server.

- **Unusual DNS request:**

  - **Description:** Requests for unusual or suspicious domain names.

  - **Real-Life Example:** A workstation makes a large number of DNS
    requests for randomly generated domain names, which is a common
    tactic used by malware to locate C2 servers.

**6. Intrusion Detection/Prevention (IDP/IDS) Alerts**

- **Network Intrusion Detection Sensor alerts when buffer overflow
  attempt occurs against DB server:**

  - **Description:** IDS/IDP detects an attempt to exploit a buffer
    overflow vulnerability.

  - **Real-Life Example:** An IDS triggers an alert when it detects a
    series of malformed SQL queries being sent to a database server,
    indicating a buffer overflow attack.

- **IDP: IDPs use signatures to identify malicious activity, signatures
  must be kept up to date to detect newest attacks. IDPs often produce
  false positives, so analyst should manually validate IDPs alerts
  either by closely reviewing recorded supporting data or by getting
  related data from other sources. On a periodic basis run through these
  quick steps to look for anomalous behavior caused by a computer
  intrusion. Each of these commands runs locally on a system. Look for
  Network alerts and logs for Suspicious connection attempts on server,
  High increase of support calls, Suspicious network traffic, Suspicious
  connection attempts in firewalls.**

  - **Description:** Broad detection of malicious activity, and analysis
    of these alerts.

  - **Real life example:** An IDP alerts on a known malware signature.
    The security team then checks the logs of the endpoint that

Network Activity:

- Geographical irregularities

- Mismatched port-application traffic

- Signs of DDoS activity

- Unusual DNS requests

- Unusual outbound network traffic

- Web traffic with unhuman behaviour.

## Network Compromise

Objective: Detect the incident, determine its scope, and involve the
appropriate parties.

Objective of Detection and Analysis is to detect the incident, determine
its scope, and involve the appropriate parties.

Identify the technical characteristics of the traffic:

- Source IP address(es)

- Ports used, TTL, Packet ID, …

- Protocols used

- Targeted machines/services

- Exploit(s)

- Remote accounts logged in

**Categorization and Summary of Network Compromise Detection
Techniques**

**Network Traffic Analysis**

- **Packet Capture and Analysis:**

  - Use tools like tcpdump to capture network packets and analyze them
    for anomalies.

  - Filter traffic based on specific criteria (e.g., port numbers, IP
    addresses).

  - Analyze captured packets for signs of malicious activity, such as
    unusual port usage, excessive traffic, or encrypted traffic to
    unexpected destinations.

- **Network Flow Analysis:**

  - Analyze network flows to identify unusual patterns, such as sudden
    increases in traffic, unexpected connections, or unusual traffic
    volumes.

  - Use tools like netstat to monitor network connections and identify
    suspicious activity.

- **Protocol Analysis:**

  - Analyze network protocols for deviations from standard behaviour,
    such as incorrect protocol usage or malformed packets.

  - Use protocol analysers to inspect protocol headers and payloads for
    signs of compromise.

**Security Device Logs and Alerts**

- **IDS/IPS Alerts:**

  - Monitor security devices (IDS/IPS) for alerts related to malicious
    activity.

  - Analyze alerts for false positives and prioritize true threats.

- **Firewall Logs:**

  - Review firewall logs for blocked traffic, unauthorized access
    attempts, and other suspicious activity.

- **Router and Switch Logs:**

  - Examine router and switch logs for errors, unusual traffic patterns,
    and configuration changes.

**System and Application Logs**

- **System Logs:**

  - Check system logs for error messages, security warnings, and
    unauthorized access attempts.

  - Analyze logs for signs of malware activity, such as unusual
    processes or file modifications.

- **Application Logs:**

  - Review application logs for errors, exceptions, and security-related
    events.

  - Look for unusual activity, such as unauthorized login attempts or
    data exfiltration.

**Network Configuration and Security Policies**

- **Configuration Review:**

  - Review network configuration settings to ensure they are secure and
    up-to-date.

  - Check for weak passwords, default settings, and unnecessary
    services.

- **Policy Enforcement:**

  - Enforce network security policies to prevent unauthorized access and
    malicious activity.

  - Monitor network traffic to ensure compliance with security policies.

**Incident Response and Forensics**

- **Incident Response Plan:**

  - Have a well-defined incident response plan to guide the response to
    a network compromise.

  - Establish clear procedures for containment, eradication, and
    recovery.

- **Forensic Analysis:**

  - Collect and analyze digital evidence to identify the root cause of
    the compromise.

  - Use forensic tools to recover deleted files, reconstruct events, and
    identify attacker techniques.

By combining these techniques and staying vigilant, organizations can
effectively detect and respond to network compromises.

To identify potential network sniffers and gain insights into network
behaviour, focus on these key areas:

**Detecting Sniffers:**

- **Monitor network interfaces:** Check for interfaces in promiscuous
  mode using ip link or kernel logs.

- **Analyze network traffic:** Use netstat and lsof to identify unusual
  port listening and process activity.

- **Examine ARP cache:** Look for unexpected MAC address entries using
  arp -a.

**Understanding Network Activity:**

- **Inspect network interfaces:** Use ifconfig or ip add to view network
  interface details.

- **List open ports and processes:** Employ lsof -i to identify
  processes listening on ports.

- **Display active network connections:** Utilize netstat -nap to view
  network connections.

- **Examine ARP cache:** Use arp -a to display the ARP cache.

- **Check executable file paths:** Review the \$PATH environment
  variable.

**Process and Network Analysis**

- **strace:** Trace system calls made by a process: strace -p \<PID\>

- **tcpdump:** Capture network traffic: tcpdump -i eth0 -w capture. pcap

- **ss:** Display socket statistics (like netstat but more concise): ss
  -tulnp

- **netstat:** Display network connections, routing tables, interface
  statistics, masquerade connections, and multicast memberships: netstat
  -antulp

 

Regularly check for suspicious network access points in enterprises:

**Wired access points**

- **Unauthorized modems:** Personal modems or hotspots connected to the
  corporate network.

- **Misconfigured switches**: Switches with open ports or default
  configurations.

- **Physical access points:** Network cables in unsecured areas or
  physically accessible equipment.

**Wireless access points**

- **Rogue access points**: Unauthorized Wi-Fi networks within the
  enterprise.

- **Weakly secured access points:** Wi-Fi networks with insufficient
  encryption or authentication.

- **Public Wi-Fi hotspots:** Nearby public Wi-Fi networks that could be
  exploited.

**Remote Access Points**

- **VPN vulnerabilities:** Weak VPN configurations or unauthorized VPN
  access.

- **Remote desktop services**: Improperly configured remote desktop
  connections.

- **Cloud services:** Insecure cloud storage or application access.

**Other Access Points**

- IoT devices: Unsecured or compromised Internet of Things devices.

- Supply chain vulnerabilities: Third-party vendors or suppliers with
  weak security practices.

- Social engineering: Employees who fall victim to phishing attacks or
  other social engineering tactics.

Define and document Security Alert Notification Process

An efficient security alert notification process is critical for timely
response and mitigation of threats. It should be clear, concise, and
scalable. Key components of an effective notification process:

**Alert Classification:**

- Clearly defined alert severity levels (e.g., critical, high, medium,
  low).

- Consistent criteria for categorizing alerts based on impact and
  urgency.  

**Notification Channels:**

- Multiple communication channels (email, SMS, phone, push
  notifications) for different alert severities.

- Primary and secondary contact information for key personnel.

- On-call rotation schedules for after-hours coverage.

**Notification Escalation:**

- Defined escalation paths for alerts that are not addressed promptly.

- Clear escalation criteria and timeframes.

**Alert Content:**

- Essential information included in alerts (date, time, source, event
  type, severity, brief description).

- Consistent alert formatting for easy interpretation.

**Testing and Refinement:**

- Regular testing of the notification process to identify weaknesses.

- Continuous improvement based on feedback and incident response
  experiences.

**Documentation:**

- Detailed documentation of the notification process, including roles,
  responsibilities, and procedures.

- Easy access to documentation for all relevant personnel.

**Additional Considerations:**

- **False Positive Management:** Implement mechanisms to reduce false
  positive alerts.

- **Alert Fatigue Mitigation:** Prioritize alerts and avoid overwhelming
  recipients.

- **Security Incident Response Plan (SIRP):** Integrate the notification
  process into the overall SIRP.

- **Automation:** Utilize automation tools for efficient alert
  distribution and escalation.

**<span class="mark">Example Notification Process:</span>**

- **Critical alerts:** Immediate notification via phone and SMS to
  primary contacts, followed by email with detailed information.

- **High alerts:** Email notification with escalation to management if
  not addressed within a specified timeframe.

- **Medium alerts:** Email notification with optional escalation based
  on incident severity.

- **Low alerts:** Daily or weekly summary report.

By following these guidelines, organizations can establish a robust
security alert notification process that enhances their ability to
respond effectively to threats.

### Inventory of network access points

A comprehensive inventory of network assets and access points is crucial
for effective incident response. This information provides a baseline
for identifying anomalies, tracing the attack path, and containing the
breach.

**Network Devices:**

- Routers, switches, firewalls, load balancers, VPN concentrators,
  wireless access points, etc.

- Models, serial numbers, IP addresses, MAC addresses, firmware
  versions.

**Servers:**

- Physical and virtual servers, operating systems, applications,
  services, critical data.

- IP addresses, MAC addresses, server roles, vulnerabilities.

**End User Devices:**

- Laptops, desktops, mobile devices, IoT devices, OS, Apps, user
  accounts, physical locations.

**Network Segmentation:**

- Network zones, VLANs, DMZs, subnets, and their interconnections.

**Critical Assets:**

- Identification of high-value assets, systems, and data.

**Backup Systems:**

- Backup locations, frequency, retention policies, recovery procedures.

**Network Access Points to Monitor:**

- **Physical Access Points:**

  - Building entrances, server rooms, data centers, wiring closets.

  - Access control systems, surveillance cameras.

- **Remote Access Points:**

  - VPN connections, remote desktop protocols, cloud services.

  - Authentication methods, authorization levels, access logs.

- **Wireless Access Points:**

  - SSIDs, encryption protocols, authentication methods, MAC filtering.

- **Internet-Facing Services:**

  - Web servers, email servers, FTP servers, other exposed services.

  - IP addresses, ports, protocols, firewall rules.

**Additional Considerations:**

- **Regular Updates:** Ensure inventory and access point information is
  kept up-to-date.

- **Documentation:** Maintain detailed documentation of network
  topology, configuration, and procedures.

- **Access Controls:** Implement strong access controls to protect
  network assets and sensitive information.

- **Vulnerability Management:** Conduct regular vulnerability
  assessments and patch management.

By maintaining a comprehensive inventory and understanding network
access points, organizations can significantly improve their ability to
respond to network attacks effectively.

Windows-Specific Checks:

- **Basic Network Information:**

  - Monitor active connections and listening ports.

  - View active network sessions.

  - Check for suspicious NetBIOS connections.

- **Firewall Configuration:** Examine Windows Firewall settings.

- **File Sharing:** View file shares and verify their legitimacy.

- **Kernel Logs:** Check for entries indicating unauthorized access.

- **Service and Process Monitoring:**

  - Review running services for anomalies.

  - List active services.

  - Monitor listening ports and their associated processes.

- **Third-Party Tools:** Use advanced port monitoring tools.

Linux-Specific Checks:

- **Network Interface Promiscuous Mode:** Check for unauthorized changes
  to network interface settings.

- **Port and Process Monitoring:** Monitor active connections and
  listening ports. List open files, including network sockets.

- **Packet Capture and Analysis:** Capture network traffic and analyze
  it for suspicious activity.

General Considerations for Both Systems:

- **Regularly Update Critical File Lists:** Maintain a list of critical
  system files and monitor for unauthorized modifications.

- **Understand Normal Network Behaviour:** Establish a baseline of
  normal network activity to identify deviations.

- **Monitor for Unusual Port Activity:** Pay attention to ports that are
  not commonly used or are open to the public internet.

- **Check for Unexpected IP Addresses:** Identify devices that are not
  authorized to be on the network.

- **Review Network Sessions:** Analyze active sessions to detect
  suspicious connections.

- **Use Third-Party Tools:** Leverage specialized tools for advanced
  analysis and monitoring.

- **Periodic Reviews:** Conduct regular security audits to identify
  potential threats.

Network Scanning Techniques:

- **Ping Sweep:** Identify active hosts on a network.

- **Port Scanning:** Determine open ports on target hosts.

- **Service Scanning:** Identify services running on open ports.

- **Vulnerability Scanning:** Discover potential vulnerabilities in
  systems and applications.

By combining these techniques and staying vigilant, you can effectively
identify and mitigate suspicious network activity on your systems.

### Expected Result 

- Compromised machines list

- Modus operandi of attack should have been identified

- Source of attack should have been identified

.

## Containment for Network attack

This document outlines the strategies, tactics, steps, and procedures
for containing a cyber network attack, focusing on mitigating the impact
on affected and neighbouring IT resources. It emphasizes a tiered
approach based on the severity and sensitivity of the affected systems.

**I. Overall Strategy:**

The core strategy is to isolate the compromised systems and prevent
further spread of the attack while preserving evidence for forensic
analysis. This involves a combination of technical measures,
communication protocols, and incident response procedures. For
strategically sensitive incidents, a dedicated crisis management cell
should be activated.

**II. Tactics and Procedures:**

The following tactics and procedures are categorized for clarity and
should be implemented based on the specific attack and its impact:

**A. Initial Response & Triage:**

1.  **Mobilize the Incident Response Team:** Activate the cybersecurity
    response team and relevant stakeholders.

2.  **Identify the Attack Type:** Determine the nature of the attack
    (e.g., ransomware, DDoS, data breach) to tailor the response.

3.  **Assess Impact & Criticality:** Evaluate the scope of the attack
    and identify affected systems and data. Determine the criticality of
    the impacted resources to prioritize containment efforts.

**B. Containment Tactics:**

1.  **Network Isolation:** This is the primary tactic to prevent lateral
    movement.

    - **Disconnect Compromised Systems:** Isolate affected machines from
      the network. This may involve physically disconnecting them or
      using network segmentation tools.

    - **Perimeter Containment:** Isolate public-facing systems from the
      internet to prevent further external access.

    - **Internal Network Segmentation:** Segment the internal network to
      limit the attack's spread.

    - **Firewall and Network Device Configuration:** Implement firewall
      rules and configure network devices to block malicious traffic and
      enforce security policies.

    - **DNS Blocking:** Prevent access to known malicious domains.

    - **Exfiltration Blocking:** Prevent data exfiltration by blocking
      connections to known malicious destinations or using data loss
      prevention (DLP) tools.

    - **File Server Restrictions:** Limit access to critical file
      servers from potentially compromised systems.

2.  **Host-Based Containment:** Focuses on individual systems.

    - **Endpoint Security Measures:** Utilize antivirus, endpoint
      detection and response (EDR) solutions, and other endpoint
      security tools to detect and contain malicious activity on
      individual machines.

    - **Process Termination:** Terminate any suspicious or malicious
      processes running on affected systems.

3.  **Data Protection Tactics (for Strategic/Sensitive Incidents):**

    - **File Access Control:** Restrict access to confidential files
      from compromised computers.

    - **Digital Watermarking:** Implement watermarking on sensitive
      documents to track potential theft.

    - **Enhanced Logging:** Increase logging verbosity and securely
      store logs for forensic analysis.

**C. Investigation and Remediation:**

1.  **Backup Critical Data:** Immediately back up critical data from
    affected systems before further investigation. This ensures data
    preservation in case of data corruption or loss. Ideally, create a
    bit-by-bit physical copy of the hard disk and RAM for forensic
    analysis.

2.  **Offline Investigation:** Conduct a thorough investigation on
    isolated systems to identify the attack's origin, methods, and
    impact.

3.  **Evidence Collection:** Use forensic tools to gather evidence,
    including deleted files, system logs, and network traffic. Maintain
    chain of custody for all evidence.

4.  **Vulnerability Patching:** Apply security patches to address
    vulnerabilities exploited by the attacker.

5.  **Advanced Containment (for Advanced Persistent Threats):** Consider
    techniques like sandboxing and network micro-segmentation for
    advanced attacks.

**D. Communication and Recovery:**

1.  **User Notification:** Inform affected users about the incident and
    any necessary actions they should take.

2.  **Stakeholder Communication:** Notify relevant authorities,
    stakeholders, and customers about the incident and mitigation
    efforts.

3.  **Damage Assessment and Repair:** Assess the extent of the damage
    and repair affected systems and data.

4.  **Lessons Learned:** Conduct a post-incident review to identify
    areas for improvement in security posture and incident response
    procedures.

**III. Strategic Considerations (for Sensitive Data/Systems):**

For incidents involving sensitive data or critical systems, the
following additional steps are crucial:

- **Activate Crisis Management Cell:** A dedicated team should manage
  the incident response.

- **Prioritize Containment:** Focus on containing the breach and
  preventing data exfiltration.

- **Law Enforcement Involvement:** Coordinate with law enforcement
  agencies, especially if criminal activity is suspected.

**IV. Key Improvements and Corrections:**

- **Consolidated and Organized:** The information has been reorganized
  into logical categories to improve clarity and flow.

- **Removed Redundancy:** Duplicate steps and information have been
  removed.

- **Clarified Terminology:** Terms like "mitigate" have been clarified
  and replaced with more specific actions.

- **Added Detail:** More detail has been added to certain steps, such as
  data backup and evidence collection.

- **Emphasis on Strategic Considerations:** The importance of a separate
  crisis management structure for sensitive incidents has been
  highlighted.

- **Modernized Language:** The language has been updated to reflect
  current best practices in cybersecurity incident response.

By following these strategies, tactics, steps, and procedures,
organizations can effectively contain cyber network attacks, minimize
their impact, and improve their overall security posture.

## Eradication from Network behaviour

Objective: Take actions to stop the malicious behaviour.

- **Block the source**

  - Using analysis of identification and containment stages, find out
    all communication channels used by the attacker and block them on
    all your network boundaries.

  - If source is an insider, take appropriate actions, and involve your
    Management/HR/Legal team.

  - If source is an external offender, consider involvinabuse teams and
    law enforcement services if required.

- **Technical remediation**

  - Define a remediation process. If necessary, this process can be
    validated by another structure, like your incident response team for
    example.

  - Remediation steps from intrusion IRM can also be useful.

- **Test and enforce**

  - Test the remediation process and make sure that it properly works
    without damaginany service.

  - Enforce the remediation process once tests have been approved by
    both IT and business.

Objective: Take actions to stop the malicious behaviour.

 

Are there additional IDS/IPS segments that need coverage to
prevent/detect outbreak?

Ban malicious MD5 or SHA2 hashes with whitelisting tool or other
relevant product.

Block command and control IP addresses at network perimeter.

Block malicious IP addresses and file hashes.

Monitor RDP sessions on external accessible RDP client system.

Review firewall logs and identify any weaknesses.

## Recovery from Network attack

All these steps shall be made in a step-by-step manner and with a
technical monitoring.

Ensure that the network traffic is back to normal

Objective: Restore the system to normal operations.

Re-allow the network traffic that was used as a propagation method by
the attacker

Reconnect sub-areas together if necessary

Reconnect the area to the Internet if necessary

Reconnect the area to your local network if necessary

Tighten perimeter security and zero trust access rules.

Update boundary access control lists.

Update Firewall rules
