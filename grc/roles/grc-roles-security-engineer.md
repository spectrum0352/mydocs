Projects

Cloud Products (SAAS, IAAS) Marketplace

•	- Worked as lead developer and Associate Architect for a B2B Marketplace platform offering cloud products and subscriptions (SAAS and IAAS).

* Developed various modules (SOA) including, Marketplace, Recurring Billing, White label, Integrations with various Vendors (Fortune 100 Technology vendors) and Re-sellers.
* Migration to MSA (Microservices).
•	Client - B2B Marketplace - Fortune company.
Apr 2014 - Present
Responsibilities:
* Lead DevOps Team.
* Design Cloud Infrastructure for Micro-services hosting and implemented it.
* Automate cloud Infra creation for various environments (Dev, Stage, Prod).
* Implement IaC, Policy as code, Security as code.
* Tools : Kubernetes, Docker, Azure DevOps, Azure Cloud (AKS, App gateway, Storage, App insights, KeyVault, Event Grid, VM, App Service) , Terraform, Packer.



* Define Enterprise Web App Architecture.
* Adhere to agile development using scrum framework.
* Analysis of systems which need high level of technical competency.
* Lead team of system analysts to implement various modules/sub-systems of web app.
* Assist Program Managers, Development Managers in release and deployment.
* Migrate legacy system to next gen technologies.
* Assisting and Mentoring Team.
* Initiate and help creating documentation - Functional, Technical, User Guides, Api Integration Guides.
* Coding and Review.
* DB design and Data dictionary creation.
* Code and DB Optimization.
* Closely work with DevOps to achieve CI/CD.
* Trainer and Mentor. (Project and Org. level).
* Follow and Research applicable trends.
* Design and Implement Cloud infrastructure for flagship PaaS solution for fortune 100 enterprise.
* Lead DevOps team.
* Mentor creation of CI/CD pipelines for all environments.
* POC creation and take decision to choose right solutions/tools.
* Make sure solutions are High available, resilient, monitored, scalable, secured.
* Implement security as suggested by the Security Team. CIS Hardening, effective Network Access restrictions.
* Develop cloud native applications for fortune 100 enterprise.
* Manage and monitor teams during all phase of development.
* Contribute and assist Enterprise Architects to design architecture of enterprise web applications.
* Liaison between Product Specialists (Business Analysts) and technical teams to deliver features/enhancements timely.
* Migrate Legacy Enterprise Web Architecture to Cloud. (AWS).
* Convert business ideas into technical documents.
* RCA of issues affecting customer satisfaction budget.
* Conduct (Agile) Scrum, Scrum of Scrum, Sprint Planning, Planning poker and Retrospective meetings.
* Coordinate cross-project activities.
* Lead, Mentor and evaluate teams.
* Executive reporting (Product owners and Stakeholders).
* Report project KPIs.
* Implementing best practices for Coding, Code review and deployments.
* Change and Release management.

I have web application deployed in azure kubernetes. how do I design the security architecture for this? please share the detailed list of security controls we need to implement?

Securing a Web Application in Azure Kubernetes Service (AKS)
Securing a web application deployed on Azure Kubernetes Service (AKS) requires a multi-layered approach that addresses various aspects of the application stack.
Network Security
•	Network Segmentation: Isolate your AKS cluster from other resources using virtual networks and subnets.
•	Azure Firewall: Implement a stateful firewall to protect your network perimeter.
•	Network Security Groups (NSGs): Control inbound and outbound traffic to the AKS cluster.
•	Application Gateway or Ingress Controller: Protect the application layer with WAF capabilities.
•	VPN or ExpressRoute: Securely connect on-premises networks to the AKS cluster.
Identity and Access Management (IAM)
•	Azure Active Directory (Azure AD) Integration: Use Azure AD for authentication and authorization.
•	Role-Based Access Control (RBAC): Implement granular access controls for cluster resources and pods.
•	Service Principals: Use service principals for application identities.
•	Secret Management: Store secrets securely using Azure Key Vault.
Application Security
•	Secure Coding Practices: Adhere to secure coding standards and guidelines.
•	Vulnerability Scanning: Conduct regular vulnerability assessments using tools like SAST and DAST.
•	Web Application Firewall (WAF): Protect against common web attacks.
•	Input Validation: Validate and sanitize user input to prevent injection attacks.
•	Output Encoding: Properly encode output to prevent cross-site scripting (XSS).
Container Security
•	Image Scanning: Scan container images for vulnerabilities before deployment.
•	Runtime Protection: Use container runtime security solutions to detect and respond to threats.
•	Least Privilege: Run containers with minimal necessary privileges.
•	Immutable Infrastructure: Treat container images as immutable.
Kubernetes Security
•	Pod Security Policies (PSPs): Enforce security policies for pods.
•	Network Policies: Control network traffic between pods.
•	Kubernetes RBAC: Implement role-based access control within the cluster.
•	Audit Logging: Enable audit logging to track cluster activity.
Monitoring and Logging
•	Azure Monitor: Monitor the health and performance of the AKS cluster.
•	Log Analytics: Collect and analyze logs for security insights.
•	Azure Security Center: Utilize for threat detection and response.
Additional Considerations
•	Patch Management: Keep operating systems and applications up-to-date with patches.
•	Data Protection: Encrypt data at rest and in transit.
•	Incident Response Plan: Develop and test an incident response plan.
•	Regular Security Assessments: Conduct regular security assessments and audits.
By implementing these security controls and following best practices, you can significantly enhance the security posture of your web application deployed on AKS.
Would you like to focus on a specific area or have any other questions?





6️⃣ What would be your priorities as a new Cloud Security Engineer?
If replacing someone fired for incompetence:

Phase 1 – Immediate Risk Reduction (First 30 Days)
Review IAM \& Global Admin access

Enable MFA everywhere

Check public exposure of storage \& VMs

Review Defender Secure Score

Validate logging coverage

Check backup \& DR status

Assess Key Vault configuration

Phase 2 – Visibility \& Governance (60 Days)
Centralize logging in Sentinel

Enable Defender plans

Conduct vulnerability scans

Review NSG and firewall rules

Audit service principals

Implement PIM

Phase 3 – Strategic Hardening (90 Days)
Zero Trust architecture

Threat hunting program

Automation via SOAR

Incident response playbooks

Red team simulation



