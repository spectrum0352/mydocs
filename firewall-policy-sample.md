Author: Sandeep Jadhav

Version: 1.0

# Change History

| Version | Date | Summary of Changes | Author | Pages Affected | Review and Approval |
|----|----|----|----|----|----|
| 1.0 | 01-Jan-1990 | Created initial document | Sandeep Jadhav | 1-20 | Sandeep Jadhav |
|  |  |  |  |  |  |
|  |  |  |  |  |  |

# Contents

[Change History [2](#change-history)](#change-history)

[1. Introduction [4](#introduction)](#introduction)

[2. Scope [5](#scope)](#scope)

[3. Policy Statement [5](#policy-statement)](#policy-statement)

[3.1. Default Deny Principle: [5](#default-deny-principle)](#default-deny-principle)

[3.2. Least Privilege Principle: [5](#least-privilege-principle)](#least-privilege-principle)

[3.3. Regular Review and Updates: [5](#regular-review-and-updates)](#regular-review-and-updates)

[3.4. Change Management: [5](#change-management)](#change-management)

[3.5. Logging and Monitoring: [5](#logging-and-monitoring)](#logging-and-monitoring)

[3.6. Security Best Practices: [5](#security-best-practices)](#security-best-practices)

[4. Firewall Configuration Guidelines [5](#firewall-configuration-guidelines)](#firewall-configuration-guidelines)

[4.1. Access Control Lists (ACLs): [5](#access-control-lists-acls)](#access-control-lists-acls)

[4.2. Port and Protocol Filtering: [5](#port-and-protocol-filtering)](#port-and-protocol-filtering)

[4.3. IP Address Filtering: [5](#ip-address-filtering)](#ip-address-filtering)

[4.4. Intrusion Detection and Prevention Systems (IDPS): [6](#intrusion-detection-and-prevention-systems-idps)](#intrusion-detection-and-prevention-systems-idps)

[4.5. Virtual Private Networks (VPNs): [6](#virtual-private-networks-vpns)](#virtual-private-networks-vpns)

[5. Firewall Management and Maintenance [6](#firewall-management-and-maintenance)](#firewall-management-and-maintenance)

[5.1. Regular Updates: [6](#regular-updates)](#regular-updates)

[5.2. Security Audits: [6](#security-audits)](#security-audits)

[5.3. Incident Response: [6](#incident-response)](#incident-response)

[6. Roles and Responsibilities [6](#roles-and-responsibilities)](#roles-and-responsibilities)

[6.1. Security Administrator: [6](#security-administrator)](#security-administrator)

[6.2. Network Administrator: [6](#network-administrator)](#network-administrator)

[7. Violations and Penalties [6](#violations-and-penalties)](#violations-and-penalties)

[8. Policy Review and Updates [6](#policy-review-and-updates)](#policy-review-and-updates)

# 1. Introduction

This policy outlines the guidelines and procedures for configuring, managing, and maintaining the network firewall systems within \[Organization Name\]. The primary objective is to safeguard the organization's network infrastructure and sensitive data by controlling inbound and outbound traffic, preventing unauthorized access, and mitigating potential security threats.

# 2. Scope

This policy applies to all network firewalls deployed within the organization's network infrastructure, including physical and virtual appliances. It covers all personnel involved in the management and operation of these firewalls.

# 3. Policy Statement

## 3.1. Default Deny Principle: 

All traffic is implicitly denied unless explicitly permitted by firewall rules.

## 3.2. Least Privilege Principle: 

Firewall rules should be configured to grant only the minimum necessary access to network resources.

## 3.3. Regular Review and Updates: 

Firewall rules and configurations must be reviewed and updated regularly to address evolving security threats and changes in network requirements.

## 3.4. Change Management: 

Any changes to firewall configurations must be documented, approved, and implemented following established change management procedures.

## 3.5. Logging and Monitoring: 

Firewall logs must be regularly monitored and analyzed to identify potential security incidents and anomalies.

- **Logging Requirements:**

  - Firewall filtering activity logs (TCP connections, proxy traffic)

  - Firewall audit trail logs (login/logout, rule changes)

  - Firewall system-level logs (disk errors, configuration changes)

- **Log Review:**

  - Periodic review for accountability or detective control

  - Situational review for problem determination or forensic investigation

- **Log Review Responsibility:**

  - Internal review by Information Security Manager or independent party

- **Log Archiving:**

  - Logs should be archived for a defined period

- **Log Disposal:**

  - Secure disposal through irreversible erasure or overwriting

**Categorization:**

- **Operational Logs:** Firewall filtering activity logs

- **Administrative Logs:** Firewall audit trail logs

- **System Logs:** Firewall system-level logs

## 3.6. Security Best Practices: 

Firewall configurations must adhere to industry-standard security best practices and guidelines.

Any connection between internal host to an external organization’s host over the public network or entrusted network for business-related exchange (e.g. B2B) shall use encrypted channel such as Virtual Private Network (VPN), router-to-router encryption, Secured-Socket-Layer (SSL), Secure-Shell (SSH), etc to ensure privacy and integrity of its data communication.

For establishing encrypted channel, there should be secured means for distributing the encryption keys prior to its operational use.

## 3.7 General Guidelines

- **Dedicated Hardware:** Firewall software should run on dedicated hardware.

- **Restricted Policy:** Enforce a restrictive policy where all services are denied unless explicitly permitted.

- **Network Segregation:** Isolate different user groups or network communities with distinct firewall policies.

- **Internal Network Visibility:** Prevent the internal network's details from being exposed to the external network.

- **Intrusion and Breakdown Notifications:** Implement a system to promptly notify relevant personnel of any intrusion or system failure.

- **Firewall Deployment:** Deploy firewalls in accordance with the established Network Trust Model and recommended layers.

- **Two-Tiered Firewalls:** Consider using two-tiered hybrid-platform firewalls for internet gateway connections.

- **Internal Firewalls and Filtering Routers:** Employ these tools to protect critical systems and enforce access controls.

- **Physical Segmentation:** Segment hosts behind the firewall using physical ports, not logical segmentation like VLANs.

# 4. Firewall Configuration Guidelines

## 4.1. Access Control Lists (ACLs): 

ACLs should be used to define granular access control rules for network traffic.

## 4.2. Port and Protocol Filtering: 

Only essential ports and protocols should be allowed through the firewall.

## 4.3. IP Address Filtering: 

IP addresses should be carefully defined and filtered to restrict access to authorized sources.

## 4.4. Intrusion Detection and Prevention Systems (IDPS): 

IDPS solutions should be integrated with the firewall to detect and mitigate potential security threats.

## 4.5. Virtual Private Networks (VPNs): 

VPN configurations should be secure and adhere to best practices to protect remote access.

# 5. Firewall Management and Maintenance

## 5.1. Regular Updates: 

Firewall firmware and software should be kept up-to-date with the latest security patches and updates.

Patches recommended by firewall vendor should be promptly implemented with management’s approval.

The Firewall Administrator[^1] shall evaluate new version or release of the firewall or its platform capacity requirement to determine if upgrading is necessary. Prior approval from the Information Security Manager should be obtained before implementation.

After any upgrade, the firewall’s proper operation shall be verified prior to going operational.

## 5.2. Security Audits: 

Regular security audits should be conducted to assess the effectiveness of firewall configurations.

## 5.3. Incident Response: 

Procedures should be in place to respond to security incidents involving the firewall.

## 5.4 Designated Administrators: 

Firewall administration should be the responsibility of designated Firewall Administrators and Backup Firewall Administrators.

## 5.5 Change Management: 

Any modification to the firewall requires approval from IT Security and should be performed by authorized administrators.

## 5.6 Periodic Validation: 

Firewall Administrators should regularly validate defined connections, rules, and services with application owners to ensure their validity.

## 5.7 Authorization and Security Review: 

All requests for new connections or rules/services on the firewall must be authorized by users, application owners, and the Information Security Manager. Information Security should review and establish security controls for all such requests.

## 5.8 Logical Access & Remote Administration

Logical access to the firewall should be restricted only to the Firewall Administrator(s), Backup Firewall Administrator(s) and the Information Security Manager[^2]. Any other access granted should be on a need to basis and with prior approval by the IT Security.

The Information Security Manager shall approve all access and privilege-level attributes.

Access previously granted which is invalid or no longer required should be removed immediately.

Logical access to the firewall, through administration workstation or direct terminal, should be controlled with authentication, with for example with user id and password.

Remote connection for firewall administration should only be considered if operational environment requires. If via entrusted network, remote connection should be secured with session encryption.

## 5.9 System Backup

- **System Configuration**

  - Firewall software (e.g., Rules/Policies, Network objects, definitions)

  - Operating system (e.g., inetd.conf, rc3.d)

  - Network definitions (e.g., routing tables, hostname)

- **Logs**

  - Firewall software (e.g., fwlog)

  - Operating system (e.g., syslog)

- **Removable Media Storage**

  - Label and securely store removable media used for backups.

## Documentation

All operational procedures for the firewall should be documented. At the minimum, they consist of the following: -

a\) Administration procedures

b\) Backup procedures

c\) Troubleshooting guide

d\) Review of firewall logs and audit trails

e\) Housekeeping procedures

2.2 The firewall’s configurable parameters should be documented and kept in confidence, accessible only by Firewall Administrator(s), Backup Firewall Administrator(s) and the Information Security Manager. At the minimum, the configuration documents should include: -

a\) Network diagram(s)

b\) IP addresses of all relevant network devices, internal hosts and relevant hosts of the Internet Service Provider (ISP) e.g. DNS server, router, etc

c\) Routing tables

d\) Firewall rules

2.3 All the above documentation should be updated following any changes to the firewall.

**Firewall Documentation Summary**

**Operational Procedures**

- Administration procedures

- Backup procedures

- Troubleshooting guide

- Log and audit trail review

- Housekeeping procedures

**Configuration Documentation**

- Network diagrams

- IP addresses of network devices, internal hosts, and ISP hosts

- Routing tables

- Firewall rules

**General Documentation Practices**

- All documentation should be kept up-to-date.

- Sensitive configuration information should be restricted to authorized personnel.

**Questions:**

1.  **What is the purpose of documenting firewall operational procedures?**

    - To ensure consistent and effective management of the firewall.

    - To provide a reference for troubleshooting and incident response.

    - To maintain compliance with security policies and regulations.

2.  **Why is it important to keep firewall configuration documentation confidential?**

    - To protect the security of the network and systems.

    - To prevent unauthorized access and modification of the firewall.

    - To maintain the integrity of the firewall's security posture.

3.  **How often should firewall documentation be reviewed and updated?**

    - Whenever changes are made to the firewall configuration or operational procedures.

    - Regularly, as part of the organization's security review process.

    - After security incidents or breaches to identify and address vulnerabilities.

# 6. Roles and Responsibilities

## 6.1. Security Administrator: 

Responsible for overall firewall security, policy enforcement, and incident response.

## 6.2. Network Administrator: 

Responsible for firewall configuration, maintenance, and troubleshooting.

# Enforcement

All staffs are required to comply with this security policy and its appendices. Disciplinary actions including termination may be taken against any Organization staffs who fail to comply with the Organization’s security policies, or circumvent/violate any security systems and/or protection mechanisms.

Staff having knowledge of personal misuse or malpractice of IT Systems must report immediately to management and IT Security.

Organization’s staff must ensure that Organization’s contractors and others parties authorized by the Organization using its internal computer systems, comply with this policy.

Where the role of the service provider is outsourced to a vendor, the outsourced vendor should ensure compliance with this policy.

# 7. Violations and Penalties

Violations of this policy may result in disciplinary action, including but not limited to:

- Written warnings

- Suspension

- Termination of employment

# 8. Policy Review and Updates

This policy will be reviewed annually or as needed to ensure its continued effectiveness and alignment with organizational security objectives.

**Note:** This is a general template and may need to be customized to fit your specific organization's requirements and security posture. Consult with security experts to tailor the policy to your needs.

**\[Organization Name\]** **\[Date\]**

**Disclaimer:**

This document provides general guidance and should not be considered a comprehensive security solution. It is recommended to consult with security experts to develop a tailored firewall policy that addresses your organization's specific needs and risks.

[^1]: *As in the above, outside of Head Office, local Firewall Administrator(s) would be appointed by the resident manager in charge of Information Systems.*

[^2]: *Outside of Head Office, for subsidiaries or oversea centre, the resident manager in charge of Information Systems would assume the role of the Information Security Manager.*
