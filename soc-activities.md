# SOC Operational Activities
 

Daily SOC Activities
1. Incident Monitoring & Investigation

Review the incident dashboard for newly generated alerts and incidents.
Perform incident triage, investigation, and response actions.
Follow investigation guidance and recommendations provided by security platforms.
Escalate confirmed incidents according to SOC procedures.
2. Threat Hunting

Execute built-in hunting queries.
Analyze hunting results for suspicious activities.
Update existing hunting queries.
Create new hunting queries and bookmarks based on findings.
3. Analytics Rule Management

Review newly available analytics rules from connected data sources.
Enable and tune applicable analytics rules.
Validate alert quality and reduce false positives.
4. Data Connector & Log Monitoring

Verify status of all data connectors.
Review last log received time for each connector.
Ensure logs are being ingested within expected timelines.
Monitor ingestion volume and confirm limits are not exceeded.
5. Agent & Workspace Health Monitoring

Verify servers and workstations are connected to Log Analytics workspace.
Check Azure Monitoring/Log Analytics agent health.
Troubleshoot failed or disconnected agents.
6. Automation & Playbook Monitoring

Verify automation playbook execution status.
Investigate and troubleshoot playbook failures.
Ensure automated response workflows run successfully.
7. Platform Health Validation

Confirm overall SIEM/SOAR operational health.
Ensure data visibility across monitored environments.
 

Weekly SOC Activities
1. Content & Workbook Updates

Review Sentinel workbooks for available updates.
Install or update dashboards where required.
2. Threat Content Review

Review Microsoft Sentinel GitHub repository.
Identify new detection rules, hunting queries, parsers, and playbooks relevant to the environment.
3. Security Configuration Auditing

Audit changes made within Sentinel, including:
Analytics rules
Hunting queries
Bookmarks
Automation rules
Playbooks
Verify authorized configuration changes only.
4. Detection Effectiveness Review

Review alert trends and false positives.
Tune analytics rules for improved detection accuracy.
 

Monthly SOC Activities
1. Access & Identity Review

Review user roles and permissions.
Validate least-privilege access.
Identify and remove inactive or unnecessary accounts.
2. Log Management & Retention

Review Log Analytics workspace configuration.
Validate data retention policies.
Optimize log storage and ingestion costs.
Integrate or validate long-term log retention (e.g., Azure Data Explorer).
3. Operational Collaboration

Coordinate with IT, Helpdesk, and Cloud Operations teams for incident handling improvements.
Review incident handling efficiency and response timelines.
4. Documentation & Knowledge Management

Update incident documentation and playbooks.
Maintain investigation notes and lessons learned.
Improve SOC runbooks and procedures.
5. Metrics & Reporting

Generate monthly SOC performance reports:
Incident volume
Mean Time to Detect (MTTD)
Mean Time to Respond (MTTR)
Detection coverage
 

Semi-Annual SOC Activities (Every 6 Months)
1. Detection Coverage Assessment

Review detection rules against MITRE ATT&CK framework.
Identify detection gaps.
Implement new threat detections.
2. Threat Hunting Program Review

Evaluate hunting effectiveness.
Update hunting methodology and hypotheses.
3. Playbook & Automation Optimization

Review automation workflows.
Improve response automation efficiency.
Remove unused or ineffective playbooks.
4. Security Architecture Review

Validate log source coverage across cloud and on-prem systems.
Ensure critical assets are monitored.
5. Incident Response Readiness

Conduct tabletop exercises.
Validate escalation and communication workflows.
 

Annual SOC Activities
1. SOC Strategy & Maturity Review

Assess SOC maturity against frameworks (NIST CSF, ISO 27001, SOC-CMM).
Define improvement roadmap.
2. Security Tooling Assessment

Evaluate SIEM/SOAR effectiveness.
Review licensing, ingestion costs, and optimization opportunities.
3. Incident Response Exercises

Conduct full incident response simulations (Red Team / Blue Team).
Test ransomware and breach scenarios.
4. Access & Privilege Certification

Perform organization-wide privileged access review.
Revalidate administrative access.
5. Compliance & Audit Support

Support annual audits and compliance assessments.
Validate log retention and monitoring requirements.
6. Training & Skill Development

Conduct SOC analyst training programs.
Update certifications and threat knowledge.
Review emerging threat landscape.