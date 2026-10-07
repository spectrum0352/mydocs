# Introduction

**XDR Core Components:**

- **Federation of security signals:** XDR systems collect and integrate
  security data from a wide range of sources, including
  endpoints, networks, cloud applications, and email systems. This data
  is then normalized and correlated to provide a unified view of
  security across the entire organization.

- **Higher-level behavioural and cross-correlated analytics:** XDR
  systems use advanced analytics to detect suspicious activity and
  potential threats. These analytics go beyond the traditional
  rule-based approach to detection by looking for anomalies and patterns
  in security data across multiple sources.

- **Closed-loop and highly automated responses**: XDR systems can
  automate many of the tasks involved in threat detection and
  response. This includes tasks such as investigating alerts, triaging
  incidents, and executing remediation actions.

<!-- -->

- **Threat intelligence integration:** XDR systems can integrate with
  threat intelligence feeds to keep track of the latest threats and
  vulnerabilities. This information can be used to improve the accuracy
  of detection and response.

- **Security orchestration, automation, and response (SOAR):** XDR
  systems can be integrated with SOAR solutions to automate even more of
  the security workflow. This can help organizations to respond to
  threats more quickly and effectively.

- **User experience**: XDR systems typically provide a single console
  where security teams can view all of their security data, alerts, and
  incidents. This makes it easier for security teams to investigate and
  respond to threats.

Overall, XDR systems provide a comprehensive approach to security
detection and response. By integrating data from a wide range of sources
and using advanced analytics, XDR systems can help organizations to
identify and respond to threats more quickly and effectively.

<span class="mark">Here are some examples of how XDR components can be
used to detect and respond to security threats:</span>

- An XDR system can use endpoint telemetry to detect a malware infection
  on a single endpoint. The system can then correlate this data with
  network telemetry to identify other devices on the network that may be
  infected. The system can then automatically isolate the infected
  devices and deploy a patch to the malware.

- An XDR system can use email telemetry to detect a phishing attack. The
  system can then correlate this data with user identity data to
  identify the users who may have fallen victim to the attack. The
  system can then automatically reset the passwords of these users and
  send them awareness training materials.

- An XDR system can use cloud telemetry to detect an unauthorized access
  to a cloud storage bucket. The system can then correlate this data
  with user identity data to identify the user who may have been
  responsible for the unauthorized access. The system can then
  automatically lock the user's account and investigate the incident
  further.

XDR systems are a powerful tool that can help organizations of all sizes
to improve their security posture and reduce the risk of cyberattacks.

## Architecture of XDR

The typical XDR architecture consists of the following components:

- Data collection and storage: XDR collects data from a variety of
  security sources, including endpoints, networks, clouds, and
  applications. This data is then stored in a central data lake or
  repository.

- Data normalization and enrichment: XDR normalizes and enriches the
  collected data to make it easier to analyze and correlate. This may
  involve converting data to a common format, adding context from
  external sources, and removing noise.

- Analytics and detection: XDR uses advanced analytics and machine
  learning to detect threats and anomalies in the data. This may involve
  looking for patterns of malicious activity, identifying suspicious
  files or processes, and correlating events from different sources.

- Investigation and response: XDR provides security teams with the tools
  they need to investigate and respond to detected threats. This may
  include providing visibility into the attack path, recommending
  remediation actions, and automating response tasks.

XDR platforms can be deployed on-premises, in the cloud, or as a hybrid
solution. Cloud-based XDR platforms are becoming increasingly popular,
as they offer scalability, flexibility, and ease of deployment.

Here is a diagram of a typical XDR architecture:

[<u>\
</u>](https://learn.microsoft.com/en-us/security/operations/siem-xdr-overview)As
you can see, XDR sits at the center of the security stack, collecting
and analyzing data from all other security solutions. This allows XDR to
provide a unified view of security across the entire organization,
making it easier to detect and respond to threats.

Here are some of the benefits of using XDR:

- **Improved threat visibility:** XDR provides a single pane of glass
  for viewing security data from all sources. This gives security teams
  a complete view of their security posture and helps them to identify
  threats that might otherwise be missed.

- **Faster threat detection and response:** XDR's advanced analytics and
  machine learning capabilities help security teams to detect threats
  more quickly and accurately. XDR can also automate response
  tasks, helping security teams to remediate threats faster.

- **Reduced security complexity:** XDR simplifies security operations by
  consolidating multiple security tools into a single platform. This can
  help security teams to save time and resources.

Overall, XDR is a powerful security solution that can help organizations
to improve their security posture and reduce their risk of cyberattacks.

<img src="media/image1.png" style="width:9.69306in;height:5.48889in" />

## What is XDR?

Interviewee: XDR, or Extended Detection and Response, is a security
solution that integrates data from multiple sources across an
organization's IT environment to improve threat detection and response.
XDR solutions typically collect data from endpoints, networks, security
information and event management (SIEM) systems, and cloud applications.

**What are the benefits of using XDR?**

Interviewee: XDR offers a number of benefits, including:

- Improved threat visibility: XDR solutions provide a unified view of
  all security data, making it easier to identify and track threats
  across the entire IT environment.

- More effective threat detection: XDR solutions use advanced analytics
  to correlate data from multiple sources to detect threats that would
  be difficult or impossible to detect using traditional security
  solutions.

- Faster threat response: XDR solutions can automate many of the tasks
  involved in incident response, such as identifying the affected
  systems, containing the threat, and remediating the damage.

**What are some of the challenges of implementing an XDR solution?**

Interviewee: Some of the challenges of implementing an XDR solution
include:

- Data integration: XDR solutions need to be able to integrate data from
  a variety of different sources, which can be complex and challenging.

- Security skills: XDR solutions require skilled security personnel to
  manage and operate them effectively.

- Cost: XDR solutions can be expensive to implement and maintain.

**What are some of the best practices for implementing an XDR
solution?**

Some of the best practices for implementing an XDR solution include:

- Start with a clear plan: Define your goals for implementing XDR and
  identify the key requirements for your solution.

- Choose the right solution: Select an XDR solution that meets your
  specific needs and budget.

- Integrate your data: Carefully plan and execute the integration of
  data from your various security sources.

- Train your staff: Make sure your security team is properly trained on
  how to use and manage your XDR solution.

- Monitor your environment: Continuously monitor your XDR solution to
  ensure that it is working properly and that it is meeting your needs.

**What are the future trends for XDR?**

Interviewee: XDR is a rapidly evolving technology, and there are a
number of trends that are shaping the future of this market. One trend
is the convergence of XDR with other security solutions, such as
security orchestration, automation, and response (SOAR) and security
analytics. Another trend is the adoption of XDR in the cloud. As more
organizations move their IT workloads to the cloud, they are looking for
XDR solutions that can protect their cloud-based assets.

**How to design XDR solutions?**

To design an XDR implementation, you should follow these steps:

1.  Assess your current security posture. This will help you identify
    your security gaps and needs. Consider the following questions:

    - What security tools and solutions are you currently using?

    - What types of data are you collecting and analyzing?

    - How are you currently detecting and responding to threats?

    - What are your security goals?

2.  Define your XDR requirements. Based on your assessment, define your
    requirements for an XDR solution. Consider the following factors:

    - What types of data do you need to collect and analyze?

    - What types of threats do you need to detect and respond to?

    - What level of integration do you need with your existing security
      tools and solutions?

    - What is your budget?

3.  Choose an XDR solution. There are a number of different XDR
    solutions available on the market. Evaluate each solution carefully
    to ensure that it meets your requirements. Consider the following
    factors:

    - The types of data the solution can collect and analyze

    - The types of threats the solution can detect and respond to

    - The level of integration the solution offers with your existing
      security tools and solutions

    - The cost of the solution

4.  Plan your implementation. Once you have chosen an XDR solution, you
    need to develop a plan for its implementation. This plan should
    include the following steps:

    - Data integration: How will you integrate data from your various
      security sources into the XDR solution?

    - Deployment: How will you deploy the XDR solution in your
      environment?

    - Training: How will you train your security team on how to use and
      manage the XDR solution?

5.  Implement your solution. Once you have developed your implementation
    plan, you can begin implementing the XDR solution.

6.  Monitor and optimize your solution. Once the XDR solution is
    implemented, you need to monitor its performance and make
    adjustments as needed. This will help you ensure that the solution
    is meeting your needs and that it is protecting your organization
    effectively.

Here are some additional tips for designing an XDR implementation:

- Start with a pilot project. This will help you test the XDR solution
  and identify any potential issues before deploying it to your entire
  environment.

- Use a phased approach. Implement the XDR solution in phases to
  minimize disruption to your operations.

- Get buy-in from all stakeholders. It is important to get buy-in from
  all stakeholders, including security, IT, and business leaders, before
  implementing an XDR solution.

- Train your staff. Make sure your security team is properly trained on
  how to use and manage the XDR solution.

- Monitor your XDR solution continuously. Monitor the performance of
  your XDR solution and make adjustments as needed.

By following these steps, you can design an XDR implementation that will
help you improve your security posture and protect your organization
from threats.

**What is the difference between XDR and SIEM?**

XDR (Extended Detection and Response) and SIEM (Security Information and
Event Management) are both security solutions that collect and analyze
data from multiple sources to detect and respond to threats. However,
there are some key differences between the two technologies.

**SIEM** solutions focus on log data collection and analysis. They
collect logs from a variety of sources, such as firewalls, servers, and
applications, and analyze them to identify potential threats. SIEM
solutions can also generate alerts to notify security analysts of
potential incidents.

**XDR** solutions go beyond log data and collect a broader range of
security telemetry data, including endpoint data, network traffic, and
cloud-based data. XDR solutions use advanced analytics and machine
learning to correlate data from multiple sources and detect threats that
would be difficult or impossible to detect using traditional SIEM
solutions.

Another key difference between XDR and SIEM is their approach to threat
response. SIEM solutions typically provide alerts to security analysts,
who are then responsible for investigating and responding to incidents.
XDR solutions, on the other hand, can automate many of the tasks
involved in incident response, such as identifying the affected systems,
containing the threat, and remediating the damage.

**Here is a table that summarizes the key differences between XDR and
SIEM:**

| **Feature** | **XDR** | **SIEM** |
|----|----|----|
| Data sources | Log data, endpoint data, network traffic, cloud-based data | Log data |
| Detection | Advanced analytics and machine learning to correlate data from multiple sources | Rule-based detection |
| Response | Can automate many of the tasks involved in incident response | Provides alerts to security analysts |
| Use cases | Threat detection and response, security analytics, incident response | Log management, compliance, security analytics |

**Which technology is right for you depends on your specific needs and
requirements.** If you are looking for a solution that can provide
comprehensive threat visibility and detection, and automate many of the
tasks involved in incident response, then XDR is a good choice. If you
are looking for a solution that can help you manage your logs and comply
with regulations, then SIEM is a good choice.

In many cases, organizations may choose to use both XDR and SIEM
solutions together. XDR can be used for threat detection and response,
while SIEM can be used for log management and compliance.

## XDR Costing

**What are the low-cost XDR solutions available in market?**

There are a number of low-cost XDR solutions available in the market.
Some of the most popular options include:

- **Cynet 360:** Cynet 360 is a cloud-based XDR solution that offers a
  wide range of features, including threat detection, investigation, and
  response. Cynet 360 is also one of the most affordable XDR solutions
  on the market.

- **Trend Micro Vision One:** Trend Micro Vision One is another
  cloud-based XDR solution that offers a wide range of features. Vision
  One is also very affordable, especially for smaller organizations.

- **SentinelOne Singularity XDR:** SentinelOne Singularity XDR is a
  powerful XDR solution that is known for its ease of use and
  scalability. Singularity XDR is also very affordable, especially for
  organizations with a large number of endpoints.

- **Sophos Intercept X XDR:** Sophos Intercept X XDR is a comprehensive
  XDR solution that offers a wide range of features at a competitive
  price. Intercept X XDR is a good choice for organizations of all
  sizes.

- **CrowdStrike Falcon XDR:** CrowdStrike Falcon XDR is a powerful XDR
  solution that is known for its industry-leading threat detection and
  response capabilities. Falcon XDR is a bit more expensive than some of
  the other XDR solutions on the market, but it is worth the investment
  for organizations that need the best possible protection.

When choosing a low-cost XDR solution, it is important to consider the
following factors:

- **Features:** Make sure the XDR solution you choose has the features
  you need, such as threat detection, investigation, and response.

- **Scalability:** Choose an XDR solution that can scale to meet your
  needs as your organization grows.

- **Ease of use:** Choose an XDR solution that is easy to use and
  manage.

- **Price:** Compare the prices of different XDR solutions to find the
  best fit for your budget.

It is also important to read reviews of different XDR solutions before
making a decision. This will help you learn more about the pros and cons
of each solution and make an informed decision.

**How do you manage XDR costs?**

To manage XDR costs, you can follow these steps:

1.  Understand your XDR costs. What are the different components of your
    XDR costs? This may include the cost of the XDR solution itself, the
    cost of deployment and maintenance, and the cost of training and
    upskilling your security team.

2.  Identify areas to reduce costs. Once you understand your XDR
    costs, you can identify areas where you can reduce costs. For
    example, you may be able to reduce costs by negotiating better
    pricing with your XDR vendor, by using open-source XDR solutions, or
    by consolidating your XDR tools.

3.  Monitor your XDR usage. Monitor your XDR usage to identify areas
    where you can optimize your usage and reduce costs. For example, you
    may be able to reduce costs by turning off features that you are not
    using or by reducing the amount of data that you are storing.

4.  Invest in security automation and orchestration (SOAR). SOAR can
    help you to automate security tasks, such as incident response and
    threat hunting. This can free up your security team to focus on more
    strategic tasks and can help you to reduce costs.

5.  Use a cloud-based XDR solution. Cloud-based XDR solutions can be
    more cost-effective than on-premises XDR solutions, as you do not
    have to invest in and maintain your own hardware and software.

Here are some additional tips for managing XDR costs:

- Negotiate with your XDR vendor. Don't be afraid to negotiate with your
  XDR vendor to get a better price. You may be able to negotiate a lower
  price by committing to a longer contract or by bundling your XDR
  subscription with other security solutions.

- Use open-source XDR solutions. There are a number of open-source XDR
  solutions available, such as Splunk XDR and Apache NiFi. Open-source
  XDR solutions can be a good way to reduce the cost of XDR, but they
  require more expertise to deploy and maintain.

- Consolidate your XDR tools. If you are using multiple XDR
  tools, consider consolidating your tools onto a single platform. This
  can help you to reduce costs and to improve the efficiency of your
  security operations.

- Turn off features that you are not using. Many XDR solutions offer a
  wide range of features. Make sure that you are only using the features
  that you need. This can help you to reduce costs and to improve the
  performance of your XDR solution.

- Reduce the amount of data that you are storing. XDR solutions can
  generate a lot of data. Make sure that you are only storing the data
  that you need. This can help you to reduce storage costs.

- Invest in security automation and orchestration (SOAR). SOAR can help
  you to automate security tasks, such as incident response and threat
  hunting. This can free up your security team to focus on more
  strategic tasks and can help you to reduce costs.

By following these tips, you can manage your XDR costs and ensure that
you are getting the most value from your XDR investment.

# XDR Concepts

**Extended Detection and Response (XDR):** An XDR system is designed to
deliver intelligent, automated, and integrated security across an
organization’s domain. It helps prevent, detect, and respond to threats
across identities, endpoints, applications, email, IoT, infrastructure,
and cloud platforms.

**Extended detection and response (XDR)** collect threat data from
previously siloed security tools across an organization’s technology
stack for easier and faster investigation, threat hunting, and response.
An XDR platform can collect security telemetry
from [endpoints](https://www.crowdstrike.com/cybersecurity-101/endpoint-security/what-is-an-endpoint/),
cloud workloads, network email, and more.

[Gartner defines XDR](https://www.gartner.com/en/documents/3982247) as a
“unified security incident detection and response platform that
automatically collects and correlates data from multiple proprietary
security components.”

With all this enriched threat data filtered and condensed into a single
console, XDR enables security teams to rapidly and efficiently hunt and
eliminate security threats across multiple domains from one unified
solution.

**How XDR Works?**

XDR connects data from siloed security solutions so they can work
together to improve threat visibility and reduce the length of time
required to identify and respond to an attack. XDR enables advanced
forensic investigation and threat hunting capabilities across multiple
domains from a single console.

Here’s a simple step-by-step of how XDR works:

- **Step 1. Ingest:** Ingest and normalize volumes of data from
  endpoints, cloud workloads, identity, email, network traffic, virtual
  containers and more.

- **Step 2. Detect:** Parse and correlate data to automatically detect
  stealthy threats with advanced artificial intelligence (AI) and
  machine learning (ML).

- **Step 3 Respond:** Prioritize threat data by severity so that threat
  hunters can quickly analyze and triage new events, and automate
  investigation and response activities.

**3 Benefits of XDR Security**

XDR coordinates and extends the value of siloed security tools, unifying
and streamlining security analysis, investigation and remediation. As a
result, XDR provides the following benefits:

1.  **Consolidated threat visibility:** XDR delivers granular visibility
    by working across multiple layers, collecting and correlating data
    from email, endpoints, servers, cloud workloads and networks.

2.  **Hassle-free detections and investigation:** Analysts and threat
    hunters can focus on high-priority threats because XDR weeds out
    anomalies determined to be insignificant from the alert stream. And
    with advanced analytics and correlation content prebuilt in the
    tool, XDR automatically detects stealthy threats — all but
    eliminating the need for security teams to spend time constantly
    writing, tuning, and managing detection rules.

3.  **End-to-end orchestration and response:** Detailed, cross-domain
    threat context and telemetry — from impacted hosts and root cause to
    indicators and timelines — guides the entire investigation and
    remediation process. Automated alerts and powerful response actions
    can trigger complex, multi-tool workflows for dramatic SOC
    efficiency gains and surgical threat neutralization.

[**https://www.crowdstrike.com/cybersecurity-101/what-is-xdr/**](https://www.crowdstrike.com/cybersecurity-101/what-is-xdr/)

## XDR core components

- **Federation of security signals:** XDR systems collect and integrate
  security data from a wide range of sources, including
  endpoints, networks, cloud applications, and email systems. This data
  is then normalized and correlated to provide a unified view of
  security across the entire organization.

- **Higher-level behavioural and cross-correlated analytics:** XDR
  systems use advanced analytics to detect suspicious activity and
  potential threats. These analytics go beyond the traditional
  rule-based approach to detection by looking for anomalies and patterns
  in security data across multiple sources.

- **Closed-loop and highly automated responses**: XDR systems can
  automate many of the tasks involved in threat detection and
  response. This includes tasks such as investigating alerts, triaging
  incidents, and executing remediation actions.

<!-- -->

- **Threat intelligence integration:** XDR systems can integrate with
  threat intelligence feeds to keep track of the latest threats and
  vulnerabilities. This information can be used to improve the accuracy
  of detection and response.

- **Security orchestration, automation, and response (SOAR):** XDR
  systems can be integrated with SOAR solutions to automate even more of
  the security workflow. This can help organizations to respond to
  threats more quickly and effectively.

- **User experience**: XDR systems typically provide a single console
  where security teams can view all of their security data, alerts, and
  incidents. This makes it easier for security teams to investigate and
  respond to threats.

Overall, XDR systems provide a comprehensive approach to security
detection and response. By integrating data from a wide range of sources
and using advanced analytics, XDR systems can help organizations to
identify and respond to threats more quickly and effectively.

<span class="mark">Here are some examples of how XDR components can be
used to detect and respond to security threats:</span>

- An XDR system can use endpoint telemetry to detect a malware infection
  on a single endpoint. The system can then correlate this data with
  network telemetry to identify other devices on the network that may be
  infected. The system can then automatically isolate the infected
  devices and deploy a patch to the malware.

- An XDR system can use email telemetry to detect a phishing attack. The
  system can then correlate this data with user identity data to
  identify the users who may have fallen victim to the attack. The
  system can then automatically reset the passwords of these users and
  send them awareness training materials.

- An XDR system can use cloud telemetry to detect an unauthorized access
  to a cloud storage bucket. The system can then correlate this data
  with user identity data to identify the user who may have been
  responsible for the unauthorized access. The system can then
  automatically lock the user's account and investigate the incident
  further.

XDR systems are a powerful tool that can help organizations of all sizes
to improve their security posture and reduce the risk of cyberattacks.

## XDR architecture

The typical XDR architecture consists of the following components:

- Data collection and storage: XDR collects data from a variety of
  security sources, including endpoints, networks, clouds, and
  applications. This data is then stored in a central data lake or
  repository.

- Data normalization and enrichment: XDR normalizes and enriches the
  collected data to make it easier to analyze and correlate. This may
  involve converting data to a common format, adding context from
  external sources, and removing noise.

- Analytics and detection: XDR uses advanced analytics and machine
  learning to detect threats and anomalies in the data. This may involve
  looking for patterns of malicious activity, identifying suspicious
  files or processes, and correlating events from different sources.

- Investigation and response: XDR provides security teams with the tools
  they need to investigate and respond to detected threats. This may
  include providing visibility into the attack path, recommending
  remediation actions, and automating response tasks.

XDR platforms can be deployed on-premises, in the cloud, or as a hybrid
solution. Cloud-based XDR platforms are becoming increasingly popular,
as they offer scalability, flexibility, and ease of deployment.

Here is a diagram of a typical XDR architecture:

[<u>\
</u>](https://learn.microsoft.com/en-us/security/operations/siem-xdr-overview)As
you can see, XDR sits at the center of the security stack, collecting
and analyzing data from all other security solutions. This allows XDR to
provide a unified view of security across the entire organization,
making it easier to detect and respond to threats.

Here are some of the benefits of using XDR:

- **Improved threat visibility:** XDR provides a single pane of glass
  for viewing security data from all sources. This gives security teams
  a complete view of their security posture and helps them to identify
  threats that might otherwise be missed.

- **Faster threat detection and response:** XDR's advanced analytics and
  machine learning capabilities help security teams to detect threats
  more quickly and accurately. XDR can also automate response
  tasks, helping security teams to remediate threats faster.

- **Reduced security complexity:** XDR simplifies security operations by
  consolidating multiple security tools into a single platform. This can
  help security teams to save time and resources.

Overall, XDR is a powerful security solution that can help organizations
to improve their security posture and reduce their risk of cyberattacks.

**What is XDR?**

Interviewee: XDR, or Extended Detection and Response, is a security
solution that integrates data from multiple sources across an
organization's IT environment to improve threat detection and response.
XDR solutions typically collect data from endpoints, networks, security
information and event management (SIEM) systems, and cloud applications.

**What are the benefits of using XDR?**

Interviewee: XDR offers a number of benefits, including:

- Improved threat visibility: XDR solutions provide a unified view of
  all security data, making it easier to identify and track threats
  across the entire IT environment.

- More effective threat detection: XDR solutions use advanced analytics
  to correlate data from multiple sources to detect threats that would
  be difficult or impossible to detect using traditional security
  solutions.

- Faster threat response: XDR solutions can automate many of the tasks
  involved in incident response, such as identifying the affected
  systems, containing the threat, and remediating the damage.

**What are some of the challenges of implementing an XDR solution?**

Interviewee: Some of the challenges of implementing an XDR solution
include:

- Data integration: XDR solutions need to be able to integrate data from
  a variety of different sources, which can be complex and challenging.

- Security skills: XDR solutions require skilled security personnel to
  manage and operate them effectively.

- Cost: XDR solutions can be expensive to implement and maintain.

**What are some of the best practices for implementing an XDR
solution?**

Some of the best practices for implementing an XDR solution include:

- Start with a clear plan: Define your goals for implementing XDR and
  identify the key requirements for your solution.

- Choose the right solution: Select an XDR solution that meets your
  specific needs and budget.

- Integrate your data: Carefully plan and execute the integration of
  data from your various security sources.

- Train your staff: Make sure your security team is properly trained on
  how to use and manage your XDR solution.

- Monitor your environment: Continuously monitor your XDR solution to
  ensure that it is working properly and that it is meeting your needs.

**What are the future trends for XDR?**

Interviewee: XDR is a rapidly evolving technology, and there are a
number of trends that are shaping the future of this market. One trend
is the convergence of XDR with other security solutions, such as
security orchestration, automation, and response (SOAR) and security
analytics. Another trend is the adoption of XDR in the cloud. As more
organizations move their IT workloads to the cloud, they are looking for
XDR solutions that can protect their cloud-based assets.

## How to design XDR solutions?

To design an XDR implementation, you should follow these steps:

7.  Assess your current security posture. This will help you identify
    your security gaps and needs. Consider the following questions:

    - What security tools and solutions are you currently using?

    - What types of data are you collecting and analyzing?

    - How are you currently detecting and responding to threats?

    - What are your security goals?

8.  Define your XDR requirements. Based on your assessment, define your
    requirements for an XDR solution. Consider the following factors:

    - What types of data do you need to collect and analyze?

    - What types of threats do you need to detect and respond to?

    - What level of integration do you need with your existing security
      tools and solutions?

    - What is your budget?

9.  Choose an XDR solution. There are a number of different XDR
    solutions available on the market. Evaluate each solution carefully
    to ensure that it meets your requirements. Consider the following
    factors:

    - The types of data the solution can collect and analyze

    - The types of threats the solution can detect and respond to

    - The level of integration the solution offers with your existing
      security tools and solutions

    - The cost of the solution

10. Plan your implementation. Once you have chosen an XDR solution, you
    need to develop a plan for its implementation. This plan should
    include the following steps:

    - Data integration: How will you integrate data from your various
      security sources into the XDR solution?

    - Deployment: How will you deploy the XDR solution in your
      environment?

    - Training: How will you train your security team on how to use and
      manage the XDR solution?

11. Implement your solution. Once you have developed your implementation
    plan, you can begin implementing the XDR solution.

12. Monitor and optimize your solution. Once the XDR solution is
    implemented, you need to monitor its performance and make
    adjustments as needed. This will help you ensure that the solution
    is meeting your needs and that it is protecting your organization
    effectively.

Here are some additional tips for designing an XDR implementation:

- Start with a pilot project. This will help you test the XDR solution
  and identify any potential issues before deploying it to your entire
  environment.

- Use a phased approach. Implement the XDR solution in phases to
  minimize disruption to your operations.

- Get buy-in from all stakeholders. It is important to get buy-in from
  all stakeholders, including security, IT, and business leaders, before
  implementing an XDR solution.

- Train your staff. Make sure your security team is properly trained on
  how to use and manage the XDR solution.

- Monitor your XDR solution continuously. Monitor the performance of
  your XDR solution and make adjustments as needed.

By following these steps, you can design an XDR implementation that will
help you improve your security posture and protect your organization
from threats.

## What is the difference between XDR and SIEM?

XDR (Extended Detection and Response) and SIEM (Security Information and
Event Management) are both security solutions that collect and analyze
data from multiple sources to detect and respond to threats. However,
there are some key differences between the two technologies.

**SIEM** solutions focus on log data collection and analysis. They
collect logs from a variety of sources, such as firewalls, servers, and
applications, and analyze them to identify potential threats. SIEM
solutions can also generate alerts to notify security analysts of
potential incidents.

**XDR** solutions go beyond log data and collect a broader range of
security telemetry data, including endpoint data, network traffic, and
cloud-based data. XDR solutions use advanced analytics and machine
learning to correlate data from multiple sources and detect threats that
would be difficult or impossible to detect using traditional SIEM
solutions.

Another key difference between XDR and SIEM is their approach to threat
response. SIEM solutions typically provide alerts to security analysts,
who are then responsible for investigating and responding to incidents.
XDR solutions, on the other hand, can automate many of the tasks
involved in incident response, such as identifying the affected systems,
containing the threat, and remediating the damage.

**Here is a table that summarizes the key differences between XDR and
SIEM:**

| **Feature** | **XDR** | **SIEM** |
|----|----|----|
| Data sources | Log data, endpoint data, network traffic, cloud-based data | Log data |
| Detection | Advanced analytics and machine learning to correlate data from multiple sources | Rule-based detection |
| Response | Can automate many of the tasks involved in incident response | Provides alerts to security analysts |
| Use cases | Threat detection and response, security analytics, incident response | Log management, compliance, security analytics |

**Which technology is right for you depends on your specific needs and
requirements.** If you are looking for a solution that can provide
comprehensive threat visibility and detection, and automate many of the
tasks involved in incident response, then XDR is a good choice. If you
are looking for a solution that can help you manage your logs and comply
with regulations, then SIEM is a good choice.

In many cases, organizations may choose to use both XDR and SIEM
solutions together. XDR can be used for threat detection and response,
while SIEM can be used for log management and compliance.

## Comparison between CSPM, SIEM, SOAR, EDR and XDR

**EDR (Endpoint Detection and Response)** and XDR (Extended Detection
and Response) are both security solutions that help organizations detect
and respond to threats. However, there are some key differences between
the two.

**EDR** is focused on protecting endpoints, such as laptops, desktops,
and mobile devices. It collects data from endpoints, such as logs and
events, and uses this data to identify and respond to threats. EDR
solutions typically include features such as anomaly detection, threat
hunting, and incident response.

**XDR** is a more comprehensive security solution that extends beyond
endpoints to include other data sources, such as networks, cloud
environments, and security tools. XDR solutions collect data from all of
these sources and correlate it to identify and respond to threats. XDR
solutions typically include features such as unified visibility, threat
hunting, and automated response.

SIEM (Security Information and Event Management), SOAR (Security
Orchestration, Automation, and Response), EDR (Endpoint Detection and
Response), and XDR (Extended Detection and Response) are all security
solutions that can help organizations detect and respond to threats.
However, each solution has its own unique focus and capabilities.

**SIEM** collects and analyses logs and events from a variety of
sources, such as networks, servers, and applications. This data can be
used to identify suspicious activity and potential threats. SIEM
solutions typically include features such as log aggregation, event
correlation, and anomaly detection.

**SOAR** automates security workflows, such as incident response, threat
hunting, and remediation. This can help security teams to improve their
efficiency and effectiveness. SOAR solutions typically include features
such as playbooks, case management, and integrations with other security
tools.

**EDR** collects and analyses data from endpoints, such as laptops,
desktops, and mobile devices. This data can be used to identify
suspicious activity and potential threats. EDR solutions typically
include features such as behavioral analysis, threat hunting, and
incident response.

**XDR** extends EDR to include other data sources, such as networks,
cloud environments, and security tools. This allows XDR solutions to
provide a more complete view of the threat landscape and to identify
threats that may not be visible to EDR solutions alone. XDR solutions
typically include features such as unified visibility, threat hunting,
and automated response.

Here is a table summarizing the key differences between SIEM, SOAR, EDR,
and XDR:

Here is a table summarizing the key differences between EDR and XDR:

| **Feature** | **EDR** | **XDR** |
|----|----|----|
| Scope | Endpoints | Endpoints, networks, cloud environments, and security tools |
| Data sources | Endpoint logs and events | Endpoint logs and events, network traffic, cloud logs, and security tool alerts |
| Capabilities | Anomaly detection, threat hunting, incident response | Unified visibility, threat hunting, automated response |

| **Feature** | **SIEM** | **SOAR** | **EDR** | **XDR** |
|----|----|----|----|----|
| Focus | Log and event analysis | Security orchestration and automation | Endpoint detection and response | Extended detection and response |
| Data sources | Various sources, such as networks, servers, applications, and endpoints | Various sources, such as security tools, ticketing systems, and CRM systems | Endpoints | Various sources, such as endpoints, networks, cloud environments, and security tools |
| Capabilities | Log aggregation, event correlation, anomaly detection | Playbooks, case management, integrations with other security tools | Behavioral analysis, threat hunting, incident response | Unified visibility, threat hunting, automated response |

<img src="media/image2.png" style="width:9.69306in;height:2.34097in" />

**Which solution is right for you?**

The best solution for your organization will depend on your specific
needs and requirements. If you are primarily concerned with protecting
your endpoints, then an EDR solution may be sufficient. However, if you
want a more comprehensive security solution that can protect all of your
assets, then an XDR solution may be a better option.

Here are some factors to consider when choosing between EDR and XDR:

- **Your budget**: XDR solutions are typically more expensive than EDR
  solutions. However, they offer more features and capabilities.

- **Your IT environment:** If you have a complex IT environment with a
  variety of data sources, then an XDR solution may be a better option.

- **Your security maturity:** If you have a mature security team and
  processes in place, then you may be able to get more value out of an
  XDR solution.

If you are not sure which solution is right for you, you should consult
with a security expert.

# XDR Costing

## Low-cost XDR solutions in market

There are a few low-cost XDR solutions available in the market. Some of
the most popular options include:

- **Cynet 360:** Cynet 360 is a cloud-based XDR solution that offers a
  wide range of features, including threat detection, investigation, and
  response. Cynet 360 is also one of the most affordable XDR solutions
  on the market.

- **Trend Micro Vision One:** Trend Micro Vision One is another
  cloud-based XDR solution that offers a wide range of features. Vision
  One is also very affordable, especially for smaller organizations.

- **SentinelOne Singularity XDR:** SentinelOne Singularity XDR is a
  powerful XDR solution that is known for its ease of use and
  scalability. Singularity XDR is also very affordable, especially for
  organizations with many endpoints.

- **Sophos Intercept X XDR:** Sophos Intercept X XDR is a comprehensive
  XDR solution that offers a wide range of features at a competitive
  price. Intercept X XDR is a good choice for organizations of all
  sizes.

- **CrowdStrike Falcon XDR:** CrowdStrike Falcon XDR is a powerful XDR
  solution that is known for its industry-leading threat detection and
  response capabilities. Falcon XDR is a bit more expensive than some of
  the other XDR solutions on the market, but it is worth the investment
  for organizations that need the best possible protection.

When choosing a low-cost XDR solution, it is important to consider the
following factors:

- **Features:** Make sure the XDR solution you choose has the features
  you need, such as threat detection, investigation, and response.

- **Scalability:** Choose an XDR solution that can scale to meet your
  needs as your organization grows.

- **Ease of use:** Choose an XDR solution that is easy to use and
  manage.

- **Price:** Compare the prices of different XDR solutions to find the
  best fit for your budget.

It is also important to read reviews of different XDR solutions before
deciding. This will help you learn more about the pros and cons of each
solution and make an informed decision.

## Manage XDR costs

To manage XDR costs, you can follow these steps:

6.  Understand your XDR costs. What are the different components of your
    XDR costs? This may include the cost of the XDR solution itself, the
    cost of deployment and maintenance, and the cost of training and
    upskilling your security team.

7.  Identify areas to reduce costs. Once you understand your XDR
    costs, you can identify areas where you can reduce costs. For
    example, you may be able to reduce costs by negotiating better
    pricing with your XDR vendor, by using open-source XDR solutions, or
    by consolidating your XDR tools.

8.  Monitor your XDR usage. Monitor your XDR usage to identify areas
    where you can optimize your usage and reduce costs. For example, you
    may be able to reduce costs by turning off features that you are not
    using or by reducing the amount of data that you are storing.

9.  Invest in security automation and orchestration (SOAR). SOAR can
    help you to automate security tasks, such as incident response and
    threat hunting. This can free up your security team to focus on more
    strategic tasks and can help you to reduce costs.

10. Use a cloud-based XDR solution. Cloud-based XDR solutions can be
    more cost-effective than on-premises XDR solutions, as you do not
    have to invest in and maintain your own hardware and software.

Here are some additional tips for managing XDR costs:

- Negotiate with your XDR vendor. Don't be afraid to negotiate with your
  XDR vendor to get a better price. You may be able to negotiate a lower
  price by committing to a longer contract or by bundling your XDR
  subscription with other security solutions.

- Use open-source XDR solutions. There are a number of open-source XDR
  solutions available, such as Splunk XDR and Apache NiFi. Open-source
  XDR solutions can be a good way to reduce the cost of XDR, but they
  require more expertise to deploy and maintain.

- Consolidate your XDR tools. If you are using multiple XDR
  tools, consider consolidating your tools onto a single platform. This
  can help you to reduce costs and to improve the efficiency of your
  security operations.

- Turn off features that you are not using. Many XDR solutions offer a
  wide range of features. Make sure that you are only using the features
  that you need. This can help you to reduce costs and to improve the
  performance of your XDR solution.

- Reduce the amount of data that you are storing. XDR solutions can
  generate a lot of data. Make sure that you are only storing the data
  that you need. This can help you to reduce storage costs.

- Invest in security automation and orchestration (SOAR). SOAR can help
  you to automate security tasks, such as incident response and threat
  hunting. This can free up your security team to focus on more
  strategic tasks and can help you to reduce costs.

By following these tips, you can manage your XDR costs and ensure that
you are getting the most value from your XDR investment.

How would you use XDR to detect and respond to following attacks?

- Supply chain partner attack

- Social engineering attack

- Endpoint compromise attacks

- Network compromise attack

- IAM attacks

- Malware attacks

- Ransomware attacks

- Data breach

 

 

 

 

 

----------------------------------------------------------------------------------------------------

Microsoft Defender XDR <span class="mark">Easy to access learning, less
cost</span>

 

Trellix EDR - Mcafee and FireEye - <span class="mark">Easy to access
learning, less cost</span>

 

Cortex XDR - Palo Alto <span class="mark">Easy to access learning, less
cost</span>

 

Qualys EDR - <span class="mark">Easy to access learning, less
cost</span>

 

 

**Not interested**

- Cisco Secure Endpoint

- Darktrace

- VMware Carbon Black EDR

- Symantec ATP - Broadcom

- Harmony Endpoint - Checkpoint

- <span class="mark">Singularity XDR SentinelOne - NO access for
  learning too costly</span>

- CrowdStrike Falcon / Trend Micro XDR <span class="mark">NO access for
  learning too costly</span>

- Cybereason Defense Platform - <span class="mark">No specific learning
  path</span>

 

 

| **Feature** | **XDR** | **SIEM** |
|:--:|:--:|:--:|
| Data sources | Log data, endpoint data, network traffic, cloud-based data | Log data |
| Detection | Advanced analytics and machine learning to correlate data from multiple sources | Rule-based detection |
| Response | Can automate many of the tasks involved in incident response | Provides alerts to security analysts |
| Use cases | Threat detection and response, security analytics, incident response | Log management, compliance, security analytics |

 

 

**XDR Future** (What is the future of XDR technology?)

 

XDR is a security approach that offers a unified view of threats across
your entire IT infrastructure.

XDR has the potential to revolutionize the way organizations detect and
respond to threats.

XDR solutions collect and correlate data from a variety of sources such
as endpoints, cloud, IAM, cloud apps, emails, collaboration tools, etc.

 

Wider Adoption and Benefits:

- Going beyond large enterprises: XDR was initially aimed at big
  companies, but it's becoming affordable and easier to use for smaller
  businesses too. This will likely lead to significant growth in the XDR
  market.

- Simplifying Security Management: XDR can combine multiple security
  tools into one platform. This simplifies managing security and reduces
  costs.

 

Enhanced Threat Response:

- Smarter Automation: Manual security processes are becoming
  insufficient. XDR is expected to leverage more intelligent automation
  to help organizations respond to threats faster and more effectively.

- Advanced Threat Detection: XDR will utilize advanced analytics to
  identify hidden threats in security data that might be missed by
  traditional methods. This allows for quicker and more effective
  response.

 

Increased Usability:

- Easier to Use and Implement: XDR solutions are becoming more
  user-friendly, making them accessible to a wider range of
  organizations, even those with limited security staff.

 

 

How can XDR be used to improve threat intelligence sharing?

 

**How do you measure the success of an XDR implementation?**

> To measure the success of an XDR implementation, you should track the
> following metrics:

- Mean time to detect (MTTD) is the average time XDR takes to detect a
  threat. MTTD should be Lower.

- Mean time to respond (MTTR) is the average time XDR takes to respond
  to a threat. MTTR should be Lower.

- Number of threats detected and blocked is a measure of the
  effectiveness of XDR solution at preventing threats.

- Number of incidents investigated and resolved is a measure of the
  effectiveness of XDR solution at helping to investigate and respond to
  threats.

- Security posture is an overall measure of organization's security. Use
  metrics such as number of vulnerabilities and number of security
  incidents to track your security posture over time.

>  
>
> XDR Qualitative metrics about performance:

- User satisfaction: Survey users to get their feedback of XDR
  solution. This feedback can help to identify areas where the solution
  can be improved.

- Security team satisfaction: Survey security team to get their feedback
  on the XDR solution. This feedback can help to identify areas where
  the solution can be improved to make it more effective for your
  security team.

>  
>
> Tips to measure XDR performance:

- Set benchmarks: Before implementing XDR set benchmarks, track our
  progress over time and areas of improvement.

- Use a variety of metrics to get a more complete picture. Don't rely on
  a single metric to measure the success XDR.

- Track your progress over time: Track your progress over time to
  identify trends and areas where you need to improve.

- Share your results with your team: Share your results with your team
  to get their feedback and to help them to understand the value of XDR.

 

**How do you report on XDR data?**

> To report on XDR data, you can follow these steps:

1.  Identify the audience and purpose of report. Who will be reading
    your report? What do you want them to learn from the report?

2.  Choose the right data. What XDR data is relevant to your audience
    and purpose?

3.  Clean and prepare the data. Make sure that the data is
    accurate, complete, and consistent.

4.  Visualize the data. Use charts and graphs to make the data easier to
    understand.

5.  Write a clear and concise report. The report should be easy to read
    and understand. It should also be actionable, meaning that it should
    provide recommendations for how to improve security.

>  
>
> Here are some specific tips for reporting on XDR data:

- Use a variety of visualizations. Different types of visualizations are
  effective for different types of data. For example, bar charts are
  good for comparing different categories, while line charts are good
  for showing trends over time.

- Use meaningful labels and titles. Make sure that your labels and
  titles are clear and concise. They should accurately describe the data
  that is being visualized.

- Highlight important findings. Use colors, arrows, and other visual
  cues to highlight important findings in your report.

- Write a clear and concise narrative. The narrative should explain the
  data and provide recommendations for how to improve security.

>  
>
> Here are some examples of XDR data that you can report on:

- Number of threats detected and blocked

- Mean time to detect (MTTD)

- Mean time to respond (MTTR)

- Top threats detected

- Most vulnerable systems

- Security posture

> You can also report on XDR data by specific incident, such as a
> ransomware attack or a phishing campaign. This type of report can
> provide more detailed information about the incident, such as the root
> cause, the impact of the incident, and the steps that were taken to
> respond to the incident.

 

**How would you use XDR to detect and respond to an insider threat?**

 

**How do you ensure compliance with regulatory requirements when using
XDR?**

To ensure compliance with regulatory requirements when using XDR, you
should follow these steps:

1.  Identify the regulatory requirements that apply to your
    organization. This may include industry-specific regulations, such
    as the General Data Protection Regulation (GDPR) or the Payment Card
    Industry Data Security Standard (PCI DSS), as well as general
    security regulations, such as the Health Insurance Portability and
    Accountability Act (HIPAA).

2.  Assess your XDR solution to determine whether it meets the
    regulatory requirements. This may involve reviewing the XDR
    solution's documentation, speaking with the XDR vendor, or
    conducting a third-party assessment.

3.  Implement any necessary changes to your XDR solution or environment
    to ensure compliance. For example, you may need to configure the XDR
    solution to retain data for a certain period of time or to encrypt
    sensitive data.

4.  Monitor your XDR solution and environment on an ongoing basis to
    ensure that you remain in compliance. This may involve reviewing
    audit logs, conducting regular security assessments, and
    implementing security updates.

Here are some specific examples of how you can use XDR to comply with
regulatory requirements:

- GDPR: You can use XDR to collect and analyze data from a variety of
  sources to identify and remediate data breaches. You can also use XDR
  to monitor data access and to ensure that data is processed in
  accordance with GDPR requirements.

- PCI DSS: You can use XDR to detect and respond to security incidents
  that could impact the security of cardholder data. You can also use
  XDR to monitor network traffic and to identify and block malicious
  activity.

- HIPAA: You can use XDR to protect the privacy and security of
  protected health information (PHI). For example, you can use XDR to
  monitor data access and to encrypt PHI.

In addition to the above, here are some additional tips for ensuring
compliance with regulatory requirements when using XDR:

- Develop a compliance plan. Your compliance plan should outline the
  steps that you will take to comply with the relevant regulatory
  requirements. The plan should also include procedures for monitoring
  your compliance and for responding to any compliance issues.

- Involve your security team. Your security team should be involved in
  all aspects of your compliance efforts. They can help you to identify
  the relevant regulatory requirements, to assess your XDR solution, and
  to implement the necessary changes.

- Train your employees. Your employees should be trained on the
  regulatory requirements that apply to your organization and on their
  role in ensuring compliance.

- Use a compliance management tool. A compliance management tool can
  help you to automate many of the tasks involved in compliance. This
  can save you time and help you to ensure that you are meeting your
  compliance obligations.

By following these tips, you can ensure that you are using XDR in a
compliant manner and that you are meeting your regulatory requirements.

 

 

How can XDR be used to support zero trust security?

What are the ethical considerations of using XDR?

What is your favourite XDR feature?

What is the most challenging XDR implementation you have worked on?

What advice would you give to someone who is new to XDR?

What XDR resources would you recommend to someone who wants to learn
more about the technology?

 

 

How can XDR be used to improve threat intelligence sharing?

 

**How does XDR use analytics and machine learning to detect threats?**

XDR solutions use analytics and machine learning to detect threats in a
number of ways.

 

**Analytics**

XDR solutions collect data from a variety of sources, including
endpoints, networks, and cloud environments.

This data is then analysed using a variety of techniques, such as:

- **Correlation:** XDR correlate data from different sources to identify
  patterns and relationships that may indicate a threat. 

  - Ex. XDR might correlate data from endpoints and network to identify
    a device that is communicating with a known malicious IP address.

- **Statistical analysis** used to identify anomalies in data that may
  indicate a threat. 

  - Ex. XDR uses statistical analysis to identify a sudden increase in
    network traffic or a change in the behaviour of a user account.

- **Threat intelligence** used to identify known threats and their
  indicators of compromise (IOCs). 

  - Ex. XDR use threat intelligence to identify a new malware variant or
    a new phishing campaign.

 

**Machine learning**

- XDR solutions use machine learning to train models that can identify
  threats with a high degree of accuracy.

- These models are trained on large datasets of historical security
  data, which includes both known threats and benign activity.

- Once trained, these models can be used to identify new threats that
  have not been seen before.

- For example, an XDR solution might use machine learning to train a
  model that can identify malware samples. This model could then be used
  to scan new files for malware, even if the files are not known to be
  malicious.

- XDR solutions can also use machine learning to automate the
  investigation and response to threats. For example, an XDR solution
  might use machine learning to identify the root cause of a threat or
  to recommend remediation actions.

 

**Benefits of using XDR analytics and machine learning to detect
threats**

- **Improved visibility:** XDR solutions collect data from a variety of
  sources, which gives them a more complete view of the security
  landscape. This improved visibility can help to identify threats that
  might not be visible to traditional security solutions.

- **Reduced false positives:** XDR solutions use analytics and machine
  learning to reduce the number of false positives. This can help
  security teams to focus on the most important threats and to reduce
  the time they spend investigating false positives.

- **Faster detection and response:** XDR solutions can automate the
  detection and response to threats. This can help security teams to
  respond to threats more quickly and effectively.

> Overall, XDR analytics and machine learning can help organizations to
> detect and respond to threats more effectively.

 

# Ingest Data in XDR

<span class="mark">What is most important SIEM or XDR for
organizations?</span>

Both SIEM and XDR are important security solutions for organizations,
but they have different strengths and weaknesses.

SIEM solutions are better at collecting and analysing large volumes of
data, while XDR solutions are better at detecting and responding to
threats across multiple security silos.

SIEM

- Strengths:

  - Collects and analyzes large volumes of data from a variety of
    sources

  - Provides a central view of security posture

  - Can be used to generate reports for compliance purposes

- Weaknesses:

  - Can be complex and expensive to implement and maintain

  - Can generate a large number of false positives

  - May not be able to detect and respond to threats that span multiple
    security silos

XDR

- Strengths:

  - Detects and responds to threats across multiple security silos

  - Uses advanced analytics to detect threats that may not be visible to
    traditional SIEM systems

  - Can automate many of the tasks involved in threat detection and
    response

- Weaknesses:

  - May not be as good at collecting and analyzing large volumes of data
    as SIEM systems

  - Can be expensive to implement and maintain

  - May not be as mature as SIEM systems

Which one is more important depends on the specific needs of the
organization.

Organizations that need to collect and analyse large volumes of data for
compliance purposes may benefit more from a SIEM solution. Organizations
that are looking for a solution to detect and respond to threats across
multiple security silos may benefit more from an XDR solution.

Many organizations are now choosing to implement both SIEM and XDR
solutions together. This allows them to get the best of both worlds: the
ability to collect and analyse large volumes of data for compliance
purposes, as well as the ability to detect and respond to threats across
multiple security silos.

## Integration with other security solutions

#### What are the different ways to integrate XDR with other security tools?

There are two main ways to integrate XDR with other security tools:

1\. Native integration

Native integration is the most seamless and efficient way to integrate
XDR with other security tools. Native integration is when the XDR
solution and the other security tools are developed by the same vendor
and are designed to work together seamlessly. This type of integration
typically involves sharing data and events between the XDR solution and
the other security tools.

2\. Open integration

Open integration is when the XDR solution and the other security tools
are developed by different vendors. Open integration is typically
achieved using standard protocols and APIs. This type of integration is
more complex to implement than native integration, but it allows
organizations to integrate their XDR solution with a wider range of
security tools.

Here are some specific examples of how XDR can be integrated with other
security tools:

- Integration with firewalls: XDR can be integrated with firewalls to
  share data and events. This integration can help to improve the
  detection and response to threats. For example, the XDR solution can
  notify the firewall to block malicious IP addresses or to isolate
  infected devices.

- Integration with intrusion detection systems (IDS): XDR can be
  integrated with IDS to share data and events. This integration can
  help to improve the detection of threats. For example, the XDR
  solution can correlate data from the IDS with data from other sources
  to identify threats that may not be visible to the IDS alone.

- Integration with security information and event management (SIEM)
  systems: XDR can be integrated with SIEM systems to share data and
  events. This integration can help to improve the visibility and
  analysis of security data. For example, the SIEM system can correlate
  data from the XDR solution with data from other sources to generate
  comprehensive security reports.

Here are some tips for integrating XDR with other security tools:

- Identify your integration goals. What do you want to achieve by
  integrating XDR with other security tools? Once you know your
  goals, you can choose the integration approach that is right for you.

- Choose the right integration tools. There are a number of different
  integration tools available. Choose the tools that are best suited for
  your needs and environment.

- Follow vendor documentation. Most vendors provide documentation on how
  to integrate their products with other security tools. Follow the
  vendor documentation to ensure that the integration is successful.

- Test the integration. Once you have integrated XDR with other security
  tools, be sure to test the integration to make sure that it is working
  properly.

By following these tips, you can integrate XDR with other security tools
to improve your security posture and to protect your organization from
threats.

# Troubleshoot Issues with Tools

**How do you troubleshoot XDR issues?**\
To troubleshoot XDR issues, you can follow these steps:

1.  Gather information about the issue. This may include information
    about the symptoms of the issue, the steps that you have taken to
    try to resolve the issue, and the version of the XDR solution that
    you are using.

2.  Check the XDR logs. The XDR logs may contain information about the
    cause of the issue. You can use the XDR logs to identify
    errors, warnings, and other messages that may be related to the
    issue.

3.  Search for known issues. You can search for known issues on the XDR
    vendor's website or support portal. You may also be able to find
    information about known issues on community forums and other online
    resources.

4.  Contact the XDR vendor. If you are unable to resolve the issue on
    your own, you can contact the XDR vendor for assistance. The XDR
    vendor may be able to provide you with a solution to the issue or
    help you to troubleshoot the issue further.

Here are some additional tips for troubleshooting XDR issues:

- Check the XDR configuration. Make sure that the XDR solution is
  configured correctly. You can find information about how to configure
  the XDR solution in the vendor documentation.

- Restart the XDR services. Restarting the XDR services may resolve some
  issues.

- Update the XDR software. Make sure that you are using the latest
  version of the XDR software. The XDR vendor may release updates to fix
  known issues and improve the performance of the XDR solution.

- Collect XDR diagnostic data. The XDR vendor may ask you to collect XDR
  diagnostic data when you contact them for assistance. This data can
  help the vendor to troubleshoot the issue.

By following these steps and tips, you can troubleshoot XDR issues and
improve the performance and reliability of your XDR solution.

Here are some common XDR issues and their troubleshooting steps:

- Issue: XDR agent is not reporting data to the XDR console.

- Troubleshooting steps:

  - Verify that the XDR agent is installed correctly.

  - Verify that the XDR agent is configured correctly.

  - Restart the XDR agent service.

  - Check the XDR agent logs for errors.

- Issue: XDR console is not responding.

- Troubleshooting steps:

  - Restart the XDR console service.

  - Clear the XDR console cache and cookies.

  - Try accessing the XDR console from a different browser.

  - Contact the XDR vendor for assistance.

- Issue: XDR alerts are not being generated.

- Troubleshooting steps:

  - Verify that XDR alerts are configured correctly.

  - Check the XDR logs for errors.

  - Contact the XDR vendor for assistance.

If you are experiencing other XDR issues, you can search for known
issues on the XDR vendor's website or support portal, or you can contact
the XDR vendor for assistance.

**Alert has triggered and automated investigation has initiated, on
analysing the progress its status shows that "Terminated by System" what
2 reasons causes this issue?**

Pending actions timed out after one week (When no action taken)

Actions are too numerous to run all analysers

**How to create Safe attachments policy that is fulfils tracking
requirement and send malicious email to admin for review?**

- **Click enable redirect**

- **Enter admins email address**

- **Select monitor option**

<!-- -->

- Roles required to configure data loss prevention policy (DLP):

  - **Compliance data administrator**: it can manage settings related to
    DLP, device management and report.

  - **Communication compliance analys**t: Investigate when policy is
    matched and take remediation actions when suspicious content is
    detected.

  - **Communication compliance viewe**r:

- Insider Risk management Role Group:

  - **Insider risk management (IRM):** All

  - **IRM Admin:** Policies/Settings, Analytics insights

  - **IRM Analysts**: Analytics insights, Investigate Alerts/Cases,
    Notice Templates,

  - **IRM Investigators**: Investigate Alerts/Cases, Content Explorer,
    Notice Templates

  - **IRM Auditors**: Only able to View & export audit logs

- Alert is triggered on IRM portal, now we need to escalate it to
  Advanced eDiscovery, but before escalating what step we need to do?
  **--\> Create Case in Insider Risk Management portal.**

- One of the employee accidently runs executable from email, which
  steals employee credentials, what solution can be used to respond to
  these type of threats? **-\> Microsoft Secure Score - used to
  configure security features.**

- How to identify un-sanctioned apps being used in company? **-\> Cloud
  discovery in Microsoft Defender for Cloud App - which used to gain
  insights of network and cloud apps used in company.**

- Which policy needs to be defined in Microsoft Defender for Cloud app,
  if credentials of employee are stolen and those are used by attacker
  from difference country? **-\> Impossible travel policy.**

- What steps we need to follow for enforcing information protection,
  with Microsoft Defender for Cloud App?

  - **Make sure applications in company are connected to Microsoft
    Defender for Cloud App**

  - **Classify sensitive information in company through Microsoft
    Defender for Cloud App**

<!-- -->

- User in accounting department violates policy related to risk IP
  address by accessing it, task is assigned to you to resolve issue, you
  access MDCA portal's alert page. What remediation you will perform?

  - **Send notification to user and ask if violation was intentional**

  - **Suspend user until decision is made concerning case.**

- How to detect number of employees using new cloud app. We decided to
  use Cloud discovery in MDCA, what prerequires should be followed to
  use these policy?

  - **Enable integration of MDCA with MDE**

  - **Establish automatic log upload for reports of cloud discovery**

- How to implement Information Protection policy in MDCA to detect
  employee share confidential files with external cloud service?

  - **Select file policy**

  - **Modify access level filter to public (internet) / public /
    external**

  - **Select Data classification service option in inspection method
    field**

  - **Access select type field on policies page**

  - **Create governance action**

**Employee sends email outside organization with sensitive information.
Manager wants incident should be identified as Red Incident by Microsoft
365 Defender. What 2 action you will perform?** Edit name of incident
and Add tag to the incident

**While investigating incident, how to categories and associate alerts
with incidents?** Select link alert to another incident, Set status to
inprogress

- How to write advanced hunting query that counts failed sign-in
  authentications on 2 devices named device1 and device2?

- **DeviceLogonEvents**

- **\| where DeviceName in (device1, device2) and**

- **ActionType == FailureReason**

- **\| summarize LogonFailure = count() by DeviceName, LogonType**

- Incident involved risk user sign-in was blocked because of MFA not
  completed, but credentials was correct. You contacted user and sign-in
  was not user in question. User completed SSPR and updated the
  password. Now what manual risk detection resolution we should select?

- **Select Dismiss users risk - Sign-in risk detection was accurate,
  after doing SSPR both user and sign in risk remediated.**

- In KQL query results, how to include only last 2 weeks and only 50
  results, sorted by TimeRange column?

- **\| where Timestamp \> ago(14d)**

- **\| top 50 by Timestamp**

- In Microsoft 365 Defender, automated investigation has quarantined a
  file believed to be malicious on 12 devices. We completed further
  research and found out that file is not malicious. How to remove this
  file from quarantine?

- **Navigate to Action center**

- **Select History tab and then select file**

- **Select apply to 11 more instances of this file then click Undo**

<!-- -->

- Configure alerts in MDE/MD365 so that members of accounts department
  will receive alerts when vulnerability is detected, one of the
  employee reported that they are not receiving alert, what to do? **Ask
  employee to check Junk email folder, mark security emails as Not
  Junk.**

- While investigating possible attack that uses malware, we intend to
  automate operation of collection of machines having sensitive data and
  you have 4 custom device groups. We need to create temporary group for
  machines in order to perform actions on devices: --\> **Create admin
  role that gives users access to tagged machines.**

- HR department employee uses excel with macros, false-positive alerts
  showing on MDE, because excel with macros are not allowed in company,
  how to hide false-positive alerts? **--\> Suppress alert and make
  suppression rule that is applicable to any device**

- Coordinator of HR department notices that app on their device runs
  suspicious scripts, what solution to use to constrain such a software
  behaviour? --\> **Attack Surface Reduction (ASR)**

- What role is required to create detection rules? **--\> Security
  Administrator**

- How to provide overview of Threat from MDE threat analytics dashboard?

  - **Threats with Active alerts**

  - **Threats with Resolved alerts**

  - **Threats with No alerts**

- In MDE, Old Policy-IoC policy with Block and remediate action and also
  used MD5 hash file indicator, You are tasked to create New Policy-IoC
  policy with Allow action and use MD5 hash file indicator, in this case
  what should you do to allow file to run? **--\> Delete IoC policy that
  is suing Block and remediate action**

- How to use API call to get list of devices connected with particular
  vulnerability ID? GET /api/vulnerabilities/cveid/machineReferences

- After automated investigation device is isolated, after some time we
  found out that device is not threat to company, how to remove device
  from isolation? **-\> Select undo option on History tab on Microsoft
  365 Defender portal**

- What solution is used to check the compliance of apps? **Microsoft
  Defender for Cloud App**

- Which solution is used to notify and monitor the user account risk?
  **Azure AD Identity Protection**

- How to create IP address tag to scope continuous report to specific IP
  range in Microsoft Defender for Cloud App?

- **Click on settings cog and select IP address range**

- **Enter name and category, then click on + button in IP address ranges
  field and add appropriate IP range**

- **Select "Create"**

- Minimum license required to activate Azure AD Identity protection's
  user risk and sign-in risk?

- **Azure AD Premium P2 license**

- We are using MDE and configuring roles for users, you are configuring
  roles for Azure AD groups. What permissions allows to manage email
  notification in Azure AD portal?

- **Manage security settings in Security Center**

**Vulnerability Management**

- Discovers vulnerable and misconfigured devices based on known attack
  vectors and software vulnerabilities.

- Exposure Score: Current exposure associated with machines in
  organization (Less is good)

- Secure Score: Shows collective security configuration posture of
  machines (High is good)

  - OS

  - Application

  - Network

  - Account

  - Security Controls

- Exposure Distribution: Exposed machines are easy targets for attacks,
  High Medium and Low.

- Top Security Recommendations: Based on highest organizational exposure
  impact.

1.  **What is Microsoft 365 Defender?**

- Microsoft 365 Defender is Extended detection and response (XDR)
  solution helps protect your computer and data from threats like
  viruses and hackers. It does this by working with other Microsoft
  security products to detect and respond to threats across your
  endpoint devices, email, identities, and apps.

-  

1.  **What are the components of Microsoft 365 Defender?**

2.  **How to download vulnerability scan report from Microsoft 365
    Defender?**

3.  **How to ingest data in Microsoft 365 Defender?**

4.  **How to perform incident investigation on Microsoft 365 Defender**

5.  **What are the features of Microsoft 365 Defender?**

6.  **What is Attack surface reduction and how to perform it on
    Microsoft 365 Defender?**

- ** **

- <https://www.testpreptraining.com/tutorial/ms-101-microsoft-365-mobility-and-security-interview-questions/>

- ** **

- <https://www.testpreptraining.com/blog/top-60-microsoft-security-engineer-interview-questions/>

**MDE Sensors**

1.  MsSense.exe

**Windows Defender Antivirus exe files**

1.  MsMpEng.exe - Windows Defender Service (WinDefend) is main Microsoft
    Defender AV service that needs to be running always.

**Actions and Submissions**

- **Actions**: It lists pending and completed remediation actions for
  your devices, email & collaboration content, and identities in one
  location. Following actions are tracked:

- Collect investigation package

- Isolate device (this action can be undone)

- Offboard machine

- Release code execution

- Release from quarantine

- Request sample

- Restrict code execution (this action can be undone)

- Run antivirus scan

- Stop and quarantine

- Contain devices from the network

- **Pending:** Displays a list of actions that require attention. You
  can approve or reject actions one at a time, or select multiple
  actions if they have the same type of action (such as Quarantine
  file).

<!-- -->

- **History:**

- Serves as an audit log for actions that were taken and also provides
  way to undo it.

- Remediation actions that were taken as a result of automated
  investigations

- Remediation actions that were taken on suspicious or malicious email
  messages, files, or URLs

- Remediation actions that were approved by your security operations
  team

- Commands that were run and remediation actions that were applied
  during Live Response sessions

- Remediation actions that were taken by your antivirus protection

- Required Roles: Security Administrator, Active remediation actions,
  Search and Purge

<!-- -->

- **Microsoft 365 Defender – Identity threats**

- Detect, investigate, respond, and remediate identity threats

- identify and remediate security risks related to sign-in risk policies

- identify and remediate security risks related to Conditional Access
  events

- identify and remediate security risks related to Azure Active
  Directory

- identify and remediate security risks using Secure Score

- identify, investigate, and remediate security risks related to
  privileged identities

- configure detection alerts in Azure AD Identity Protection

**Microsoft Defender for Endpoint Plans: P1 and P2**

- **MDE Features**

- Attack surface reduction

- Next generation protection

- Endpoint detection and response

- Automated investigation and response

- Vulnerability management

<img src="media/image3.png" style="width:6.26806in;height:1.89236in" />

**Attack Surface Reduction**

- Attack Surface Reduction is hardening the places where a threat is
  likely to attack.

- Components of attack surface reduction:

- **Attack surface reduction rules**: Reduce attack surface in apps with
  intelligent rules (Need Microsoft Defender Antivirus)

- **Hardware-based isolation:**

  - Protects integrity of system during start and running.

  - Validate system integrity with local and remote attestation.

  - Use container isolation for Microsoft Edge to help guard against
    malicious websites.

- **Application control**: Use application control so that your
  applications must earn trust in order to run.

- **Exploit protection:** Help protect operating systems and apps your
  organization uses from being exploited. Exploit protection also works
  with third-party antivirus solutions.

- **Network protection:** Extend protection to your network traffic and
  connectivity on your organization's devices. (Requires Microsoft
  Defender Antivirus)

- **Web protection:** Secure your devices against web threats and help
  you regulate unwanted content.

- **Controlled folder access:** Help prevent malicious or suspicious
  apps (including file-encrypting ransomware malware) from making
  changes to files in your key system folders (Requires Microsoft
  Defender Antivirus)

- **Device control:** Protects against data loss by monitoring and
  controlling media used on devices, such as removable storage and USB
  drives, in your organization.

**MDE Minimum Requirement**

**Licensing requirement:**

- Microsoft Defender for Endpoint Plan 1 (P1) - Commercial and education
  purpose

- Microsoft Defender for Endpoint Plan 2 (P2)

- Microsoft Defender for Endpoint server (With Defender for Cloud)

**Browser requirement**: Access to Defender for endpoint is done through
below browsers: Microsoft Edge, Google Chrome

**OS requirement:** Windows, Linux, Android, iOS, MacOS

**Network requirement:** MDE Sensors requires Microsoft Windows HTTP
(WinHTTP)

**Data storage requirement:**

**Microsoft Defender Antivirus requirement:**

- MDE sensors depends on ability of Microsoft Defender Antivirus to scan
  files and provide information about them.

- If you're running Microsoft Defender Antivirus as the primary
  antimalware product on your devices, the Defender for Endpoint agent
  will successfully onboard.

- If you're running a third-party antimalware client and use Mobile
  Device Management solutions or Microsoft Endpoint Manager (current
  branch), you'll need to ensure the Microsoft Defender Antivirus ELAM
  driver is enabled.

**Deploy MDE**

- Required Permissions: global administrator or security administrator

- Navigate to MDE portal:
  [https://security.microsoft.com](https://security.microsoft.com/)

- Settings - Endpoints - General - Data Retention - Data Storage -
  US/UK/EU

- We cannot change data location and can’t move data.

- Data Retention: 6 Months Default

- MDE data can be stored at US, UK EU.

- We cannot change your data storage location after the first-time
  setup.

- **Network Configuration:**

- If organization doesn't require endpoints to use Proxy to access the
  Internet, then following configuration isn't required.

- MDE Sensors requires Microsoft Windows HTTP (WinHTTP) to report data
  to MDE Cloud portal.

- MDE Sensors uses LocalSystem Account to run on Windows machine.

- WinHTTP setting is independent of Windows Internet (WinINet) browsing
  proxy setting.

- WinHTTP setting discovers proxy setting using following method:
  Transparent proxy and Web Proxy Autodiscovery Protocol (WPAD)

- Note: If a Transparent proxy or WPAD has been implemented in the
  network topology, there's no need for special configuration settings.

<!-- -->

- **Detect, investigate, respond, and remediate application threats**

- identify, investigate, and remediate security risks by using Microsoft
  Cloud Application Security (MCAS)

- configure MCAS to generate alerts and reports to detect threats

- **Cloud Access Security Broker (CASB)** is a software tool or service
  that sits between an organization's on-premises infrastructure and a
  cloud provider's infrastructure. CASBs are available as both an
  on-premises or cloud-based software as well as a service.

-  Four pillars of CASB: A CASB acts as a gatekeeper, allowing
  organizations to extend the reach of their security policies beyond
  their own infrastructure.

- CASBs typically offer the following:

- Firewalls to identify malware and prevent it from entering the
  enterprise network

- Authentication to check users' credentials and ensure they only access
  appropriate company resources

- Web application firewalls (WAFs) to thwart malware designed to breach
  security at the application level, rather than at the network level

- Data loss prevention (DLP) to ensure that users cannot transmit
  sensitive information outside of the corporation

- **Cloud Access Security Broker**

- A cloud access security broker (CASB) is on-premises or cloud based
  software that sits between cloud service users and cloud applications,
  and monitors all activity and enforces security policies. Cloud Access
  Security Broker (CASB) is a software tool or service that sits between
  an organization's on-premises infrastructure and a cloud provider's
  infrastructure. CASBs are available as both an on-premises or
  cloud-based software as well as a service.

<!-- -->

- **How does a CASB work?**

- CASBs work by ensuring that network traffic between on-premises
  devices and the cloud provider complies with an organization's
  security policies.

- The value of cloud access security brokers stems from their ability to
  give insight into cloud application use across cloud platforms and
  identify unsanctioned use. This is especially important in regulated
  industries.

- CASBs use auto-discovery to identify cloud applications in use and
  identify high-risk applications, high-risk users and other key risk
  factors. Cloud access security brokers may enforce a number of
  different security access controls, including encryption and device
  profiling. They may also provide other services such as credential
  mapping when single sign-on is not available.

- **Vendors and resources:** Vendors in the cloud access security space
  include Skyhigh Networks, CipherCloud, McAfee and Symantec. Microsoft
  includes CASB functionality in its base Azure security services at no
  extra charge. To meet the needs of IaaS and PaaS users, CASB vendors
  have added or expanded functionality for security tasks, such as the
  following:

- **Single sign-on (SSO).** Allows an employee to enter their
  credentials one time and access a number of applications.

- **Encryption**. Encrypts information from the moment it's created
  until it's sitting at rest in the cloud.

- **Compliance reporting tools**. Ensure that the company's security
  systems comply with corporate policies and government regulations.

- **User behavior analytics**. Identifies aberrant behavior indicative
  of an attack or data breach.

**CASB Products**

- Microsoft Cloud App Security

- MacAfee Mvision Cloud

- Symantec CloudSOC CASB

- Cisco Cloudlock

- Palo Alto network Prisma SaaS

- ZScaler Internet Access

- FortiCASB

**Microsoft 365 Defender Console**

- Home

- Incidents and Alerts

- Hunting

- Actions and Submissions

- Threat Analytics

- Secure Score

- Assets – Device

- Endpoints:

  - Vulnerability management: Dashboard, Recommendations, Remediation,
    Inventories, Weakness, Event Timeline

  - Partners and APIs: Connected apps, API explorer, Partner apps,
    Professional services

  - Evaluation and Tutorial

  - Configuration management: Device security management visibility –
    MDE, MEM, Configmgr, Unknown

- Email and Collaboration – Policies and Rules

- Reports

- Health

- Permissions

- Settings:

  - Security Center: Time Zone

  - Microsoft 365 Defender: Email notification (incident/threat
    analytics), Preview features, Streaming API

  - Endpoints: Data Retention, Licenses, Notifications, Advanced
    features, Auto-remediation, Permissions, APIs, Rules, Configuration
    management, Device management, Network assessment,

  - Device Discovery: Setup, Exclusions, Network, Data Sources,
    Enterprise IoT, Authenticated Scan

**Microsoft 365 Defender Home**

- Microsoft Secure Score

- Device Compliance

- Device Health

- Devices at risk

- Discovered devices to onboard

- Devices with active malware

- Users Risk

- Simulation

- Active incidents

**Microsoft Defender for Office 365**

- Defender for Office 365 safeguards your organization against malicious
  threats posed by email messages, links (URLs), and collaboration
  tools.

- Defender for Office 365 Threat Policies:

  - Anti-spam

  - Anti-malware

  - Anti-phishing

  - Safe links

  - Safe attachments

- **Enable Safe attachments for SharePoint, OneDrive and Teams**

- Safe Attachment policy:

- Enable Safe attachment to ensure that users are not able to download
  any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365
  -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload
  \$true

- Reference:
  <https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps>

- Detect, investigate, respond, and remediate threats to Microsoft
  Teams, SharePoint, and OneDrive

<!-- -->

- **How does a CASB work?** 🡪 CASBs work by ensuring that network
  traffic between on-premises devices and the cloud provider complies
  with an organization's security policies. The value of cloud access
  security brokers stems from their ability to give insight into cloud
  application use across cloud platforms and identify unsanctioned use.
  This is especially important in regulated industries. CASBs use
  auto-discovery to identify cloud applications in use and identify
  high-risk applications, high-risk users, and other key risk factors.
  Cloud access security brokers may enforce several different security
  access controls, including encryption and device profiling. They may
  also provide other services such as credential mapping when single
  sign-on is not available.

> **<span class="mark">Microsoft Defender for Endpoint - 6hrs</span>**
>
>  

- Configure alerts in MDE/MD365 so that members of accounts department
  will receive alerts when vulnerability is detected, one of the
  employee reported that they are not receiving alert, what to do? **Ask
  employee to check Junk email folder, mark security emails as Not
  Junk.**

- While investigating possible attack that uses malware, we intend to
  automate operation of collection of machines having sensitive data and
  you have 4 custom device groups. We need to create temporary group for
  machines in order to perform actions on devices: --\> **Create admin
  role that gives users access to tagged machines.**

- HR department employee uses excel with macros, false-positive alerts
  showing on MDE, because excel with macros are not allowed in company,
  how to hide false-positive alerts? **--\> Suppress alert and make
  suppression rule that is applicable to any device**

- Coordinator of HR department notices that app on their device runs
  suspicious scripts, what solution to use to constrain such a software
  behaviour? --\> **Attack Surface Reduction (ASR)**

- What role is required to create detection rules? **--\> Security
  Administrator**

- How to provide overview of Threat from MDE threat analytics dashboard?

  - **Threats with Active alerts**

  - **Threats with Resolved alerts**

  - **Threats with No alerts**

- In MDE, Old Policy-IoC policy with Block and remediate action and also
  used MD5 hash file indicator, You are tasked to create New Policy-IoC
  policy with Allow action and use MD5 hash file indicator, in this case
  what should you do to allow file to run? **--\> Delete IoC policy that
  is suing Block and remediate action**

- How to use API call to get list of devices connected with particular
  vulnerability ID?

  - GET /api/vulnerabilities/cveid/machineReferences

- After automated investigation device is isolated, after some time we
  found out that device is not threat to company, how to remove device
  from isolation? **-\> Select undo option on History tab on Microsoft
  365 Defender portal**

- What solution is used to check the compliance of apps? **Microsoft
  Defender for Cloud App**

- Which solution is used to notify and monitor the user account risk?
  **Azure AD Identity Protection**

- How to create IP address tag to scope continuous report to specific IP
  range in Microsoft Defender for Cloud App?

  - **Click on settings cog and select IP address range**

  - **Enter name and category, then click on + button in IP address
    ranges field and add appropriate IP range**

  - **Select "Create"**

- Minimum license required to activate Azure AD Identity protection's
  user risk and sign-in risk?

  - **Azure AD Premium P2 license**

- We are using MDE and configuring roles for users, you are configuring
  roles for Azure AD groups. What permissions allows to manage email
  notification in Azure AD portal?

  - **Manage security settings in Security Center**

>  
>
> **Vulnerability Management:**

- Discovers vulnerable and misconfigured devices based on known attack
  vectors and software vulnerabilities.

- **Exposure Score:** Current exposure associated with machines in
  organization (Less is good)

- Secure Score: Shows collective security configuration posture of
  machines (High is good)

  - OS

  - Application

  - Network

  - Account

  - Security Controls

- **Exposure Distribution**: Exposed machines are easy targets for
  attacks, High Medium and Low.

- **Top Security Recommendations**: Based on highest organizational
  exposure impact.

>  
>
>  
>
> **<span class="mark">Microsoft 365 Defender Dashboard</span>**

- Home

- Incidents and Alerts

- Hunting

- Actions and Submissions

- Threat Analytics

- Secure Score

- Assets – Device

- Endpoints:

  - Vulnerability management: Dashboard, Recommendations, Remediation,
    Inventories, Weakness, Event Timeline

  - Partners and APIs: Connected apps, API explorer, Partner apps,
    Professional services

  - Evaluation and Tutorial

  - Configuration management: Device security management visibility –
    MDE, MEM, Configmgr, Unknown

- Email and Collaboration – Policies and Rules

- Reports

- Health

- Permissions

- Settings:

  - Security Center: Time Zone

  - Microsoft 365 Defender: Email notification (incident/threat
    analytics), Preview features, Streaming API

  - Endpoints: Data Retention, Licenses, Notifications, Advanced
    features, Auto-remediation, Permissions, APIs, Rules, Configuration
    management, Device management, Network assessment,

  - Device Discovery: Setup, Exclusions, Network , Data Sources,
    Enterprise IoT, Authenticated Scan

>  

- **Microsoft 365 Defender Home**

  - Microsoft Secure Score

  - Device Compliance

  - Device Health

  - Devices at risk

  - Discovered devices to onboard

  - Devices with active malware

  - Users Risk

  - Simulation

  - Active incidents

>  
>
> **<span class="mark">Microsoft Defender for Office 365</span>**

- Defender for Office 365 safeguards your organization against malicious
  threats posed by email messages, links (URLs), and collaboration
  tools.

- Defender for Office 365 Threat Policies:

  - Anti-spam

  - Anti-malware

  - Anti-phishing

  - Safe links

  - Safe attachments

> **Actions and Submissions**
>
> **Actions**: It lists pending and completed remediation actions for
> your devices, email & collaboration content, and identities in one
> location. Following actions are tracked:

- Collect investigation package

- Isolate device (this action can be undone)

- Offboard machine

- Release code execution

- Release from quarantine

- Request sample

- Restrict code execution (this action can be undone)

- Run antivirus scan

- Stop and quarantine

- Contain devices from the network

> **Pending:** Displays a list of actions that require attention. You
> can approve or reject actions one at a time, or select multiple
> actions if they have the same type of action (such as Quarantine
> file).
>
>  
>
> **History:**

- Serves as an audit log for actions that were taken and also provides
  way to undo it.

- Remediation actions that were taken as a result of automated
  investigations

- Remediation actions that were taken on suspicious or malicious email
  messages, files, or URLs

- Remediation actions that were approved by your security operations
  team

- Commands that were run and remediation actions that were applied
  during Live Response sessions

- Remediation actions that were taken by your antivirus protection

- Required Roles: Security Administrator, Active remediation actions,
  Search and Purge

>  
>
>  
>
> **Enable Safe attachments for SharePoint, OneDrive and Teams**

- Safe Attachment policy:

- Enable Safe attachment to ensure that users are not able to download
  any malicious content to their systems.

- Using Exchange Online powershell module: \#Set-AtpPolicyForO365
  -EnableATPForSPOTeamsODB \$true

- Using SharePoint online: \#Set-SPOTenant -DisallowInfectedFileDownload
  \$true

- Reference:
  [<u>https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps</u>](https://docs.microsoft.com/en-us/powershell/module/exchange/set-atppolicyforo365?view=exchange-ps)

- Detect, investigate, respond, and remediate threats to Microsoft
  Teams, SharePoint, and OneDrive

>  
>
>  
>
> **<span class="mark">Microsoft Defender for Endpoint</span>**

- **MDE Features**

  - Attack surface reduction

  - Next generation protection

  - Endpoint detection and response

  - Automated investigation and response

  - Vulnerability management

- **Microsoft Defender for Endpoint Plans: P1 and P2**

- **Attack Surface Reduction**

  - Attack Surface Reduction is hardening the places where a threat is
    likely to attack.

  - Components of attack surface reduction:

    - **Attack surface reduction rules**: Reduce attack surface in apps
      with intelligent rules (Need Microsoft Defender Antivirus)

    - **Hardware-based isolation**:

      - Protects integrity of system during start and running.

      - Validate system integrity with local and remote attestation.

      - Use container isolation for Microsoft Edge to help guard against
        malicious websites.

    - **Application contro**l: Use application control so that your
      applications must earn trust in order to run.

    - **Exploit protection:** Help protect operating systems and apps
      your organization uses from being exploited. Exploit protection
      also works with third-party antivirus solutions.

    - **Network protection:** Extend protection to your network traffic
      and connectivity on your organization's devices. (Requires
      Microsoft Defender Antivirus)

    - **Web protection:** Secure your devices against web threats and
      help you regulate unwanted content.

    - **Controlled folder access:** Help prevent malicious or suspicious
      apps (including file-encrypting ransomware malware) from making
      changes to files in your key system folders (Requires Microsoft
      Defender Antivirus)

    - **Device control:** Protects against data loss by monitoring and
      controlling media used on devices, such as removable storage and
      USB drives, in your organization.

- **MDE Minimum Requirement**

  - **Licensing requirement:**

  - Microsoft Defender for Endpoint Plan 1 (P1) àCommercial and
    education purpose

  - Microsoft Defender for Endpoint Plan 2 (P2)

  - Microsoft Defender for Endpoint server (With Defender for Cloud)

  - **Browser requirement**: Access to Defender for endpoint is done
    through below browsers: Microsoft Edge, Google Chrome

  - **OS requirement:** Windows, Linux, Android, iOS, MacOS

  - **Network requirement:** MDE Sensors requires Microsoft Windows HTTP
    (WinHTTP)

  - **Data storage requirement:**

  - **Microsoft Defender Antivirus requirement:**

    - MDE sensors depends on ability of Microsoft Defender Antivirus to
      scan files and provide information about them.

    - If you're running Microsoft Defender Antivirus as the primary
      antimalware product on your devices, the Defender for Endpoint
      agent will successfully onboard.

    - If you're running a third-party antimalware client and use Mobile
      Device Management solutions or Microsoft Endpoint Manager (current
      branch), you'll need to ensure the Microsoft Defender Antivirus
      ELAM driver is enabled.

- **Deploy MDE**

  - Required Permissions: global administrator or security administrator

  - Navigate to MDE portal:
    [<u>https://security.microsoft.com</u>](https://security.microsoft.com/)

    - Settings à Endpoints à General à Data Retention à Data Storage à
      US/UK/EU

  - We cannot change data location and can’t move data.

  - Data Retention: 6 Months Default

  - MDE data can be stored at US, UK EU.

  - We cannot change your data storage location after the first-time
    setup.

  - Network Configuration:

    - If organization doesn't require endpoints to use Proxy to access
      the Internet, then following configuration isn't required.

    - MDE Sensors requires Microsoft Windows HTTP (WinHTTP) to report
      data to MDE Cloud portal.

    - MDE Sensors uses LocalSystem Account to run on Windows machine.

    - WinHTTP setting is independent of Windows Internet (WinINet)
      browsing proxy setting.

    - WinHTTP setting discovers proxy setting using following method:

      - Transparent proxy

      - Web Proxy Autodiscovery Protocol (WPAD)

    - Note: If a Transparent proxy or WPAD has been implemented in the
      network topology, there's no need for special configuration
      settings.

>  
>
> **<span class="mark">Microsoft Defender for Cloud Apps</span>**

- **Detect, investigate, respond, and remediate application threats**

  - identify, investigate, and remediate security risks by using
    Microsoft Cloud Application Security (MCAS)

  - configure MCAS to generate alerts and reports to detect threats

#### How identify and remediate security risks related to sign-in risk policies in Microsoft 365 Defender?

To identify and remediate security risks related to sign-in risk
policies in Microsoft 365 Defender, you can follow these steps:

**Identify**

1.  **Review your sign-in risk policies.** Make sure that your policies
    are aligned with your security posture and that they are effective
    in mitigating the risks that you face.

2.  **Monitor your sign-in risk data.** Use Microsoft 365 Defender to
    monitor sign-in activity and identify risky sign-ins.

3.  **Investigate risky sign-ins.** If you identify a risky
    sign-in, investigate it to determine whether it is a legitimate
    sign-in or a malicious attempt.

4.  **Remediate security risks.** If you determine that a sign-in is
    malicious, remediate the risk by blocking the user, resetting their
    password, and reviewing their account for other signs of compromise.

**Remediate**

Here are some specific ways to remediate security risks related to
sign-in risk policies in Microsoft 365 Defender:

- **Require multi-factor authentication (MFA) for all users.** MFA is
  one of the most effective ways to mitigate sign-in risk.

- **Implement conditional access policies.** Conditional access policies
  can be used to require additional authentication or block access to
  specific resources based on user risk and other factors.

- **Block anomalous sign-ins.** Microsoft 365 Defender can be used to
  block sign-ins that are anomalous, such as sign-ins from unusual
  locations or devices.

- **Reset user passwords.** If you suspect that a user's password has
  been compromised, reset their password immediately.

- **Review user accounts for other signs of compromise.** If you
  identify a risky sign-in, review the user's account for other signs of
  compromise, such as suspicious changes to their account settings or
  unusual activity in their email inbox.

**Here are some additional tips for identifying and remediating security
risks related to sign-in risk policies in Microsoft 365 Defender:**

- **Use Azure Active Directory (AD) Premium.** Azure AD Premium provides
  additional features for managing sign-in risk, such as user risk
  policies and risk-based conditional access.

- **Use Microsoft Entra Identity Protection.** Microsoft Entra Identity
  Protection is a unified identity protection solution that provides a
  comprehensive view of user risk across Microsoft 365 and other cloud
  services.

- **Use a security information and event management (SIEM) tool.** A
  SIEM tool can be used to correlate data from multiple
  sources, including Microsoft 365 Defender, to identify and remediate
  security risks.

By following these tips, you can identify and remediate security risks
related to sign-in risk policies in Microsoft 365 Defender and help to
protect your organization from cyberattacks.

#### How to identify and remediate security risks related to Conditional Access events in microsoft 365 defender?

To identify and remediate security risks related to Conditional Access
events in Microsoft 365 Defender, you can follow these steps:

Identify

1.  Review your Conditional Access policies. Make sure that your
    policies are aligned with your security posture and that they are
    effective in mitigating the risks that you face.

2.  Monitor your Conditional Access event data. Use Microsoft 365
    Defender to monitor Conditional Access events and identify risky
    events.

3.  Investigate risky events. If you identify a risky Conditional Access
    event, investigate it to determine whether it is a legitimate event
    or a malicious attempt.

4.  Remediate security risks. If you determine that a Conditional Access
    event is malicious, remediate the risk by blocking the
    user, resetting their password, or reviewing their account for other
    signs of compromise.

Remediate

Here are some specific ways to remediate security risks related to
Conditional Access events in Microsoft 365 Defender:

- Block anomalous Conditional Access events. Microsoft 365 Defender can
  be used to block Conditional Access events that are anomalous, such as
  events from unusual locations or devices.

- Reset user passwords. If you suspect that a user's password has been
  compromised, reset their password immediately.

- Review user accounts for other signs of compromise. If you identify a
  risky Conditional Access event, review the user's account for other
  signs of compromise, such as suspicious changes to their account
  settings or unusual activity in their email inbox.

- Update your Conditional Access policies. If you identify a new
  security risk, update your Conditional Access policies to mitigate the
  risk.

Here are some additional tips for identifying and remediating security
risks related to Conditional Access events in Microsoft 365 Defender:

- Use Azure Active Directory (AD) Premium. Azure AD Premium provides
  additional features for managing Conditional Access events, such as
  risk-based conditional access and Conditional Access Insights.

- Use Microsoft Entra Identity Protection. Microsoft Entra Identity
  Protection is a unified identity protection solution that provides a
  comprehensive view of user risk across Microsoft 365 and other cloud
  services.

- Use a security information and event management (SIEM) tool. A SIEM
  tool can be used to correlate data from multiple sources, including
  Microsoft 365 Defender, to identify and remediate security risks.

By following these tips, you can identify and remediate security risks
related to Conditional Access events in Microsoft 365 Defender and help
to protect your organization from cyberattacks.

Here are some specific examples of how you can identify and remediate
security risks related to Conditional Access events in Microsoft 365
Defender:

- Identify suspicious login attempts. You can use Microsoft 365 Defender
  to monitor Conditional Access events for suspicious login
  attempts, such as login attempts from unusual locations or devices. If
  you identify a suspicious login attempt, you can block the user or
  reset their password.

- Identify failed authentication attempts. You can also use Microsoft
  365 Defender to monitor Conditional Access events for failed
  authentication attempts. If a user fails to authenticate multiple
  times, you can block the user or review their account for other signs
  of compromise.

- Identify risky app access. You can also use Microsoft 365 Defender to
  monitor Conditional Access events for risky app access. For
  example, you can monitor for users accessing apps from unusual
  locations or devices. If you identify risky app access, you can block
  the user or review their account for other signs of compromise.

By monitoring Conditional Access events in Microsoft 365 Defender, you
can identify and remediate security risks and help to protect your
organization from cyberattacks.

identify and remediate security risks related to Azure Active Directory

identify, investigate, and remediate security risks related to
privileged identities

configure detection alerts in Azure AD Identity Protection

identify and remediate security risks related to Active Directory Domain
Services using Microsoft Defender for Identity

#### What is attack surface reduction in microsoft 365 defender and how to implement it?

Attack surface reduction (ASR) is a set of rules and configurations in
Microsoft 365 Defender that can help you reduce the number of attack
vectors that attackers can use to exploit your devices and networks. ASR
rules can block or audit common attack techniques, such as malware
execution, script execution, and suspicious network activity.

To implement ASR in Microsoft 365 Defender, you can follow these steps:

1.  Go to the **Microsoft 365 Defender portal**.

2.  Click **Endpoints** \> **Attack surface reduction**.

3.  Click the **Policies** tab.

4.  Click **Create policy**.

5.  Enter a name and description for the policy.

6.  Select the ASR rules that you want to enable or audit.

7.  Click **Create**.

Once you have created an ASR policy, you can assign it to devices or
groups of devices. To do this:

1.  Go to the **Microsoft 365 Defender portal**.

2.  Click **Endpoints** \> **Attack surface reduction**.

3.  Click the **Devices** tab.

4.  Select the devices or groups of devices that you want to assign the
    policy to.

5.  Click **Assign policy**.

ASR policies can be deployed in two modes:

- **Block mode:** Blocks the attack technique that is being targeted by
  the ASR rule.

- **Audit mode:** Audits the attack technique that is being targeted by
  the ASR rule, but does not block it. This allows you to see how often
  the attack technique is being used and to identify any patterns or
  trends.

It is recommended that you start by deploying ASR rules in audit mode.
This will allow you to see how the rules impact your environment and to
make any necessary adjustments before deploying them in block mode.

**Here are some additional tips for implementing ASR in Microsoft 365
Defender:**

- **Review the ASR rule documentation carefully.** Each ASR rule has its
  own unique set of benefits and risks. It is important to understand
  the impact of a rule before you deploy it.

- **Test ASR rules in a lab environment before deploying them to
  production.** This will help you to identify any potential conflicts
  or performance issues.

- **Monitor ASR alerts and reports.** Microsoft 365 Defender generates
  alerts and reports for ASR events. It is important to monitor these
  alerts and reports to identify any suspicious activity.

- **Keep your ASR rules up to date.** Microsoft regularly releases new
  ASR rules and updates existing rules. It is important to keep your ASR
  rules up to date to ensure that you are protected against the latest
  threats.

By following these tips, you can implement ASR in Microsoft 365 Defender
and help to protect your organization from cyberattacks.

#### How to deploy Microsoft 365 Defender?

To deploy Microsoft 365 Defender, you can follow these steps:

**Prepare your environment**

1.  Make sure that your devices and networks meet the system
    requirements for Microsoft 365 Defender.

2.  Determine which deployment method you want to use. You can deploy
    Microsoft 365 Defender using the following methods:

- **Microsoft Endpoint Configuration Manager:** You can use Microsoft
  Endpoint Configuration Manager to deploy the Microsoft 365 Defender
  agent to your devices.

- **Intune:** You can use Intune to deploy the Microsoft 365 Defender
  agent to your devices.

- **Standalone installer:** You can use the standalone installer to
  deploy the Microsoft 365 Defender agent to devices that are not
  managed by Microsoft Endpoint Configuration Manager or Intune.

3.  If you are using Microsoft Endpoint Configuration Manager or
    Intune, create a deployment package for the Microsoft 365 Defender
    agent.

4.  If you are using the standalone installer, download the Microsoft
    365 Defender agent from the Microsoft Download Center.

5.  On each device that you want to deploy Microsoft 365 Defender
    to, install the Microsoft 365 Defender agent.

**Onboard your devices to Microsoft 365 Defender**

1.  Go to the **Microsoft 365 Defender portal**.

2.  Click **Endpoints** \> **Onboarding**.

3.  Select the operating system of the devices that you want to onboard.

4.  Select the deployment method that you want to use.

5.  Follow the instructions to deploy the Microsoft 365 Defender agent
    to the devices.

**Configure Microsoft 365 Defender**

1.  Go to the **Microsoft 365 Defender portal**.

2.  Configure the features and settings that you want to use.

3.  Create and assign policies to your devices and groups of devices.

**Start using Microsoft 365 Defender**

Once you have deployed and configured Microsoft 365 Defender, you can
start using it to protect your organization from cyberattacks.

Here are some additional tips for deploying Microsoft 365 Defender:

- Start by deploying Microsoft 365 Defender to a small group of test
  devices. This will allow you to test the deployment process and to
  identify any potential problems.

- Once you have successfully deployed Microsoft 365 Defender to the test
  devices, you can start deploying it to more devices.

- Use Microsoft Endpoint Configuration Manager or Intune to deploy
  Microsoft 365 Defender to your devices. This will allow you to manage
  the deployment process more easily.

- If you are using the standalone installer to deploy Microsoft 365
  Defender, make sure that you have the necessary permissions to install
  the agent on the devices.

- Monitor the deployment process to make sure that all of your devices
  are successfully deployed to Microsoft 365 Defender.

By following these tips, you can deploy Microsoft 365 Defender and help
to protect your organization from cyberattacks.

**<span class="mark">What first time configuration we need to while
deploying microsoft 365 defender?</span>**

When deploying Microsoft 365 Defender for the first time, there are a
few key configurations that you should perform to ensure that you are
getting the most out of the product.

**1. Enable all of the recommended ASR rules**

ASR rules are a set of rules and configurations that can help you reduce
the number of attack vectors that attackers can use to exploit your
devices and networks. Microsoft recommends that you enable all of the
ASR rules by default. You can review and customize the ASR rules as
needed, but it is important to start with all of the recommended rules
enabled.

**2. Configure alerts and reports**

Microsoft 365 Defender generates alerts and reports for a variety of
security events. It is important to configure alerts and reports so that
you are notified of any suspicious activity. You can also use reports to
monitor your security posture and to identify trends.

**3. Assign policies to devices and groups of devices**

Microsoft 365 Defender policies allow you to configure the security
features and settings for your devices and groups of devices. It is
important to assign policies to your devices and groups of devices so
that they are protected against the latest threats.

**4. Configure data connectors**

Data connectors allow you to ingest data from other sources, such as
security information and event management (SIEM) tools and cloud
security platforms, into Microsoft 365 Defender. This data can be used
to improve the accuracy and effectiveness of Microsoft 365 Defender's
detection and response capabilities.

**5. Enable threat hunting**

Threat hunting is the process of actively searching for and
investigating potential threats in your environment. Microsoft 365
Defender provides a variety of tools and resources that can help you
with threat hunting. It is important to enable threat hunting so that
you can identify and respond to threats before they cause damage to your
organization.

**6. Keep your Microsoft 365 Defender tenant up to date**

Microsoft regularly releases updates for Microsoft 365 Defender. These
updates include new features, security fixes, and performance
improvements. It is important to keep your Microsoft 365 Defender tenant
up to date so that you are protected against the latest threats and are
getting the most out of the product.

By performing these first-time configurations, you can ensure that you
are using Microsoft 365 Defender to its full potential and that your
organization is protected from cyberattacks.

**<span class="mark">What data storage and network configuration we need
to make for microsoft 365 defender?</span>**

- Required Permissions: global administrator or security administrator

- Navigate to MDE portal:
  [https://security.microsoft.com](https://security.microsoft.com/)
  Settings 🡪Endpoints🡪 General 🡪 Data Retention 🡪 Data Storage🡪 US/UK/EU

- We can not change data location and can’t move data.

- Data Retention: 6 Months Default

- MDE data can be stored at US, UK EU.

- We cannot change your data storage location after the first-time
  setup.

**Network Configuration:**

- If organization doesn't require endpoints to use Proxy to access the
  Internet, then following configuration isn't required.

- MDE Sensors requires Microsoft Windows HTTP (WinHTTP) to report data
  to MDE Cloud portal.

- MDE Sensors uses LocalSystem Account to run on Windows machine.

- WinHTTP setting is independent of Windows Internet (WinINet) browsing
  proxy setting.

- WinHTTP setting discovers proxy setting using following method:

  - Transparent proxy

  - Web Proxy Autodiscovery Protocol (WPAD)

- Note: If a Transparent proxy or WPAD has been implemented in the
  network topology, there's no need for special configuration settings.

Data storage configuration

Microsoft 365 Defender stores data in the cloud, so you do not need to
configure any on-premises data storage. However, there are a few things
you can do to optimize your data storage configuration:

- Choose the right data storage tier for your needs. Microsoft 365
  Defender offers two data storage tiers: standard and premium. The
  standard tier is designed for most organizations, but the premium tier
  offers additional features and capabilities for organizations with
  more demanding needs.

- Enable data compression. Data compression can help to reduce your data
  storage costs.

- Set data retention policies. Data retention policies allow you to
  control how long data is stored in Microsoft 365 Defender.

Network configuration

To ensure that Microsoft 365 Defender can communicate with your devices
and networks, you need to configure your network to allow the following
traffic:

- HTTPS traffic to the following domains:

\*.microsoft.com

\*.msocdn.net

\*.msocdn.com

- UDP traffic to the following ports:

5688

5000

You may also need to configure your firewall to allow traffic to
specific IP addresses. You can find a list of the IP addresses that
Microsoft 365 Defender uses on the Microsoft Learn website.

Additional tips

- If you have a complex network environment, you may need to work with
  Microsoft support to configure your network for Microsoft 365
  Defender.

- You can use Microsoft Endpoint Configuration Manager or Intune to
  configure network settings for your devices.

- You can use the Microsoft 365 Network Connectivity Test to test your
  network connectivity to Microsoft 365 Defender.

By following these tips, you can configure your data storage and network
for Microsoft 365 Defender and ensure that it is properly protected.

#### How to perform device investigation on Microsoft 365 Defender?

To perform device investigation on Microsoft 365 Defender, you can
follow these steps:

1.  Identify the device to investigate. You can identify the device to
    investigate by reviewing the alerts or incidents in the Microsoft
    365 Defender portal. You can also search for devices by name, IP
    address, or other criteria.

2.  View the device details. Once you have identified the device to
    investigate, you can view its details in the Microsoft 365 Defender
    portal. The device details include information such as the device
    name, operating system, hardware configuration, and security status.

3.  Investigate the device's activity. You can investigate the device's
    activity by reviewing its event logs, network traffic, and file
    system activity. You can also use the Microsoft 365 Defender threat
    hunting tools to search for suspicious activity on the device.

4.  Collect evidence. If you find evidence of a threat on the
    device, you can collect evidence to support your investigation. You
    can collect evidence such as system logs, network traffic logs, and
    malware samples.

5.  Remediate the threat. Once you have completed your
    investigation, you can remediate the threat by removing the
    malware, patching vulnerabilities, and hardening the device's
    security configuration.

Here are some additional tips for performing device investigation on
Microsoft 365 Defender:

- Use the device timeline. The device timeline in the Microsoft 365
  Defender portal provides a chronological view of the device's
  activity. You can use the device timeline to identify suspicious
  activity and to track the progress of your investigation.

- Use the device inventory. The device inventory in the Microsoft 365
  Defender portal provides a list of all devices that are managed by
  Microsoft 365 Defender. You can use the device inventory to search for
  devices by name, IP address, or other criteria.

- Use the device groups. Device groups in the Microsoft 365 Defender
  portal allow you to group devices together based on criteria such as
  operating system, location, or security status. You can use device
  groups to filter alerts and incidents, and to target remediation
  actions to specific groups of devices.

- Use the threat hunting tools. The threat hunting tools in the
  Microsoft 365 Defender portal allow you to search for suspicious
  activity across your environment. You can use the threat hunting tools
  to identify threats that may be difficult or impossible to detect
  using traditional security solutions.

By following these tips, you can use Microsoft 365 Defender to perform
device investigations effectively and protect your organization from
threats.

#### What remediation actions we can take on device in Microsoft 365 Defender?

The following remediation actions can be taken on devices in Microsoft
365 Defender:

- Isolate device: Disconnects the device from the network, preventing it
  from spreading malware or other threats.

- Restrict code execution: Prevents certain types of code, such as
  executable files or scripts, from running on the device.

- Run antivirus scan: Initiates a scan of the device for malware and
  other threats.

- Collect investigation package: Gathers information about the
  device, its configuration, and its activity. This information can be
  used to investigate and diagnose problems.

- Initiate automated investigation: Starts a new general purpose
  automated investigation on the device.

- Release code execution: Allows code that was previously restricted
  from running on the device.

- Release from quarantine: Releases files that were quarantined as
  suspicious or malicious.

- Request sample: Requests a sample of a file or process on the device
  for further analysis.

- Stop and quarantine: Stops a process and quarantines it for further
  analysis.

- Contain devices from the network: Prevents devices from accessing the
  network.

- Block URL (time-of-click): Blocks a URL from being accessed by
  devices.

- Soft delete email messages or clusters: Softly deletes email messages
  or clusters, which can be restored later.

- Quarantine email: Quarantines email messages for further analysis.

- Quarantine an email attachment: Quarantines an email attachment for
  further analysis.

- Turn off external mail forwarding: Disables external mail forwarding
  for the device.

- Disable user: Disables the user account associated with the device.

- Reset user password: Resets the user password associated with the
  device.

- Confirm user as compromised: Confirms that the user account associated
  with the device has been compromised.

These remediation actions can be taken manually or automatically.
Automated investigation and response (AIR) features in Microsoft 365
Defender can automatically investigate and apply remediation actions to
malicious or suspicious items.

To take a remediation action on a device in Microsoft 365 Defender,
follow these steps:

1.  Go to the Devices page in the Microsoft 365 Defender portal.

2.  Select the device that you want to take a remediation action on.

3.  Click the Remediation tab.

4.  Select the remediation action that you want to take.

5.  Click Take action.

If you have any questions or concerns, please contact your Microsoft
security administrator.

#### How to mitigate cyber-attack on Microsoft 365 Defender?

To mitigate a cyberattack on Microsoft 365 Defender, you can follow
these steps:

1.  Identify the affected systems and users. Use Microsoft 365 Defender
    to identify the systems and users that have been affected by the
    cyberattack. This may involve searching for known indicators of
    compromise (IOCs), such as file hashes, IP addresses, and URLs.

2.  Determine the scope of the infection. Use Microsoft 365 Defender to
    determine the extent of the cyberattack. This may involve
    investigating the network traffic associated with the affected
    systems, as well as the files that have been accessed or modified by
    the malware.

3.  Identify the root cause of the infection. Use Microsoft 365 Defender
    to identify the root cause of the cyberattack. This may involve
    investigating how the malware was initially introduced into your
    environment, as well as any vulnerabilities that may have been
    exploited.

4.  Remediate the infection. Once you have identified the affected
    systems and users, and determined the scope of the infection, you
    can begin to remediate the infection. This may involve removing the
    malware from infected systems, restoring data from backups, and
    patching vulnerabilities.

5.  Prevent future infections. Once you have remediated the
    infection, you need to take steps to prevent future infections. This
    may involve implementing additional security controls, such as email
    filtering, web filtering, and application control.

Here are some additional tips for mitigating a cyberattack on Microsoft
365 Defender:

- Use the Microsoft 365 Defender Security Score. The Microsoft 365
  Defender Security Score provides a holistic view of your security
  posture and helps you to identify areas where you can improve. You can
  use the Security Score to prioritize your remediation efforts and to
  track your progress over time.

- Use the Microsoft 365 Defender threat hunting tools. The threat
  hunting tools in the Microsoft 365 Defender portal allow you to search
  for suspicious activity across your environment. You can use the
  threat hunting tools to identify threats that may be difficult or
  impossible to detect using traditional security solutions.

- Use the Microsoft 365 Defender automated investigation and response
  (AIR) features. The AIR features in Microsoft 365 Defender can
  automatically investigate and apply remediation actions to malicious
  or suspicious items. This can help you to respond to cyberattacks more
  quickly and effectively.

- Work with Microsoft security experts. Microsoft offers a variety of
  security services that can help you to mitigate cyberattacks. You can
  work with Microsoft security experts to develop a security plan that
  is tailored to your specific needs.

By following these steps and tips, you can use Microsoft 365 Defender to
mitigate cyberattacks and protect your organization from threats.

#### How to perform security investigation on Microsoft 365 Defender?

To perform a security investigation on Microsoft 365 Defender, you can
follow these steps:

1.  **Identify the security alert or incident.** This may involve
    reviewing the alerts and notifications in the Microsoft 365 Defender
    console, or searching for specific events or activities.

2.  **Gather data.** Once you have identified the security alert or
    incident, gather as much data as possible about it. This may include
    data from the following sources:

    - **Endpoints:** Logs, event data, and system information from the
      affected systems

    - **Networks:** Network traffic logs and firewall logs

    - **Security appliances:** Logs and events from security
      appliances, such as firewalls and intrusion detection systems

    - **Microsoft 365 Defender alerts and notifications:** Details about
      the security alert or incident, such as the time it occurred, the
      affected systems, and the type of threat

    - **Threat intelligence feeds:** Information about known malware
      threats, such as IOCs and attack patterns

3.  **Analyze the data.** Once you have gathered data about the security
    alert or incident, analyze it to identify the following:

    - **The root cause of the alert or incident:** How did the threat
      enter your environment? What vulnerabilities were exploited?

    - **The scope of the alert or incident:** Which systems and users
      have been affected?

    - **The impact of the alert or incident:** What damage has been done
      to your organization?

4.  **Take action.** Once you have analyzed the data, you can take
    action to remediate the threat and prevent future incidents. This
    may involve the following:

    - **Removing the threat from infected systems:** This may involve
      using antivirus software, removing malicious files, or restoring
      data from backups

    - **Patching vulnerabilities:** Patching vulnerabilities that were
      exploited by the threat

    - **Implementing additional security controls:** Implementing
      additional security controls, such as email filtering, web
      filtering, and application control

Microsoft 365 Defender provides a number of tools to help you with your
security investigation. For example, the Threat Explorer tool allows you
to investigate threats across endpoints, identities, email, and
applications. The Incidents tab in the Microsoft 365 Defender console
provides a list of all security incidents that have occurred in your
environment.

Here are some additional tips for performing a security investigation on
Microsoft 365 Defender:

- **Start with the basics.** Before you start investigating a security
  alert or incident, it is important to understand the basics, such as
  the time it occurred, the affected systems, and the type of threat.

- **Use all of the data sources available to you.** Microsoft 365
  Defender collects data from a variety of sources. Use all of this data
  to get a complete picture of the alert or incident.

- **Correlate data from different sources.** Microsoft 365 Defender can
  correlate data from different sources to identify threats that would
  be difficult or impossible to detect using traditional security
  solutions. Use this capability to identify the root cause of the alert
  or incident and to determine which systems and users have been
  affected.

- **Use threat intelligence feeds.** Threat intelligence feeds can
  provide information about known malware threats, such as IOCs and
  attack patterns. Use this information to help you identify and
  investigate security alerts and incidents.

- **Automate tasks.** Microsoft 365 Defender can automate many of the
  tasks involved in investigating and responding to security alerts and
  incidents. This can save you time and help you to respond to incidents
  more quickly and effectively.

By following these steps and tips, you can use Microsoft 365 Defender to
perform security investigations effectively and protect your
organization from threats.

#### During security investigation how to decide that cyber-attack is happened?

To decide that a cyber-attack has happened during a security
investigation, you should look for the following evidence:

- **Indicators of compromise (IOCs)**: IOCs are artifacts or events that
  indicate that a cyber-attack has occurred. Examples of IOCs include
  malicious IP addresses, file hashes, and URLs.

- **Patterns of behaviour:** Cyber-attacks often follow a predictable
  pattern of behaviour. For example, attackers may first try to gain
  access to your network, then try to elevate their privileges, and then
  try to steal data or launch a ransomware attack. By looking for
  patterns of behaviour, you can identify cyber-attacks that may not be
  immediately apparent.

- **Anomalies:** Anomalies are unusual events or activities that may
  indicate a cyber-attack. For example, a sudden increase in network
  traffic or a failed login attempt from an unusual location may be an
  indication of a cyber-attack.

If you find evidence of IOCs, patterns of behaviour, or anomalies during
your security investigation, it is likely that a cyber-attack has
occurred. In this case, you should take steps to remediate the attack
and prevent future attacks.

Here are some additional tips for deciding if a cyber-attack has
happened during a security investigation:

- **Consider the context.** When evaluating the evidence, it is
  important to consider the context of the situation. For example, a
  failed login attempt from an unusual location may be suspicious, but
  it may also be a legitimate attempt by an employee who is traveling.

- **Use multiple sources of evidence.** No single piece of evidence is
  conclusive. To make a determination, you should consider evidence from
  multiple sources, such as endpoints, networks, and security
  appliances.

- **Consult with experts.** If you are unsure whether a cyber-attack has
  happened, consult with experts in security forensics and incident
  response.

By following these tips, you can make informed decisions about whether a
cyber-attack has happened during a security investigation.

#### please share the list of "Patterns of behaviour" that confirms cyber-attack is happened?

Here is a list of patterns of behavior that can confirm that a
cyber-attack has happened:

- Unusual network activity: This can include a sudden increase in
  network traffic, spikes in bandwidth usage, or unusual patterns of
  traffic to and from known malicious IP addresses.

- Unexpected login attempts: This can include failed login attempts from
  unusual locations, login attempts from known compromised accounts, or
  successful login attempts followed by unusual activity.

- Changes to system or security configurations: This can include
  disabling security software, changing system permissions, or
  installing new software, especially software from untrusted sources.

- Data exfiltration: This can include attempts to transfer large amounts
  of data out of the network, or the presence of unusual files or
  folders on the network.

- Ransomware demands: This can include the appearance of ransom notes on
  systems or the encryption of critical files.

- Performance issues: This can include slow system
  performance, unexpected reboots, or the unavailability of applications
  or services.

- User complaints: This can include complaints about unusual activity on
  systems, problems logging in, or missing files.

It is important to note that no single pattern of behavior is
conclusive. However, the presence of multiple patterns of behavior can
indicate a high probability that a cyber-attack has occurred.

Here are some additional tips for identifying patterns of behavior that
confirm a cyber-attack:

- Look for changes in behavior over time. For example, a sudden increase
  in network traffic may not be suspicious on its own, but if it is
  sustained over a period of time, it may be indicative of a
  cyber-attack.

- Correlate data from multiple sources. For example, you can correlate
  network traffic data with endpoint logs to identify unusual activity.

- Use threat intelligence feeds. Threat intelligence feeds can provide
  information about known patterns of behavior associated with
  cyber-attacks.

By following these tips, you can identify patterns of behavior that
confirm a cyber-attack has occurred and take steps to remediate the
attack and prevent future attacks.

#### how automated investigation and response in Microsoft 365 Defender works?

Automated investigation in Microsoft 365 Defender uses a combination of
machine learning, analytics, and threat intelligence to automate the
investigation of security alerts and incidents. This can help security
teams to save time and respond to incidents more quickly and
effectively.

When an alert or incident is triggered, Microsoft 365 Defender gathers
data from a variety of sources, including endpoints, networks, security
appliances, and Microsoft 365 services. This data is then analyzed using
machine learning and analytics to identify the root cause of the alert
or incident, the scope of the impact, and the potential remediation
steps.

Microsoft 365 Defender also uses threat intelligence to enrich its
investigation results. Threat intelligence provides information about
known malware threats, such as indicators of compromise (IOCs) and
attack patterns. This information can help Microsoft 365 Defender to
identify and investigate threats more effectively.

Once the investigation is complete, Microsoft 365 Defender provides a
report that summarizes the findings and recommends remediation steps.
The report also includes links to additional resources, such as
Microsoft security documentation and threat intelligence feeds.

Here are some of the benefits of using automated investigation in
Microsoft 365 Defender:

- **Reduced workload for security teams:** Automated investigation can
  help security teams to save time by automating many of the tasks
  involved in investigating security alerts and incidents. This allows
  security teams to focus on more complex tasks, such as strategic
  planning and incident response.

- **Improved response times:** Automated investigation can help security
  teams to respond to incidents more quickly by automating the initial
  stages of the investigation process. This can help to mitigate the
  damage caused by the incident and reduce the risk of further attacks.

- **Increased accuracy:** Automated investigation can help to improve
  the accuracy of incident investigations by using machine learning and
  analytics to identify patterns and trends that may be difficult or
  impossible for humans to identify.

- **Reduced costs:** Automated investigation can help to reduce the
  costs associated with incident response by reducing the workload for
  security teams and improving response times.

Overall, automated investigation in Microsoft 365 Defender is a powerful
tool that can help security teams to improve their security posture and
protect their organizations from threats.

#### Could you please share the real life or practical use cases of Automated investigation and response feature in Microsoft 365 Defender?

Sure. Here are some real-life and practical use cases of the Automated
Investigation and Response (AIR) feature in Microsoft 365 Defender:

<span class="mark">**Use case 1:** Detecting and responding to phishing
attacks</span>

Phishing attacks are one of the most common types of cyberattacks. They
involve sending fraudulent emails or messages to users in an attempt to
trick them into revealing sensitive information, such as passwords or
credit card numbers.

Microsoft 365 Defender's AIR feature can be used to automate the
detection and response to phishing attacks. For example, AIR can be
configured to automatically investigate any emails that are reported as
phishing by users. AIR can then gather data about the email, such as the
sender address, subject line, and body content. AIR can also analyze the
email for any known phishing indicators of compromise (IOCs).

If AIR determines that the email is a phishing attack, it can take a
number of actions, such as quarantining the email, marking it as spam,
or notifying the user. AIR can also be configured to automatically block
the sender's email address.

<span class="mark">**Use case 2:** Investigating and responding to
malware infections</span>

Malware infections can have a significant impact on organizations,
causing damage to systems and data, and disrupting operations.

Microsoft 365 Defender's AIR feature can be used to automate the
investigation and response to malware infections. For example, AIR can
be configured to automatically investigate any devices that are flagged
as infected with malware. AIR can then gather data about the device,
such as the operating system, installed applications, and recent
activity. AIR can also analyze the device for any known malware hashes
or other IOCs.

If AIR determines that the device is infected with malware, it can take
a number of actions, such as removing the malware, isolating the device
from the network, or notifying the user. AIR can also be configured to
automatically deploy patches for any known vulnerabilities that were
exploited by the malware.

<span class="mark">**Use case 3:** Responding to ransomware
attacks</span>

Ransomware attacks involve encrypting an organization's data and
demanding a ransom payment in exchange for the decryption key.
Ransomware attacks can be very costly and disruptive for organizations.

Microsoft 365 Defender's AIR feature can be used to automate the
response to ransomware attacks. For example, AIR can be configured to
automatically isolate any devices that are infected with ransomware from
the network. This can help to prevent the ransomware from spreading to
other devices.

AIR can also be used to restore data from backups in the event that the
ransomware attack is successful. AIR can also be configured to
automatically notify law enforcement and other relevant authorities of
the ransomware attack.

<span class="mark">**Use case 4:** Conducting proactive security
investigations</span>

Microsoft 365 Defender's AIR feature can also be used to conduct
proactive security investigations. For example, AIR can be used to
investigate security incidents that have not yet triggered any alerts.
AIR can also be used to investigate specific threats, such as advanced
persistent threats (APTs).

By using AIR to conduct proactive security investigations, organizations
can identify and respond to threats before they cause any damage.

These are just a few examples of the many ways that Microsoft 365
Defender's AIR feature can be used to improve security posture and
protect organizations from threats.

#### What is the minimum requirement for implementation of Microsoft 365 Defender?

The minimum requirements for the implementation of Microsoft 365
Defender are as follows:

- A Microsoft 365 subscription that includes Microsoft 365 Defender.

- Supported operating systems and platforms.

- Supported devices.

- The latest version of the Microsoft 365 Defender agent installed on
  all supported devices.

- A network connection to the Microsoft 365 cloud.

Here is a more detailed breakdown of each requirement:

Microsoft 365 subscription that includes Microsoft 365 Defender

Microsoft 365 Defender is available as part of the following Microsoft
365 subscriptions:

- Microsoft 365 E5

- Microsoft 365 E5 Security

- Microsoft 365 Business Premium

- Microsoft 365 Defender for Business

Supported operating systems and platforms

Microsoft 365 Defender supports the following operating systems and
platforms:

- Windows 10 and 11

- Windows Server 2012 and later

- macOS

- Linux

- Android

- iOS

Supported devices

Microsoft 365 Defender supports the following devices:

- Computers

- Laptops

- Mobile devices

- Servers

Microsoft 365 Defender agent

The Microsoft 365 Defender agent is a software application that is
installed on all supported devices. The agent collects data from devices
and sends it to the Microsoft 365 cloud for analysis and correlation.

Network connection to the Microsoft 365 cloud

Microsoft 365 Defender requires a network connection to the Microsoft
365 cloud. The agent uses this connection to send data to the Microsoft
365 cloud and to receive updates and security intelligence.

If you meet all of the above requirements, you are ready to implement
Microsoft 365 Defender. For more information, please see the Microsoft
365 Defender documentation:
<https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/?view=o365-worldwide>.

What does the shared responsibility model in cloud mean?

How would you secure the East-West traffic in the cloud?

How would you secure the traffic between cloud services?

Who is responsible for securing the data and users when using SaaS or
IaaS services?

What are some of the security risks for the organization when using
Microsoft Teams?

Why does it take so long for organizations to move their workloads to
the cloud?

Can you name the advantages of cloud-based databases?

Can you name a few security software tools that can help you monitor
cloud environments?

What are things to take into consideration when using public cloud
instead of private?

#### What type of devices we can onboard on Microsoft 365 Defender?

You can onboard the following types of devices on Microsoft 365
Defender:

Windows 10 and 11 devices

macOS devices

Linux devices

Android devices

iOS devices

You can also onboard cloud workloads, such as Azure Active Directory,
Exchange Online, and Microsoft Teams.

#### Can we onboard network devices on Microsoft 365 Defender such as router switches, network appliances?

No, you cannot directly onboard network devices, such as routers,
switches, and network appliances on Microsoft 365 Defender.

Microsoft 365 Defender is designed to protect endpoints, such as
Windows, macOS, Linux, Android, and iOS devices, as well as cloud
workloads.

However, there are a few ways to get network device data into Microsoft
365 Defender:

- Use a third-party security information and event management (SIEM)
  tool to collect data from your network devices and then forward that
  data to Microsoft 365 Defender.

- Use a network device monitoring (NDM) tool to collect data from your
  network devices and then forward that data to a SIEM tool or directly
  to Microsoft 365 Defender.

- Use a Microsoft Defender for Endpoint sensor on a network device that
  is connected to your production network. This sensor can collect data
  from the network device and send it to Microsoft 365 Defender.

Microsoft Defender for Endpoint also offers a feature called Network
Device Discovery and Vulnerability Management. This feature can be used
to discover network devices on your network and assess them for
vulnerabilities. However, this feature does not provide the same level
of protection as onboarding the network devices directly onto Microsoft
365 Defender.

If you are considering using Microsoft 365 Defender to protect your
network devices, you should carefully evaluate your needs and
requirements. You should also consider the different ways to get network
device data into Microsoft 365 Defender and choose the option that is
best for your organization.

#### Comparison between CSPM, SIEM, SOAR, EDR and XDR

EDR (Endpoint Detection and Response) and XDR (Extended Detection and
Response) are both security solutions that help organizations detect and
respond to threats. However, there are some key differences between the
two.

EDR is focused on protecting endpoints, such as laptops, desktops, and
mobile devices. It collects data from endpoints, such as logs and
events, and uses this data to identify and respond to threats. EDR
solutions typically include features such as anomaly detection, threat
hunting, and incident response.

XDR is a more comprehensive security solution that extends beyond
endpoints to include other data sources, such as networks, cloud
environments, and security tools. XDR solutions collect data from all of
these sources and correlate it to identify and respond to threats. XDR
solutions typically include features such as unified visibility, threat
hunting, and automated response.

SIEM (Security Information and Event Management), SOAR (Security
Orchestration, Automation, and Response), EDR (Endpoint Detection and
Response), and XDR (Extended Detection and Response) are all security
solutions that can help organizations detect and respond to threats.
However, each solution has its own unique focus and capabilities.

**SIEM** collects and analyses logs and events from a variety of
sources, such as networks, servers, and applications. This data can be
used to identify suspicious activity and potential threats. SIEM
solutions typically include features such as log aggregation, event
correlation, and anomaly detection.

**SOAR** automates security workflows, such as incident response, threat
hunting, and remediation. This can help security teams to improve their
efficiency and effectiveness. SOAR solutions typically include features
such as playbooks, case management, and integrations with other security
tools.

**EDR** collects and analyses data from endpoints, such as laptops,
desktops, and mobile devices. This data can be used to identify
suspicious activity and potential threats. EDR solutions typically
include features such as behavioral analysis, threat hunting, and
incident response.

**XDR** extends EDR to include other data sources, such as networks,
cloud environments, and security tools. This allows XDR solutions to
provide a more complete view of the threat landscape and to identify
threats that may not be visible to EDR solutions alone. XDR solutions
typically include features such as unified visibility, threat hunting,
and automated response.

Here is a table summarizing the key differences between SIEM, SOAR, EDR,
and XDR:

Here is a table summarizing the key differences between EDR and XDR:

| **Feature** | **EDR** | **XDR** |
|----|----|----|
| Scope | Endpoints | Endpoints, networks, cloud environments, and security tools |
| Data sources | Endpoint logs and events | Endpoint logs and events, network traffic, cloud logs, and security tool alerts |
| Capabilities | Anomaly detection, threat hunting, incident response | Unified visibility, threat hunting, automated response |

| **Feature** | **SIEM** | **SOAR** | **EDR** | **XDR** |
|----|----|----|----|----|
| Focus | Log and event analysis | Security orchestration and automation | Endpoint detection and response | Extended detection and response |
| Data sources | Various sources, such as networks, servers, applications, and endpoints | Various sources, such as security tools, ticketing systems, and CRM systems | Endpoints | Various sources, such as endpoints, networks, cloud environments, and security tools |
| Capabilities | Log aggregation, event correlation, anomaly detection | Playbooks, case management, integrations with other security tools | Behavioral analysis, threat hunting, incident response | Unified visibility, threat hunting, automated response |

<img src="media/image2.png" style="width:9.69306in;height:2.34097in" />

**Which solution is right for you?**

The best solution for your organization will depend on your specific
needs and requirements. If you are primarily concerned with protecting
your endpoints, then an EDR solution may be sufficient. However, if you
want a more comprehensive security solution that can protect all of your
assets, then an XDR solution may be a better option.

Here are some factors to consider when choosing between EDR and XDR:

- **Your budget**: XDR solutions are typically more expensive than EDR
  solutions. However, they offer more features and capabilities.

- **Your IT environment:** If you have a complex IT environment with a
  variety of data sources, then an XDR solution may be a better option.

- **Your security maturity:** If you have a mature security team and
  processes in place, then you may be able to get more value out of an
  XDR solution.

If you are not sure which solution is right for you, you should consult
with a security expert.

# SOAR with Automation Playbooks

Automation playbooks use logics apps for SOAR function in Sentinel.
Automation Rules is solution that runs playbooks as a response of
incidents.

- Configure rules and incidents to trigger playbooks

- Create Sentinel playbooks

- Use playbooks across Microsoft Defender solutions

- Use playbooks to manage incidents

- Use playbooks to remediate threats

[**https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow**](https://learn.microsoft.com/en-us/azure/logic-apps/quickstart-create-example-consumption-workflow)

[**https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents**](https://learn.microsoft.com/en-us/azure/sentinel/tutorial-respond-threats-playbook?tabs=LAC%2Cincidents)

<span class="mark">How to run playbook manually on alert in
incident?</span>

- Incident page--\>Select incident --\> View full details

- In alerts tab --\> Click on alert on which you want to run playbook

- Click view playbooks and select playbook to run from list of available
  playbooks on subscription

<span class="mark">Create playbook that uses logic app to communicate
with other systems and services via API calls to a known, commonly used
products or services. Which connector we should configure?</span>

**Managed connector**: A set of actions and triggers that wrap around
API calls to a particular product or service.

<span class="mark">Your manager wants to send messages to Security
channel whenever intended sign-in from suspicious IP address occurs.
What solution needs to be used?</span>

- Create Playbook and assign it to incident

- Do not use workbook

- Do not use Microsoft Graph

<span class="mark">How to copy exiting playbook?</span> Clone

<span class="mark">How to update or make changes to playbook?</span>
Edit

<span class="mark">If automation playbook is not running, while
troubleshooting you notice that playbook has trigger kind of not
initialized, what to do?</span> Add triggers or actions to play book

 

# Threat Detection

**How to create rule that runs every hour and stops running if single
alert is generated?**

On Analytics rule wizard select - Run query every 1 hour (Query
scheduling), Enable Stop running query after alert is generated.
(Suppression)

** **

**How to identify origin of cyber-attack and potential data loss?** Use
analytic rule in sentinel

** **

**How to identify RDP connection activity that unusual for your
environment through Sentinel?**

"Enable anomalous RDP login detection rules" Pre-requisites for this
rule are: Select event set other than "None" and Collect security events
or Windows security events with Event ID-4624

**Create analytic rule which will alert the IT coordinator when user
creates Storage Account:** AzureActivity \| where OperationName ==
"Create Storage account" \| where ActivityStatus == "Succeeded"

**Create a query to view all deleted operations performed in Sentinel
Workspace:** AzureActivity \| where OperationNameValue contains
"SecurityInsights" \| where OperationName contains "Delete" \| where
ActivityStatusValue contains "Succeeded"

**Which solution provides data for manager about creation of new
roles?** Use SecurityIncident table in sentinel.

**How to group alerts in incident with respect to severity or entity in
analytics rules?** Select grouping alerts in to single incident if
selected entities match.

**How to create rule that runs every hour and stops running if single
alert is generated?** On Analytics rule wizard select - Run query every
1 hour (Query scheduling), Enable Stop running query after alert is
generated. (Suppression)

 

**How to identify origin of cyber-attack and potential data loss?** Use
analytic rule in sentinel

 

**How to identify RDP connection activity that unusual for your
environment through Sentinel**? "Enable anomalous RDP login detection
rules" Pre-requisites for this rule are: Select event set other than
"None" and Collect security events or Windows security events with Event
ID-4624

 

**Create an analytic rule which will alert the IT coordinator when user
creates Storage Account:** AzureActivity \| where OperationName ==
"Create Storage account" \| where ActivityStatus == "Succeeded"

 

<span class="mark">Create a query to view all deleted operations
performed in Sentinel Workspace</span>: AzureActivity \| where
OperationNameValue contains "SecurityInsights" \| where OperationName
contains "Delete" \| where ActivityStatusValue contains "Succeeded"

<span class="mark">Which solution provides data for manager about
creation of new roles?</span> Use SecurityIncident table in sentinel.

## Analytics Rules

Analytics rules are used for threat detection; Anomaly Rules used to
identify anomalous behaviour. KQL queries are used to detect issues.
Analyses data from several sources to identify correlations and
anomalies. Using analytic rules, we can trigger alerts based on attack
techniques. With proper analytic rule you can get insights in to where
attack is originated and what resources are compromised, data lost,
timeline of incident.

- design and configure analytics rules

- create custom analytics rules to detect threats

- activate Microsoft security analytics rules

- configure connector provided scheduled queries

- configure custom scheduled queries

- define incident creation logic

**<span class="mark">Analytics Rules Filters</span>**

- Severity

- Rule Type

- Tactics

- Data Sources

**<span class="mark">Analytics Rules Types</span>**

Fusion Rules /Built-in rules

Identify suspicious activity with respect to Cyber Kill Chain, Common
attack detection scenarios by Fusion Rules are Data Exfiltration, Data
Destruction, Denial of Service, Lateral movement, Ransomware.

Machine Learning Rules /Built-in rules

Behaviour analytics like SSH, RDP

Microsoft Security Rules /Built-in rules

Microsoft Defender platforms

Scheduled Rules / Custom rules

Custom rules created with KQL queries. Create Analytic rules from
templates, templates are stored in Github:

- Define KQL

- Let schedule to run alert

- Provide automated action – Associate rule with Microsoft Sentinel
  Playbook

## Analytics

### What type of analytics we need to create in SIEM?

The type of analytics you need to create in SIEM will depend on your
specific needs and requirements. However, some common analytics that can
be useful include:

- User and entity behavior analytics (UEBA): UEBA uses machine learning
  to identify anomalies in user and entity behaviour. This can be
  helpful for detecting insider threats and advanced persistent threats
  (APTs).

- Network traffic analytics: Network traffic analytics can be used to
  identify suspicious traffic patterns, such as unusual spikes in
  traffic or traffic to known malicious IP addresses.

- Threat intelligence analytics: Threat intelligence analytics can be
  used to correlate security events with known threats and
  vulnerabilities. This can help you to identify threats that may not be
  detected by traditional security solutions.

- Risk analytics: Risk analytics can be used to assess the risk of
  different security threats to your organization. This information can
  be used to prioritize security initiatives and make informed decisions
  about security investments.

In addition to these common analytics, you may also want to create
custom analytics to meet your specific needs. For example, you could
create analytics to track security events for a particular application
or system, or to monitor the performance of your security team.

When creating analytics, it is important to consider the following
factors:

- Data: What data will you be using to create the analytics? How will
  you prepare the data?

- Purpose: What is the purpose of the analytics? What information do you
  want to convey?

- Audience: Who will be using the analytics? What is their level of
  technical expertise?

By carefully considering these factors, you can create analytics that
will help you to get the most out of your SIEM solution.

Here are some specific examples of how analytics can be used in SIEM:

- Identify insider threats: UEBA can be used to identify insider threats
  by looking for anomalies in user behavior, such as unusual login times
  or access to sensitive data.

- Detect APTs: UEBA and network traffic analytics can be used to detect
  APTs by looking for suspicious patterns in user and network activity.

- Identify malicious traffic: Network traffic analytics can be used to
  identify malicious traffic, such as traffic to known malicious IP
  addresses or traffic that is associated with known malware.

- Correlate security events with known threats: Threat intelligence
  analytics can be used to correlate security events with known threats
  and vulnerabilities. This can help you to identify threats that may
  not be detected by traditional security solutions.

- Assess the risk of security threats: Risk analytics can be used to
  assess the risk of different security threats to your
  organization. This information can be used to prioritize security
  initiatives and make informed decisions about security investments.

By using analytics effectively, you can get more value out of your SIEM
solution and improve your overall security posture.

## Workbooks

Workbooks used for threat detection by analysing and interpreting data.
Workbooks used to visualize data within Sentinel workspace though graph,
trends, charts, summary dashboards by using KQL queries.

**Workbooks Features**

- Visualize data within Sentinel

- Graph, trends, charts, summary dashboards.

- Each dashboard is built by using KQL

- Built-in workbooks, recommendations.

**Use Microsoft Sentinel workbooks to analyse and interpret data**

- activate and customize Microsoft Sentinel workbook templates

- create custom workbooks

- configure advanced visualizations

- view and analyse Microsoft Sentinel data using workbooks

- track incident metrics using the security operations efficiency
  workbook

## Watchlist

[Sentinel Watchlist Automation Using Logic Apps - Microsoft Community
Hub](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/sentinel-watchlist-automation-using-logic-apps/ba-p/3718753)

## Threat Detection using XDR

How does XDR use analytics and machine learning to detect threats?

Extended detection and response (XDR) solutions use analytics and
machine learning to detect threats in a number of ways.

**Analytics**

XDR solutions collect data from a variety of sources, including
endpoints, networks, and cloud environments. This data is then analyzed
using a variety of techniques, such as:

- **Correlation:** XDR solutions correlate data from different sources
  to identify patterns and relationships that may indicate a threat. For
  example, an XDR solution might correlate data from endpoints and the
  network to identify a device that is communicating with a known
  malicious IP address.

- **Statistical analysis:** XDR solutions use statistical analysis to
  identify anomalies in the data that may indicate a threat. For
  example, an XDR solution might use statistical analysis to identify a
  sudden increase in network traffic or a change in the behavior of a
  user account.

- **Threat intelligence:** XDR solutions use threat intelligence to
  identify known threats and their indicators of compromise (IOCs). For
  example, an XDR solution might use threat intelligence to identify a
  new malware variant or a new phishing campaign.

**Machine learning**

XDR solutions use machine learning to train models that can identify
threats with a high degree of accuracy. These models are trained on
large datasets of historical security data, which includes both known
threats and benign activity. Once trained, these models can be used to
identify new threats that have not been seen before.

For example, an XDR solution might use machine learning to train a model
that can identify malware samples. This model could then be used to scan
new files for malware, even if the files are not known to be malicious.

XDR solutions can also use machine learning to automate the
investigation and response to threats. For example, an XDR solution
might use machine learning to identify the root cause of a threat or to
recommend remediation actions.

**Benefits of using XDR analytics and machine learning to detect
threats**

XDR solutions offer a number of benefits for detecting threats,
including:

- **Improved visibility:** XDR solutions collect data from a variety of
  sources, which gives them a more complete view of the security
  landscape. This improved visibility can help to identify threats that
  might not be visible to traditional security solutions.

- **Reduced false positives:** XDR solutions use analytics and machine
  learning to reduce the number of false positives. This can help
  security teams to focus on the most important threats and to reduce
  the time they spend investigating false positives.

- **Faster detection and response:** XDR solutions can automate the
  detection and response to threats. This can help security teams to
  respond to threats more quickly and effectively.

Overall, XDR analytics and machine learning can help organizations to
detect and respond to threats more effectively.

# Alerts

**How to group alerts in incident with respect to severity or entity in
analytics rules?**

Select grouping alerts in to single incident if selected entities match

**Improve Incident Response with Alerting on Azure**

<https://docs.microsoft.com/en-us/learn/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts>

<https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/3-enable-and-configure-app-service-application-logging-using-the-azure-portal>

<https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/5-view-live-application-logging-activity-with-the-log-streaming-service-using-azure-cli>

<https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service/7-retrieve-application-log-files-from-an-application-using-azure-cli-and-kudu>

<https://docs.microsoft.com/en-us/learn/modules/secure-aspnet-core-identity/4-customize-identity?pivots=sql>

<https://docs.microsoft.com/en-us/learn/modules/control-authentication-with-apim/3-exercise-create-subscriptions-in-apim>
** **

**Analyze alert in SIEM**

**Analyze alert in XDR**

To analyse alerts in XDR, you can follow these steps:

1.  **Gather context**. Before you start analysing an alert, it is
    important to gather as much context as possible. This may include
    information about the alert itself, such as the time it was
    triggered, the severity, and the source. You should also gather
    information about the environment in which the alert was
    triggered, such as the affected systems and networks.

2.  **Correlate data.** XDR solutions can correlate data from a variety
    of sources, such as endpoints, networks, and security
    appliances. This allows you to get a complete picture of the threat
    and to identify the root cause of the alert.

3.  **Identify the threat.** Once you have gathered context and
    correlated data, you can begin to identify the threat. This may
    involve using threat intelligence feeds or machine learning
    algorithms.

4.  **Assess the impact.** Once you have identified the threat, you need
    to assess the impact. This may involve determining the scope of the
    attack, the systems and data that have been affected, and the
    potential damage to the organization.

5.  **Take action.** Once you have assessed the impact, you need to take
    action to remediate the threat and prevent future attacks. This may
    involve isolating affected systems, removing malware, or patching
    vulnerabilities.

6.  **Use filters**. XDR solutions allow you to filter alerts based on a
    variety of criteria, such as the severity, source, and type of
    alert. This can help you to quickly identify the most important
    alerts and to prioritize your investigations.

7.  **Use threat intelligence feeds**. Threat intelligence feeds can
    provide information about known threats, such as indicators of
    compromise (IOCs) and attack patterns. This information can help you
    to identify and investigate threats more effectively.

8.  **Use machine learning algorithms**. Machine learning algorithms can
    be used to identify patterns and trends in alert data. This can help
    you to identify threats that may be difficult or impossible to
    identify manually.

9.  **Collaborate with other teams**. XDR solutions can help you to
    collaborate with other teams, such as security operations and
    incident response. This can help you to investigate and respond to
    threats more effectively.

# The End

How would you use XDR to detect and respond to a phishing attack?

How would you use XDR to detect and respond to an insider threat?

How would you use XDR to detect and respond to an attack on a
cloud-based application?

How would you use XDR to detect and respond to an attack on a supply
chain partner?

What are the different ways to use XDR to automate security tasks?

How can XDR be used to improve threat intelligence sharing?

How can XDR be used to support zero trust security?

What are the ethical considerations of using XDR?

What is your favorite XDR feature?

What is the most challenging XDR implementation you have worked on?

What advice would you give to someone who is new to XDR?

What XDR resources would you recommend to someone who wants to learn
more about the technology?

How to perform incident investigation on Microsoft 365 Defender

What are the features of Microsoft 365 Defender?

What is Attack surface reduction and how to perform it on Microsoft 365
Defender?

<https://www.testpreptraining.com/tutorial/ms-101-microsoft-365-mobility-and-security-interview-questions/>

<https://www.testpreptraining.com/blog/top-60-microsoft-security-engineer-interview-questions/>
