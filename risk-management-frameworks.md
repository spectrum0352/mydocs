Risk Management Frameworks
A framework is a description of a complex process, concentranting on major steps and the flows between the steps.
Describes the major steps and flows of the complex process of applying security controls in an organized and
controlled fashion.
Frameworks come from a variety of sources including:
Regulatory
Non-Regulatory
National
Industry Standards (Best Practices)
Popular RMF
National Standard and Regulatory:
NIST SP 800-37
Non-Regulatory:
ISACA IT Infrastructure
International Standard:
ISO 27000
NIST Risk Management Framework:
129 of 178
Quantitative Risk Assessment
Is based on objective data, typically numerical data; Exact values, for instance, can be used to describe impact or
loss of an asset.
Asset Value (AV)
When valuing an asset, consider not only the replacement cost, but also the revenue the asset generates, as this will be
lost as well if the asset is not available.
Example:
Asset
Cost
Repair
Revenue
= Total
Router
€600
€500 x day
€2000 x day
€3100
Exposure Factor (EF)
130 of 178
The percentage of an asset that could be lost during a negative event. Realistically, you will not always lose 100% (1) of
the asset; you may lose only 20% (0.2) or 50% (0.5) for example.
Example:
Incident
Exposure Value
Flood
1 (100%)
Single Loss Expectancy (SLE)
Is the value that's computed simply by multiplying the asset's value by the exposure factor (percentage of loss).
Formula:
Single Loss Expectancy = Asset Value x Exposure Factor
SLE = AV x EF
Example (using data below):
AV
x EF
= SLE
€3100
1
€3100
SLE = €3100 (AV) x 1 (EF) = €3100
Annualized Rate of Occurrence (ARO)
How many times per year you would expect a particularly negative event to occur, resulting in a loss of the asset. This
value relates more to likelihood than impact.
Example: Flood on Server room, base on data: one flood in about 10 years, 1/10 (0.1). [SLE x ARO = ALE]
Annualized Loss Expectancy (ALE)
Essentially looks at the amount of loss from the SLE and determines how much loss the organization could realistically
expect in a one-year period.
Formula:
ALE (Annualized loss expectancy) = SLE x ARO
SLE x ARO = ALE
Evaluating risk
Risk register
Every project has a plan, but also has risk
Identify and document the risk associated with each step
Apply possible solutions to the identified risks
Monitor the results
Supply chain assessment
Get a product or service from supplier to customer
Evaluate coordination between groups
131 of 178
Identify areas of improvement
Asses the IT systems supporting the operation
Document the business process changes
Business Impact Analysis
Designed to mitigate the effects of an incident, not to prevent an incident.
Determine mission process. (make sure servers are up)
Identify critical systems.
Single point-of-failure. (using Defense-in-Depth...)
Identify resource requirements.
Identify recovery priorities. (prioritize most important steps to kepp whatever essential function running)
Types of Impact
Property
The risk to buildings and assets
Safety | Life | People
Some environments are too dangerous too work
Finance (Credit, Cash flows...)
The resulting financial cost
Reputation
An event can cause status or character problems
Privacy
Some compliance requires a public privacy statement
Gramm-Leach-Bliley Act (financial information)
HIPAA (health care), etc
Privacy Impact Assessment (PIA) and
Privacy Threshold Assessment (PTA)
PTA
The first step in the compliance process
Identify business processes that are privacy-sensitive
Determines if a privacy impact assessment is required
132 of 178
PIA
Determine the impact on the privacy of the individuals who data is beign stored; and ensure that the organization has
sufficient security controls applied to be within compliance of applicable laws or standards.
Ensures compliance with privacy laws and regulations
What PII is collected, and why
How the PII data will be collected, used, and secured
🛑 To create a (PIA) - Privacy Impact Assessment, the organization needs to perform a (PTA) - Privacy
Threshold Assessment on its infrastructure to locate personal information, what personal info. is stored
and from whom the personal info is collected.
PTA and PIA - in order to understand the impact of the loss of personal information can do to a particular business.
Calculating Impact
Determine how long the particular equipament going to
last. (qualitative)
MTTF = Mean Time to Failure
The expected lifetime of a non-repairable product or system
MTTR = Mean Time to Repair
Mean time to repair
MTBF = Mean Time Between Failure
Predict the time between failures
Recovery Time Objective (RTO):
Maximum amount of time that a resource may remain unavailable before an unacceptable impact on other system
resources occurs.
Get up and running quickly
Get back to a particular service level
Recovery Point Objective (RPO):
Defines the amount of time that will pass between an incident and recovery from backup.
How much data loss is acceptable?
133 of 178
Bring the system back online; how far back does data go?
🛑 Recovery priorities help define what needs to be addressed to maintain business continuity.
Maximum Tolerable Downtime (MTD):
The maximum tolerable downtime (MTD) indicates how long an asset may be down or offline without seriously
impacting the organization.
Calculating uptime and availability
Expressed as a percentage over time
99.999% availability
'Availability' is a negotiated definition
Especially if it's part of your bonus
e.g. - The 'four nines' (99.99%) - means that during the year, you could be down for a total of 52 minutes
and 56 seconds.
Removing single points of failure
A single point of failure is a part of a system that, if it fails, will stop the entire system from working.
A single event can ruin your day
Unless you make some plans
Network configuration
Multiple devices
Facility / Utilities
Backup power, multiple cooling devices
People / Location
A good hurricane can disrupt personnel travel
There's no practical way to remove all points of failure (money drives redundancy)
134 of 178
Organizing Data
The first step to dealing with data security is organization.
Analyze individual chuncks of data (such as databases, files, access control lists..)
Determine the importance - the sensitivity of data.
Data Sensitivity | Labeling
Public Data: Has no restrictions. (stills needs integrity and availability)
Confidential Information: Limited to authorized viewing as agreed by the parties involved.
Private Information:social security number, passport number, PII - Peronally identifiable information...
Proprietary Information: Information owned by a company that gives a certain competitive advantages. (e.g. The
secret formula of Coca-Cola).
PII - Personally Identifiable Information: Individual information (Name, birth, morther's name, biometric
information, SSN, passport number)
PHI - Protected Health Information: Not only Health information, PII may include on PHI.
Data Roles
Data Owners: Legally responsible for the data, can be entity responsible.
Steward: Responsible for data accuracy, privacy, and security; Associates sensitivity labels to the data and ensure
compliance with any applicable laws and standards.
Custodian: Manages the access rights to the data; Implements security controls; Sometimes the same person as
the data steward.
Privacy Officer: Ensures data adhere to privacy policies and procedures. Set policies, implements processes and
procedures.
User Roles
Users: Assigned standard permissions to complete tasks. | Must understand how system functions works and have
proper security training to recognize common issues (Malware, etc).
135 of 178
Privileged Users: Increased access and control over the data or system. (e.g. a Normal user can run anti-malware
software, but the privileged can updated then).
Executive Users: Concentrates on strategic decisions including policy review, incident response and disaster
recovery.
System Administrator: Has complete direct control over the data or system. (Can remove or add users, applying
permissions, and doing system maintance...)
Data Owner | System Owner: People or organizations who have legal ownership of this particular data set or
particular system.
Data Loss Prevention (DLP)
Data Loss Prevention (DLP) is the practice of detecting and preventing data breaches, exfiltration, or unwanted
destruction of sensitive data. Organizations use DLP to protect and secure their data and comply with regulations.
The DLP term refers to defending organizations against both data loss and data leakage prevention.
Organizations typically use DLP to:
Protect Personally Identifiable Information (PII) and comply with relevant regulations
Protect Intellectual Property critical for the organization
Achieve data visibility in large organizations
Secure mobile workforce and enforce security in Bring Your Own Device (BYOD) environments
Secure data on remote cloud systems
