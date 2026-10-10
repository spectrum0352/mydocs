cyber-kill-chain

Kill Chain explanation
1. Preparation & Reconnaissance
In this phase, attackers research, identify, and select targets using active or passive reconnaissance techniques. They gather intelligence about the target’s infrastructure, personnel, and vulnerabilities. Preparatory activities include setting up attack infrastructure such as command and control servers and weaponizing malicious payloads. This groundwork  increases the likelihood of a successful breach.
Activities include:
Reconnaissance (target research)
Weaponization (creating tools, exploits, or malware)

2. Initial Compromise
Attackers deliver the weaponized payload to the target environment, often using techniques like phishing, watering hole attacks, or supply chain compromises. Social engineering is commonly used to manipulate users into executing malicious actions, or attackers directly exploit vulnerabilities in systems to gain entry. Successful exploitation results in initial access to the targeted network or systems.
Activities include:
Delivery (transmitting payloads)
Social Engineering (user manipulation)
Exploitation (leveraging system vulnerabilities)

3. Post-Compromise Expansion
Once inside, attackers work to establish persistent presence and expand their foothold. They escalate privileges on compromised systems, discover network topology and assets, and move laterally through the environment by exploiting trust relationships and additional vulnerabilities. They may also collect credentials to facilitate further access and pivot to more critical systems.
Activities include:
Persistence (maintaining access)
Privilege Escalation (gaining higher permissions)
Discovery (mapping network and assets)
Credential Access (stealing authentication info)
Lateral Movement & Pivoting (moving through the network)
Execution (running attacker code on new systems)

4. Defense Evasion & Control
To avoid detection, attackers employ techniques to evade security controls and forensic investigations. This includes disabling or bypassing security tools, cleaning logs, obfuscating payloads, and using covert communication channels. Command and Control (C2) techniques enable attackers to remotely manage compromised systems securely and stealthily.
Activities include:
Defense Evasion (avoiding detection)
Command & Control (remote system management)

5. Target Interaction & Collection
At this stage, attackers interact with high-value assets or systems to achieve their strategic objectives. They collect sensitive data such as intellectual property, credentials, or personal information. Collection may involve identifying and aggregating data prior to extraction. 
Activities include:
Collection (gathering target data)
Targeted actions on specific assets
6. Exfiltration & Impact
Finally, attackers remove the collected data from the target
environment, often using encrypted or covert channels to avoid
detection. In some cases, attackers may also manipulate, destroy, or
disrupt systems and data to achieve impact objectives such as sabotage,
ransom, or denial of service.
Activities include:
Exfiltration (data theft and removal)
Impact (manipulation, disruption, destruction)

Summary:  
The attacker’s progression follows a cycle from Preparation & Reconnaissance through Initial Compromise, then expands and consolidates access in Post-Compromise Expansion. Defense Evasion & Control techniques maintain stealth while the attacker interacts with targets to collect data. The final phase involves Exfiltration & Impact, completing
the attacker’s strategic goals. Would you like me to map specific techniques or examples to each phase?

Action on Objectives in the Context of Cyber Attack Phases
Preparation & Reconnaissance
Before taking action on objectives, attackers gather intelligence about
the target network, identifying assets, privileges, and potential paths
to reach critical systems. This phase sets the stage for effective
attack planning and goal-setting.
2. Initial Compromise  
The attacker gains an initial foothold inside the target environment,
often through exploiting vulnerabilities, social engineering, or other
entry methods. This foothold enables access to internal resources
necessary for further activities.
3. Post-Compromise Expansion  
After initial access, attackers move laterally within the network,
escalating privileges and expanding control to reach critical assets
aligned with their objectives.
4. Defense Evasion & Control  
Attackers employ techniques to avoid detection and maintain persistence,
ensuring uninterrupted access while preparing to execute their primary
goals.
5. Target Interaction & Collection  
This phase corresponds to actively interacting with the target assets to fulfill the attacker’s objectives:
Confidentiality objectives: Collect sensitive data and intellectual property (Collection).
Integrity or Availability objectives: Manipulate, disrupt, or destroy critical systems or data (Target Interaction).
6. Exfiltration & Impact  
Attackers exfiltrate collected data to external locations under their control (Exfiltration). For availability or integrity attacks, they
cause disruption, deletion, or damage to the target systems or data (Impact). These activities may be continuous or repeated until the
attacker’s goals are met.
---
Additional Insights on Action on Objectives
The phases of Collection, Exfiltration, and Impact map directly to compromises of the Confidentiality, Integrity, and
Availability (CIA) triad, and together define the core "Action on Objectives."
Attackers may loop through these phases repeatedly as needed to achieve their goals.
Understanding attacker objectives allows defenders to anticipate likely targets and attack paths, enabling proactive defense and
incident response.
While it’s difficult to prevent attackers from reaching their objectives once inside, organizations can prepare defensive measures
like incident communication strategies to mitigate damage post-compromise.
---
Using the Phases to Model and Defend Against Attacks
The 6 phases act as building blocks to describe the sequence or tactics observed in specific attacks or from particular threat actors.
Attack-specific kill chains help analyze individual attack progressions, while actor-specific kill chains describe a threat actor’s typical tactics and sequences.
Defensive strategies should prioritize choke points—critical junctures like network segmentation and identity zones—where attackers must pivot and face increased scrutiny before advancing toward objectives.
Given the difficulty of protecting all internet-facing assets, focusing defenses on critical internal assets and attack phases
occurring inside the organization’s network increases resilience and chances of detection.
---
5. Exfiltration & Impact
Why it's common: Final goal is data theft or disruption.
Cloud exfiltration techniques:
Downloading storage blobs (Azure), S3 buckets, GCS
Syncing data to attacker-controlled services
Impact techniques:
Deleting critical data or resources
Ransomware in cloud VMs
Cost-exhaustion attacks by spinning up resources
💡 Conclusion:
The most commonly observed phases in real cloud attacks are:
Reconnaissance
Initial Access
Credential Access
Privilege Escalation
Defense Evasion
These are the core of almost every successful cloud attack chain. If you'd like a matrix or attack graph of these mapped to Azure/AWS/GCP
tools or detections, I can provide that too.

Example Cloud Attack Chain
Initial Access: Attacker finds a GitHub repo with hardcoded Azure Function Key.
Credential Access: Inside the Function App, they extract a storage account key from environment variables.
Privilege Escalation: The storage key allows access to a blob containing an Azure service principal secret → used to get Contributor role.
Lateral Movement: Using Contributor, attacker pivots to another resource group or subscription (via trust or automation account).
Persistence: Attacker deploys an Azure Automation Account runbook to re-add themselves every 12 hours using a hidden SP.