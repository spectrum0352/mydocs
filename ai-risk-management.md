# AI Security Risk Management

## Overview

AI Security Risk Management is critical for ensuring that artificial intelligence (AI) systems are **secure, trustworthy, resilient, explainable, privacy-preserving, and resistant to cyber threats and misuse**.

AI security risk management should address the complete AI lifecycle, including:

* Business and use-case definition
* Data collection and preparation
* Model development and training
* Model validation and testing
* Deployment and integration
* Inference and runtime operations
* Monitoring and observability
* Model updates and retraining
* Retirement and secure disposal

A comprehensive AI security program should address **confidentiality, integrity, availability, privacy, safety, accountability, transparency, robustness, and regulatory compliance**.

---

## 1. Key Security Risks in AI Systems

### 1.1 Data-Related Risks

#### Data Poisoning

Malicious actors introduce corrupted, manipulated, biased, or malicious data into training or fine-tuning datasets to compromise model behavior.

**Potential impacts:**

* Incorrect model predictions
* Backdoors or hidden behaviors
* Reduced model accuracy
* Manipulation of downstream decisions
* Persistent compromise after deployment

**Security controls:**

* Data provenance and lineage
* Dataset integrity validation
* Trusted data sources
* Data validation and sanitization
* Hashing and integrity monitoring
* Dataset version control
* Restricted write access
* Anomaly detection

#### Data Breaches

Training datasets, prompts, embeddings, vector databases, logs, or inference data may contain sensitive or confidential information that can be exposed.

**Security controls:**

* Encryption at rest and in transit
* Data classification
* Data Loss Prevention (DLP)
* Least-privilege access
* Tokenization and pseudonymization
* Data minimization
* Secure secrets management
* Retention and deletion controls
* Privacy-preserving techniques

#### Bias in Data

Inaccurate, incomplete, unrepresentative, or skewed datasets can produce unfair or unreliable outcomes.

**Security and governance controls:**

* Dataset quality assessment
* Bias testing
* Representative sampling
* Data provenance
* Fairness testing
* Human review for high-impact decisions
* Continuous monitoring

#### Sensitive Data Exposure

AI systems may unintentionally expose:

* Personally identifiable information (PII)
* Financial information
* Authentication credentials
* Intellectual property
* Source code
* Health information
* Confidential business information
* Security-sensitive information

Controls should include data classification, access control, DLP, prompt filtering, output validation, and secure retention policies.

---

### 1.2 Model-Related Risks

#### Adversarial Attacks

Attackers craft malicious inputs designed to cause an AI model to produce incorrect or unsafe outputs.

Examples include:

* Adversarial examples
* Evasion attacks
* Input manipulation
* Perturbation attacks
* Malicious prompts

Controls include adversarial testing, input validation, model hardening, anomaly detection, rate limiting, and continuous testing.

#### Model Inversion

Attackers attempt to infer sensitive information from model behavior or outputs, potentially reconstructing characteristics of training data.

**Controls:**

* Differential privacy
* Output restrictions
* Query monitoring
* Rate limiting
* Privacy testing
* Access controls
* Membership-inference testing

#### Model Theft

Unauthorized users may attempt to replicate or extract an AI model through API queries, stolen model artifacts, compromised repositories, or unauthorized access to model storage.

**Controls:**

* Strong authentication
* Authorization
* API rate limiting
* Model artifact encryption
* Secure model registries
* Network segmentation
* Monitoring of abnormal query behavior
* Protection of model weights

#### Model Supply-Chain Risks

AI models may depend on:

* Third-party models
* Open-source libraries
* Pre-trained models
* Datasets
* Python packages
* Container images
* AI APIs
* Plugins
* Model repositories

Compromised dependencies can introduce malicious code, backdoors, vulnerabilities, or unsafe functionality.

**Controls:**

* Software Bill of Materials (SBOM)
* Model Bill of Materials (MBOM)
* Dependency scanning
* Provenance verification
* Signed artifacts
* Trusted repositories
* Vulnerability management
* Third-party risk assessments

#### Model Hallucination and Reliability Risks

Generative AI systems may produce incorrect, fabricated, or misleading information.

For security-sensitive use cases, controls should include:

* Retrieval-Augmented Generation (RAG)
* Grounding against trusted sources
* Output validation
* Confidence thresholds
* Human-in-the-loop review
* Source attribution
* Restricted autonomous actions

---

### 1.3 Generative AI and LLM-Specific Risks

Generative AI introduces additional attack surfaces that should be explicitly assessed.

#### Prompt Injection

Attackers manipulate prompts or external content to influence model behavior and bypass intended instructions.

Controls include:

* Input filtering
* Prompt isolation
* Instruction hierarchy
* Content validation
* Privilege separation
* Tool authorization
* Output validation

#### Indirect Prompt Injection

Malicious instructions can be embedded in external content consumed by an AI system, such as:

* Web pages
* Documents
* Emails
* PDFs
* Knowledge bases
* Search results

External content should therefore be treated as **untrusted input**.

#### Sensitive Information Disclosure

An LLM may expose confidential information through prompts, responses, retrieved documents, conversation history, or logs.

#### Excessive Agency

An AI application with excessive permissions may perform unauthorized actions through connected tools, APIs, databases, or cloud resources.

Controls should follow:

* Least privilege
* Just-in-time access
* Explicit tool authorization
* Transaction approval
* Human approval for high-impact actions
* Segmentation of AI workloads

#### Insecure Output Handling

AI-generated output should not automatically be trusted or executed.

For example, AI-generated:

* SQL
* Shell commands
* Code
* HTML
* API requests
* Infrastructure configuration

must be validated and appropriately sandboxed before execution.

#### Vector and Embedding Security

RAG systems introduce risks involving:

* Vector database access
* Embedding leakage
* Unauthorized document retrieval
* Malicious documents
* Cross-tenant data exposure
* Retrieval manipulation

Security controls should include tenant isolation, document-level authorization, encryption, metadata filtering, access controls, and retrieval validation.

---

### 1.4 Operational Risks

#### Misuse of AI

AI systems may be used for unintended, unauthorized, or malicious purposes.

Examples include:

* Unauthorized automation
* Fraud
* Data extraction
* Security bypass
* Generation of malicious content
* Unauthorized decision-making

#### AI System Exploitation

Attackers may exploit vulnerabilities in:

* AI applications
* APIs
* Model servers
* Containers
* Kubernetes environments
* Cloud infrastructure
* Vector databases
* CI/CD pipelines
* Supporting libraries

#### Dependence on AI

Over-reliance on AI can result in critical failures when:

* The model becomes unavailable
* Model behavior changes
* Data becomes unavailable
* An upstream AI service fails
* The model produces incorrect decisions
* A security control incorrectly trusts AI output

Critical systems should therefore maintain appropriate fallback mechanisms and human oversight.

#### Availability Risks

AI services can be affected by:

* Denial-of-service attacks
* Resource exhaustion
* API abuse
* Excessive inference requests
* Dependency outages
* Infrastructure failures

Controls include rate limiting, quotas, autoscaling, redundancy, monitoring, and disaster recovery.

---

### 1.5 Compliance, Privacy, and Ethical Risks

#### Regulatory Violations

AI systems may be subject to privacy, cybersecurity, sector-specific, and AI-specific regulations.

Relevant requirements may include:

* GDPR
* CCPA/CPRA
* EU AI Act
* Applicable national privacy legislation
* Industry-specific regulatory requirements
* Contractual requirements

Organizations should conduct a legal and regulatory applicability assessment for each AI use case.

#### Ethical Concerns

AI systems should address:

* Fairness
* Accountability
* Transparency
* Explainability
* Human oversight
* Non-discrimination
* Appropriate use
* Safety

---

# 2. AI Security Risk Management Framework

AI security risk management should operate as a continuous lifecycle rather than a one-time assessment.

```text
Identify
   ↓
Assess
   ↓
Prioritize
   ↓
Treat
   ↓
Validate
   ↓
Monitor
   ↓
Respond
   ↓
Improve
   ↺
```

---

## 3. Risk Assessment and Identification

### 3.1 Inventory AI Assets

Identify and maintain an inventory of:

* AI models
* Foundation models
* Machine-learning models
* Training datasets
* Fine-tuning datasets
* Prompts
* System instructions
* Embeddings
* Vector databases
* AI APIs
* AI applications
* AI agents
* Model-serving infrastructure
* GPUs and compute resources
* Containers
* Kubernetes workloads
* CI/CD pipelines
* Model registries
* Secrets and credentials
* Supporting applications
* Third-party AI services

Categorize assets according to:

* Business criticality
* Data sensitivity
* Regulatory impact
* Security exposure
* User population
* External accessibility
* Decision-making impact

---

## 4. Threat Modeling

Identify potential:

* Adversaries
* Attack vectors
* Assets
* Trust boundaries
* Vulnerabilities
* Abuse cases
* Security assumptions
* Failure modes
* Dependencies

Threat-modeling methodologies can include **STRIDE**:

| STRIDE                 | Threat                                                       |
| ---------------------- | ------------------------------------------------------------ |
| Spoofing               | Impersonation of users, services, or identities              |
| Tampering              | Unauthorized modification of data, models, or configurations |
| Repudiation            | Inability to establish accountability for actions            |
| Information Disclosure | Unauthorized exposure of information                         |
| Denial of Service      | Disruption or exhaustion of AI resources                     |
| Elevation of Privilege | Obtaining unauthorized permissions                           |

AI-specific threat modeling should additionally consider:

* Prompt injection
* Data poisoning
* Model extraction
* Model inversion
* Membership inference
* Adversarial examples
* Training-data leakage
* Supply-chain compromise
* Excessive agency
* Insecure output handling
* RAG manipulation
* Tool/API abuse

---

# 5. Risk Classification

Rank AI risks according to **likelihood, impact, exploitability, exposure, and control maturity**.

A basic risk model can be:

```text
Risk Score = Likelihood × Impact
```

A more comprehensive model can consider:

```text
AI Risk Score =
Likelihood × Impact × Exposure × Exploitability
```

Risk impact should consider:

* Financial impact
* Operational impact
* Security impact
* Privacy impact
* Regulatory impact
* Legal impact
* Reputational impact
* Safety impact
* Customer impact
* Business continuity impact

A practical classification can be:

| Score | Risk Level | Recommended Action                                     |
| ----: | ---------- | ------------------------------------------------------ |
|   1–4 | Low        | Monitor and manage through standard controls           |
|   5–9 | Medium     | Implement additional controls and track remediation    |
| 10–16 | High       | Prioritized remediation and management oversight       |
| 17–25 | Critical   | Immediate risk treatment or suspension of the use case |

Risk scoring should be adapted to the organization's enterprise risk methodology rather than treated as a universal scoring standard.

---

# 6. Mitigation Strategies

## 6.1 Data Security

Secure training, validation, inference, and operational data using:

* Encryption at rest
* Encryption in transit
* Strong identity and access management
* RBAC
* Attribute-Based Access Control (ABAC)
* Data classification
* Data Loss Prevention
* Tokenization
* Pseudonymization
* Data minimization
* Secure data retention
* Secure deletion
* Data provenance
* Dataset integrity monitoring

Where appropriate, use:

* Synthetic data
* Differential privacy
* Federated learning
* Privacy-preserving computation

---

## 6.2 Model Robustness

Implement:

* Adversarial training
* Robustness testing
* Red-team testing
* Model validation
* Bias testing
* Safety testing
* Stress testing
* Abuse-case testing
* Regression testing
* Security testing before production deployment

AI models should be tested against both expected use cases and deliberate attempts to cause unsafe or incorrect behavior.

---

## 6.3 Access Control

Limit access to AI models, data, infrastructure, and APIs using:

* RBAC
* ABAC
* Least privilege
* MFA
* Privileged Access Management
* Just-in-Time access
* Service identities
* Managed identities
* Network segmentation

Monitor:

* Authentication
* Authorization
* API usage
* Model access
* Administrative activity
* Privileged operations
* Abnormal query patterns

---

## 6.4 Secure AI Development Lifecycle

Integrate security throughout the AI development lifecycle:

```text
Requirements
    ↓
Data Preparation
    ↓
Model Development
    ↓
Security Testing
    ↓
Validation
    ↓
Deployment
    ↓
Runtime Monitoring
    ↓
Continuous Improvement
```

Security should be integrated into:

* CI/CD
* ML pipelines
* Model registries
* Infrastructure-as-Code
* Dependency management
* Container security
* Secrets management
* Vulnerability management

This approach is commonly referred to as **Secure MLOps** or **MLSecOps**.

---

# 7. Secure Deployment

Use secure deployment architectures incorporating:

* Containerization
* Secure CI/CD pipelines
* Infrastructure-as-Code security
* Network segmentation
* Private connectivity where appropriate
* Secrets management
* Workload identity
* API gateways
* Web Application Firewalls
* Runtime protection
* Vulnerability scanning
* Container image scanning

Inference services should be protected against:

* Unauthorized access
* API abuse
* Prompt injection
* Malicious inputs
* Denial of service
* Data exfiltration
* Excessive resource consumption

---

# 8. Model Monitoring and Logging

Implement continuous monitoring for:

* Model drift
* Data drift
* Performance degradation
* Anomalous inputs
* Abnormal outputs
* Unauthorized model access
* Excessive API usage
* Prompt injection attempts
* Data leakage
* Policy violations
* Infrastructure anomalies

Maintain appropriate logs for:

* User authentication
* Authorization
* Prompts and requests, subject to privacy requirements
* Model responses, subject to privacy requirements
* Model versions
* Dataset versions
* Administrative actions
* Configuration changes
* API activity
* Security events
* Tool/API invocation by AI agents

Logs should be protected against unauthorized modification and excessive collection of sensitive information.

---

# 9. AI Incident Response and Recovery

## 9.1 Incident Response Plan for AI

Develop specific procedures for AI-related incidents, including:

1. Detection
2. Triage
3. Containment
4. Investigation
5. Eradication
6. Recovery
7. Validation
8. Lessons learned

Incident scenarios should include:

* Data poisoning
* Model compromise
* Model theft
* Prompt injection
* Sensitive data disclosure
* Unauthorized AI-agent action
* API compromise
* Supply-chain compromise
* Malicious model deployment
* AI service outage
* Regulatory breach

Test response plans using:

* Tabletop exercises
* Red-team exercises
* Purple-team exercises
* Simulated AI attacks

---

# 10. Backup and Redundancy

Maintain secure backups of:

* Training datasets
* Validation datasets
* Model artifacts
* Model weights
* Configurations
* Prompts and system instructions
* Vector databases where required
* Infrastructure configuration
* CI/CD configurations
* Security policies

Backups should be:

* Encrypted
* Access controlled
* Integrity protected
* Versioned
* Regularly tested

Use redundancy and disaster recovery mechanisms to maintain availability during infrastructure failures or security incidents.

---

# 11. Retraining and Updating

Periodically retrain or update models when:

* New threats emerge
* Training data changes
* Model performance degrades
* Data drift occurs
* Business requirements change
* Security vulnerabilities are identified
* Regulatory requirements change

Model updates should follow controlled change-management processes.

Every production model should have:

* Version identification
* Approval status
* Training-data lineage
* Deployment date
* Owner
* Security test results
* Performance baseline
* Rollback capability

---

# 12. Compliance and Governance

## 12.1 AI Governance

Establish an AI governance structure defining:

* AI ownership
* Security ownership
* Data ownership
* Model ownership
* Business accountability
* Risk acceptance authority
* Approval processes
* Human oversight requirements
* Exception management

---

## 12.2 AI Ethics Frameworks

Implement principles covering:

* Fairness
* Accountability
* Transparency
* Explainability
* Privacy
* Safety
* Human oversight
* Non-discrimination

Ethical considerations should be incorporated into AI risk assessments rather than treated as a separate activity.

---

## 12.3 Regular Audits

Conduct periodic:

* AI security assessments
* Privacy assessments
* Model risk assessments
* Compliance audits
* Penetration testing
* Red-team assessments
* Data-quality assessments
* Third-party assessments

Audit evidence should include:

* Risk assessments
* Security test results
* Model documentation
* Dataset lineage
* Access reviews
* Monitoring records
* Incident records
* Exception approvals

---

## 12.4 Standards and Frameworks

Organizations should consider applicable standards and frameworks, including:

* **NIST AI Risk Management Framework (AI RMF)**
* **NIST AI RMF Generative AI Profile**
* **ISO/IEC 42001** — AI management systems
* **ISO/IEC 23894** — AI risk management
* **ISO/IEC 27001** — Information security management
* **ISO/IEC 27002** — Information security controls
* **ISO/IEC 27701** — Privacy information management
* **ISO/IEC 24029-1** — Assessment of robustness of neural networks
* **OWASP Top 10 for LLM Applications**
* **OWASP Machine Learning Security Top 10**
* Applicable privacy and AI regulations, including GDPR, CCPA/CPRA, and the EU AI Act where applicable.

> **Important:** ISO/IEC 24029-1 is primarily concerned with assessing the robustness of neural networks; it should not be described as a complete AI risk-management standard. ISO/IEC 23894 is more directly applicable to AI risk management.

---

# 13. AI Security Tools and Techniques

## 13.1 Adversarial Testing Tools

Tools and frameworks can be used to evaluate model robustness and security, including:

* CleverHans
* Adversarial Robustness Toolbox (ART)
* Garak
* Model-specific red-team frameworks
* Custom adversarial testing frameworks

Tool selection should be based on the model type, architecture, deployment environment, and threat model.

---

## 13.2 Model Monitoring and Observability

AI observability platforms can help monitor:

* Model performance
* Drift
* Bias
* Data quality
* Explainability
* Model behavior
* Production anomalies

Examples include:

* Fiddler
* Arize AI
* Other enterprise AI observability platforms

---

## 13.3 Secure Federated Learning

Federated learning enables model training across distributed datasets without necessarily centralizing the underlying data.

Security considerations include:

* Secure aggregation
* Participant authentication
* Data poisoning detection
* Model-update validation
* Differential privacy
* Communication security

Federated learning does not automatically eliminate privacy or security risks and must itself be threat modeled.

---

## 13.4 Encryption and Privacy-Preserving Techniques

Use appropriate cryptographic and privacy-preserving technologies, including:

* Encryption at rest
* Encryption in transit
* Key management
* Tokenization
* Pseudonymization
* Differential privacy
* Secure multiparty computation
* Homomorphic encryption where technically and economically appropriate

Homomorphic encryption can enable certain computations over encrypted data, but its applicability depends on the workload, performance requirements, and supported operations.

---

## 13.5 Explainability Tools

Explainability techniques can support model transparency and analysis, including:

* LIME — Local Interpretable Model-Agnostic Explanations
* SHAP — SHapley Additive exPlanations

Explainability should be combined with model validation, documentation, monitoring, and human oversight. Explainability by itself does not guarantee that an AI system is secure or fair.

---

# 14. AI Supply-Chain Security

AI supply-chain security should cover the complete dependency chain:

```text
Data
  ↓
Libraries
  ↓
Frameworks
  ↓
Pre-trained Models
  ↓
Fine-Tuning
  ↓
Model Registry
  ↓
Containers
  ↓
Deployment Platform
  ↓
APIs / Applications
  ↓
End Users
```

Controls should include:

* Trusted sources
* Dependency scanning
* Vulnerability management
* Artifact signing
* SBOM
* MBOM
* Model provenance
* Dataset provenance
* Integrity verification
* Secure repositories
* Third-party risk management
* Continuous monitoring

---

# 15. AI Agent Security

AI agents introduce additional risks because they can interact with external systems and execute actions.

Security controls should include:

* Least-privilege tool access
* Strong authentication
* Explicit authorization
* Tool allowlists
* Transaction limits
* Human approval for high-risk actions
* Sandboxing
* Network restrictions
* Command validation
* Output validation
* Agent activity logging
* Rate limiting
* Session isolation

High-impact actions should not be executed solely on the basis of an AI-generated decision without appropriate authorization and control mechanisms.

---

# 16. Continuous Improvement

AI security should be treated as a continuous process.

## 16.1 Threat Intelligence Integration

Incorporate AI-specific threat intelligence covering:

* Emerging AI attacks
* New vulnerabilities
* Prompt-injection techniques
* Model attacks
* Supply-chain threats
* Data-poisoning campaigns
* AI abuse trends
* Newly disclosed security research

Threat intelligence should feed into:

* Threat models
* Detection rules
* Security testing
* Incident response
* Risk assessments
* Security controls

---

## 16.2 Community Collaboration

Participate in relevant:

* AI security communities
* Industry forums
* Security research communities
* Standards organizations
* Threat intelligence communities

Share lessons learned and security practices where permitted.

---

## 16.3 Education and Awareness

Train relevant stakeholders on:

* AI security concepts
* AI risk management
* Secure AI development
* Prompt injection
* Data protection
* Model security
* Secure RAG
* AI agent security
* Supply-chain risks
* Responsible AI
* Incident response

Training should be role-based for:

* Developers
* Data scientists
* ML engineers
* Security engineers
* SOC analysts
* Cloud engineers
* Risk and compliance teams
* Business owners
* AI governance teams
* Senior management

---

# 17. AI Security Risk Management Checklist

### Governance

* [ ] Define AI governance and accountability.
* [ ] Assign AI system owners.
* [ ] Maintain an AI system inventory.
* [ ] Define acceptable AI use.
* [ ] Establish AI risk acceptance criteria.
* [ ] Define regulatory requirements.
* [ ] Establish AI security policies and standards.

### Data Security

* [ ] Classify AI data.
* [ ] Validate data provenance.
* [ ] Protect training and inference data.
* [ ] Implement encryption.
* [ ] Implement access controls.
* [ ] Implement DLP where required.
* [ ] Test for sensitive-data leakage.
* [ ] Establish retention and deletion requirements.

### Model Security

* [ ] Validate model provenance.
* [ ] Secure model artifacts.
* [ ] Test model robustness.
* [ ] Perform adversarial testing.
* [ ] Test for model extraction.
* [ ] Test for model inversion.
* [ ] Assess model poisoning risks.
* [ ] Maintain model version control.

### Generative AI Security

* [ ] Test for prompt injection.
* [ ] Test for indirect prompt injection.
* [ ] Protect against sensitive information disclosure.
* [ ] Validate AI-generated output.
* [ ] Restrict excessive agency.
* [ ] Secure RAG pipelines.
* [ ] Secure vector databases.
* [ ] Apply tool-level authorization.

### Infrastructure

* [ ] Secure AI workloads.
* [ ] Scan containers and dependencies.
* [ ] Protect CI/CD pipelines.
* [ ] Secure secrets and credentials.
* [ ] Implement network segmentation.
* [ ] Apply least privilege.
* [ ] Monitor infrastructure activity.

### Monitoring

* [ ] Monitor model behavior.
* [ ] Monitor data and model drift.
* [ ] Monitor API activity.
* [ ] Detect abnormal requests.
* [ ] Detect security violations.
* [ ] Maintain appropriate audit logs.
* [ ] Integrate AI security events with SOC monitoring.

### Incident Response

* [ ] Establish AI-specific incident procedures.
* [ ] Define containment procedures.
* [ ] Establish model rollback procedures.
* [ ] Test AI incident response.
* [ ] Maintain secure backups.
* [ ] Conduct lessons-learned reviews.

---

# 18. AI Security Metrics and KPIs

Organizations should establish measurable AI security metrics.

| Metric                              | Purpose                               |
| ----------------------------------- | ------------------------------------- |
| AI assets inventoried               | Measures inventory coverage           |
| AI systems risk assessed            | Measures risk assessment coverage     |
| High-risk AI systems                | Measures overall risk exposure        |
| Critical AI risks unresolved        | Measures residual risk                |
| Models security-tested              | Measures security validation          |
| Models with documented provenance   | Measures supply-chain assurance       |
| AI incidents                        | Measures security events              |
| AI data leakage events              | Measures privacy/security exposure    |
| Prompt-injection detections         | Measures GenAI attack activity        |
| Unauthorized AI access attempts     | Measures access-control effectiveness |
| AI systems with monitoring          | Measures monitoring coverage          |
| AI systems with rollback capability | Measures operational resilience       |
| Third-party AI services assessed    | Measures supply-chain governance      |
| AI security training completion     | Measures awareness coverage           |

---

# 19. AI Security Risk Management Operating Model

A mature AI security program should integrate multiple organizational functions:

```text
                         AI Governance
                              │
             ┌────────────────┼────────────────┐
             │                │                │
        AI Security       Data Privacy      Compliance
             │                │                │
       ┌─────┼─────┐          │                │
       │     │     │          │                │
     SOC   DevSecOps  ML/AI Engineering         │
       │     │     │          │                │
       └─────┴─────┴──────────┴────────────────┘
                              │
                       Business Owners
                              │
                         Risk Management
```

Effective AI security requires collaboration between **security, engineering, data, privacy, legal, compliance, risk, and business stakeholders**.

---

# 20. AI Security Risk Lifecycle

The overall lifecycle can be summarized as:

```text
1. Identify AI System
        ↓
2. Classify Data and Business Impact
        ↓
3. Identify Threats and Abuse Cases
        ↓
4. Assess AI Security Risks
        ↓
5. Prioritize Risks
        ↓
6. Implement Security Controls
        ↓
7. Perform Security and Adversarial Testing
        ↓
8. Approve for Deployment
        ↓
9. Monitor Production Behavior
        ↓
10. Detect and Respond to Incidents
        ↓
11. Retrain / Update / Patch
        ↓
12. Reassess Risk
        ↓
13. Retire and Securely Dispose
```

---

# 21. Key Principles

A mature AI Security Risk Management program should follow these principles:

1. **Security by Design** — security requirements should be incorporated from the beginning of the AI lifecycle.
2. **Privacy by Design** — minimize and protect sensitive information throughout the AI lifecycle.
3. **Least Privilege** — AI systems, agents, users, and services should receive only the permissions they require.
4. **Zero Trust** — do not implicitly trust users, models, prompts, applications, or external content.
5. **Defense in Depth** — use multiple complementary security controls.
6. **Continuous Validation** — continuously test models, data, infrastructure, and AI applications.
7. **Human Oversight** — maintain appropriate human control over high-impact decisions and actions.
8. **Transparency and Accountability** — maintain sufficient documentation, logging, and ownership.
9. **Secure Supply Chain** — validate models, datasets, libraries, dependencies, and third-party AI services.
10. **Continuous Monitoring** — monitor both cybersecurity events and changes in AI behavior.
11. **Resilience and Recoverability** — maintain backups, rollback mechanisms, redundancy, and recovery procedures.
12. **Risk-Based Governance** — apply stronger controls to AI systems with greater business, privacy, security, safety, or regulatory impact.

---

## 22. Conclusion

AI Security Risk Management must extend beyond traditional cybersecurity controls because AI systems introduce unique risks involving **data, models, prompts, inference, model behavior, AI agents, training pipelines, third-party models, and autonomous actions**.

An effective program combines:

* AI governance
* Risk assessment
* Threat modeling
* Data security
* Model security
* Application security
* Secure MLOps/MLSecOps
* Generative AI security
* AI agent security
* Privacy
* Supply-chain security
* Continuous monitoring
* Incident response
* Compliance
* Security testing
* Human oversight
* Continuous improvement

The objective is not merely to make an AI model secure. The objective is to establish a **secure, governed, observable, resilient, and accountable AI ecosystem across the entire AI lifecycle**.
