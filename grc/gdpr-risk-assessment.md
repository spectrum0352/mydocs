# GDPR Risk Assessment

## 1. Overview

When advising organisations on how to comply with the **General Data Protection Regulation (GDPR)**, organisations sometimes state that they apply **"best information security practices."**

The important question is: **What does "best information security practices" actually mean in the context of a specific organisation, its processing activities, and the personal data it processes?**

A generic statement that an organisation follows "best practices" is not, by itself, sufficient to demonstrate GDPR compliance. GDPR requires controllers and processors to assess risks associated with the processing of personal data and to implement **appropriate technical and organisational measures (TOMs)** that are proportionate to those risks.

Controllers and processors must assess:

* Risks to the **security of personal data**.
* Risks to the **rights and freedoms of natural persons**.
* The likelihood and severity of potential impacts.
* The nature, scope, context, and purposes of processing.
* The effectiveness and appropriateness of existing controls.
* The residual risk remaining after controls are implemented.

The objective is to identify, evaluate, treat, monitor, and periodically reassess risks so that appropriate technical, organisational, and, where applicable, legal measures can be implemented.

> **Key principle:** GDPR compliance cannot be demonstrated merely by claiming adherence to "best practices." Organisations should be able to demonstrate that security and privacy measures are appropriate and proportionate to the risks associated with their actual processing activities.

---

## 2. Relationship Between Information Security and GDPR

Information security is a fundamental component of personal data protection.

The protection of information systems is an integral part of GDPR compliance because information systems are frequently essential means through which personal data is:

* Collected.
* Stored.
* Accessed.
* Transmitted.
* Analysed.
* Modified.
* Shared.
* Archived.
* Deleted.

Organisations have historically implemented information security controls to protect confidential business information and critical information systems.

The development and adoption of information security standards have provided organisations with structured approaches for establishing, operating, assessing, and improving information security management systems.

One prominent example is:

* **ISO/IEC 27001** — Information Security Management Systems (ISMS).

An ISMS provides a systematic approach for managing information security risks, selecting controls, establishing governance, and continuously improving security.

Certification against ISO/IEC 27001 can provide independent assurance that an organisation's ISMS has been assessed against the applicable certification requirements by an accredited certification body.

However:

> **ISO/IEC 27001 certification is not a prerequisite for GDPR compliance.**

An organisation can implement appropriate information security without holding an ISO/IEC 27001 certificate.

The critical requirement is that the organisation can demonstrate that its security measures are:

1. Based on an appropriate risk assessment.
2. Appropriate to the risks identified.
3. Proportionate to the nature of the processing.
4. Implemented effectively.
5. Regularly reviewed and updated.
6. Capable of protecting personal data against relevant threats and risks.

---

## 3. Information Security Risk Assessment

Adequate information security should be based on a structured and documented risk-management process.

A suitable risk assessment methodology should identify:

* Assets.
* Threats.
* Vulnerabilities.
* Existing controls.
* Security events.
* Likelihood.
* Impact.
* Inherent risk.
* Residual risk.
* Risk treatment requirements.
* Risk owners.
* Risk acceptance criteria.

A recognised methodology can be used to provide consistency and repeatability.

**ISO/IEC 27005** provides guidance for information security risk management and can be used as one reference methodology.

Other recognised risk-management frameworks and methodologies may also be used, provided that they appropriately address the organisation's information security and privacy risks.

---

## 4. Why "Best Security Practices" Are Not Sufficient

The phrase **"best security practices"** can be problematic when it is used without supporting risk analysis.

Information security risks vary significantly between organisations and processing environments.

A security control that is appropriate for one organisation may be:

* Insufficient for another organisation.
* Excessive for another environment.
* Economically disproportionate.
* Technically unsuitable.
* Ineffective against the actual threat landscape.

Therefore, security controls should be selected based on the organisation's actual risk profile rather than on a generic assumption that a particular collection of controls constitutes "best practice."

For example, an organisation may deploy:

* Firewalls.
* Network scanners.
* IDS/IPS systems.
* Real-time log monitoring.
* Vulnerability scanners.
* Endpoint security systems.
* Security information and event management (SIEM).
* Network segmentation.
* Encryption.
* Data loss prevention (DLP).

These controls may be valuable, but their existence alone does not demonstrate that the organisation has adequately addressed its GDPR obligations.

Controls should be evaluated against:

* The processing activities.
* The personal data involved.
* Threats and vulnerabilities.
* Potential consequences.
* Likelihood of occurrence.
* Existing safeguards.
* Residual risk.
* Regulatory requirements.
* Business requirements.

In some circumstances, organisational, operational, procedural, contractual, or personnel controls may provide effective risk reduction at a lower cost than additional technical controls.

The objective is therefore not to implement the maximum possible number of controls.

The objective is to implement **appropriate and proportionate controls based on assessed risk**.

---

## 5. Information Security Policies Versus Risk Assessment

Many organisations maintain information security policies and security standards but have not formally assessed the risks associated with their information systems and processing activities.

Having policies does not, by itself, demonstrate that risks have been adequately addressed.

A mature security programme should establish a relationship between:

```text
Business / Processing Activity
          |
          v
Information & Personal Data
          |
          v
Threats and Vulnerabilities
          |
          v
Risk Assessment
          |
          v
Risk Treatment
          |
          v
Technical + Organisational Measures
          |
          v
Residual Risk
          |
          v
Risk Acceptance / Further Treatment
          |
          v
Continuous Monitoring and Review
```

Without a documented risk assessment, it is difficult to demonstrate why particular controls were selected, whether they are proportionate, and whether significant risks remain untreated.

---

# 6. GDPR Changes the Risk Perspective

Traditional information security programmes have historically focused heavily on protecting organisational information and business assets.

GDPR expands this perspective by requiring organisations to consider the protection of **personal data and the rights and freedoms of natural persons**.

The distinction can be summarised as follows:

| Information Security                                               | GDPR / Data Protection                                                        |
| ------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| Protects information and information systems                       | Protects personal data and the rights and freedoms of individuals             |
| Primarily focuses on information security risks                    | Considers security risks and broader privacy/data-protection risks            |
| Protects confidentiality, integrity and availability               | Protects personal data and considers impacts on individuals                   |
| Focuses heavily on organisational assets                           | Focuses on processing activities and affected individuals                     |
| Security controls are selected based on information security risks | Technical and organisational measures must also reflect GDPR processing risks |
| May focus on business impact                                       | Considers potential impact on natural persons                                 |
| Security governance is central                                     | Security, privacy, accountability, and lawful processing are interconnected   |

This does not mean that information security and GDPR are separate disciplines.

Rather:

> **Information security provides an essential foundation for protecting personal data, while GDPR establishes a broader legal and risk-based framework for how personal data is processed and protected.**

---

# 7. GDPR Article 24 — Responsibility of the Controller

Article 24 of the GDPR establishes the controller's responsibility to implement appropriate technical and organisational measures based on the characteristics and risks of processing.

The assessment should take into account:

1. **Nature of processing**
2. **Scope of processing**
3. **Context of processing**
4. **Purposes of processing**
5. **Risks of varying likelihood and severity to the rights and freedoms of natural persons**

The controller must not only implement appropriate measures but also be able to **demonstrate compliance**.

The measures must be reviewed and updated where necessary.

Where proportionate to the processing activities, appropriate data protection policies should also be implemented.

---

# 8. GDPR Article 32 — Security of Processing

Article 32 requires controllers and processors to implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk.

The assessment should consider, among other factors:

* The state of the art.
* Costs of implementation.
* Nature of processing.
* Scope of processing.
* Context of processing.
* Purposes of processing.
* Risks to the rights and freedoms of natural persons.
* Likelihood of risks.
* Severity of risks.

Article 32 specifically identifies risks associated with:

* Accidental destruction.
* Unlawful destruction.
* Accidental loss.
* Unlawful loss.
* Alteration.
* Unauthorised disclosure.
* Unauthorised access.
* Personal data transmitted.
* Personal data stored.
* Personal data otherwise processed.

Appropriate measures may include, where appropriate:

* Pseudonymisation.
* Encryption.
* Confidentiality controls.
* Integrity controls.
* Availability controls.
* Resilience of processing systems.
* Backup and recovery.
* Disaster recovery.
* Business continuity.
* Regular testing.
* Security assessments.
* Evaluation of control effectiveness.

---

# 9. GDPR Risk Assessment Must Go Beyond Traditional Information Security Risk

When assessing GDPR risks, organisations should not consider only conventional information security threats.

They should also consider risks arising from the **processing of personal data itself**.

The assessment should therefore consider the following dimensions.

## 9.1 Nature of Processing

The organisation should determine how personal data is processed.

Examples include:

* Manual processing.
* Automated processing.
* Semi-automated processing.
* Profiling.
* Automated decision-making.
* Artificial intelligence and machine learning.
* Behaviour monitoring.
* Large-scale analytics.
* Cross-system data correlation.

Automated processing and profiling can create significant risks to individuals, including:

* Discrimination.
* Incorrect decisions.
* Unfair treatment.
* Loss of autonomy.
* Unjustified exclusion.
* Inaccurate profiling.
* Lack of transparency.

---

## 9.2 Scope of Processing

The scope of processing should be assessed.

Relevant considerations include:

* Number of data subjects.
* Volume of personal data.
* Geographic coverage.
* Number of systems involved.
* Number of processing activities.
* Number of organisations involved.
* Number of recipients.
* Frequency of processing.
* Duration of processing.
* Whether processing is conducted on a large scale.

Large-scale processing generally requires greater scrutiny because a security or privacy event may affect a significant number of individuals.

---

## 9.3 Context of Processing

The context in which personal data is processed can significantly affect the level of risk.

The assessment should consider:

* Industry sector.
* Business model.
* Relationship with data subjects.
* Expectations of data subjects.
* Vulnerability of data subjects.
* Regulatory environment.
* Geographic environment.
* Processing ecosystem.
* Third-party involvement.
* Data-sharing arrangements.
* Cross-border processing.
* Existing safeguards.

For example, the consequences of a personal data breach may differ significantly between an organisation that sells general consumer products online and a financial institution processing financial information for credit decisions.

---

## 9.4 Purpose of Processing

The purpose for which personal data is processed must be considered.

Different processing purposes can result in substantially different risks.

Examples include:

* Customer account management.
* Marketing.
* Fraud detection.
* Credit assessment.
* Employee administration.
* Healthcare services.
* Financial services.
* Behavioural analytics.
* Advertising.
* Profiling.
* Automated decision-making.
* Security monitoring.

The risk assessment should evaluate whether the intended purpose introduces risks to individuals and whether the processing is necessary and proportionate for that purpose.

---

# 10. Risk to the Rights and Freedoms of Natural Persons

GDPR requires organisations to assess **risks of varying likelihood and severity to the rights and freedoms of natural persons**.

This is broader than simply asking whether an information system could be compromised.

The assessment should determine:

1. What could happen to the personal data?
2. What could happen to the affected individuals?
3. How likely is the event?
4. How severe could the consequences be?
5. Which rights and freedoms could be affected?
6. Which controls reduce the risk?
7. What residual risk remains?

Potential impacts may include:

* Financial loss.
* Identity theft.
* Fraud.
* Discrimination.
* Reputational harm.
* Social harm.
* Psychological harm.
* Loss of confidentiality.
* Loss of control over personal data.
* Unauthorised surveillance.
* Unfair treatment.
* Restriction of rights.
* Loss of access to services.
* Incorrect automated decisions.

---

# 11. Confidentiality, Integrity and Availability

The traditional **CIA triad** remains relevant to GDPR risk assessment.

## Confidentiality

Unauthorised persons gain access to personal data.

Examples:

* Data breach.
* Compromised credentials.
* Excessive privileges.
* Insider access.
* Misconfigured cloud storage.
* Unauthorised API access.

Potential consequences may include:

* Identity theft.
* Fraud.
* Loss of privacy.
* Discrimination.
* Reputational harm.

## Integrity

Personal data is altered, corrupted, manipulated, or incorrectly processed.

Examples:

* Unauthorised modification.
* Data corruption.
* Manipulation of records.
* Incorrect database updates.
* Compromised applications.
* Malicious modification.

Potential consequences may include:

* Incorrect decisions.
* Financial loss.
* Incorrect profiling.
* Denial of services.
* Harm to individuals.

## Availability

Personal data or systems required for processing become unavailable.

Examples:

* Ransomware.
* System failure.
* Denial-of-service attacks.
* Infrastructure failure.
* Data corruption.
* Disaster.
* Loss of critical services.

Potential consequences may include:

* Inability to provide services.
* Loss of access to personal information.
* Operational disruption.
* Financial harm.
* Delayed or incorrect decisions.

---

# 12. Risk Assessment Model

A practical GDPR risk assessment can use the following conceptual model:

```text
Threat
   +
Vulnerability
   +
Processing Context
   +
Personal Data Characteristics
   +
Nature / Scope / Purpose
   |
   v
Likelihood
   +
Potential Impact
   |
   v
Inherent Risk
   |
   v
Existing Controls
   |
   v
Residual Risk
   |
   v
Risk Treatment
```

A simplified quantitative model can be represented as:

```text
Risk = Likelihood × Impact
```

However, GDPR assessments should not rely solely on a numerical score.

The assessment should also document the **nature of the potential harm to individuals** and the rights and freedoms that could be affected.

---

# 13. Sources of Risk

Risk may originate from multiple areas of an organisation.

At minimum, organisations should consider:

### 13.1 Information Technology

Examples:

* Vulnerabilities.
* Malware.
* Ransomware.
* Misconfiguration.
* Insecure applications.
* Cloud security weaknesses.
* Weak authentication.
* Excessive privileges.
* Unpatched systems.
* Network attacks.
* API vulnerabilities.

### 13.2 Processing Activities

Examples:

* Excessive data collection.
* Unnecessary retention.
* Excessive access.
* Inappropriate data sharing.
* Incompatible processing purposes.
* Unauthorised secondary use.
* Excessive profiling.
* Inadequate deletion.

### 13.3 People

Examples:

* Human error.
* Insider threats.
* Social engineering.
* Phishing.
* Misuse of privileges.
* Inadequate training.
* Accidental disclosure.
* Poor security practices.

### 13.4 Business and Operational Environment

Examples:

* Business process failures.
* Supply-chain dependencies.
* Third-party processors.
* Outsourcing.
* Physical security issues.
* Operational failures.
* Business continuity weaknesses.
* Regulatory changes.

---

# 14. Example GDPR Risk Assessment

Consider the following scenario:

| Assessment Dimension | Example                                                                                   |
| -------------------- | ----------------------------------------------------------------------------------------- |
| Nature of processing | Automated processing and profiling of customer personal data                              |
| Context              | Banking / financial services                                                              |
| Scope                | Large-scale processing by a major market participant                                      |
| Purpose              | Supporting decisions on loan applications                                                 |
| Data involved        | Customer identification, financial and other relevant personal data                       |
| Key risks            | Unauthorised access, incorrect data, inappropriate profiling, discrimination, data breach |
| CIA impact           | Confidentiality, integrity, and availability assessed separately                          |
| Individual impact    | Financial harm, discrimination, incorrect decisions, privacy loss                         |
| Existing controls    | Access control, encryption, monitoring, logging, segregation, security testing            |
| Residual risk        | Determined after evaluating control effectiveness                                         |
| Treatment            | Additional technical, organisational, and privacy measures where required                 |

The organisation should determine whether a breach of confidentiality, integrity, or availability would have a:

* Low impact.
* Medium impact.
* High impact.
* Very high impact.

The organisation should then assess how the identified event could affect the rights and freedoms of the affected data subjects.

---

# 15. Information Security Risk Assessment and GDPR Risk Assessment

A mature GDPR programme should integrate information security and privacy risk assessments rather than treating them as completely independent activities.

| Area                | Information Security Risk Assessment    | GDPR / Privacy Risk Assessment                                |
| ------------------- | --------------------------------------- | ------------------------------------------------------------- |
| Primary focus       | Information and information systems     | Personal data and individuals                                 |
| Main objective      | Protect information assets              | Protect personal data and rights/freedoms                     |
| CIA                 | Core consideration                      | Core consideration for security of processing                 |
| Threats             | Cyber, operational, physical, human     | Cyber, operational, physical, human, processing/privacy risks |
| Scope               | Information systems and assets          | Processing activities and personal data                       |
| Impact              | Business/organisational impact          | Impact on organisation and natural persons                    |
| Privacy harms       | May be considered                       | Explicitly considered                                         |
| Processing purpose  | May be secondary                        | Core consideration                                            |
| Data subject impact | Not always central                      | Central consideration                                         |
| DPIA                | Not necessarily required                | Required where Article 35 criteria are met                    |
| Legal basis         | Generally outside security assessment   | Important component of GDPR compliance                        |
| Data minimisation   | Security consideration in some contexts | Core GDPR principle                                           |
| Retention           | Security/operational requirement        | GDPR data protection requirement                              |
| Accountability      | Security governance                     | Explicit GDPR requirement                                     |

---

# 16. Data Protection Impact Assessment (DPIA)

A **Data Protection Impact Assessment (DPIA)** is a specific GDPR mechanism for identifying and mitigating privacy risks associated with processing activities.

Under **GDPR Article 35**, a DPIA is required where processing is likely to result in a **high risk to the rights and freedoms of natural persons**.

Examples of processing that may require particular scrutiny include:

* Systematic and extensive evaluation of personal aspects based on automated processing, including profiling, where decisions produce legal or similarly significant effects.
* Large-scale processing of special categories of personal data.
* Large-scale systematic monitoring of publicly accessible areas.

The DPIA should generally describe:

* Processing operations.
* Purposes of processing.
* Necessity and proportionality.
* Risks to data subjects.
* Measures addressing those risks.
* Safeguards.
* Demonstration of compliance.

A DPIA should not be treated as a substitute for an information security risk assessment.

Instead:

```text
Information Security Risk Assessment
                +
Privacy / GDPR Risk Assessment
                +
DPIA, where required
                |
                v
Integrated Risk Treatment
```

---

# 17. Data Protection by Design and by Default

GDPR Article 25 establishes requirements relating to **data protection by design and by default**.

Risk assessment should therefore occur during the design and development of processing activities rather than only after a system has been deployed.

Relevant controls may include:

* Data minimisation.
* Purpose limitation.
* Privacy-preserving architecture.
* Encryption.
* Pseudonymisation.
* Access control.
* Segregation.
* Secure development.
* Privacy-aware application design.
* Default privacy settings.
* Retention controls.
* Automated deletion.
* Monitoring and auditing.

Security and privacy requirements should be incorporated into:

* Architecture.
* Procurement.
* Software development.
* Cloud deployments.
* Data integrations.
* Product design.
* Business processes.
* Third-party arrangements.

---

# 18. Technical, Organisational, and Legal Measures

Based on the risks identified through both information security and GDPR assessments, organisations should implement appropriate measures.

## 18.1 Technical Measures

Examples include:

* Encryption at rest.
* Encryption in transit.
* Pseudonymisation.
* Strong authentication.
* Multi-factor authentication.
* Role-based access control.
* Privileged access management.
* Network segmentation.
* Endpoint protection.
* Vulnerability management.
* Patch management.
* Secure configuration.
* Application security.
* API security.
* Data loss prevention.
* Security monitoring.
* SIEM.
* Intrusion detection and prevention.
* Backup and recovery.
* Disaster recovery.
* Key management.
* Secrets management.
* Database security.
* Cloud security controls.

## 18.2 Organisational Measures

Examples include:

* Information security policies.
* Data protection policies.
* Privacy policies.
* Security awareness training.
* Data protection training.
* Access governance.
* Joiner-mover-leaver processes.
* Incident response procedures.
* Data breach response procedures.
* Business continuity plans.
* Disaster recovery plans.
* Vendor risk management.
* Data protection agreements.
* Processor management.
* Data retention procedures.
* Data deletion procedures.
* Regular risk assessments.
* Internal audits.
* Control testing.

## 18.3 Legal and Contractual Measures

Where applicable, organisations should also consider:

* Data processing agreements.
* Controller-processor contracts.
* Data-sharing agreements.
* International data transfer mechanisms.
* Standard Contractual Clauses (SCCs).
* Confidentiality obligations.
* Security obligations.
* Subprocessor requirements.
* Contractual breach notification requirements.
* Data retention and deletion obligations.

---

# 19. Risk Treatment

After risks have been identified and assessed, the organisation should determine the appropriate treatment strategy.

Typical options include:

### Avoid

Stop or redesign processing where the associated risk cannot be justified or adequately mitigated.

### Reduce

Implement additional technical, organisational, or privacy controls to reduce likelihood or impact.

### Transfer

Transfer or share certain risks through mechanisms such as:

* Insurance.
* Contractual arrangements.
* Outsourcing with appropriate safeguards.

Risk transfer does not eliminate GDPR accountability.

### Accept

Accept residual risk where it falls within the organisation's defined risk appetite and acceptance criteria.

Risk acceptance should be:

* Explicit.
* Documented.
* Approved by an authorised risk owner.
* Supported by the assessment.
* Periodically reviewed.

---

# 20. Residual Risk

Risk assessment should distinguish between **inherent risk** and **residual risk**.

```text
Inherent Risk
     |
     v
Existing Controls
     |
     v
Control Effectiveness
     |
     v
Residual Risk
```

### Inherent Risk

Risk that exists before considering implemented controls.

### Residual Risk

Risk remaining after existing controls have been considered.

The organisation should determine whether residual risk is:

* Acceptable.
* Requires additional treatment.
* Requires management escalation.
* Requires redesign of processing.
* Requires discontinuation of processing.

---

# 21. Accountability and Demonstrability

GDPR introduces an important principle of **accountability**.

It is not sufficient for an organisation to state:

> "The organisation follows industry best practices."

The organisation should be able to demonstrate:

* What personal data is processed.
* Why it is processed.
* How it is processed.
* Where it is processed.
* Who has access.
* Which threats and risks exist.
* How risks were assessed.
* Which controls were selected.
* Why those controls are appropriate.
* How control effectiveness is evaluated.
* What residual risks remain.
* Who accepted those risks.
* When the assessment was last reviewed.
* When the assessment will be reviewed again.

Evidence may include:

* Risk assessments.
* DPIAs.
* Records of Processing Activities (RoPA).
* Security policies.
* Data protection policies.
* Architecture documentation.
* Control assessments.
* Vulnerability assessments.
* Penetration-test reports.
* Audit reports.
* Security monitoring records.
* Access reviews.
* Incident records.
* Training records.
* Vendor assessments.
* Data processing agreements.
* Business continuity tests.
* Backup and recovery tests.

---

# 22. Continuous Review

GDPR risk assessment should not be treated as a one-time exercise.

Risk should be reassessed when there are significant changes to:

* Processing activities.
* Personal data categories.
* Data subjects.
* Processing purposes.
* Applications.
* Infrastructure.
* Cloud environments.
* Vendors.
* Processors.
* Data flows.
* Geographic locations.
* Threat landscape.
* Vulnerabilities.
* Security controls.
* Regulatory requirements.
* Business processes.

Periodic reassessment should also be performed according to the organisation's defined risk-management framework.

---

# 23. Recommended GDPR Risk Assessment Process

A comprehensive assessment process can follow these steps:

```text
1. Identify Processing Activities
              |
              v
2. Identify Personal Data
              |
              v
3. Identify Data Subjects
              |
              v
4. Document Data Flows
              |
              v
5. Identify Processing Purpose
              |
              v
6. Assess Nature, Scope and Context
              |
              v
7. Identify Threats and Vulnerabilities
              |
              v
8. Identify Potential Harms to Individuals
              |
              v
9. Assess Likelihood and Severity
              |
              v
10. Determine Inherent Risk
              |
              v
11. Evaluate Existing Controls
              |
              v
12. Determine Residual Risk
              |
              v
13. Determine Whether DPIA Is Required
              |
              v
14. Define Risk Treatment
              |
              v
15. Implement Technical and Organisational Measures
              |
              v
16. Obtain Risk Acceptance Where Applicable
              |
              v
17. Monitor Control Effectiveness
              |
              v
18. Review and Reassess
```

---

# 24. Recommended GDPR Risk Assessment Record

A GDPR risk register can include at least the following fields:

| Field                 | Description                                        |
| --------------------- | -------------------------------------------------- |
| Risk ID               | Unique risk identifier                             |
| Processing Activity   | Processing activity associated with the risk       |
| Business Process      | Business process supported by the processing       |
| Data Subject          | Category of affected individuals                   |
| Personal Data         | Categories of personal data                        |
| Special Category Data | Whether Article 9 data is involved                 |
| Processing Purpose    | Purpose of processing                              |
| Processing Nature     | Manual, automated, profiling, etc.                 |
| Processing Scope      | Scale and geographic scope                         |
| Processing Context    | Relevant organisational and environmental context  |
| Asset/System          | System or service processing the data              |
| Data Flow             | Source, destination and transfer path              |
| Threat                | Threat scenario                                    |
| Vulnerability         | Relevant weakness                                  |
| Security Event        | Potential security event                           |
| CIA Impact            | Confidentiality, integrity and availability impact |
| Individual Harm       | Potential harm to data subjects                    |
| Likelihood            | Likelihood rating                                  |
| Severity              | Severity rating                                    |
| Inherent Risk         | Risk before controls                               |
| Existing Controls     | Current safeguards                                 |
| Control Effectiveness | Effectiveness of existing controls                 |
| Residual Risk         | Remaining risk                                     |
| Risk Treatment        | Required treatment                                 |
| Additional Controls   | Planned controls                                   |
| Risk Owner            | Accountable risk owner                             |
| Target Date           | Remediation target                                 |
| Risk Acceptance       | Approval status where applicable                   |
| DPIA Required         | Yes/No                                             |
| DPIA Reference        | Associated DPIA                                    |
| Review Date           | Next assessment date                               |
| Status                | Open, mitigated, accepted, transferred, closed     |

---

# 25. Key Principles

The following principles should guide GDPR risk assessment:

1. **Risk assessment must be specific to the processing activity.**
2. **"Best practices" alone are not evidence of GDPR compliance.**
3. **Security controls should be proportionate to identified risks.**
4. **Information security risk and privacy risk should be considered together.**
5. **The rights and freedoms of natural persons must be explicitly considered.**
6. **Confidentiality, integrity, and availability remain fundamental security considerations.**
7. **Nature, scope, context, and purposes of processing must be evaluated.**
8. **The likelihood and severity of potential harm must be assessed.**
9. **Existing controls and their effectiveness must be evaluated.**
10. **Residual risk must be documented and managed.**
11. **A DPIA should be performed where GDPR Article 35 requires it.**
12. **Data protection should be incorporated into system and process design.**
13. **Technical and organisational measures should be reviewed and updated when necessary.**
14. **Risk acceptance should be explicit and appropriately authorised.**
15. **Risk assessments should be maintained as living documents.**
16. **Organisations should retain sufficient evidence to demonstrate accountability.**

---

# 26. Conclusion

Information security is a fundamental component of GDPR compliance, but GDPR compliance extends beyond implementing conventional information security controls.

An organisation may have firewalls, endpoint protection, vulnerability scanners, IDS/IPS, SIEM, encryption, access controls, security policies, and other security technologies and still have unresolved GDPR risks.

The fundamental question is not:

> **"Does the organisation follow best security practices?"**

The more appropriate questions are:

* What personal data is being processed?
* Why is it being processed?
* How is it being processed?
* What are the risks associated with that processing?
* What risks could affect the rights and freedoms of individuals?
* How likely are those risks?
* How severe could the consequences be?
* Which technical and organisational measures are currently implemented?
* Are those measures appropriate and proportionate?
* What residual risk remains?
* Is a DPIA required?
* Can the organisation demonstrate that the selected measures are appropriate?
* Are the controls continuously monitored and reviewed?

A robust GDPR compliance programme therefore requires an integrated approach combining:

```text
Information Security
        +
Privacy Risk Management
        +
Data Protection Governance
        +
DPIA Where Required
        +
Technical and Organisational Measures
        +
Accountability and Evidence
        +
Continuous Monitoring and Review
```

Only through a documented, risk-based, proportionate, and continuously reviewed approach can an organisation effectively demonstrate that its processing activities are appropriately protected and aligned with GDPR requirements.

> **Core principle:** GDPR compliance is not demonstrated by claiming adherence to "best practices." It is demonstrated through a documented understanding of processing activities, identification and assessment of risks to personal data and individuals, implementation of appropriate and proportionate safeguards, and the ability to demonstrate that those safeguards remain effective and appropriate over time.
