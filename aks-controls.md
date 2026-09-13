# Azure Kubernetes Service (AKS) Security Controls

The following controls are aligned with Microsoft Azure Well-Architected Framework, Kubernetes Security Best Practices, CIS Kubernetes Benchmark, CIS AKS Benchmark, NIST SP 800-190 (Application Container Security Guide), NSA/CISA Kubernetes Hardening Guidance, and enterprise cloud security practices.

---

# 1. Identity & Access Management

## Control Objectives

* Enforce least privilege
* Eliminate local administrator access
* Protect privileged operations
* Use centralized identity

### Security Controls

* Integrate AKS with Microsoft Entra ID.
* Disable local Kubernetes admin accounts whenever possible.
* Use Azure RBAC for Kubernetes Authorization.
* Enable Kubernetes RBAC.
* Never use cluster-admin for applications.
* Use namespace-based RBAC.
* Separate Admin, DevOps, Developers and Read-only roles.
* Enable Privileged Identity Management (PIM) for AKS Administrators.
* Require MFA for all privileged accounts.
* Restrict kubectl access to authorized administrators.
* Use workload identities instead of service principal credentials.
* Replace Service Principals with Managed Identities.
* Rotate credentials automatically.
* Use short-lived tokens.
* Review RBAC assignments regularly.

---

# 2. Cluster Networking

## Security Controls

* Use Azure CNI Overlay or Azure CNI based on enterprise requirements.
* Deploy private AKS clusters.
* Disable public API Server endpoint.
* Restrict API Server Authorized IP ranges if public endpoint is required.
* Enable Private Link.
* Place worker nodes inside private subnets.
* Use NSGs to restrict inbound/outbound traffic.
* Use Azure Firewall for egress filtering.
* Route outbound traffic through Azure Firewall or NAT Gateway.
* Enable Kubernetes Network Policies.
* Restrict pod-to-pod communications.
* Implement namespace isolation.
* Deny all by default.
* Explicitly allow required communications.
* Prevent unrestricted Internet egress.

---

# 3. Node Security

## Security Controls

* Use Microsoft-maintained AKS node images.
* Enable automatic node image upgrades.
* Enable Kubernetes version upgrades.
* Patch nodes regularly.
* Use ephemeral OS disks where appropriate.
* Disable SSH access.
* Use Azure Bastion for administrative access.
* Protect VMSS instances using NSGs.
* Disable password authentication.
* Require SSH keys if SSH is enabled.
* Restrict node access using Just-In-Time (JIT).
* Encrypt OS disks.
* Encrypt data disks.
* Enable Trusted Launch (where supported).
* Enable Secure Boot.
* Enable vTPM.
* Restrict node outbound connectivity.
* Use dedicated node pools for privileged workloads.

---

# 4. Kubernetes API Server

## Security Controls

* Use Private API Server.
* Restrict API access using Authorized IP Ranges.
* Disable anonymous authentication.
* Disable insecure ports.
* Enforce TLS 1.2 or later.
* Disable legacy authentication methods.
* Rotate certificates automatically.
* Enable API Server audit logging.
* Monitor failed authentication attempts.
* Monitor excessive API requests.

---

# 5. Pod Security

## Security Controls

* Enforce Kubernetes Pod Security Admission.
* Use Restricted Pod Security Standards.
* Prevent privileged containers.
* Prevent privileged escalation.
* Prevent hostPID.
* Prevent hostIPC.
* Prevent hostNetwork.
* Prevent hostPath mounts.
* Prevent host namespace sharing.
* Require read-only root filesystem.
* Drop Linux capabilities.
* Allow only required capabilities.
* Run containers as non-root.
* Define seccomp profiles.
* Use AppArmor where supported.
* Use SELinux where applicable.
* Restrict unsafe sysctls.

---

# 6. Container Image Security

## Security Controls

* Store images in Azure Container Registry (ACR).
* Disable public image repositories.
* Enable image vulnerability scanning.
* Enable Microsoft Defender for Containers.
* Scan images during CI/CD.
* Scan images before deployment.
* Prevent deployment of vulnerable images.
* Use image signing.
* Verify image signatures.
* Use trusted base images.
* Remove unused packages.
* Minimize container images.
* Pin image versions.
* Never use "latest" tag.
* Continuously rescan images.

---

# 7. Secrets Management

## Security Controls

* Never store secrets in Kubernetes manifests.
* Never hardcode credentials.
* Store secrets in Azure Key Vault.
* Use Azure Key Vault CSI Driver.
* Use Workload Identity.
* Encrypt Kubernetes Secrets.
* Rotate secrets regularly.
* Audit secret access.
* Disable secret sharing across namespaces.
* Limit secret permissions.

---

# 8. Workload Identity

## Security Controls

* Use Azure Workload Identity.
* Eliminate Service Principal secrets.
* Use Managed Identity authentication.
* Restrict Managed Identity permissions.
* Apply least privilege.
* Separate identities per workload.
* Monitor token requests.
* Rotate credentials automatically.

---

# 9. Storage Security

## Security Controls

* Encrypt Azure Disks.
* Encrypt Azure Files.
* Enable customer-managed keys (CMK) where required.
* Restrict Persistent Volume access.
* Use ReadWriteOnce unless sharing is required.
* Protect storage accounts using Private Endpoints.
* Disable public storage access.
* Enable soft delete.
* Enable versioning where applicable.
* Monitor storage access.

---

# 10. Logging & Monitoring

## Security Controls

* Enable Azure Monitor.
* Enable Container Insights.
* Enable Diagnostic Settings.
* Send logs to Log Analytics.
* Enable Kubernetes audit logs.
* Collect API Server logs.
* Collect Scheduler logs.
* Collect Controller Manager logs.
* Enable Microsoft Defender for Containers.
* Forward logs to Microsoft Sentinel.
* Monitor security alerts.
* Monitor privileged pod creation.
* Monitor RBAC changes.
* Monitor namespace creation.
* Monitor node failures.
* Monitor suspicious container execution.

---

# 11. Threat Protection

## Security Controls

* Enable Microsoft Defender for Containers.
* Enable runtime threat detection.
* Detect container escape attempts.
* Detect crypto-mining.
* Detect malicious process execution.
* Detect reverse shells.
* Detect privilege escalation.
* Detect suspicious network activity.
* Detect Kubernetes API abuse.
* Monitor MITRE ATT&CK techniques.

---

# 12. Admission Control

## Security Controls

* Use Azure Policy for AKS.
* Enforce allowed container registries.
* Restrict privileged containers.
* Restrict hostPath volumes.
* Restrict host networking.
* Restrict Linux capabilities.
* Require resource limits.
* Require CPU limits.
* Require memory limits.
* Enforce approved namespaces.
* Enforce required labels.
* Block unsafe deployments.

---

# 13. Resource Governance

## Security Controls

* Configure CPU requests.
* Configure memory requests.
* Configure CPU limits.
* Configure memory limits.
* Apply ResourceQuota.
* Apply LimitRange.
* Prevent noisy neighbor issues.
* Prevent resource exhaustion.
* Restrict excessive pod creation.

---

# 14. Namespace Security

## Security Controls

* Separate production and non-production namespaces.
* Separate applications by namespace.
* Restrict cross-namespace communication.
* Apply namespace RBAC.
* Apply network policies.
* Apply resource quotas.
* Apply Pod Security Admission.

---

# 15. Supply Chain Security

## Security Controls

* Secure CI/CD pipelines.
* Verify build integrity.
* Enable image signing.
* Verify image provenance.
* Scan IaC templates.
* Scan Helm charts.
* Scan Terraform code.
* Scan Bicep templates.
* Scan Git repositories.
* Protect build agents.
* Implement Software Bill of Materials (SBOM).
* Use trusted package repositories.

---

# 16. High Availability & Resilience

## Security Controls

* Deploy multiple node pools.
* Use Availability Zones.
* Enable automatic node repair.
* Enable cluster autoscaler.
* Backup Kubernetes resources.
* Backup etcd using Azure Backup where applicable.
* Test disaster recovery procedures.
* Test cluster restoration.
* Protect backup storage.

---

# 17. Compliance & Governance

## Security Controls

* Enable Azure Policy.
* Apply CIS AKS Benchmark.
* Enable Microsoft Defender for Cloud recommendations.
* Continuously assess compliance.
* Enable Azure Resource Locks.
* Tag AKS resources.
* Use Azure Landing Zones.
* Use Infrastructure as Code.
* Review security posture regularly.

---

# 18. Data Protection

## Security Controls

* Encrypt data at rest.
* Encrypt data in transit.
* Use TLS certificates.
* Rotate certificates.
* Use customer-managed keys where required.
* Restrict access to sensitive workloads.
* Classify sensitive data.
* Monitor data access.
* Prevent unauthorized data exfiltration.

---

# 19. Backup & Recovery

## Security Controls

* Backup Kubernetes manifests.
* Backup Persistent Volumes.
* Backup Azure Disks.
* Backup Key Vault.
* Protect backup credentials.
* Test restoration periodically.
* Maintain immutable backups where supported.

---

# 20. Operational Security

## Security Controls

* Implement change management.
* Review cluster configuration regularly.
* Remove unused namespaces.
* Remove unused node pools.
* Remove unused service accounts.
* Remove unused roles.
* Remove unused role bindings.
* Rotate certificates.
* Rotate secrets.
* Rotate credentials.
* Monitor configuration drift.
* Perform regular penetration testing.
* Perform Kubernetes CIS benchmark assessments.
* Review Microsoft Defender recommendations regularly.

---

# Enterprise Baseline (Recommended)

For a production-grade AKS deployment, enable the following by default:

* Private AKS Cluster
* Microsoft Entra ID Integration
* Azure RBAC for Kubernetes
* Kubernetes RBAC
* Azure Workload Identity
* Azure Key Vault CSI Driver
* Azure Policy for AKS
* Microsoft Defender for Containers
* Microsoft Defender for Cloud
* Azure Monitor + Container Insights
* Microsoft Sentinel integration
* Kubernetes Network Policies
* Pod Security Admission (Restricted)
* Azure Container Registry with image scanning
* Private Endpoints for ACR and Key Vault
* Automatic node image upgrades
* Automatic Kubernetes version upgrades (planned maintenance)
* Managed Identities (no Service Principals)
* Azure Firewall-controlled egress
* API Server Audit Logs
* TLS 1.2+ only
* Encryption at rest and in transit
* Continuous compliance monitoring against the CIS AKS Benchmark and Azure security baselines.
