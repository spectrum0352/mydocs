References:
<https://docs.microsoft.com/en-us/learn/paths/tm-threat-modeling-fundamentals/>

# Introduction

**Threat modelling** is a proactive security process that helps
organizations identify, assess, and mitigate potential security risks
early in the development lifecycle. It involves analysing a system,
application, or IT environment from an attacker's perspective to uncover
vulnerabilities and address them before they can be exploited. A
**threat model** is a structured framework used to identify, quantify,
and mitigate security risks, serving as a blueprint for understanding
potential threats and improving overall security.

**Who can perform threat modelling?**

Anyone with a good understanding of the system and basic security
knowledge can contribute, including developers, security analysts, and
project managers. Incorporating threat modelling into the development
lifecycle helps organizations build more resilient and secure systems.

## Purpose

- **Understand the System:** Define what is being analysed.

- **Identify Potential Threats:** Determine what could go wrong.

- **Mitigate Risks:** Plan how to address identified threats.

- **Evaluate Effectiveness:** Assess if security measures were successful.

## Benefits 

- **Early Threat Detection:** Identifies security weaknesses early,
  reducing costly fixes later.

- **Risk Reduction:** Proactively mitigates vulnerabilities, lowering
  the risk of cyberattacks.

- **Improved Communication:** Enhances collaboration between developers
  and security teams for a shared understanding of risks.

- **Proactive Security:** Addresses threats before they become real
  problems.

- **Risk Prioritization:** Focuses security efforts on the most critical
  threats.

- **Enhanced System Security:** Leads to the development of more secure
  applications and IT environments.

## Best Practices 

- **Early Integration:** Incorporate threat modelling in the early
  stages of the Software Development Lifecycle (SDLC).

- **Diverse Involvement:** Engage developers, security professionals,
  and business stakeholders for a well-rounded perspective.

- **Context Awareness:** Understand business goals and identify critical
  assets.

- **Structured Methodology:** Use established frameworks like STRIDE,
  PASTA, or Trike.

- **Asset & Attack Vector Identification:** Identify valuable assets and
  potential attack methods.

- **Risk Assessment:** Evaluate the impact and likelihood of each
  threat.

- **Prioritization:** Focus on mitigating the most critical risks first.

- **Continuous Review:** Regularly update the threat model as the system
  evolves.

- **Documentation & Communication:** Clearly document findings and share
  them with relevant stakeholders.

# Process

Threat modeling is a technique used by anyone who knows how their system
works and has a working knowledge of information security.

The technique is broken down into four different phases:

- **Design**: Gather all requirements for your system and create data
  flow diagram.

- **Break:** Apply threat modelling framework to data flow diagram and
  find potential security issues.

- **Fix:** Decision how to approach each issue with right combination of
  security controls.

- **Verify:** Verify requirements are met, issues are found, and
  security controls are implemented.

 

 

# STAR Technique

- S = Situation − (recall an incident in your life that suits the
  situation)

- T = Task − (recall an incident in your life that suits the task)

- A = Action − (mention the course of action you opted to address the
  situation or task)

- R = Result − (mention the result of your action and the outcome)

 

**When to use threat modeling?**

Use threat modeling whenever you design new systems or update existing
ones.

 

**Who can threat model?**

Anyone with a working knowledge of the system and a basic understanding
of security can work with threat modeling.

 

**Threat Modelling Best Practices**

- Make threat modelling a priority during system development.

- Do not to view applications and systems in isolation from one another.

- This result is a comprehensive attack surface which the CISO can use
  to understand the entire threat portfolio across the enterprise

- Do not focus too much on whatever threats are in the headlines

- Do not forget that your users can be some of the biggest inadvertent
  threats of all.

- Do not forget that a threat model should be a living document and
  needs constant updating.

 

 

## Threat Modelling Approaches

Threat Identification approaches:

- Focused on Assets: Protect valuable assets

- Focused on Attackers: Protect the things that attackers want to attack

- Focused on Software: Protect the software

- Individual Threats: Be cautious of Contractors and Trusted Partners

 

**Proactive**

- Performed before and while the system is being implemented

- Predicting threats and designing defences in advance

- More cost effective and more successful

- Security Development Lifecycle

  - Reduce number of coding defects

  - Reduce severity of remaining defects

 

**Reactive**

- Performed after the system has been implemented

- Less effective but more cost effective than redesign

- E.g., penetration testing, source code review, fuzz testing

- Fuzz Testing: Random invalid input is fed to a program. Attempts to
  find previously undetected flaws

# Process

**Core Steps:**

1.  **Identify:** Define the system, its assets, and potential threats.

2.  **Analyze:** Create a data-flow diagram to visualize the system and
    identify vulnerabilities.

3.  **Assess:** Evaluate the identified threats based on their
    likelihood and impact.

4.  **Mitigate:** Develop strategies to address the identified risks.

**Additional Considerations:**

- **Decomposition:** Break down the system or infrastructure into
  smaller components to understand its vulnerabilities more effectively.

- **Threat Determination:** Identify potential threats, both known and
  unknown, that could target the system or its assets.

- **Countermeasures and Mitigations:** Develop strategies to address
  identified threats, including security controls and system design
  modifications.

- **Threat Ranking:** Prioritize threats based on their likelihood and
  impact to focus on the most critical risks.

**Common Frameworks:**

- **STRIDE:** Spoofing, Tampering, Repudiation, Information Disclosure,
  Denial-of-Service, Elevation of Privilege

- **PASTA:** People, Assets, Threats, Strategies, Attacks

**Key Considerations:**

- **Asset Identification:** Clearly define what you are protecting.

- **Threat Actor Identification:** Consider both external and internal
  threats.

- **Attack Vector Identification:** Identify potential vulnerabilities
  that could be exploited.

- **Risk Assessment:** Evaluate the likelihood and impact of each
  threat.

- **Mitigation Strategy Development:** Implement appropriate security
  measures to address risks.

By following these steps and considering the additional factors,
organizations can effectively identify and mitigate security threats to
their systems and data.

Key Points:

- It helps prioritize threats based on likelihood and potential impact.

- Threat modelling can be applied to both new and existing systems.

- Threat modelling is a collaborative process to strengthen system
  security.

# STRIDE

STRIDE: A Threat Modelling Framework

STRIDE is a threat modelling framework developed by Microsoft that helps
categorize potential threats to a system based on the CIA triad.

By using STRIDE and following these best practices, organizations can
develop a more comprehensive understanding of potential security threats
and implement effective mitigation strategies.

Each letter in STRIDE represents a threat category and how it violates a
CIA triad principle:

- **Spoofing (Authenticity):** Impersonating another user or system to
  gain unauthorized access (violates Authenticity).

- **Tampering (Integrity):** Unauthorized modification of data (violates
  Integrity).

- **Repudiation (Non-repudiation):** Denying an action you performed
  (violates non-repudiation).

- **Information Disclosure (Confidentiality):** Unauthorized access to
  confidential information (violates Confidentiality).

- **Denial-of-Service (DoS) (Availability):** Preventing legitimate
  users from accessing a system or resource (violates Availability).

- **Elevation of Privilege (Authorization):** Gaining unauthorized
  access to higher-level privileges (violates Authorization).

# STRIDE

STRIDE is an acronym for the threat modelling system. It helps in
categorizing all cyberattacks into the below techniques: Spoofing,
Tampering, Repudiation, Information disclosure, Denial of service (DoS),
Elevation of privilege

Each category of STRIDE violates a specific property from variations of
the CIA triad:

- **Spoofing**: Impersonating another person or computer to gain access,
  which violates <u>authenticity</u>.

- **Tampering**: Unauthorized changes in data, code, configuration,
  which violates <u>integrity</u>.

- **Repudiation** means making it impossible to link an action you
  performed to you, which violates <u>non-repudiability.</u> Denying
  having done an action

- **Information disclosure:** Revelation of controlled information to
  unauthorized person or entity, which violates <u>confidentiality</u>.

- **Denial of service:** Prevents the use of an asset, which
  violates <u>availability</u>.

- **Elevation of privilege:** Gain capabilities without proper
  authorization. which violates <u>authorization</u>.

## **Benefits**

- **Systematic Approach:** Provides a structured way to identify and
  categorize threats.

- **Improved Communication:** Uses a common language for discussing
  security risks with different stakeholders.

- **Comprehensive Analysis:** Considers various attack vectors that
  could violate CIA triad principles.

# QnA

How would you permanently remove the threat of data falling into the
wrong hands?

There is no absolute way to permanently remove the threat of data
falling into the wrong hands. However, there are a number of things that
can be done to mitigate the risk:

- **Encrypt the data:** Encryption is one of the most effective ways to
  protect data from unauthorized access. When data is encrypted, it is
  converted into a format that can only be read by those with the
  decryption key. This makes it very difficult for attackers to access
  the data, even if they can steal it.

- **Use strong access controls:** Access controls restrict who can
  access data and what they can do with it. Strong access controls can
  help to prevent unauthorized users from accessing data, and they can
  also help to limit the damage that can be done if data is accessed by
  unauthorized users.

- **Monitor data access:** Monitoring data access can help to identify
  suspicious activity and prevent data breaches. By monitoring who is
  accessing data and when, organizations can identify potential threats
  and take action to mitigate them.

- **Educate employees about security:** Employees are often the weakest
  link in the security chain. It is important to educate employees about
  security best practices and how to identify and report suspicious
  activity.

- **Have a plan for responding to data breaches:** Even with the best
  security in place, data breaches can still happen. It is important to
  have a plan for responding to data breaches so that the organization
  can minimize the damage and get back to business as quickly as
  possible.

- **Use multiple layers of security:** No single security measure is
  perfect. It is important to use multiple layers of security to protect
  data. This may include encryption, access controls, monitoring,
  employee education, and a plan for responding to data breaches.

Why are companies paying million dollars for bugs/vulnerabilities?

Companies want to take benefit of freelance bug bounty hunters, to check
assets with different perspective. Companies are paying million dollars
for bugs/vulnerabilities for several reasons:

- **To protect their users and customers**. When a security
  vulnerability is discovered in a company's product or service, it puts
  their users and customers at risk of being attacked. By paying for bug
  bounties, companies can encourage researchers to find and report
  vulnerabilities so that they can be fixed before they are exploited by
  attackers.

- **To protect their reputation and brand**. A data breach or other
  security incident can damage a company's reputation and brand. By
  paying for bug bounties, companies can show their customers that they
  are taking security seriously and that they are committed to
  protecting their data.

- **To stay ahead of the competition.** Attackers are constantly
  developing new techniques and tools to exploit security
  vulnerabilities. By paying for bug bounties, companies can stay ahead
  of the competition and identify and fix vulnerabilities before they
  can be exploited.

- **To comply with regulations.** Many industries are subject to
  regulations that require them to protect their customers' data. By
  paying for bug bounties, companies can demonstrate that they are
  complying with these regulations.

What is the primary reason most companies have not fixed their
vulnerabilities?

The primary reason most companies have not fixed their vulnerabilities
is that it is difficult and expensive.

- **Complexity**: Software systems are becoming increasingly complex,
  making it difficult to identify and fix all vulnerabilities.

- **Cost**: Fixing vulnerabilities can be expensive, both in terms of
  the time and resources required.

- **Disruption**: Fixing vulnerabilities can sometimes disrupt business
  operations.

- **Lack of awareness:** Some companies may not be aware of the
  vulnerabilities in their systems.

- **Lack of priority**: Security is not always a top priority for
  companies, and fixing vulnerabilities may be deferred in favour of
  other initiatives.

Here are some specific examples of the challenges that companies face in
fixing vulnerabilities:

- **Legacy systems:** Many companies still use legacy systems that are
  no longer supported by the vendor. This makes it difficult to get
  patches for vulnerabilities in these systems.

- **Third-party software:** Companies rely on a wide range of
  third-party software, and they may not have the resources to test all
  of this software for vulnerabilities.

- **Supply chain attacks**: Attackers are increasingly targeting the
  software supply chain. This means that vulnerabilities in third-party
  software can be exploited to attack companies.

Despite the challenges, companies need to make fixing vulnerabilities a
priority. Vulnerabilities can be exploited by attackers to steal data,
launch ransomware attacks, or disrupt business operations.

Here are some tips for companies on how to fix their vulnerabilities:

- Identify and prioritize vulnerabilities: Use security tools and
  services to identify vulnerabilities in your systems. Prioritize
  vulnerabilities based on their risk and severity.

- Develop a patching plan: Create a plan for patching vulnerabilities in
  a timely and efficient manner.

- Test patches before deployment: Test patches before deploying them to
  production systems to avoid any disruptions.

- Keep systems up to date: Install security patches and updates as soon
  as they are released.

- Educate employees: Educate employees about security best practices and
  how to identify and report suspicious activity.

Can you name some of the emerging Cyber threats?

Ransomware, Continued Rise of Ai, Increased Attack on cloud services,
Covid phishing schemes, Insider Threats, Work from Home Attacks, Brute
Force Frustrations, Fileless frameworks, Front line phishing.

Explain security threat.

Security threat is defined as a risk which can steal confidential data
and harm computer systems as well as organization.

Give examples of non-physical threats.

Loss of sensitive information Loss or corruption of system data Cyber
security Breaches Disrupt business operations that rely on computer
systems Illegal monitoring of activities on computer systems.

How would you explain the threat of deep fakes in cyber security world?

Deepfakes are a major threat in the cybersecurity world because they can
be used to exploit human trust and manipulate people into revealing
sensitive information or taking actions that they would not otherwise
take.

For example, a deepfake video of a CEO instructing employees to transfer
money to a fraudulent account could trick employees into carrying out
the fraudulent transaction. Or, a deepfake audio recording of a customer
service representative asking a customer for their credit card
information could be used to steal the customer's credit card
information.

Deepfakes can also be used to launch phishing attacks. For example, a
deepfake email could be sent to a target pretending to be from a trusted
source, such as a bank or credit card company. The email could contain a
link to a phishing website that is designed to steal the target's login
credentials or other sensitive information.

Deepfakes can also be used to damage a company's reputation. For
example, a deepfake video of a company's CEO making false or offensive
statements could be used to damage the company's public image and brand.

Cybersecurity professionals are increasingly concerned about the threat
of deepfakes. There are a number of steps that organizations can take to
mitigate the risk of deepfakes, such as:

- Educating employees about deepfakes: Employees should be aware of the
  existence of deepfakes and how to identify them.

- Implementing strong cybersecurity controls: Organizations should
  implement strong cybersecurity controls to make it more difficult for
  attackers to create and distribute deepfakes.

- Using deepfake detection tools: There are a number of deepfake
  detection tools available that can help organizations to identify
  deepfakes.

- Monitoring social media and other online channels: Organizations
  should monitor social media and other online channels for deepfakes
  that may target their employees or customers.

By taking these steps, organizations can help to protect themselves from
the threat of deepfakes.

Here are some additional tips for protecting yourself from deepfakes:

- Be sceptical of any video or audio recording that you
  receive, especially if it is from someone you don't know well.

- If you receive a video or audio recording that seems suspicious, try
  to verify its authenticity by contacting the person who supposedly
  sent it to you.

- Be careful about clicking on links in emails or text messages, even if
  they seem to be from a trusted source.

- Keep your software and operating system up to date. Software updates
  often include security patches that can help to protect you from
  deepfakes and other cyber threats.

Why are internal threats often more successful than external threats?

Internal threats are often more successful than external threats because
they have a number of advantages:

- **Access**: Internal threats already have access to the organization's
  systems and networks, which gives them a significant advantage over
  external threats. This is because external threats must first find a
  way to penetrate the organization's security perimeter, which can be a
  difficult and time-consuming task.

- **Knowledge**: Internal threats have a deep understanding of the
  organization's systems and networks, as well as its business
  processes. This gives them the knowledge they need to carry out
  successful attacks.

- **Trust**: Internal threats are trusted members of the
  organization, which makes it difficult to detect and prevent their
  attacks. External threats, on the other hand, are often viewed with
  suspicion, which makes it more likely that their attacks will be
  detected and prevented.

Here are some specific examples of how internal threats can take
advantage of these advantages:

- Employee who has access to the company's customer database could steal
  customer data and sell it on the black market.

- Disgruntled employee could sabotage the company's systems or
  networks, causing significant damage and disruption.

- Employee who has been compromised by malware attack could give
  attacker access to company's systems and networks.

- Malicious insider could use their knowledge of the company's business
  processes to commit fraud or other crimes.

<span class="mark">Organizations can take several steps to mitigate the
risk of internal threats, such as:</span>

- **Implementing strong security controls:** Organizations should
  implement strong security controls to make it more difficult for
  internal threats to carry out attacks. This includes implementing
  access control measures, data encryption, and intrusion detection
  systems.

- **Educating employees about security:** Employees should be educated
  about security best practices and how to identify and report
  suspicious activity.

- **Creating a culture of security:** Organizations should create a
  culture of security where employees feel comfortable reporting
  suspicious activity without fear of retaliation.

Anonymous hackers are hacking into some critical infrastructure around
the world. Can you comment on how would they be doing this?

List a couple of tests that you would do to a network to identify
security flaws.

Anonymous hackers are hacking into critical infrastructure around the
world using a variety of methods, including:

- **Exploiting vulnerabilities in software and hardware.** Anonymous
  hackers are constantly looking for vulnerabilities in software and
  hardware that they can exploit to gain access to systems and
  networks. They may find vulnerabilities by reading security
  advisories, scanning networks for known vulnerabilities, or developing
  their own zero-day exploits.

- **Social engineering.** Anonymous hackers often use social engineering
  to trick people into revealing sensitive information or taking actions
  that they would not otherwise take. For example, they may send
  phishing emails that appear to be from a trusted source, or they may
  call people and impersonate someone from their IT department.

- **Supply chain attacks.** Anonymous hackers may target the supply
  chain of critical infrastructure providers in order to gain access to
  their systems and networks. For example, they may hack a software
  vendor and insert malicious code into their software, which would then
  be installed on the systems of the vendor's customers.

Once Anonymous hackers have gained access to a critical infrastructure
system, they can launch a variety of attacks, such as:

- **Denial-of-service (DoS) attacks:** DoS attacks can be used to
  overwhelm a system or network with traffic, making it unavailable to
  legitimate users.

- **Ransomware attacks:** Ransomware attacks can be used to encrypt a
  system's files, making them inaccessible until the victim pays a
  ransom.

- **Data breaches:** Data breaches can be used to steal sensitive
  data, such as customer records or financial information.

- **Sabotage:** Anonymous hackers can sabotage critical infrastructure
  systems by deleting data, modifying data, or disabling systems.

List out the types of cyber attackers

1.  Cybercriminals

2.  Hacktivists

3.  Insider threats

4.  State-sponsored attackers.

List out the types of sniffing attacks.

There are two main types of sniffing attacks: **passive sniffing** and
**active sniffing**.

- **Passive sniffing** involves monitoring network traffic without
  interfering with it. The attacker simply listens to the traffic and
  captures packets. This type of attack is difficult to detect, but it
  is also the least harmful.

- **Active sniffing** involves interfering with network traffic in order
  to capture packets. This type of attack is more difficult to execute,
  but it is also more harmful.

Here are some specific examples of sniffing attacks:

- **ARP poisoning:** ARP poisoning is a type of active sniffing attack
  that involves injecting malicious ARP packets into a network. This can
  cause devices on the network to send their traffic to the attacker
  instead of the intended destination.

- **MAC flooding:** MAC flooding is a type of active sniffing attack
  that involves sending a large number of MAC address frames to a
  network switch. This can cause the switch to become overloaded and
  start dropping packets.

- **DNS spoofing:** DNS spoofing is a type of active sniffing attack
  that involves intercepting DNS requests and redirecting them to
  malicious websites. This can cause users to be tricked into entering
  their login credentials or other sensitive information on a fraudulent
  website.

- **Man-in-the-middle (MITM) attacks:** MITM attacks involve
  intercepting communication between two parties and relaying it back
  and forth, pretending to be each party. This allows the attacker to
  eavesdrop on the communication and even modify it.

Can give me an example of supply chain attack?

Can you name a few recent security breaches? Name a few types of
security breaches.

Can you name some of the emerging cyber threats?

Can you name the types of security breaches and name some recent
security breaches?

Can you define what is APT?

Can you explain man-in-the middle attack?

Can you explain some ways cyber criminals are using services like
LinkedIn?

Can you explain some ways the attackers are using AI?

Explain any type of Wi-Fi Attack and how to prevent it.

What is a common method of disrupting enterprise systems?

 

Can you describe the role of security operations in the enterprise?

Can you give me a brief overview of the solution design?

Do you take a different approach to security architecture for a COTS vs
a custom solution?

Explain data leakage and give examples of some of the root causes.

Explain the objects of Basic web architecture? TIP: Different
organisations follow different models and networks. BE GENERIC. A basic
web architecture should contain a front ending server, a web application
server, a database server.

Have you architected a security solution that involved SaaS components?
What challenges did you face?

Have you designed security measures that span overlapping information
domains? Can you give me a brief overview of the solution?

Have you worked on a project in which stakeholders choose to accept
identified security risks that worried you? How did you handle the
situation?

How do you ensure that a design achieves regulatory compliance?

How do you ensure that a design anticipates human error?

List a couple of tests that you would do to a network to identify
security flaws.

there any weaknesses associated to it?

What are some effective ways to control data leakage?

What are web server vulnerabilities and name a few methods to prevent
web server attacks?

What is capability-based security? Have you incorporated this pattern
into your designs? How?

What is data protection in transit vs data protection at rest?

What is lacking in security architecture pattern that prevents it from
being used as finished diagram? - Context

What is layered security architecture? Is it a good approach? Why?

What is your preferred method of giving remote employees access to the
company network and are there any weaknesses associated to it?

What kind of websites and cloud services would you block?

What security challenges do unified communications present?

What special security challenges do SOA present?

What type of security flaw is there in VPN?

Who typically owns security architecture requirements and what
stakeholders contribute?

# Scenarios

Threat modelling of Azure Virtual Machine

Define the scope of threat model

Identify the list of valuable assets associated with VM: Data, Apps,
Access Credentials, or Config Settings.

**Threat modelling** is a critical security practice that involves
identifying potential threats to a system and assessing the potential
impact of those threats. For an Azure Virtual Machine (VM), this process
is particularly important due to the sensitive data and applications
often hosted on these machines.

**Understanding the Components of an Azure VM**

Before diving into threat modelling, it's essential to understand the
key components of an Azure VM:

- **Virtual Machine Image:** The base operating system and applications
  installed on the VM.

- **Virtual Hard Disk (VHD):** Stores the VM's operating system,
  applications, and data.

- **Network Interface:** Connects the VM to the virtual network.

- **Storage Account:** Stores the VHD.

- **Azure Security Center:** Provides security recommendations and
  threat protection.

**Threat Modelling Process**

1.  **Define the System:** Clearly outline the Azure VM environment,
    including the operating system, applications, network configuration,
    and data sensitivity.

2.  **Identify Assets:** Determine the valuable assets that need
    protection, such as data, applications, and infrastructure
    components.

3.  **Identify Threats:** Analyze potential threats to the VM,
    considering both internal and external sources.

4.  **Identify Vulnerabilities:** Evaluate the weaknesses in the VM
    environment that could be exploited by threats.

5.  **Assess Threat Impact:** Determine the potential impact of each
    threat on the assets.

6.  **Develop Mitigation Strategies:** Create strategies to address the
    identified threats and vulnerabilities.

**Common Threats to Azure VMs**

- **Unauthorized Access:**

  - Brute-force attacks

  - Password spraying

  - Keylogging

  - Man-in-the-middle attacks

- **Data Loss or Corruption:**

  - Accidental deletion

  - Ransomware

  - Malware infection

  - Hardware failure

- **Denial of Service (DoS):**

  - Resource exhaustion

  - Network flooding

- **Data Breaches:**

  - Unauthorized access to sensitive data

  - Exfiltration of data

- **Misconfiguration:**

  - Incorrect network settings

  - Weak security controls

  - Improper access permissions

**Mitigation Strategies**

- **Network Security:**

  - Use strong network security groups (NSGs) to control inbound and
    outbound traffic.

  - Implement network address translation (NAT) to protect internal IP
    addresses.

  - Employ intrusion detection and prevention systems (IDPS).

- **Host Security:**

  - Keep operating system and applications up-to-date with patches.

  - Use strong passwords and multi-factor authentication (MFA).

  - Implement antivirus and antimalware protection.

  - Regularly review and update security configurations.

- **Data Protection:**

  - Encrypt data at rest and in transit.

  - Regularly backup data to multiple locations.

  - Implement data loss prevention (DLP) policies.

- **Identity and Access Management:**

  - Use Azure Active Directory (Azure AD) for identity management.

  - Implement role-based access control (RBAC).

  - Regularly review and audit user permissions.

- **Monitoring and Logging:**

  - Use Azure Monitor to monitor VM performance and security.

  - Enable logging for security events and system activities.

  - Regularly review logs for suspicious activity.

**Additional Considerations**

- **Threat Modeling Tools:** Utilize tools like the Microsoft Threat
  Modeling Tool to streamline the process.

- **Regular Assessments:** Conduct threat modeling assessments
  periodically to identify emerging threats.

- **Incident Response Plan:** Develop a comprehensive incident response
  plan to handle security breaches effectively.

- **Compliance:** Ensure compliance with relevant industry standards and
  regulations.

By following these guidelines and leveraging Azure's built-in security
features, you can significantly enhance the security posture of your
Azure VMs.

**Would you like to delve deeper into a specific threat or mitigation
strategy?**

**Do you have a particular Azure VM scenario in mind that you'd like to
model?**

Threat modelling of Azure Storage Account

Threat modelling of Azure Key Vault

Threat modelling of Microsoft Fabric

Threat modelling of PowerBI

Threat modelling of Logic Apps

Threat modelling of Azure App service

Threat modelling of Azure Functions

Threat modelling of Azure DevOps

Threat modelling of Windows server

Threat modelling of Windows client

Threat modelling of Linux

**How to perform threat modelling for azure cloud security architecture
which is having, 100 servers, 30 Kubernetes clusters, 20 App services,
70 storage accounts, 50 Database servers, having credit card data?**

**<span class="mark">Step 1: Identify the assets</span>**

The first step is to identify all the assets in your Azure cloud
environment. This includes your servers, Kubernetes clusters, App
services, storage accounts, database servers, and credit card data.

**<span class="mark">Step 2: Identify the threats</span>**

Once you have identified your assets, you need to identify the threats
that could potentially impact them. Some common threats to Azure cloud
environments include:

- **Data breaches:** Attackers may attempt to gain unauthorized access
  to your data, including credit card data.

- **Denial of service (DoS) attacks:** Attackers may attempt to flood
  your resources with traffic, making them unavailable to legitimate
  users.

- **Malware attacks:** Attackers may attempt to infect your systems with
  malware, which could give them control of your systems or steal your
  data.

- **Insider threats:** Malicious insiders may attempt to abuse their
  access to your systems to steal data or cause damage.

**<span class="mark">Step 3: Assess the risks</span>**

Once you have identified the threats to your assets, you need to assess
the risks associated with each threat. Consider the following factors
when assessing the risks:

- **Impact:** What would the impact be if the threat were to
  materialize?

- **Likelihood:** How likely is it that the threat will materialize?

- **Vulnerabilities:** What vulnerabilities in your environment could be
  exploited by the threat?

- **Controls:** What controls do you have in place to mitigate the risk?

**<span class="mark">Step 4: Prioritize the risks</span>**

Once you have assessed the risks, you need to prioritize them. Focus on
addressing the risks with the highest impact and likelihood first.

**<span class="mark">Step 5: Develop mitigations</span>**

For each high-priority risk, you need to develop mitigations to reduce
the risk. Some common mitigations for Azure cloud environments include:

- **Implement strong access control policies:** Only grant users access
  to the resources they need.

- **Use encryption to protect data:** Encrypt all sensitive
  data, including credit card data.

- **Keep software up to date:** Install security patches and updates
  promptly.

- **Monitor your environment for suspicious activity:** Use Azure
  Security Center and other security tools to monitor your environment
  for suspicious activity.

**<span class="mark">Step 6: Implement and monitor the
mitigations</span>**

Once you have developed mitigations, you need to implement them and
monitor their effectiveness.

**Additional considerations for credit card data**

Credit card data is a highly sensitive asset, so it is important to take
additional steps to protect it. Some additional considerations include:

- **Use a PCI DSS compliant payment processor:** Use a payment processor
  that is compliant with the Payment Card Industry Data Security
  Standard (PCI DSS).

- **Limit the number of people who have access to credit card
  data:** Only grant access to credit card data to people who need to
  access it.

- **Use a secure payment gateway:** Use a secure payment gateway to
  process credit card payments.

By following these steps, you can develop a threat model for your Azure
cloud security architecture and protect your assets, including credit
card data.

# Azure VM Threat Modelling

 

 

 

Please perform the real-life threat modelling of Azure VM? Real-Life
Threat Modeling of Azure VM

- Threat modelling helps identify and mitigate potential security
  threats against your Azure VM.

- Here's a real-life example using the STRIDE model: STRIDE: Spoofing,
  Tampering, Repudiation, Information Disclosure, Denial-of-Service,
  Elevation of Privilege

- Scenario: An e-commerce website hosted on an Azure VM processes online
  payments and stores customer data.

 

> **Assets:**

- Azure VM

- Web application

- Database containing customer data

- Payment processing system

 

| **Column1** | **Threats** | **Mitigations** |
|----|----|----|
| **Spoofing** | Attacker spoofs the VM's IP address to gain access to the web application or database. | Implement strong authentication mechanisms, such as multi-factor authentication. |
| ** ** | Attacker spoofs the identity of a legitimate user to access the payment processing system. | Use network access control lists to restrict access to the VM from unauthorized IP addresses. |
| ** ** |   | Monitor network traffic for suspicious activity. |
| **Tampering** | Attacker modifies data in transit between the VM and other resources. | Implement data integrity checks to ensure data hasn't been tampered with. |
| ** ** | Attacker modifies files on the VM to inject malicious code. | Encrypt data at rest and in transit. |
| ** ** |   | Use intrusion detection and prevention systems to monitor for unauthorized modifications. |
| **Repudiation** | Attacker denies performing actions on the VM, making it difficult to attribute responsibility. | Enable logging and auditing to track all activity on the VM. |
| ** ** | Attacker alters audit logs to cover their tracks. | Use digital signatures to verify the authenticity of data. |
| ** ** |   | Implement strong access controls to restrict who can modify sensitive data. |
| **Information Disclosure** | Attacker gains unauthorized access to sensitive customer data stored on the VM or database. | Encrypt sensitive data stored on the VM and database. |
| ** ** | Attacker eavesdrops on network traffic to steal payment information. | Implement access controls to restrict who can access sensitive data. |
| ** ** |   | Monitor network traffic for potential leaks of sensitive information. |
| **DoS** | Attacker floods the VM with traffic to make it unavailable to legitimate users. | Use a web application firewall to block malicious traffic. |
| ** ** | Attacker exploits vulnerabilities in the web application or VM to launch a DoS attack. | Implement rate limiting to prevent denial-of-service attacks. |
| ** ** |   | Monitor resource usage to detect and respond to DoS attacks. |
| **Elevation of Privilege** | Attacker gains access to the VM with low privileges and exploits vulnerabilities to escalate their privileges. | Implement the principle of least privilege, granting users only the minimum permissions necessary to perform their jobs. |
| ** ** | Attacker compromises a user account and uses it to gain access to the VM with higher privileges. | Patch vulnerabilities promptly. |
| ** ** |   | Monitor user activity for suspicious behaviour. |
| ** ** |   |   |

 

>  
>
> **Validation**

- After implementing mitigations, it's important to validate their
  effectiveness.

- This can be done through penetration testing, vulnerability scanning,
  and red teaming exercises.

- Continuously monitor and update threat models as the threat landscape
  evolves and new vulnerabilities are discovered.

>  
>
> **Additional Considerations**

- Use Azure security services: Azure offers a range of security services
  that can help protect your VMs, such as Azure Security Center, Azure
  Monitor, and Azure Sentinel.

- Stay informed about security threats: Keep up-to-date with the latest
  security threats and vulnerabilities by subscribing to security
  advisories and blogs.

- Have an incident response plan: Develop a plan for responding to
  security incidents, including data breaches and denial-of-service
  attacks.

 

# Azure Environment Threat Modelling

How to perform threat modelling for azure cloud security architecture
which is having, 100 servers, 30 Kubernetes clusters, 20 App services,
70 storage accounts, 50 Database servers, having credit card data?

 

### Identify Assets

The first step is to identify all the assets in your Azure cloud
environment. This includes your servers, Kubernetes clusters, App
services, storage accounts, database servers, and credit card data.

>  

### Identify Threats

> Once you have identified your assets, you need to identify the threats
> that could potentially impact them. Some common threats to Azure cloud
> environments include:

- **Data breaches:** Attackers may attempt to gain unauthorized access
  to your data, including credit card data.

- **Denial of service (DoS) attacks:** Attackers may attempt to flood
  your resources with traffic, making them unavailable to legitimate
  users.

- **Malware attacks:** Attackers may attempt to infect your systems with
  malware, which could give them control of your systems or steal your
  data.

- **Insider threats:** Malicious insiders may attempt to abuse their
  access to your systems to steal data or cause damage.

>  

### Risk Assessment

Once you have identified the threats to your assets, you need to assess
the risks associated with each threat. Consider the following factors
when assessing the risks:

- **Impact:** What would the impact be if the threat were to
  materialize?

- **Likelihood:** How likely is it that the threat will materialize?

- **Vulnerabilities:** What vulnerabilities in your environment could be
  exploited by the threat?

- **Controls:** What controls do you have in place to mitigate the risk?

>  

### Risk Prioritization

Once you have assessed the risks, you need to prioritize them. Focus on
addressing the risks with the highest impact and likelihood first.

>  

### Develop mitigations

For each high-priority risk, you need to develop mitigations to reduce
the risk. Some common mitigations for Azure cloud environments include:

- **Implement strong access control policies:** Only grant users access
  to the resources they need.

- **Use encryption to protect data:** Encrypt all sensitive
  data, including credit card data.

- **Keep software up to date:** Install security patches and updates
  promptly.

- **Monitor your environment for suspicious activity:** Use Azure
  Security Center and other security tools to monitor your environment
  for suspicious activity.

 

### Implement Mitigations

Once you have developed mitigations, you need to implement them and
monitor their effectiveness.

> Additional considerations for credit card data

- Credit card data is a highly sensitive asset, so it is important to
  take additional steps to protect it. Some additional considerations
  include:

- **Use a PCI DSS compliant payment processor:** Use a payment processor
  that is compliant with the Payment Card Industry Data Security
  Standard (PCI DSS).

- **Limit the number of people who have access to credit card
  data:** Only grant access to credit card data to people who need to
  access it.

- **Use a secure payment gateway:** Use a secure payment gateway to
  process credit card payments.

# The End

# Threat Modelling

- Threat modelling helps you identify potential threats and risk
  reduction strategies earlier in the development lifecycle.

- "Understanding the frameworks, methodologies and tools to help you
  identify, quantify and prioritize the threats you face."

- Threat modeling uses a data-flow diagram that graphically shows how
  the system works. It then applies a framework to help you find and fix
  security issues.

- When to use threat modeling? - Use threat modeling whenever you design
  new systems or update existing ones.

- Who can threat model? - Anyone with a working knowledge of the system
  and a basic understanding of security can work with threat modeling.

<!-- -->

-  

- Purpose of Threat Modelling

<!-- -->

- Purpose of Threat Model is to answer below four questions:

  - What are we working on?

  - What can go wrong?

  - What are we going to do about it?

  - Did we do a good job?

<!-- -->

-  

- Threat Modelling Process

<!-- -->

- Decompose the application or infrastructure

- Determine the threats

- Determine countermeasures and mitigations

- Rank the threats

## Threat Modelling Phases

- Threat modeling is a technique used by anyone who knows how their
  system works and has a working knowledge of information security.

- The technique is broken down into four different phases:

<img src="media/image1.png" style="width:9.69306in;height:1.01389in" />

## Threat Modelling Frameworks and Methodologies

- "The varying structured approaches for threat modeling are usually
  called frameworks or methodologies"

- Threat modeling methodologies are: STRIDE and NIST

-  STRIDE

  - STRIDE is the first developed at Microsoft in the late '90s. STRIDE
    stands for the six categories of threat, each of which violates a
    specific property from variations of the CIA triad:

  - Spoofing, or impersonating another person or computer, which
    violates authenticity

  - Tampering with data, which violates integrity

  - Repudiation, or making it impossible to link an action you performed
    to you, which violates non-repudiability

  - Information disclosure, which violates confidentiality

  - Denial of service, which violates availability

  - Elevation of privilege, which violates authorization

    - Spoofing: Falsifying information to gain access

    - Tampering: Making unauthorized changes

    - Repudiation: Denying having done an action

    - Information Disclosure: Revelation of controlled information

    - Denial-of-Service: Prevents the use of an asset

    - Escalation of Privilege: Elevates capability of under privileged
      account

    <!-- -->

    - Determining Potential Attacks: Data Flow Diagrams - Entities,
      Technologies, Transactions, Attacks vs each element.

    - Reduction Analysis

      - Decomposing system/process/environment: Modules, Functions,
        Protocols, etc.

      - Identify the Following: Trust Boundaries, Data Flow Paths, Input
        Points, Privileged Operations, Security Approach

    - Prioritization and Response

    - Probability x Damage Potential

    - High/Medium/Low

    - DREAD

      - Discoverability

      - Reproducibility

      - Exploitability

      - Affected Users

      - Damage Potential

- NIST Threat modeling

  - The U.S. National Institute of Standards and Technology has its own
    data-centric threat modeling methodology, which consists of four
    steps

  - Identify and characterize the system and data of interest

  - Identify and select the attack vectors to be included in the model

  - Characterize the security controls for mitigating the attack vectors

  - Analyze the threat model

  - The NIST draft also includes a detailed example of how this
    methodology would be applied in practice. If you're looking for a
    threat modeling example, this is a great document to read to see how
    the process works.

<!-- -->

- Note: Quality threat intelligence is key enabling factor for proactive
  threat hunting program.

## Threat Modelling Best Practices

- Make threat modelling a priority during system development-\> If you
  can do it at the start of a project, you can save yourself a lot of
  grief later on, because a secure viewpoint will be baked into your
  application or system.

- Do not to view applications and systems in isolation from one another.
  -\> "If the various threat models are connected to one another in the
  same way in which the applications and components interact as part of
  the IT system,". "The result is a comprehensive attack surface which
  the CISO can use to understand the entire threat portfolio across the
  enterprise."

- Avoid threat modelling mistakes:

  - Don't focus too much on whatever threats are in the headlines

  - Don't forget that your users can be some of the biggest inadvertent
    threats of all

  - Don't forget that a threat model should be a living document and
    needs constant updating.

<!-- -->

- Threat Modelling Approaches

<!-- -->

- Threat Identification approaches:

  - Focused on Assets: Protect valuable assets

  - Focused on Attackers: Protect the things that attackers want to
    attack

  - Focused on Software: Protect the software

  - Individual Threats: Be cautious of Contractors and Trusted Partners

- Proactive

  - Performed before and while the system is being implemented

  - Predicting threats and designing defences in advance

  - More cost effective and more successful

  - Security Development Lifecycle

    - Reduce number of coding defects

    - Reduce severity of remaining defects

- Reactive

  - Performed after the system has been implemented

  - Less effective but more cost effective than redesign

  - E.g., penetration testing, source code review, fuzz testing

  - Fuzz Testing: Random invalid input is fed to a program. Attempts to
    find previously undetected flaws

# Threat Modelling

- **Can you explain threat modelling?** It is the process of evaluating
  your organizations risk, threat, and vulnerabilities. It identifies
  probability of threats that could compromise organization and assess
  ability to respond and prevent those threats.

<!-- -->

- **Explain the Term “Threat Modelling”** Threat modelling is simply the
  process of analysing the possible threats and vulnerabilities within a
  system. It involves identifying the hazards, carefully studying them,
  and correcting them accordingly.

- **What is STRIDE? 🡪** STRIDE is an acronym for the threat modelling
  system. It helps in categorizing all cyberattacks into the below
  techniques: **S**poofing, **T**ampering, **R**epudiation,
  **I**nformation disclosure, **D**enial of service (DoS), **E**levation
  of privilege

- Which of these threat modelling methodologies is integrated seamlessly
  into an Agile development methodology? VAST

## Threat Modelling

**Threat modelling** is a process of identifying, assessing, and
mitigating threats to a system or application. It is a proactive
approach to security that can help organizations to reduce their risk of
cyberattacks.

Threat modelling is typically performed during the design phase of a
system or application, but it can also be applied to existing systems
and applications.

The process involves the following steps:

1.  **Identify the assets to be protected.** This includes the system or
    application itself, as well as any data that it stores or processes.

2.  **Identify the potential attackers.** This includes both external
    attackers (such as hackers) and internal attackers (such as
    malicious employees).

3.  **Identify the threats to the assets.** This includes both known
    threats (such as SQL injection attacks) and unknown threats (such as
    zero-day attacks).

4.  **Assess the likelihood and impact of each threat.** This will help
    to prioritize the threats and identify the ones that need to be
    mitigated first.

5.  **Identify and implement mitigations for the threats.** This may
    involve implementing security controls, such as firewalls and
    intrusion detection systems, or changing the design of the system or
    application.

**<span class="mark">How would you permanently remove the threat of data
falling into the wrong hands?</span>**

There is no absolute way to permanently remove the threat of data
falling into the wrong hands. However, there are a number of things that
can be done to mitigate the risk:

- **Encrypt the data:** Encryption is one of the most effective ways to
  protect data from unauthorized access. When data is encrypted, it is
  converted into a format that can only be read by those with the
  decryption key. This makes it very difficult for attackers to access
  the data, even if they are able to steal it.

- **Use strong access controls:** Access controls restrict who can
  access data and what they can do with it. Strong access controls can
  help to prevent unauthorized users from accessing data, and they can
  also help to limit the damage that can be done if data is accessed by
  unauthorized users.

- **Monitor data access:** Monitoring data access can help to identify
  suspicious activity and prevent data breaches. By monitoring who is
  accessing data and when, organizations can identify potential threats
  and take action to mitigate them.

- **Educate employees about security:** Employees are often the weakest
  link in the security chain. It is important to educate employees about
  security best practices and how to identify and report suspicious
  activity.

- **Have a plan for responding to data breaches:** Even with the best
  security in place, data breaches can still happen. It is important to
  have a plan for responding to data breaches so that the organization
  can minimize the damage and get back to business as quickly as
  possible.

- **Use multiple layers of security:** No single security measure is
  perfect. It is important to use multiple layers of security to protect
  data. This may include encryption, access controls, monitoring,
  employee education, and a plan for responding to data breaches.

<span class="mark">Why are companies paying million dollars for
bugs/vulnerabilities?</span>

Companies want to take benefit of freelance bug bounty hunters, to check
assets with different perspective. Companies are paying million dollars
for bugs/vulnerabilities for a number of reasons:

- **To protect their users and customers**. When a security
  vulnerability is discovered in a company's product or service, it puts
  their users and customers at risk of being attacked. By paying for bug
  bounties, companies can encourage researchers to find and report
  vulnerabilities so that they can be fixed before they are exploited by
  attackers.

- **To protect their reputation and brand**. A data breach or other
  security incident can damage a company's reputation and brand. By
  paying for bug bounties, companies can show their customers that they
  are taking security seriously and that they are committed to
  protecting their data.

- **To stay ahead of the competition.** Attackers are constantly
  developing new techniques and tools to exploit security
  vulnerabilities. By paying for bug bounties, companies can stay ahead
  of the competition and identify and fix vulnerabilities before they
  can be exploited.

- **To comply with regulations.** Many industries are subject to
  regulations that require them to protect their customers' data. By
  paying for bug bounties, companies can demonstrate that they are
  complying with these regulations.

<span class="mark">What is the primary reason most companies have not
fixed their vulnerabilities?</span>

The primary reason most companies have not fixed their vulnerabilities
is that it is difficult and expensive.

- **Complexity**: Software systems are becoming increasingly complex,
  making it difficult to identify and fix all vulnerabilities.

- **Cost**: Fixing vulnerabilities can be expensive, both in terms of
  the time and resources required.

- **Disruption**: Fixing vulnerabilities can sometimes disrupt business
  operations.

- **Lack of awareness:** Some companies may not be aware of the
  vulnerabilities in their systems.

- **Lack of priority**: Security is not always a top priority for
  companies, and fixing vulnerabilities may be deferred in favour of
  other initiatives.

Here are some specific examples of the challenges that companies face in
fixing vulnerabilities:

- **Legacy systems:** Many companies still use legacy systems that are
  no longer supported by the vendor. This makes it difficult to get
  patches for vulnerabilities in these systems.

- **Third-party software:** Companies rely on a wide range of
  third-party software, and they may not have the resources to test all
  of this software for vulnerabilities.

- **Supply chain attacks**: Attackers are increasingly targeting the
  software supply chain. This means that vulnerabilities in third-party
  software can be exploited to attack companies.

Despite the challenges, companies need to make fixing vulnerabilities a
priority. Vulnerabilities can be exploited by attackers to steal data,
launch ransomware attacks, or disrupt business operations.

Here are some tips for companies on how to fix their vulnerabilities:

- Identify and prioritize vulnerabilities: Use security tools and
  services to identify vulnerabilities in your systems. Prioritize
  vulnerabilities based on their risk and severity.

- Develop a patching plan: Create a plan for patching vulnerabilities in
  a timely and efficient manner.

- Test patches before deployment: Test patches before deploying them to
  production systems to avoid any disruptions.

- Keep systems up to date: Install security patches and updates as soon
  as they are released.

- Educate employees: Educate employees about security best practices and
  how to identify and report suspicious activity.

**Can you name some of the emerging Cyber threats?**

Ransomware, Continued Rise of Ai, Increased Attack on cloud services,
Covid phishing schemes, Insider Threats, Work from Home Attacks, Brute
Force Frustrations, Fileless frameworks, Front line phishing.

**Explain security threat.**

Security threat is defined as a risk which can steal confidential data
and harm computer systems as well as organization.

**Give examples of non-physical threats.**

Loss of sensitive information Loss or corruption of system data Cyber
security Breaches Disrupt business operations that rely on computer
systems Illegal monitoring of activities on computer systems.

**<span class="mark">How would you explain the threat of deep fakes in
cyber security world?</span>**

Deepfakes are a major threat in the cybersecurity world because they can
be used to exploit human trust and manipulate people into revealing
sensitive information or taking actions that they would not otherwise
take.

For example, a deepfake video of a CEO instructing employees to transfer
money to a fraudulent account could trick employees into carrying out
the fraudulent transaction. Or, a deepfake audio recording of a customer
service representative asking a customer for their credit card
information could be used to steal the customer's credit card
information.

Deepfakes can also be used to launch phishing attacks. For example, a
deepfake email could be sent to a target pretending to be from a trusted
source, such as a bank or credit card company. The email could contain a
link to a phishing website that is designed to steal the target's login
credentials or other sensitive information.

Deepfakes can also be used to damage a company's reputation. For
example, a deepfake video of a company's CEO making false or offensive
statements could be used to damage the company's public image and brand.

Cybersecurity professionals are increasingly concerned about the threat
of deepfakes. There are a number of steps that organizations can take to
mitigate the risk of deepfakes, such as:

- Educating employees about deepfakes: Employees should be aware of the
  existence of deepfakes and how to identify them.

- Implementing strong cybersecurity controls: Organizations should
  implement strong cybersecurity controls to make it more difficult for
  attackers to create and distribute deepfakes.

- Using deepfake detection tools: There are a number of deepfake
  detection tools available that can help organizations to identify
  deepfakes.

- Monitoring social media and other online channels: Organizations
  should monitor social media and other online channels for deepfakes
  that may target their employees or customers.

By taking these steps, organizations can help to protect themselves from
the threat of deepfakes.

Here are some additional tips for protecting yourself from deepfakes:

- Be sceptical of any video or audio recording that you
  receive, especially if it is from someone you don't know well.

- If you receive a video or audio recording that seems suspicious, try
  to verify its authenticity by contacting the person who supposedly
  sent it to you.

- Be careful about clicking on links in emails or text messages, even if
  they seem to be from a trusted source.

- Keep your software and operating system up to date. Software updates
  often include security patches that can help to protect you from
  deepfakes and other cyber threats.

**<span class="mark">Why are internal threats often more successful than
external threats?</span>**

Internal threats are often more successful than external threats because
they have a number of advantages:

- **Access**: Internal threats already have access to the organization's
  systems and networks, which gives them a significant advantage over
  external threats. This is because external threats must first find a
  way to penetrate the organization's security perimeter, which can be a
  difficult and time-consuming task.

- **Knowledge**: Internal threats have a deep understanding of the
  organization's systems and networks, as well as its business
  processes. This gives them the knowledge they need to carry out
  successful attacks.

- **Trust**: Internal threats are trusted members of the
  organization, which makes it difficult to detect and prevent their
  attacks. External threats, on the other hand, are often viewed with
  suspicion, which makes it more likely that their attacks will be
  detected and prevented.

Here are some specific examples of how internal threats can take
advantage of these advantages:

- Employee who has access to the company's customer database could steal
  customer data and sell it on the black market.

- Disgruntled employee could sabotage the company's systems or
  networks, causing significant damage and disruption.

- Employee who has been compromised by malware attack could give
  attacker access to company's systems and networks.

- Malicious insider could use their knowledge of the company's business
  processes to commit fraud or other crimes.

<span class="mark">Organizations can take a number of steps to mitigate
the risk of internal threats, such as:</span>

- **Implementing strong security controls:** Organizations should
  implement strong security controls to make it more difficult for
  internal threats to carry out attacks. This includes implementing
  access control measures, data encryption, and intrusion detection
  systems.

- **Educating employees about security:** Employees should be educated
  about security best practices and how to identify and report
  suspicious activity.

- **Creating a culture of security:** Organizations should create a
  culture of security where employees feel comfortable reporting
  suspicious activity without fear of retaliation.

**<span class="mark">Anonymous hackers are hacking into some critical
infrastructure around the world. Can you comment on how would they be
doing this?</span>**

List a couple of tests that you would do to a network to identify
security flaws.

Anonymous hackers are hacking into critical infrastructure around the
world using a variety of methods, including:

- **Exploiting vulnerabilities in software and hardware.** Anonymous
  hackers are constantly looking for vulnerabilities in software and
  hardware that they can exploit to gain access to systems and
  networks. They may find vulnerabilities by reading security
  advisories, scanning networks for known vulnerabilities, or developing
  their own zero-day exploits.

- **Social engineering.** Anonymous hackers often use social engineering
  to trick people into revealing sensitive information or taking actions
  that they would not otherwise take. For example, they may send
  phishing emails that appear to be from a trusted source, or they may
  call people and impersonate someone from their IT department.

- **Supply chain attacks.** Anonymous hackers may target the supply
  chain of critical infrastructure providers in order to gain access to
  their systems and networks. For example, they may hack a software
  vendor and insert malicious code into their software, which would then
  be installed on the systems of the vendor's customers.

Once Anonymous hackers have gained access to a critical infrastructure
system, they can launch a variety of attacks, such as:

- **Denial-of-service (DoS) attacks:** DoS attacks can be used to
  overwhelm a system or network with traffic, making it unavailable to
  legitimate users.

- **Ransomware attacks:** Ransomware attacks can be used to encrypt a
  system's files, making them inaccessible until the victim pays a
  ransom.

- **Data breaches:** Data breaches can be used to steal sensitive
  data, such as customer records or financial information.

- **Sabotage:** Anonymous hackers can sabotage critical infrastructure
  systems by deleting data, modifying data, or disabling systems.

**<span class="mark">List out the types of cyber attackers</span>**

5.  Cybercriminals

6.  Hacktivists

7.  Insider threats

8.  State-sponsored attackers.

**<span class="mark">List out the types of sniffing attacks.</span>**

There are two main types of sniffing attacks: **passive sniffing** and
**active sniffing**.

- **Passive sniffing** involves monitoring network traffic without
  interfering with it. The attacker simply listens to the traffic and
  captures packets. This type of attack is difficult to detect, but it
  is also the least harmful.

- **Active sniffing** involves interfering with network traffic in order
  to capture packets. This type of attack is more difficult to execute,
  but it is also more harmful.

Here are some specific examples of sniffing attacks:

- **ARP poisoning:** ARP poisoning is a type of active sniffing attack
  that involves injecting malicious ARP packets into a network. This can
  cause devices on the network to send their traffic to the attacker
  instead of the intended destination.

- **MAC flooding:** MAC flooding is a type of active sniffing attack
  that involves sending a large number of MAC address frames to a
  network switch. This can cause the switch to become overloaded and
  start dropping packets.

- **DNS spoofing:** DNS spoofing is a type of active sniffing attack
  that involves intercepting DNS requests and redirecting them to
  malicious websites. This can cause users to be tricked into entering
  their login credentials or other sensitive information on a fraudulent
  website.

- **Man-in-the-middle (MITM) attacks:** MITM attacks involve
  intercepting communication between two parties and relaying it back
  and forth, pretending to be each party. This allows the attacker to
  eavesdrop on the communication and even modify it.

**<span class="mark">Can give me an example of supply chain
attack?</span>**

Can you name a few recent security breaches? Name a few types of
security breaches.

Can you name some of the emerging cyber threats?

Can you name the types of security breaches and name some recent
security breaches?

Can you define what is APT?

Can you explain man-in-the middle attack?

Can you explain some ways cyber criminals are using services like
LinkedIn?

Can you explain some ways the attackers are using AI?

Explain any type of Wi-Fi Attack and how to prevent it.

What is a common method of disrupting enterprise systems?

> **Sources of Cyber Threats**

- While identifying a cyber threat it’s important to understand who is
  the threat actor, as well as their tactics, techniques and procedures
  (TTP). Common sources of cyber threats include:

  - **State-sponsored**: Cyberattacks by countries can disrupt
    communications, military activities, or other services that citizens
    use daily.

  - **Terrorists**: Terrorists may attack government or military
    targets, but at times may also target civilian websites to disrupt
    and cause lasting damage.

  - **Industrial spies**: organized crime and international corporate
    spies carry out industrial espionage and monetary theft. Their
    primary motive is financial.

  - **Organized crime groups**: criminal groups infiltrate systems for
    monetary gain. Organized crime groups use phishing, spam, and
    malware to carry out identity theft and online fraud.

  - **Hackers**: there is a large global population of hackers, ranging
    from beginner “script kiddies” or those leveraging readymade threat
    toolkits, to sophisticated operators who can develop new types of
    threats and avoid organizational defenses.

  - **Hacktivists**: hacktivists are hackers who penetrate or disrupt
    systems for political or ideological reasons rather than financial
    gain.

  - **Malicious insider:** insiders represent a very serious threat, as
    they have existing access to corporate systems and knowledge of
    target systems and sensitive data. Insider threats can be
    devastating and very difficult to detect. Malicious Insiders

    - Little risk of detection

    - System administrator qualifications and vetting process for cloud
      services provider may be different than that of the data owner

  - **Cyber espionage:** is a form of cyberattack that steal
    classified, or sensitive intellectual data to gain an advantage over
    a competitive company or government entity.

  - **Natural Threats:** Storm/Flood Damage, Fire, Lightning Strikes,
    Hurricanes/Tornadoes, Environmental Threats: Power Outages, Chemical
    Spills, Pollution

  - **Human Threats:** Computer Abuse, Terrorism, Sabotage, Vandalism,
    Fraud, Errors/Negligence, Falsified Data, Unauthorized Access,
    System Tampering

>  
>
>  

- Threats are:

  - Destruction of Information

  - Corruption or Modification of Information

  - Theft Removal or Loss of Information

  - Disclosure of Information

  - Interruption of Services

  - Non-availability of Information

>  

- Insecure Application Programming Interface

  - Could expose more functionality than intended

  - Policy could be circumvented

  - Credentials may need to be passed - is the interface secure?

- Shared Technology Vulnerabilities

  - Underlying architecture (CPU cache, GPU, etc.) not intended to offer
    strong isolation properties

  - Virtualization hypervisor used to mediate access between guest OS
    and physical resources

  - Exploits exist (Blue Pill, Red Pill)

- Data Loss/leakage

  - Data is outside the owner’s control

  - Data can be deleted or decoupled (lost)

  - Encryption keys can be lost

  - Unauthorized parties may gain access

  - Caused by

    - Insufficient authentication, authorization, and access controls

    - Persistence and remanence

    - Poor disposal procedures

    - Poor data center reliability

- Account, Service and Traffic Hijacking

  - Exploits phishing attacks, fraud, or software vulnerabilities

  - Credential reuse

- Unknown Risk Profile

  - How well is the cloud being maintained?

  - Many companies are unwilling to release details

  - Is the infrastructure up to date

    - Patches

    - Firmware

  - Does the combination of different service providers create
    previously unseen vulnerabilities?

>  
>
>  
>
>  
>
>  
>
> **Threats to Cloud Computing**

- *Password and Key Cracking*

- *Launching Dynamic attack points*

- *Hosting malicious Data*

- *Botnet command and control*

- *Building rainbow tables*

- *CAPTCHA Solving*

- *Exploits exists already*

- *Threats to Cloud API*

  - Could expose more functionality than intended

  - Policy could be circumvented

  - Credentials may need to be passed - is the interface secure?

- *Malicious Insiders*

- **Shared Technology Vulnerabilities**

  - Underlying architecture (CPU cache, GPU, etc.) not intended to offer
    strong isolation properties

  - Virtualization hypervisor used to mediate access between guest OS
    and physical resources

  - Exploits exist (Blue Pill, Red Pill)

- **Data Loss/leakage**

  - Data is outside the owner’s control

  - Data can be deleted or decoupled (lost)

  - Encryption keys can be lost

  - Unauthorized parties may gain access

  - Caused by

    - Insufficient authentication, authorization, and access controls

    - Persistence and remanence

    - Poor disposal procedures

    - Poor data center reliability

- **Account, Service and Traffic Hijacking:** Exploits phishing attacks,
  fraud, or software vulnerabilities, Credential reuse

- **Unknown Risk Profile**

  - How well is the cloud being maintained?

  - Many companies are unwilling to release details

  - Is the infrastructure up to date

    - Patches

    - Firmware

  - Does the combination of different service providers create
    previously unseen vulnerabilities?

## Threat Modelling

<span class="mark">Threat Modelling is Understanding Your
Weaknesses</span>

Threat modelling is a process for analysing a system to identify
potential security vulnerabilities and threats. It helps organizations:

- **Identify:** Recognize potential security risks.

- **Quantify:** Assess the likelihood and impact of each threat.

- **Address:** Develop mitigation strategies to minimize risks.

## Methodologies of Threat modelling

- **STRIDE:** A framework for categorizing threats based on techniques
  like Spoofing, Tampering, Repudiation, Information Disclosure,
  Denial-of-Service, and Elevation of Privilege.

- **VAST:** A threat modelling methodology designed to be integrated
  with Agile development processes. It focuses on Visual, Agile, and
  Simple Threat modelling.

By understanding different threat types, threat modelling, and insider
risk, organizations can develop a comprehensive security strategy to
protect their data and systems.
