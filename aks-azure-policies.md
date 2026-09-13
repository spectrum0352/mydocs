# Azure Policies for AKS with deny effect

For Azure Kubernetes Service (AKS), Azure Policy can enforce governance at two levels:

1. **Azure Resource Manager (ARM) Policies** – Deny creation or modification of AKS resources (e.g., public clusters, unsupported SKUs, missing tags).
2. **Azure Policy for Kubernetes (Gatekeeper)** – Deny deployment of Kubernetes objects (Pods, Deployments, Services, Ingresses, etc.) inside the cluster using admission control.

For enterprise environments, both should be used together.

---

# Azure AKS Deny Policies (ARM-Level)

## 1. Deny AKS Clusters Without Private API Server

**Effect:** Deny

```text
IF
Microsoft.ContainerService/managedClusters/apiServerAccessProfile.enablePrivateCluster == false

THEN
Deny
```

---

## 2. Deny Public API Server Access

```text
IF

public API endpoint enabled

THEN

Deny
```

---

## 3. Deny Local Kubernetes Accounts

Prevent use of local admin credentials.

```text
disableLocalAccounts == false

Effect:
Deny
```

---

## 4. Deny AKS Without Azure RBAC

```text
enableAzureRBAC == false

Effect

Deny
```

---

## 5. Deny AKS Without Managed Identity

```text
identity.type != SystemAssigned

Effect

Deny
```

(or require User Assigned Managed Identity based on your standard)

---

## 6. Deny Unsupported Kubernetes Versions

```text
IF

version < approved version

THEN

Deny
```

---

## 7. Deny Public Load Balancers

Only Internal Load Balancers allowed.

```text
Service Type LoadBalancer

AND

Internal Annotation Missing

Effect

Deny
```

---

## 8. Deny Basic Load Balancer SKU

Require Standard SKU.

---

## 9. Deny AKS Without Defender for Containers

Require Microsoft Defender plan enabled.

---

## 10. Deny Clusters Without Diagnostic Logs

Require Diagnostic Settings.

---

## 11. Deny Internet Outbound Type

Require

```
UserDefinedRouting
```

instead of unrestricted outbound.

---

## 12. Deny Missing Tags

Require:

* Owner
* BusinessUnit
* Environment
* CostCenter
* DataClassification

---

## 13. Deny Public IP Creation for AKS Nodes

Prevent node pools from receiving Public IPs.

---

## 14. Deny Node Pools Using Unsupported VM Sizes

Allow only approved SKUs.

---

## 15. Deny Unapproved Regions

Allow only:

* East US
* West Europe
* Australia East
* etc.

---

# Kubernetes Admission (Azure Policy for AKS)

---

## 16. Deny Privileged Containers

```yaml
securityContext:
  privileged: true
```

Denied.

---

## 17. Deny Containers Running as Root

Require

```yaml
runAsNonRoot: true
```

---

## 18. Deny Privilege Escalation

Require

```yaml
allowPrivilegeEscalation: false
```

---

## 19. Deny hostNetwork

```yaml
hostNetwork: true
```

Denied.

---

## 20. Deny hostPID

```yaml
hostPID: true
```

Denied.

---

## 21. Deny hostIPC

```yaml
hostIPC: true
```

Denied.

---

## 22. Deny HostPath Volumes

Prevent

```yaml
hostPath:
```

---

## 23. Deny Writable Root Filesystem

Require

```yaml
readOnlyRootFilesystem: true
```

---

## 24. Deny Linux Capabilities

Require

```yaml
capabilities:
  drop:
    - ALL
```

---

## 25. Deny NET_ADMIN Capability

Prevent

```yaml
NET_ADMIN
```

---

## 26. Deny SYS_ADMIN Capability

Prevent

```yaml
SYS_ADMIN
```

---

## 27. Deny Containers Without Resource Limits

Require

```yaml
resources:
  requests:
  limits:
```

---

## 28. Deny Images from Docker Hub

Allow only

```
mycompany.azurecr.io/*
```

---

## 29. Deny Latest Image Tag

Prevent

```
:latest
```

---

## 30. Deny Unsigned Images

Require trusted image signatures (e.g., using Ratify/Notation or other image verification mechanisms).

---

## 31. Deny Images With Critical Vulnerabilities

Block deployment when vulnerability scan reports Critical findings above your policy threshold.

---

## 32. Deny HostPort Usage

Prevent

```yaml
hostPort:
```

---

## 33. Deny NodePort Services

Allow only

* ClusterIP
* Internal LoadBalancer

---

## 34. Deny ExternalName Services

Prevent DNS redirection attacks.

---

## 35. Deny Ingress Without TLS

Require HTTPS.

---

## 36. Deny Wildcard Hosts

Prevent

```
*.company.com
```

unless explicitly approved.

---

## 37. Deny Default Namespace Deployments

Require dedicated namespaces.

---

## 38. Deny Default Service Account Usage

Require application-specific service accounts.

---

## 39. Deny Automount Service Account Tokens

Require

```yaml
automountServiceAccountToken: false
```

unless explicitly needed.

---

## 40. Deny Missing Labels

Require labels such as:

* app
* owner
* environment
* business-unit
* cost-center

---

## 41. Deny Missing Annotations

Require organization-specific metadata annotations.

---

## 42. Deny Pods Without Network Policy

Require applicable NetworkPolicy resources for namespaces hosting workloads.

---

## 43. Deny Host Aliases

Prevent

```yaml
hostAliases:
```

---

## 44. Deny Unsafe Sysctls

Allow only approved sysctls.

---

## 45. Deny Unsafe Volume Types

Allow only approved volume types such as:

* PersistentVolumeClaim
* CSI
* Azure Disk
* Azure Files

Block types such as:

* hostPath
* gitRepo (deprecated)

---

## 46. Deny seccomp Unconfined

Require

```yaml
seccompProfile:
  type: RuntimeDefault
```

---

## 47. Deny Missing Liveness Probe

Require

```yaml
livenessProbe
```

---

## 48. Deny Missing Readiness Probe

Require

```yaml
readinessProbe
```

---

## 49. Deny Missing Startup Probe

Require

```yaml
startupProbe
```

for long-starting applications where appropriate.

---

## 50. Deny Containers Without Read-Only Filesystem

Require

```yaml
readOnlyRootFilesystem: true
```

---

# Enterprise Baseline (Recommended Deny Set)

For a production AKS environment, the following policies are typically enforced as **Deny**:

| Category         | Deny Controls                                                                                   |
| ---------------- | ----------------------------------------------------------------------------------------------- |
| Cluster Security | Private Cluster only, Disable Local Accounts, Azure RBAC required, Managed Identity required    |
| Networking       | Public API Server, Public IPs on nodes, NodePort Services, Host Networking, Unrestricted egress |
| Identity         | Default Service Account, Service Account token auto-mount, Legacy Service Principals            |
| Containers       | Privileged containers, Root user, Privilege escalation, HostPath, HostPID, HostIPC, HostPort    |
| Images           | Untrusted registries, `:latest` tag, Unsigned images, Images exceeding vulnerability thresholds |
| Storage          | Unsafe volume types, Writable root filesystem                                                   |
| Workloads        | Missing CPU/Memory requests and limits, Missing probes, Missing labels                          |
| Ingress          | No TLS, Wildcard hosts (unless approved)                                                        |
| Runtime          | Unsafe Linux capabilities, Unconfined seccomp, Unsafe sysctls                                   |

This set aligns well with enterprise security practices, Microsoft's AKS security baseline, the CIS AKS Benchmark, and Kubernetes Pod Security Standards (Restricted profile).

