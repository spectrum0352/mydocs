# AI Risk Assessment: Step-by-Step Guide

## 1. What Is AI Risk Assessment?

**AI Risk Assessment** is a structured, step-by-step process for identifying, analyzing, evaluating, treating, and monitoring risks associated with an Artificial Intelligence (AI) system throughout its lifecycle.

It helps organizations identify problems in an AI system **before they cause harm** and establish appropriate controls to manage those risks early.

A comprehensive AI risk assessment helps organizations ensure that AI systems are:

* Safe and secure
* Fair and non-discriminatory
* Reliable and accurate
* Transparent and explainable where appropriate
* Privacy-preserving
* Legally and regulatorily compliant
* Resilient against attacks and misuse
* Governed by appropriate human oversight
* Appropriate for their intended purpose

AI risk assessment should not be treated as a one-time activity. It should be performed throughout the AI lifecycle, including during **design, development, testing, deployment, operation, modification, and retirement**.

---

## 2. What Does an AI Risk Assessment Look At?

AI risk assessment evaluates multiple categories of risk.

### 2.1 Technology and Model Risk

Questions include:

* Does the AI system work correctly?
* Is the model sufficiently accurate for its intended use?
* Is the model robust against unexpected inputs?
* Can the model produce incorrect or fabricated information?
* Is the model vulnerable to adversarial attacks?
* Can the model be manipulated through malicious inputs?
* Does model performance degrade over time?
* Are dependencies, APIs, models, libraries, and infrastructure secure?

Examples:

* Model hallucination
* Model drift
* Adversarial attacks
* Prompt injection
* Data poisoning
* Insecure model configuration
* Unauthorized model modification

---

### 2.2 Data and Privacy Risk

Questions include:

* What data is used to train, fine-tune, test, or operate the AI system?
* Does the organization have the right to use the data?
* Does the data contain Personally Identifiable Information (PII) or sensitive information?
* Is the data accurate and representative?
* Is personal data unnecessarily exposed to the model?
* Are data retention and deletion requirements defined?
* Are data access controls implemented?

Examples:

* Personal data leakage
* Sensitive data exposure
* Poor data quality
* Unauthorized data use
* Excessive data retention
* Training-data leakage
* Re-identification risk

---

### 2.3 Legal and Compliance Risk

Questions include:

* Does the AI system comply with applicable laws and regulations?
* Are privacy requirements satisfied?
* Are required disclosures provided to users?
* Are appropriate records and audit evidence maintained?
* Are intellectual-property and licensing requirements addressed?
* Are contractual requirements satisfied?
* Does the AI use case require additional regulatory controls?

Depending on the organization and use case, applicable requirements may include:

* Data protection and privacy laws
* Sector-specific regulations
* AI-specific legislation
* Intellectual-property requirements
* Cybersecurity requirements
* Records-retention requirements
* Contractual and third-party requirements

---

### 2.4 Ethics and Fairness Risk

Questions include:

* Could the AI system produce biased or discriminatory outcomes?
* Are protected or sensitive characteristics indirectly influencing decisions?
* Is the training data representative?
* Are different user groups affected differently?
* Can decisions be explained where explanation is required?
* Is there a mechanism for users to challenge or appeal important decisions?

Examples:

* Algorithmic bias
* Discrimination
* Unequal error rates
* Unfair treatment of specific groups
* Lack of transparency
* Lack of meaningful human oversight

---

### 2.5 Operational Risk

Questions include:

* Can people misuse the AI system?
* Could users over-trust AI-generated results?
* Are human review and escalation processes defined?
* What happens when the AI system produces an incorrect result?
* Are operational procedures documented?
* Are incidents monitored and investigated?
* Is there a fallback or business-continuity process?

Examples:

* Over-reliance on AI
* Incorrect automated decisions
* Lack of human oversight
* Poor incident response
* Inadequate business continuity
* Unauthorized use of AI-generated recommendations

---

### 2.6 Security Risk

AI systems introduce both traditional cybersecurity risks and AI-specific threats.

Security assessment should consider:

* Identity and access management
* Privileged access
* Authentication and authorization
* Network security
* API security
* Model security
* Data security
* Secrets management
* Supply-chain security
* Logging and monitoring
* Vulnerability management
* Prompt injection
* Jailbreaking
* Data poisoning
* Model extraction
* Sensitive information disclosure
* Insecure output handling
* Excessive agency
* Unauthorized tool use

Security testing should cover the AI application, model, data, APIs, infrastructure, integrations, and supporting services.

---

# 3. AI Risk Assessment — Step-by-Step Process

## Step 1: Define the AI System

Start by clearly documenting what is being assessed.

Record:

* AI system name
* Business owner
* Technical owner
* Purpose and intended use
* Users and affected individuals
* AI technology or model used
* Model provider
* Deployment environment
* Data sources
* External integrations
* APIs
* Plugins or tools
* Automated actions
* Human decision points
* Geographic scope
* Business-criticality
* Regulatory scope

### Example

**AI Use Case:** AI-assisted loan approval

**Purpose:** Assist financial institutions in evaluating loan applications.

**Users:** Loan officers and authorized financial staff.

**Potentially affected individuals:** Loan applicants.

**AI Function:** Analyze applicant information and provide a recommendation.

---

## Step 2: Define the Intended Use and Boundaries

Clearly distinguish between:

* Intended use
* Permitted use
* Unsupported use
* Prohibited use
* High-risk use cases
* Human-only decisions

This is important because an AI system can be relatively safe for one purpose but inappropriate or high-risk for another.

For example, an AI system designed to **assist** a loan officer may require different controls from a system that **automatically rejects loan applications without human review**.

Document:

* Intended users
* Intended decisions
* Intended outputs
* Maximum acceptable autonomy
* Human oversight requirements
* Usage restrictions
* Escalation conditions

---

## Step 3: Identify Stakeholders

Identify everyone involved in the AI system and everyone potentially affected by it.

Typical stakeholders include:

* Business owner
* AI/model owner
* Data owner
* Security team
* Privacy team
* Legal and compliance teams
* Risk management
* Internal audit
* IT/Cloud operations
* Application owners
* AI developers
* Data scientists
* Model-risk management
* Third-party providers
* End users
* Customers or other affected individuals

Assign clear accountability for risk decisions.

---

## Step 4: Identify AI Assets

Create an inventory of the assets associated with the AI system.

Examples:

| Asset             | Examples                                        |
| ----------------- | ----------------------------------------------- |
| Models            | Foundation model, ML model, fine-tuned model    |
| Data              | Training, validation, production, feedback data |
| Applications      | Web application, chatbot, AI agent              |
| APIs              | Model APIs, REST APIs, internal APIs            |
| Infrastructure    | Cloud services, containers, VMs, Kubernetes     |
| Identity          | Users, service principals, managed identities   |
| Secrets           | API keys, tokens, certificates                  |
| Tools             | Plugins, functions, external tools              |
| Knowledge sources | Vector databases, documents, knowledge bases    |
| Logs              | Application, security, model, audit logs        |
| Dependencies      | Libraries, frameworks, third-party components   |

---

## Step 5: Identify AI Risks and Threats

Identify risks using multiple perspectives.

### Common AI Risks

* Incorrect or unreliable outputs
* Hallucinations
* Bias and discrimination
* Privacy violations
* Sensitive-data exposure
* Intellectual-property issues
* Lack of transparency
* Lack of explainability
* Model drift
* Data-quality problems
* Unauthorized model use
* Prompt injection
* Jailbreaking
* Data poisoning
* Model theft or extraction
* Supply-chain compromise
* Insecure APIs
* Excessive permissions
* Excessive AI autonomy
* Unauthorized tool execution
* Over-reliance on AI outputs
* Regulatory non-compliance
* Third-party dependency risks
* Inadequate monitoring
* Inadequate incident response

---

## Step 6: Identify Who or What Could Be Harmed

AI risk assessment should consider not only technical failures but also potential impact.

Potentially affected parties include:

* Customers
* Employees
* Applicants
* Patients
* Citizens
* Suppliers
* Business partners
* The organization
* Society or the public

Consider potential impacts such as:

* Financial loss
* Privacy loss
* Discrimination
* Safety impact
* Legal consequences
* Reputational damage
* Operational disruption
* Security compromise
* Loss of customer trust

---

# 4. Perform Risk Analysis

For each identified risk, estimate:

1. **Likelihood** — How likely is the risk to occur?
2. **Impact** — How severe would the consequences be?
3. **Exposure** — How exposed is the AI system to the risk?
4. **Existing controls** — What controls are already implemented?
5. **Residual risk** — What risk remains after controls?

A simple risk score can be calculated as:

> **Risk Score = Likelihood × Impact**

For example:

|         Likelihood |       Impact | Risk Score |
| -----------------: | -----------: | ---------: |
|           1 – Rare |      1 – Low |          1 |
|       2 – Unlikely |    2 – Minor |          4 |
|       3 – Possible | 3 – Moderate |          9 |
|         4 – Likely |     4 – High |         16 |
| 5 – Almost Certain | 5 – Critical |         25 |

Organizations should define their own scoring methodology and risk appetite.

---

# 5. Example: AI Used for Loan Approvals

Consider an AI system used to support loan approval decisions.

## Risk

The AI may reject good applicants because of biased or incomplete training data.

### Potential Causes

* Historical bias in training data
* Unrepresentative datasets
* Proxy variables
* Incorrect feature selection
* Model design problems
* Data-quality issues
* Model drift

### Potential Impact

* Unfair rejection of applicants
* Financial harm
* Regulatory or legal consequences
* Discrimination claims
* Reputational damage
* Loss of customer trust

### Risk Assessment

The organization should:

* Check training data
* Validate data quality
* Test for bias
* Compare outcomes across relevant groups
* Establish appropriate fairness metrics
* Conduct model validation
* Add human review for critical decisions
* Monitor rejection patterns over time
* Establish an appeal or correction mechanism
* Periodically reassess the model

### Example Control

> **Human-in-the-loop:** The AI provides a recommendation, but a qualified human decision-maker reviews the recommendation before a critical loan decision is finalized.

---

# 6. Evaluate Existing Controls

For every identified risk, document the controls already implemented.

Controls may include:

### Preventive Controls

* Data validation
* Access controls
* Least privilege
* Input filtering
* Model restrictions
* Network segmentation
* Secure development practices
* Data-loss prevention
* Human approval gates

### Detective Controls

* Logging
* Monitoring
* Anomaly detection
* Model-performance monitoring
* Bias monitoring
* Security alerts
* Audit trails

### Corrective Controls

* Model rollback
* Incident response
* Data correction
* Access revocation
* Model retraining
* Application shutdown
* Human intervention

---

# 7. Define Risk Treatment

Once risks are assessed, determine how each risk should be treated.

Typical options are:

### Avoid

Do not deploy the AI system or do not use AI for the particular activity.

### Mitigate

Implement controls that reduce the likelihood or impact.

### Transfer

Transfer part of the risk through contractual, insurance, or third-party arrangements where appropriate.

### Accept

Accept the remaining risk when it falls within the organization's defined risk appetite and appropriate authorization has been obtained.

Risk acceptance should be documented and approved by the appropriate authority.

---

# 8. Implement AI Security and Governance Controls

A comprehensive AI risk program should establish controls across the AI lifecycle.

## Governance

* AI policy
* AI risk management framework
* AI inventory
* AI ownership
* Risk classification
* Approval process
* Acceptable-use requirements
* Third-party AI requirements
* Exception management

## Data Security

* Data classification
* Data minimization
* Encryption
* Access control
* Data-loss prevention
* Retention and deletion
* Data lineage
* Data-quality controls

## Identity and Access Management

* Strong authentication
* Role-based access control
* Least privilege
* Privileged access management
* Managed identities where appropriate
* Service-account governance
* Periodic access reviews

## Model Security

* Model validation
* Secure model storage
* Model integrity controls
* Model versioning
* Model provenance
* Model access controls
* Adversarial testing
* Model monitoring

## Application Security

* Secure coding
* API security
* Input validation
* Output validation
* Secrets management
* Dependency management
* Vulnerability management
* Secure configuration

## AI-Specific Security

* Prompt-injection testing
* Jailbreak testing
* Data-poisoning assessment
* Sensitive-information disclosure testing
* Model extraction assessment
* Tool/plugin authorization
* Agent permission boundaries
* Output handling controls
* Human approval for high-impact actions

---

# 9. Conduct AI Testing

Testing should be performed before production deployment and periodically afterward.

### Functional Testing

Verify that the AI performs its intended function.

### Accuracy Testing

Measure:

* Accuracy
* Precision
* Recall
* F1 score
* False-positive rate
* False-negative rate

The appropriate metrics depend on the use case.

### Bias and Fairness Testing

Assess whether outcomes differ significantly across relevant groups.

### Security Testing

Test for:

* Prompt injection
* Jailbreaking
* Data leakage
* Unauthorized access
* Model manipulation
* Malicious inputs
* API abuse
* Tool abuse
* Supply-chain vulnerabilities

### Privacy Testing

Check whether:

* Sensitive information can be retrieved
* Personal data is unnecessarily exposed
* Data is retained appropriately
* Users can access information they are not authorized to access

### Resilience Testing

Assess how the AI behaves when:

* Input data is incomplete
* Input data is malicious
* External services become unavailable
* Model responses fail
* Dependencies fail
* Traffic increases significantly

---

# 10. Establish Human Oversight

Human oversight is particularly important when AI can affect people's rights, safety, finances, employment, healthcare, access to services, or other high-impact outcomes.

Define:

* When human review is mandatory
* Who can override an AI decision
* When escalation is required
* What evidence the human reviewer receives
* How decisions are documented
* How users can challenge decisions
* What happens when the AI is unavailable or unreliable

Avoid treating human review as a purely procedural step. Reviewers should have sufficient authority, information, competence, and time to meaningfully challenge AI outputs.

---

# 11. Establish Monitoring and Continuous Risk Management

AI risks can change after deployment.

Monitor:

* Model accuracy
* Model drift
* Data drift
* Bias indicators
* Error rates
* Security events
* Prompt-injection attempts
* Abnormal usage
* Data leakage
* User feedback
* API usage
* Cost anomalies
* Unauthorized access
* Model changes
* Dependency changes
* Regulatory changes

Define thresholds that trigger investigation, retraining, rollback, or suspension.

---

# 12. Establish an AI Incident Response Process

Create an incident response process specifically covering AI-related incidents.

Potential incidents include:

* Sensitive data disclosure
* Harmful or incorrect AI output
* Security compromise
* Prompt injection
* Model poisoning
* Unauthorized model access
* Unauthorized tool execution
* Biased outcomes
* Regulatory violations
* Model degradation
* Third-party AI provider outage

The process should define:

1. Detection
2. Triage
3. Containment
4. Investigation
5. Risk assessment
6. Remediation
7. Recovery
8. Notification where required
9. Root-cause analysis
10. Lessons learned

---

# 13. Assess Third-Party and AI Supply-Chain Risk

Many organizations use external:

* Foundation models
* AI APIs
* SaaS AI platforms
* Open-source models
* Model repositories
* Data providers
* Plugins
* AI agents
* Software libraries

Assess third-party providers for:

* Security controls
* Privacy practices
* Data usage
* Data retention
* Model training practices
* Subprocessors
* Geographic processing locations
* Availability
* Incident notification
* Regulatory compliance
* Intellectual-property responsibilities
* Vulnerability management
* Business continuity
* Contractual protections

---

# 14. Document the AI Risk Register

Maintain an AI-specific risk register.

Example:

| ID     | AI Risk                | Likelihood | Impact | Inherent Risk | Controls                                      | Residual Risk | Owner        | Status      |
| ------ | ---------------------- | ---------: | -----: | ------------: | --------------------------------------------- | ------------: | ------------ | ----------- |
| AI-001 | Biased loan decisions  |          4 |      5 |      Critical | Bias testing, human review, monitoring        |        Medium | Model Owner  | Open        |
| AI-002 | Sensitive data leakage |          3 |      5 |          High | DLP, access control, filtering                |        Medium | Security     | Open        |
| AI-003 | Prompt injection       |          4 |      4 |          High | Input validation, monitoring, least privilege |        Medium | AI Security  | In Progress |
| AI-004 | Model drift            |          3 |      4 |          High | Continuous monitoring and validation          |           Low | Data Science | Open        |

The risk register should be regularly reviewed and updated.

---

# 15. AI Risk Assessment Deliverables

A mature AI risk assessment should produce evidence such as:

* AI system inventory
* AI use-case description
* Business impact assessment
* Data-flow diagram
* AI architecture diagram
* Threat model
* AI risk register
* Privacy assessment
* Security assessment
* Bias and fairness assessment
* Model validation report
* Testing results
* Third-party risk assessment
* Regulatory assessment
* Control assessment
* Human-oversight design
* Incident-response plan
* Monitoring plan
* Risk treatment plan
* Risk acceptance records
* Approval documentation

---

# 16. Recommended AI Risk Assessment Lifecycle

A practical lifecycle is:

```text
Identify AI System
       |
       v
Define Intended Use
       |
       v
Identify Stakeholders & Assets
       |
       v
Identify Data, Threats & Risks
       |
       v
Analyze Likelihood & Impact
       |
       v
Evaluate Existing Controls
       |
       v
Determine Residual Risk
       |
       v
Treat the Risk
       |
       v
Test & Validate AI System
       |
       v
Obtain Approval
       |
       v
Deploy with Monitoring
       |
       v
Monitor & Reassess
       |
       v
Incident / Change / Regulatory Trigger
       |
       +--------> Repeat Assessment
```

---

# 17. AI Risk Assessment Checklist

## AI Governance

* [ ] AI system has a documented business owner
* [ ] AI system has a technical owner
* [ ] Intended use is documented
* [ ] Prohibited or unsupported use is documented
* [ ] AI risk classification is established
* [ ] Applicable policies are identified
* [ ] Applicable regulations are identified
* [ ] Risk appetite is defined
* [ ] Approval requirements are documented

## Data

* [ ] Data sources are documented
* [ ] Data ownership is established
* [ ] Data classification is completed
* [ ] Data quality is assessed
* [ ] Privacy requirements are assessed
* [ ] Data minimization is implemented
* [ ] Retention requirements are defined
* [ ] Access controls are implemented

## Security

* [ ] Authentication is implemented
* [ ] Authorization is implemented
* [ ] Least privilege is enforced
* [ ] Secrets are protected
* [ ] APIs are secured
* [ ] Network controls are implemented
* [ ] Logging and monitoring are enabled
* [ ] Vulnerability management is implemented
* [ ] AI-specific security testing is completed

## Model

* [ ] Model provenance is documented
* [ ] Model version is recorded
* [ ] Model validation is completed
* [ ] Accuracy is measured
* [ ] Bias and fairness are assessed
* [ ] Model drift is monitored
* [ ] Model changes are controlled
* [ ] Model rollback capability exists

## AI-Specific Threats

* [ ] Prompt injection has been assessed
* [ ] Jailbreak attempts have been tested
* [ ] Data leakage has been assessed
* [ ] Data poisoning has been considered
* [ ] Model extraction has been considered
* [ ] Excessive agency has been assessed
* [ ] Tool/plugin permissions are controlled
* [ ] AI output is validated where necessary

## Human Oversight

* [ ] Human review requirements are documented
* [ ] Critical decisions require appropriate human oversight
* [ ] Escalation procedures are defined
* [ ] Override procedures are defined
* [ ] Users can report incorrect or harmful outputs
* [ ] Appeal or correction mechanisms exist where appropriate

## Monitoring and Response

* [ ] AI performance is monitored
* [ ] Security events are monitored
* [ ] Bias indicators are monitored
* [ ] Data and model drift are monitored
* [ ] AI incidents are defined
* [ ] AI incident response procedures exist
* [ ] Periodic reassessment is scheduled
* [ ] Risk register is maintained

---

# 18. AI Risk Assessment Frameworks and Standards

Organizations should align their AI risk management program with recognized frameworks and standards where applicable.

Examples include:

* **NIST AI Risk Management Framework (AI RMF)** — provides a structured approach to managing AI risks.
* **ISO/IEC 42001** — specifies requirements for an Artificial Intelligence Management System (AIMS).
* **ISO/IEC 23894** — provides guidance for managing AI-related risks.
* **ISO/IEC 27001** — provides an information-security management framework relevant to AI infrastructure, applications, and data.
* **ISO/IEC 27701** — provides privacy-management guidance relevant to AI systems processing personal information.
* **OWASP guidance for AI and LLM security** — provides security-focused guidance for applications using large language models and related AI technologies.
* **Applicable AI and privacy legislation** — requirements should be mapped according to the organization's jurisdictions, industry, and AI use case.

A framework should be selected based on the organization's regulatory environment, risk profile, AI technology, industry, and business requirements.

---

# 19. Key Principles for AI Risk Assessment

A strong AI risk assessment program should follow these principles:

1. **Risk-based** — Focus resources on the highest-impact AI risks.
2. **Lifecycle-based** — Assess AI from design through retirement.
3. **Continuous** — Reassess when the model, data, use case, threats, or regulations change.
4. **Human-centered** — Consider impacts on people, not only technology.
5. **Security-by-design** — Integrate security controls from the beginning.
6. **Privacy-by-design** — Minimize unnecessary collection and exposure of personal data.
7. **Fairness-aware** — Test for discriminatory or materially unequal outcomes.
8. **Transparent** — Maintain appropriate documentation and traceability.
9. **Accountable** — Assign clear ownership for AI risks and decisions.
10. **Evidence-based** — Support risk decisions with testing, monitoring, and documented evidence.
11. **Least privilege** — Give AI systems, agents, users, and tools only the permissions required.
12. **Fail-safe** — Ensure that high-impact failures do not automatically result in uncontrolled harm.

---

# 20. Summary

AI Risk Assessment is a structured process for identifying and managing the risks associated with AI systems before and after deployment.

At a minimum, an organization should:

1. **Identify the AI system.**
2. **Define its intended use and boundaries.**
3. **Identify stakeholders and affected parties.**
4. **Inventory models, data, applications, APIs, infrastructure, and dependencies.**
5. **Identify technical, security, privacy, legal, ethical, operational, and third-party risks.**
6. **Assess likelihood and impact.**
7. **Evaluate existing controls.**
8. **Determine residual risk.**
9. **Implement appropriate risk treatments.**
10. **Test the AI system for security, accuracy, privacy, fairness, and resilience.**
11. **Establish appropriate human oversight.**
12. **Monitor the system continuously after deployment.**
13. **Maintain an AI risk register and supporting evidence.**
14. **Implement AI-specific incident response.**
15. **Reassess risk whenever significant changes, incidents, new threats, or regulatory requirements occur.**

The goal is not to eliminate every AI risk—which is generally impractical—but to **identify, understand, reduce, monitor, and govern AI risks to an acceptable level consistent with the organization's risk appetite and applicable requirements**.
