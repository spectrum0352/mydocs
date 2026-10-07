# Cloud Service Models & Security Overview

---

## 1. Cloud Shared Responsibility & Service Models

Understanding the distinction between on-premises environments and various cloud service models depends on which layers are managed by the customer versus the Cloud Service Provider (CSP).

### Cloud Model Definitions

* **IaaS (Infrastructure as a Service):** Provides basic computing infrastructure (servers, storage, networking, virtualization).
* **CaaS (Container as a Service):** Provides container management, orchestration, and engine services (e.g., Kubernetes).
* **PaaS (Platform as a Service):** Provides a hardware and software framework for developing and running custom applications.
* **FaaS (Function as a Service / Serverless):** Executes event-driven code without requiring application design or server maintenance.
* **SaaS (Software as a Service):** Delivers fully managed web-based applications over the internet.
* **XaaS (Everything as a Service):** Encompasses any service delivered over the cloud, including specialized models like DBaaS, DRaaS, DaaS, and CaaS (Communications).

---

### Shared Management Matrix

| Stack Layer | On-Premises | IaaS | CaaS | PaaS | FaaS | SaaS |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Application** | 👤 Customer | 👤 Customer | 👤 Customer | 👤 Customer | 👤 Customer | ☁️ Provider |
| **Data** | 👤 Customer | 👤 Customer | 👤 Customer | 👤 Customer | 👤 Customer | ☁️ Provider |
| **Runtime** | 👤 Customer | 👤 Customer | 👤 Customer | 👤 Customer | ☁️ Provider | ☁️ Provider |
| **Middleware** | 👤 Customer | 👤 Customer | 👤 Customer | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| **O/S** | 👤 Customer | 👤 Customer | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| **Virtualization** | 👤 Customer | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| **Servers** | 👤 Customer | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| **Storage** | 👤 Customer | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| **Networking** | 👤 Customer | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider | ☁️ Provider |

> **Key:**  
> 👤 **Managed by Customer**  
> ☁️ **Managed by Cloud Service Provider**  
> 🤝 **Shared responsibility occurs depending on granular workload settings.**

---

### Common XaaS (Everything as a Service) Subtypes

* **Database-as-a-Service (DBaaS)**
* **Disaster Recovery-as-a-Service (DRaaS)**
* **Desktop-as-a-Service (DaaS)**
* **Communications-as-a-Service (CaaS)**

---

## 2. Cloud Security Tools & Model Utilization

This matrix outlines the general relevance and utilization levels of modern cloud security tools across different cloud delivery models.

| Cloud Service Model | CASB <br><sub>(Cloud Access Security Broker)</sub> | CSPM <br><sub>(Cloud Security Posture Mgmt)</sub> | CWPP <br><sub>(Cloud Workload Protection Platform)</sub> | CIEM <br><sub>(Cloud Infrastructure Entitlement Mgmt)</sub> | CNAPP <br><sub>(Cloud Native App Protection Platform)</sub> |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **IaaS** | Low | High | High | High | High |
| **CaaS** | Low | High | High | High | High |
| **PaaS** | Medium | High | Medium | High | High |
| **FaaS** | Low | Medium | Low | High | High |
| **SaaS** | High | Low | N/A | Low | N/A |
| **XaaS** | *Varies* | *Varies* | *Varies* | *Varies* | *Varies* |

> **Legend:**  
> * **High:** Core/Essential security tool for this model.  
> * **Medium:** Moderately utilized depending on configuration.  
> * **Low:** Limited use or edge cases.  
> * **N/A:** Not applicable (managed fully by provider).

---

## 3. Customer Security Responsibilities (Ascending Order)

Customer security responsibilities vary by model. Below, models are ordered from **least customer responsibility** (maximum provider management) to **most customer responsibility** (maximum customer control).
