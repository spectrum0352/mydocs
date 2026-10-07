# Introduction

**Key vault** is a cloud service for securely storing and managing
cryptographic keys and secrets.

Centralized cloud service for storing an application's secrets in a
single, central location.

It provides secure access to sensitive information by providing access
control

- Manage Secrets

- Manage Encryption keys

- Manage SSL and TLS certificates

- Store secrets backed by Hardware Security Modules

**Configure and manage Key vault**

- configure backup and recovery of certificates, secrets, and keys

- configure key rotation

- create and configure Key vault

- manage certificates, secrets, and keys

>  

**Key vault vs. HSM**

- Key vault uses software-protected keys by default.

- Key vault HSM offers an additional tier that uses Hardware Security
  Modules (HSMs) for enhanced security.

<!-- -->

- Key vault supports storing secrets backed by Hardware Security Modules
  (HSMs) for the highest level of security.

Access configuration

Assign access policy and determine whether a given service principal,
namely an application or user group, can perform different operations on
Key vault keys, secrets, or certificates.

Permission Model:

Vault access policy*:*

A Key vault access policy determines whether a given security principal,
namely a user, application, or user group, can perform different
operations on keys, secrets, and certificates.

Access policies enable you to have fine grained control over access to
vault items

**Certificates using RSA cryptography should have the specified minimum
key size**

For RSA keys, the minimum size for clear RSA keys and secure RSA keys on
the public key data set (PKDS) is **512 bits**. The minimum size for
secure RSA keys on the token key data set (TKDS) is 1024 bits and the
size must be a multiple of 256.

The new industry-allowed maximum validity will be 1 year (398 days)

| Feature | On-Premises KMS | Cloud-Based KMS |
|----|----|----|
| Control | Full control over encryption keys | Less control, reliance on cloud provider |
| Flexibility | High customization, specific needs | Integrates with cloud services |
| Performance | High performance for large data volumes | Performance varies based on cloud infrastructure |
| Scalability | Limited scalability | Easily scales to meet organizational needs |
| Cost | Higher initial cost, ongoing maintenance | Lower initial cost, potential ongoing costs |
| Ideal for | High-security organizations, complete control | Organizations with limited IT resources, quick scalability |

Key Vault Features

- **Secure Storage:**

  - Stores secrets, keys, and certificates

  - Supports hardware-backed security modules (HSM)

- **Centralized Management:**

  - Simplified administration of application secrets

  - Centralized storage and management of secrets

- **Access Control:**

  - Configurable access policies to control who can access what

  - Monitors access and usage for auditing and security

- **Key Management:**

  - Generates, stores, and rotates keys

  - Supports key rotation and expiration policies

- **Certificate Management:**

  - Stores and manages SSL/TLS certificates

  - Automates certificate renewal and deployment

- **Integration:**

  - Integrates with other Azure services for seamless security solutions

  - Enables secure communication and data protection across applications

## Benefits

- **Centralized Secret Management:** Securely store and manage secrets
  in a single, centralized location.

- **Enhanced Security:** Leverage advanced encryption and access control
  mechanisms to protect sensitive information.

- **Simplified Key Management:** Automate key rotation, backup, and
  recovery processes.

- **Integration with Azure Services:** Seamlessly integrate with other
  Azure services to streamline workflows.

- **Compliance and Regulatory Support:** Adhere to industry standards
  and regulations with built-in compliance features.

- **Scalability and High Availability:** Scale your Key Vault to meet
  growing demands and ensure high availability.

## Purpose

Why we should use Key vault?

- **Protect Sensitive Information:** Safeguard critical secrets like API
  keys, passwords, and connection strings.

- **Simplify Security Operations:** Automate key management tasks and
  reduce the risk of human error.

- **Improve Application Security:** Enforce strong security practices
  and minimize vulnerabilities.

- **Meet Compliance Requirements:** Adhere to industry standards and
  regulations with confidence.

- **Streamline Development and Deployment:** Integrate Key Vault into
  your CI/CD pipelines for efficient secret management.

<!-- -->

- Centralized application secrets

- Securely store secrets and keys

- Monitor access and use

- Simplified administration of application secrets

- Integrate with other Azure services

## Keys vs Secrets vs Certificates

**Key Points:**

- **Keys** are cryptographic keys that remain within Key Vault and are
  used for encryption and decryption operations.

- **Secrets** are sensitive information like passwords or API keys that
  can be retrieved and used outside of Key Vault.

- **Certificates** are digital certificates that can be used for
  authentication and secure communication.

| Feature | Keys | Secrets | Certificates |
|----|----|----|----|
| Purpose | Encrypt and decrypt data | Store sensitive information | Verify identity and establish secure communication |
| Data Type | Cryptographic keys (RSA, EC) | Any type of sensitive data | Public keys and digital certificates |
| Encryption | Yes (using the key) | Yes (stored encrypted) | Yes |
| Usage | Protecting sensitive data | Authenticating and accessing applications and services | Verifying identity and establishing secure communication |
| Key Retrieval | Cannot be retrieved in plain text | Can be retrieved in plain text (with proper permissions) | \- |

## Use cases

 

Difference between Key vault and HSM

- Key vault supports software-protected keys

- Key vault HSM supports HSM protected keys

Best Practices

- **Hardware Security Modules (HSMs):** Key vault utilizes HSMs for
  secure key storage and tamper-proof cryptographic operations.

- **Auditing:** Track access attempts and user activity within the Key
  vault for enhanced security posture.

# Design

Designing Azure Key Vault for enterprise-level security, scalability,
performance, and compliance requires careful planning. Key
considerations include:

**Core Principles:**

- **Security:**

  - AzKV utilizes Hardware Security Modules (HSMs) for robust key
    protection.

  - Leverage Role-Based Access Control (RBAC) for granular permission
    management.

  - Implement Network security, using private endpoints, and firewall
    restrictions to limit access.

- **Scalability:**

  - AzKV is designed to handle large volumes of secrets, keys, and
    certificates.

  - It supports high concurrency, crucial for demanding applications.

- **Performance:**

  - AzKV provides low-latency access, essential for
    performance-sensitive applications.

- **Compliance:**

  - AzKV aligns with industry standards like PCI DSS, HIPAA, and
    FedRAMP.

  - Ensure your design meets specific regulatory requirements.

**Implementation Strategies:**

- **Environment Isolation:**

  - **Environment-Specific Key Vaults:** Employ separate key vaults for
    development, staging, and production environments. This isolates
    secrets and minimizes risk.

  - Example:

    - kv-dev-secrets (Development)

    - kv-staging-secrets (Staging)

    - kv-prod-secrets (Production)

- **Key Management:**

  - **Customer-Managed Keys (CMKs):** Utilize CMKs for maximum control
    over encryption keys. This allows for self-management or integration
    with third-party KMS.

  - **Key Rotation:** Implement a robust key rotation policy to mitigate
    the impact of compromised keys. Automate this process where
    possible.

  - **Key Backup and Recovery:** Establish regular backups and a
    comprehensive disaster recovery plan for keys.

- **Access Control:**

  - **Least Privilege Principle:** Apply RBAC to grant only the
    necessary permissions to users and applications.

  - **Managed Identities:** Use Azure Managed Identities for Azure
    resources to authenticate with AzKV, eliminating the need for
    hardcoded credentials.

- **Monitoring and Auditing:**

  - **Enable Azure Key Vault Auditing:** Track all access and operations
    within the key vault.

  - **Azure Monitor Integration:** Integrate AzKV with Azure Monitor for
    proactive threat detection and performance monitoring.

  - **Azure Security Center/Defender for Cloud:** Use these tools to
    assess security posture and identify vulnerabilities.

- **Network security:**

  - **Private Endpoints:** Use private endpoints to keep the traffic
    inside the azure network.

  - **Firewall:** Use the Azure Key Vault firewall to restrict access to
    only known IP addresses.

**Additional Considerations:**

- **Secret Organization:** Implement a consistent naming convention and
  organizational structure for secrets, keys, and certificates.

- **Secret Versioning:** Understand and utilize AzKV’ s versioning
  capabilities for secrets and keys.

- **Automation:** Automate key rotation, backups, and other management
  tasks using Azure Automation or Azure Functions.

- **Cost Optimization:** Plan for key vault usage and storage costs,
  especially in large-scale deployments.

- **Secret Caching:** For performance critical applications, consider
  local secret caching, while being very mindful of the security
  implications.

By adhering to these best practices, enterprises can effectively
leverage Azure Key Vault to secure their sensitive data and
applications.

## Key vault Design Checklist

Questions to ask yourself while designing keyvault?

- **Core Functionality:**

  - What specific types of secrets or keys do you need to store (e.g.,
    encryption keys, passwords, connection strings, certificates)?

  - Do you require encryption, decryption, or signing operations?

- **Access and Permissions:**

  - How will you authenticate and authorize access to Key Vault (e.g.,
    Azure AD, service principal, managed identity)?

  - Who needs access to which secrets or keys, and what level of access
    is required (e.g., read, write, delete)?

  - How will you manage and rotate access permissions?

- **Security and Compliance:**

  - What are your organization's security and compliance requirements
    (e.g., industry standards, regulatory compliance)?

  - How will you ensure the security of your secrets, including key
    rotation, access controls, and monitoring?

  - How will you meet data residency and sovereignty requirements?

- **Backup and Recovery:**

  - How will you back up your Key Vault and restore it in case of
    failure or disaster?

  - What is your disaster recovery plan for Key Vault, including
    failover and recovery procedures?

- **Monitoring and Logging:**

  - How will you monitor the health and usage of your Key Vault?

  - What types of logs and alerts do you need to configure?

- **Integration and Automation:**

  - How will you integrate Key Vault with other Azure services and your
    applications?

  - How will you automate key rotation and other management tasks?

<!-- -->

- **Separate Key vault s:** Create distinct Key vault s for development,
  staging, and production environments.

<!-- -->

- **Naming convention**:

- **Choose region**:

- **Is it used for multi-tenant** **Azure AD architecture?**

- **Is it used for multi-cloud services?**

- **Choose deployment model**:

  - Managed vault (Key vault): cost effective with basic needs.

  - Dedicated vault (Key vault with HSM): Higher isolation and control
    over secrets.

- **Where are your applications located?** Consider regional
  distribution of vaults for low latency access.

- **How frequently secrets are accessed?** High traffic secrets might
  require dedicated vaults for optimal performance.

- **What type of secrets will you store?**

  - Passwords

  - Connection strings

  - API keys

  - Certificates

  - Encryption keys

  - Any sensitive information your application needs.

## IAM

Key Concepts:

- **Access Control:** Azure Key Vault employs a robust access control
  model to safeguard sensitive information. This model combines Azure
  Role-Based Access Control (Azure RBAC) and Key Vault access policies.

- **Azure RBAC:** A broad-scope authorization system that grants
  permissions to Azure resources, including Key Vaults. It's used to
  manage access to the Key Vault itself, such as creating, deleting, or
  modifying the vault.

- **Key Vault Access Policies:** Fine-grained access control mechanism
  that defines permissions for specific users, groups, or applications
  to access secrets, keys, and certificates within a Key Vault.

Key Vault Roles and Permissions

Key Vault offers a range of built-in roles to manage access to its
resources. These roles can be assigned to users, groups, or service
principals:

- **Key Vault Administrator:** Full access to all resources within the
  Key Vault.

- **Key Vault Reader:** Read-only access to Key Vault metadata and
  secrets.

- **Key Vault User:** Access to perform cryptographic operations on keys
  and secrets.

- **Key Vault Crypto Officer:** Manage cryptographic operations and key
  material.

- **Key Vault Secrets Officer:** Manage secrets within the Key Vault.

- **Key Vault Certificates Officer:** Manage certificates within the Key
  Vault.

Best Practices for Secure Access Management

- **Least Privilege Principle:** Grant only the minimum necessary
  permissions to users and applications.

- **Strong Authentication:** Implement strong authentication methods,
  such as multi-factor authentication (MFA).

- **Regular Review and Auditing:** Regularly review and audit access
  policies and permissions.

- **Managed Identities:** Utilize managed identities for Azure resources
  to eliminate the need to store credentials in code.

- **Network Security:** Secure network access to Key Vaults using
  network security groups and firewall rules.

- **Monitoring and Logging:** Monitor Key Vault activity and logs for
  security incidents.

Additional Considerations:

- **Key Vault Access Policies:** Configure access policies to grant
  specific permissions to users or applications.

- **Azure AD Integration:** Leverage Azure Active Directory for
  authentication and authorization.

- **Conditional Access:** Implement conditional access policies to
  enforce additional security measures.

- **Key Rotation:** Regularly rotate keys and certificates to minimize
  the risk of compromise.

- **Secret Rotation:** Implement a secret rotation strategy to ensure
  timely renewal of secrets.

## Network

Azure Key Vault provides a secure storage solution for cryptographic
keys, secrets, and certificates. To enhance its security posture, it is
crucial to implement robust network security measures.

- **Disable Public Network Access:** Prevent unauthorized access by
  blocking public internet access to both Key Vault and Key Vault
  Managed HSM.

- **Utilize Private Link:** Establish private connections between your
  virtual networks and Key Vault/Key Vault Managed HSM using private
  endpoints.

- **Configure Private DNS Zones:** Ensure seamless name resolution
  within your private network for Key Vault resources.

- Implement Virtual Network Service Endpoints: Allow secure access to
  Key Vault from within your virtual network without exposing it to the
  public internet.

- **Enable Key Vault Firewall (ACL):** Restrict access to Key Vault
  based on IP addresses or virtual networks.

- Minimize vault exposure: Avoid embedding vault URLs or secrets
  directly in code.

Private link to Secure AzKV

Azure Private Link is a service that allows you to securely access Azure
services (like Storage Account or Key Vault) from your virtual network
(VNet) without exposing them to the public internet. This enhances
security by isolating your resources and reducing the attack surface.  

**How it works?**

- Private Endpoint: You create a private endpoint within your VNet that
  represents the Azure service (Storage Account or Key Vault). This
  private endpoint uses a private IP address from your VNet.  

- Private Link Service: This is the Azure service you want to access
  privately (Storage Account or Key Vault).

- Private Link Connection: You establish a connection between the
  private endpoint and the private link service.  

**Security Benefits:**

- **Isolation:** Your resources are isolated within your VNet,
  preventing unauthorized access from the public internet.  

- **Reduced Attack Surface:** By eliminating public endpoints, you
  reduce the potential attack vectors.

- **Data Residency:** Data remains within your VNet, complying with data
  residency requirements.

- **Network Security:** Traffic between your VNet and the Azure service
  is encrypted over the Microsoft backbone network.

**Additional Considerations:**

- **Network Security Groups (NSGs):** You can use NSGs to further
  restrict inbound and outbound traffic to your private endpoint.  

- **Azure Firewall:** For advanced threat protection, consider using
  Azure Firewall to filter network traffic.

- **Private DNS Zone:** Ensure proper name resolution within your VNet
  by using Azure Private DNS.

Example: Securing a Storage Account with Private Link

- Create a private endpoint in your VNet for the storage account.  

- Establish a private link connection between the private endpoint and
  the storage account.

- Configure NSGs (optional) to further restrict access to the private
  endpoint.

- Access the storage account using the private IP address of the private
  endpoint from within your VNet.

By combining Private Link with other security measures, you can create a
highly secure environment for your Azure storage and key management
needs.

## Security Operations

Leverage Azure Security Center to proactively identify and address
potential vulnerabilities.

Microsoft Defender for Key vault

Threat Detection and prevention for Key vault

Used for threat detection and prevention

## Logging and Monitoring

- **Enable Diagnostic Settings:** Configure Key Vault and Key Vault
  Managed HSM to send logs to an Event Hub or Log Analytics workspace.

- **Log Storage:** Store logs in a Log Analytics workspace, storage
  account, or Event Hub.

- **Log Analysis:** Regularly analyse logs for suspicious activity, such
  as unauthorized access, configuration changes, or data breaches.

- **Secret Versioning:** Utilize Secret Versions to track changes and
  revert to previous versions if necessary.

- **Role-Based Access Control (RBAC):** Implement granular access
  controls to limit who can access and manage secrets.

- **Network Security:** Use Network Security Groups (NSGs) to restrict
  network access to Key Vault to authorized IP addresses or virtual
  networks.

- **Enhanced Security with Key Vault Managed HSM:** Consider using Key
  Vault Managed HSM for enhanced security and compliance.

- **Regular Security Assessments:** Conduct regular security assessments
  to identify and address potential vulnerabilities.

- **Alerting:** Set up alerts for critical events, such as unauthorized
  access or key compromise.

## Data Security

### Backups

Backups and Recovery

- **Enable Geo-Redundant Backup:** This ensures high availability and
  disaster recovery.

- **Regular Backups:** Schedule regular backups of your key vault
  resources.

- **Certificate Expiration:** Ensure that certificates have a valid
  expiration date.

- **Supported Certificate Authorities (CAs):** Refer to Azure
  documentation for the latest list of supported CAs.

- **Deleted Key Vault Recovery:** Key vaults can be recovered within 7
  to 90 days after deletion.

Soft Delete

- Automatically enabled by default.

- Allows recovery of entire vaults and vault objects within a 90-day
  retention period.

- The ability to disable soft delete via the Azure Portal has been
  deprecated.

- Creating new Key Vaults without soft delete is temporarily possible
  using CLI/PowerShell/REST API but will be fully deprecated soon.

Purge Protection

- Not enabled by default.

- Prevents accidental or malicious deletion of secrets and Key Vaults.

- Enforces a mandatory retention period of 90 days for deleted vaults
  and objects.

- Prevents permanent deletion of secrets, even by Microsoft.

- Consider backing up vault objects that cannot be recreated, such as
  encryption keys generated by Key Vault, if purge protection is not
  feasible.

### Recovery

<img src="media/image1.png" style="width:4.25in;height:3.26011in" /><img src="media/image2.png" style="width:4.825in;height:3.44216in" />

## Governance

Security Boundaries and Isolation:

- **Separate Vaults per Application and Environment:**

  - Enhances security by limiting the scope of potential breaches.

  - Reduces the blast radius, minimizing the impact of a compromise.

  - Allows for granular access control and policy enforcement.

- **Consider Regional Separation:**

  - Further isolates secrets by geographical location.

  - Reduces the risk of regional failures impacting multiple
    environments.

Access Control and Permissions:

- **Implement Role-Based Access Control (RBAC):**

  - Define granular permissions for users and groups.

  - Limit access to specific vaults, keys, and secrets.

  - Regularly review and audit access privileges.

- **Utilize Azure Active Directory (Azure AD):**

  - Integrate with Azure AD for centralized identity and access
    management.

  - Enforce strong authentication and authorization policies.

Key, Secret, and Certificate Management:

- **Set Expiration Dates:**

  - Define appropriate expiration policies for keys, secrets, and
    certificates.

  - Regularly review and renew or rotate these items.

- **Utilize Supported Certificate Authorities (CAs):**

  - Ensure compatibility and security by using trusted CAs.

**Additional Considerations:**

- **Environment Separation:**

  - Maintain distinct Key Vaults for development, staging, and
    production environments.

  - Prevent accidental or unauthorized access to sensitive information.

- **Regular Auditing and Monitoring:**

  - Monitor access logs and activity within Key Vaults.

  - Conduct regular security assessments and vulnerability scans.

- **Key Vault Best Practices:**

  - Follow Microsoft's recommended guidelines for Key Vault usage and
    security.

  - Stay updated on the latest security advisories and patches.

By adhering to these guidelines, you can effectively secure your
sensitive information stored in Azure Key Vault and mitigate potential
risks.

## Integration with 3<sup>rd</sup> party

Integration with other azure services: Key vault seamlessly integrates
with various azure services like azure app service, azure functions,
VMs.

## Scenario-1

You have an Azure solution that uses a key in Key vault to encrypt data
stored in an Azure SQL database. You need to design a solution that
automatically generates a new key in SQL and stores it in the Key vault
whenever the Key vault requires a key rotation. The solution must
minimize costs. What should you include in the solution?

Here is how to design a solution for automatic key rotation in Azure SQL
Database with Key vault, focusing on cost-minimization. By leveraging
Azure Automation with Event Grid triggers and utilizing the free tier,
this solution automates key rotation while keeping costs minimal.

**Components of design:**

- Key vault: This will store the encryption key for your Azure SQL
  database.

- Azure SQL Database: This database will be encrypted using the key
  stored in Key vault .

- Azure Automation Runbook: This runbook will automate the key rotation
  process.

**Configuration:**

- Enable automatic key rotation on the key used for SQL database
  encryption.

- Set a key rotation frequency based on your security requirements.
  (Microsoft recommends at least every two yrs).

**Azure Automation Runbook:**

- Configure the runbook to be **triggered** whenever a new key version
  is created due to automatic rotation policy.

- Integrate Azure Event Grid with Key vault, so that event grid will
  notify runbook whenever a new key version is created.

- Runbook will retrieve the details of the latest key version from Key
  vault.

- Runbook will use Azure PowerShell or CLI commands within the runbook
  to update the TDE protector on SQL DB to point to the latest key
  version retrieved from Key vault.

**Cost Optimization:**

- Free tier of Azure Automation: The free tier of Azure Automation
  provides enough monthly minutes to run this type of simple runbook for
  most scenarios. This keeps the cost minimal.

- Managed Identity for Automation Account: Use a managed identity for
  the Automation account to access Key vault and SQL Database. This
  eliminates the need for storing credentials within the runbook,
  improving security and reducing management overhead.

**Monitoring of configuration**

- Testing: Thoroughly test the runbook in a non-production environment
  before deploying it to production.

- Monitoring: Set up alerts to monitor the success and failure of the
  runbook executions.

## Scenario-2

Let us say azure VM wants to access key vault, then first it connects
with private endpoint of that key vault and then that private endpoint
uses private link to connect with key vault? is this correct? Correct me
if anything missing?

That is correct! Here is a breakdown of the process:

1.  **Azure VM:** The VM resides in a virtual network (VNet).

2.  **Private Endpoint:** A private endpoint is created within the same
    VNet as the VM, representing the Key Vault. This private endpoint
    has a private IP address within the VNet.

3.  **Private Link:** Connects the private endpoint to the Key Vault
    resource. This allows the VM to access the Key Vault without
    exposing it to the public internet.

**Key points to remember:**

- The VM communicates with the private endpoint using the private IP
  address within the VNet.

- The private endpoint acts as a gateway, routing traffic to the Key
  Vault through the private link.

- This entire communication happens within the private network,
  enhancing security.

# Implementation

## with Azure CLI

Implement Azure Key Vault with Azure CLI

To automate the implementation of **Azure Key Vault** using Azure CLI,
follow these steps:

**1. Login to Azure**

az login

**2. Create a Resource Group**

az group create --name rg-cindia-dev01 --location centralindia

**3. Create a Key Vault**

az keyvault create --name kv-cindia-dev01 --resource-group
rg-cindia-dev01 --location centralindia --sku standard

**4. Add a Key to the Key Vault**

az keyvault key create --name devkey001 --vault-name kv-cindia-dev01
--protection software

**5. Add a Secret to the Key Vault**

az keyvault secret set --name devsecret001 --vault-name kv-cindia-dev01
--value "MySecretValue"

**6. Assign a Role to a User or Application**

az role assignment create --role "Reader" --assignee
\<user-email-or-service-principal-id\> --scope
/subscriptions/\<subscription-id\>/resourceGroups/rg-cindia-dev01/providers/Microsoft.KeyVault/vaults/kv-cindia-dev01

**7. Retrieve a Secret from the Key Vault**

az keyvault secret show --name devsecret001 --vault-name kv-cindia-dev01

**Backup and Restore Azure Key Vault Keys**

You can automate the backup and restore of Azure Key Vault keys using
Azure CLI.

**Backup all Keys in a Key Vault**

az keyvault key backup --vault-name kv-cindia-dev01 --name devkey001
--file devkey001-backup.blob

**Restore a Key from Backup**

az keyvault key restore --vault-name kv-cindia-dev01 --file
devkey001-backup.blob

Automated Bash Script for Azure Key Vault Implementation

Here is an example **Bash script** that automates the **Azure Key Vault
setup**:

\#!/bin/bash

\# Variables

RESOURCE_GROUP="myResourceGroup"

LOCATION="eastus"

KEY_VAULT_NAME="myKeyVault"

KEY_NAME="myKey"

SECRET_NAME="mySecret"

SECRET_VALUE="SuperSecretValue"

\# Login to Azure

az login

\# Create a resource group

az group create --name \$RESOURCE_GROUP --location \$LOCATION

\# Create a Key Vault

az keyvault create --name \$KEY_VAULT_NAME --resource-group
\$RESOURCE_GROUP --location \$LOCATION --sku standard

\# Add a key to the Key Vault

az keyvault key create --name \$KEY_NAME --vault-name \$KEY_VAULT_NAME
--protection software

\# Add a secret to the Key Vault

az keyvault secret set --name \$SECRET_NAME --vault-name
\$KEY_VAULT_NAME --value \$SECRET_VALUE

\# Assign a role to a user or application

az role assignment create --role "Reader" --assignee
\<user-email-or-service-principal-id\> --scope
/subscriptions/\<subscription-id\>/resourceGroups/\$RESOURCE_GROUP/providers/Microsoft.KeyVault/vaults/\$KEY_VAULT_NAME

\# Retrieve the secret from Key Vault

az keyvault secret show --name \$SECRET_NAME --vault-name
\$KEY_VAULT_NAME

**Modify the script** to suit your specific requirements by updating the
**resource group, Key Vault name, keys, and secrets**.

This automated approach helps streamline the **deployment, security, and
management** of Azure Key Vault in your cloud environment.

## Implement AzKV with Terraform

## Implementation

**Implementation Steps**

- Create a key vault using the Azure portal, Azure CLI, ARM templates,
  or PowerShell.

- Configure access policies and permissions.

- Manage secrets, keys, and certificates.

- Set up key rotation for automatic key updates.

- Configure backup and recovery for your vault objects.

Using Azure CLI

This summary explains how to automate Key vault implementation using the
Azure CLI.

**Prerequisites:** Azure CLI installed (az login to verify)

**Create Resource Group: \>**az group create --name myResourceGroup
--location eastus

**Create Key vault :** \>az Key vault create --name myKey vault
--resource-group myResourceGroup --location eastus

**Add Key:** \>az key create --name myKey --Key vault myKeyVault

**Assign User/Application Role:** \>az Key vault role assignment create
--role Reader --assignee myUser --Key vault myKeyVault

**Retrieve Secret: \>**az Key vault secret show --name mySecret --Key
vault myKeyVault

**Allow Key Rotation:** \>az Key vault policy create --name myPolicy
--key-permissions rotate --Key vault myKeyVault

**Backup and restore keys:**

- **Backup all keys:** \> az Key vault backup create --name myBackup
  --Key vault myKeyVault

- **Restore a key:** \>az Key vault restore create --name myRestore
  --backup myBackup --Key vault myKeyVault

**Benefits:** Saves time and improves efficiency.

**Example Script:**

\#!/bin/bash

\# Resource group

az group create --name myResourceGroup --location eastus

\# Key vault

az Key vault create --name myKey vault --resource-group myResourceGroup
--location eastus

\# Key

az key create --name myKey --Key vault myKeyVault

\# User/App role

az Key vault role assignment create --role Reader --assignee myUser
--Key vault myKeyVault

**Note:** Modify the script for your specific needs.

Create keys

Choosing a suitable name and region for your key vault .

**Powershell**

> \$ResourceGroup = "rg-keyvault"
>
> \$Location = "centralindia"
>
> \$KeyVaultName = "dev-Keyvault-\$location-001"
>
>  
>
> \#Create RG if needed
>
> try{
>
> Get-AzResourceGroup -Name \$ResourceGroup -ErrorAction Stop
>
> }
>
>  
>
> catch {
>
> New-AzResourceGroup -Name \$ResourceGroup -location \$location
>
> }
>
>  
>
> \#Create Key vault
>
> New-AzKey vault -Name \$KeyVaultName -ResourceGroup \$ResourceGroup
> -Location \$Location

# Code Signing

What is Azure SignTool?

- A powerful tool for digitally signing code packages, executables, and
  other files.

- Leverages Azure Key Vault for secure certificate storage and
  management.

- Provides a centralized and automated approach to code signing.

- Additional <span class="mark">Benefits</span> of Azure SignTool

<!-- -->

- **Centralized Certificate Management:**

  - Simplifies certificate organization and tracking.

  - Enables efficient certificate lifecycle management.

- **Automated Code Signing:**

  - Streamlines the signing process and reduces manual effort.

  - Integrates seamlessly into CI/CD pipelines.

- **Enhanced Security:**

  - Utilizes hardware security modules (HSMs) for robust certificate
    protection.

  - Minimizes the risk of unauthorized access and misuse.

<https://learn.microsoft.com/en-us/answers/questions/25714/what-is-the-difference-between-a-key-and-a-secret.html>

Real-world Use Cases

- **Signing Microsoft Installer (MSI) Packages:**

  - Ensures package integrity and authenticity.

  - Verifies the package's origin and prevents tampering.

- **Signing Windows Driver Packages (WDP):**

  - Guarantees driver compatibility and reliability.

  - Protects against unauthorized modifications.

- **Signing ClickOnce Applications:**

  - Validates application authenticity and source.

  - Mitigates risks associated with malicious tampering.

- **Signing Software Updates:**

  - Confirms update integrity and origin.

  - Protects against unauthorized distribution of modified updates.

Code Signing with Azure Key Vault

- **Code Signing:** Digitally attaching a certificate to software to
  verify its publisher and integrity. Protects users from malware.

- **Key Vault for Code Signing:**

  - Stores and manages code signing certificates.

  - Signs code packages directly.

- **Benefits:**

  - Centralized certificate management.

  - Automated code signing.

  - Enhanced security with HSMs and RBAC.

- **Steps:**

  - Create a Key Vault and store your certificate.

  - Create an Azure AD application with access to the Key Vault.

  - Use PowerShell or REST API to sign your code.

**Note:** The example using PowerShell module is removed as it is an
illustration of step 3.

 

How to sign code built using Azure Pipelines using a certificate/key in
Key vault?

**Problem:**

- Transitioning from on-premise build servers to Azure Pipelines.

- Need to sign binaries for "shrink-wrap" desktop software.

- Current method using USB hardware token is not feasible in cloud
  environments.

**Potential Solution: Using Azure Key Vault**

**Steps:**

1.  **Create a Key Vault:**

    - Set up an Azure Key Vault in your Azure subscription.

    - Configure appropriate access policies to allow your Azure Pipeline
      service principal to access the secrets.

2.  **Import or Generate a Certificate:**

    - **Import:** Import your existing certificate from GlobalSign into
      the Key Vault.

    - **Generate:** Generate a new self-signed certificate within the
      Key Vault.

3.  **Configure Azure Pipeline:**

    - **Secure File Connection:** Create a secure file connection in
      your pipeline to access secrets from the Key Vault.

    - **Download Certificate:** Use a script task to download the
      certificate from the Key Vault during the build pipeline.

    - **Sign Binaries:** Use a specific signing tool (e.g., signtool) or
      a custom script to sign the binaries using the downloaded
      certificate.

**Additional Considerations:**

- **Security:**

  - Ensure strong access controls for the Key Vault.

  - Limit the permissions of the service principal to only the necessary
    actions.

  - Consider using Azure AD-based authentication for your service
    principal.

- **Certificate Expiration:**

  - Implement a mechanism to automatically renew certificates before
    they expire.

  - Consider using Azure Automation or PowerShell scripts to automate
    the renewal process.

- **Testing:**

  - Thoroughly test your pipeline to ensure successful signing of
    binaries.

  - Create a separate test pipeline to experiment with Key Vault
    integration without affecting production builds.

By following these steps and considering the additional factors, you can
effectively sign your binaries in Azure Pipelines using certificates
stored in Azure Key Vault.

# Migration of on-prem KMS to AzKV

Migrating On-Premises Key Storage to Azure Key Vault

Key Migration Methods

- **Manual Migration:** Suitable for small-scale migrations, involves
  manually copying and pasting keys.

- **Automated Migration:** Recommended for large-scale migrations,
  utilizes tools to streamline the process.

- **Manual Migration:** Suitable for small environments with few keys.
  Involves copying keys directly from on-premises storage to KV.

- **Automated Migration**: Ideal for large environments. Utilizes tools
  to automate the process.

Migration Tools

- **Azure Migrate:** A comprehensive cloud migration tool that includes
  key storage migration capabilities.

- **Key Management Service (KMS) Connector for Azure Key Vault:**
  Designed for migrating keys from various on-premises KMS systems.

- **Azure Key Vault Migration Tool:** A free tool for migrating keys
  from diverse on-premises key management systems.

- **Azure Migrate:** Cloud service for migrating servers, applications,
  and data to Azure, including a key storage migration tool.

- **Key Management Service (KMS) Connector for Key vault :** Tool to
  migrate keys from various on-premises KMS to Key vault .

- **Key vault Migration Tool:** Free tool for migrating keys from
  on-premises KMS to Key vault .

General Migration Steps

1.  **Identify Keys for Migration:** Determine which keys require
    migration to Azure Key Vault.

2.  **Select a Migration Tool:** Choose the appropriate tool based on
    your environment's scale and complexity.

3.  **Configure the Migration Tool:** Customize the tool's settings
    according to your specific requirements.

4.  **Initiate the Migration Process:** Start the migration process
    using the selected tool.

5.  **Verify Migration Success:** Validate that all keys have been
    successfully migrated to Azure Key Vault.

6.  **Identify Keys:** Determine which keys need migration (exclude
    legacy application keys).

7.  **Choose a Tool:** Manual for small deployments, automated for large
    deployments.

8.  **Configure the Tool:** Follow specific instructions for the chosen
    tool.

9.  **Start the Migration:** Initiate the migration process.

10. **Verify the Migration:** Ensure successful key transfer.

Best Practices

- **Thorough Planning:** Carefully plan the migration, including key
  selection and migration strategy.

- **Rigorous Testing:** Test the migration process in a staging
  environment before migrating production keys.

- **Close Monitoring:** Monitor the migration process closely to
  identify and resolve any issues promptly.

- **Key Rotation:** Rotate keys after migration to enhance security.

- **Plan Carefully:** Decide which keys and migration method to use.

- **Test the Process:** Test migration in a non-production environment
  before migrating production keys.

- **Monitor the Process:** Closely monitor the migration for successful
  completion.

- **Rotate Keys After Migration:** Enhance security by rotating keys
  after migration to Key vault .

Migrate on-prem keys to AzKV

Transfer on-premises HSM keys to Key vault HSM?

**Step-1: Generate a KEK**

- Generate Key Exchange key. KEK used to encrypt the key you want to
  import

- The KEK must be an **RSA-HSM** key. Only Azure KEY VAULT HSM supports
  RSA-HSM key.

- This KEK should be in **same Key vault** in which you want to import
  On-prem HSM keys.

- KEY should be created with only "**import**" permission.

- After creation of KEK, note down the **Key Identifier (kid),**
  required to encrypt on-prem HSM key.

> \>az Key vault key create --kty RSA-HSM --size 4096 --name KEKforBYOK
> --ops import --vault-name ContosoKeyVaultHSM

**Step-2: Download the KEK public key**

- Download the KEK public key to a .**pem** file.

- KEK public key is used to **encrypt** on-prem HSM key.

- Transfer the **KEKforBYOK.publickey.pem** file to your computer where
  on-prem HSM is deployed.

> \>az Key vault key download --name KEKforBYOK --vault-name
> ContosoKeyVaultHSM --file KEKforBYOK.publickey.pem

**Step 3: Generate and prepare your key for transfer**

- Refer to your HSM vendor's documentation to download and install the
  BYOK tool. Follow instructions from your HSM vendor to generate a
  target key, and then create a key transfer package (a BYOK file).

- BYOK tool will use **kid** and the KEKforBYOK.publickey.pem to
  generate an encrypted target key in a BYOK file.

**Step 4: Transfer your key-to-Key vault**

- To import an RSA key use following command. Parameter --kty is
  optional and defaults to 'RSA-HSM'.

> \>az Key vault key import --vault-name ContosoKeyVaultHSM --name
> ContosoFirstHSMkey --byok-file
> KeyTransferPackage-ContosoFirstHSMkey.byok

# Certificate management

- **Issuing Authority:** Restrict certificate issuance to specific
  trusted Certificate Authorities (CAs), both integrated and
  non-integrated.

- **Lifetime Management:**

- Trigger actions based on certificate lifecycle events.

- Prevent certificates from expiring within a certain timeframe.

- **Allowed Key Types and Curves:** Limit the types of keys and elliptic
  curves usable in certificates.

Policies

- Certificates should be issued by the specified integrated certificate
  authority

- Certificates should be issued by the specified non-integrated
  certificate authority

- Certificates should have the specified lifetime action triggers

- Certificates should have the specified maximum validity period

- Certificates should not expire within the specified number of days

- Certificates should use allowed key types

- Certificates using elliptic curve cryptography should have allowed
  curve names

- Certificates using RSA cryptography should have the specified minimum
  key size - For RSA keys, the minimum size for clear RSA keys and
  secure RSA keys on the public key data set (PKDS) is 512 bits. The
  minimum size for secure RSA keys on the token key data set (TKDS) is
  1024 bits and the size must be a multiple of 256. The new
  industry-allowed maximum validity will be 1 year (398 days)

- Key Vault keys should have an expiration date

RBAC for Certificates

**Access Control:**

- **Azure RBAC:** A centralized access management system that provides
  fine-grained control over Azure resources, including Key Vaults.

- **Key Vault Access Policies:** A legacy method that allows you to
  define permissions for specific users, groups, or applications to
  access Key Vault resources. However, Azure RBAC is the recommended
  approach for most scenarios.

**Key Vault Administrator:**

- Full access to all Key Vault resources (certificates, keys, secrets).

- Can manage the Key Vault itself and role assignments.

**Key Vault Certificates Officer:**

- Manage the entire certificate lifecycle (create, read, update, delete,
  import, export, recover, backup, restore).

- Manage trusted certificate authorities (CAs).

- Purge certificates.

**Key Vault Crypto Officer:** Manage keys and perform cryptographic
operations.

**Key Vault Crypto Service Encryption User:** Read key metadata and
perform wrap/unwrap operations.

**Key Vault Crypto User:** Perform cryptographic operations using keys.

**Key Vault Reader:**

- Read metadata of the Key Vault and its resources (certificates, keys,
  secrets).

- Cannot read sensitive values (secret contents, key material).

**Key Vault Secrets Officer:** Manage secrets.

**Key Vault Secrets User:** Read secret contents.

**Key Vault Contributor:**

- Manage the Key Vault resource itself (create, update, delete).

- Cannot access Key Vault resources.

**Allowed Key Vault Supported CAs:** Configured separately, not
controlled by RBAC.

**Key/Secret Expiration:** Set independently, not controlled by RBAC
permissions.

Monitoring

Certificate Monitoring in Azure Key Vault

- **Expiration Monitoring:**

  - Monitor expiration dates of all certificates.

  - Send notifications in advance (e.g., 30, 60, 90 days) of expiration.

  - Escalate to the Incident Response team/Leadership if action is not
    taken.

- **Operational and Configuration Monitoring:**

  - Monitor the health and configuration of certificates.

  - Detect issues like non-functioning or misconfigured certificates.

- **Policy Compliance Monitoring:**

  - Verify that deployed certificates adhere to defined policies.

  - Send alerts for non-compliant certificates.

# Key management

**Key Rotation:** Enforce expiration dates for keys.

**Hardware Security Module (HSM):** Mandate HSM backing for keys for
enhanced security.

**Key Types and Cryptography:** Restrict key types (RSA or EC) and
cryptographic algorithms.

**Key Validity:**

Set minimum and maximum validity periods for keys.

Prevent keys from being active for extended durations.

**Key Size (RSA only):** Specify a minimum key size for RSA keys.

**Customer-Managed Keys (CMKs):** Maintain complete control over
encryption keys by generating, storing, and managing them directly or
through a trusted third-party KMS.

**Key Rotation Policy:** Regularly rotate encryption keys to mitigate
the impact of compromised keys.

**Key Backups:** Establish a secure backup strategy for encryption keys
to ensure recovery in case of loss or corruption.

**Disaster Recovery Plan:** Define a clear plan for recovering keys in
the event of a disaster.

Policies

Key vault keys should have an expiration date

Keys should be backed by a hardware security module (HSM)

Keys should be the specified cryptographic type RSA or EC

Keys should have an expiration date

Keys should have more than the specified number of days before
expiration

Keys should have the specified maximum validity period

Keys should not be active for longer than the specified number of days

Keys using elliptic curve cryptography should have the specified curve
names

Keys using RSA cryptography should have a specified minimum key size

Manage key/secret rotation policies (create, read, update, delete).

# Secrets management

Key vault enables Microsoft Azure applications and users to store
secrets, such as passwords, database connection strings, or keys of an
Azure Storage account.

Secrets Security policies

- Key vault secrets should have an expiration date

- Secrets should have an expiration date

- Secrets should have content type set

- secrets should have more than the specified number of days before
  expiration

- Secrets should have the specified maximum validity period

- secrets should not be active for longer than the specified number of
  days

Secrets RBAC

secrets should not be active for longer than the specified number of
days

secrets should have an expiration date

**key vault secrets officer**: perform any action on the secrets of a
key vault, except manage permissions.

**key vault secrets user**: read secret contents.

**key vault administrator:** full access to manage the vault and all
objects (secrets, keys, certificates) within it, but cannot manage vault
resources or role assignments.

# Security Assessment

- To do an assessment of Key vault, you can follow these steps:

- Open the Security page on your key vault and view the triggered alert.

- Select the specific alert that was triggered and review the list of
  the secrets that were accessed and the timestamp.

# **Incident Response to Key Vault Alerts**

## 1. Understanding Security Alerts

- Defender for Key Vault protects applications and credentials.

- Every alert must be verified, even if the triggering application or
  user is known.

- Alerts include key identifiers:

  - Object ID

  - User Principal Name

  - IP Address of the suspicious resource

- Determine whether the traffic source is internal or external to the
  tenant.

## 2. Immediate Mitigation Steps

**Identify the Source of Traffic**

- **If the source is known:**

  - Contact the user or application owner to verify activity.

- **If the source is unknown:**

  - **Unrecognized IP Address:**

    - Enable Azure Key Vault firewall.

    - Configure the firewall with trusted resources and virtual
      networks.

  - **Unauthorized Application or Suspicious User:**

    - Review and modify access policies.

    - Remove or restrict permissions for the security principal.

    - Consult the Identity and Access Management (IAM) team.

  - **Azure AD Role:**

    - Contact the administrator to assess and potentially reduce or
      revoke permissions.

Summary Table: Traffic Source & Mitigation Steps

| **Source of Traffic** | **Mitigation Steps** |
|----|----|
| Known Source | Contact user or application owner |
| Unknown IP Address | Enable Key Vault firewall, configure trusted resources and VNETs |
| Unauthorized Application or Suspicious User | Review and modify access policies, remove or restrict permissions |
| Azure AD Role | Contact administrator, assess and potentially reduce or revoke permissions |

**Key Points:**

- Prioritize identification of the traffic source.

- Implement network-level security measures (firewall) to restrict
  access.

- Review and adjust access policies to minimize security risks.

- Consult IAM teams for account verification.

- Coordinate with the administrator for Azure AD permissions review.

## 3. Response to Security Alerts

**Review the Alert Details**

- Examine:

  - Time and origin of the access attempt

  - Attempted action (e.g., key access, secret retrieval, key deletion)

  - Source IP address or application

- Distinguish **internal vs external** access to determine potential
  risks.

**Respond Accordingly**

- **Legitimate Access:** No further action needed if expected behaviour.

- **Suspicious Access:**

  - Rotate/regenerate compromised keys/secrets.

  - Review and update access policies (least privilege principle).

  - Implement Azure Key Vault firewall.

- **Compromised Credentials:**

  - Enforce MFA for all Azure AD identities accessing Key Vault.

  - Reset compromised credentials.

**Document & Report**

- Document incident response actions.

- Report the incident to security teams.

## 4. Impact Assessment

**Identify Affected Secrets**

- Navigate to Azure Key Vault **Security** page.

- Select the triggered alert.

- Review:

  - List of accessed secrets and timestamps.

  - Previous operations (if logs enabled) for IP, User Principal, or
    Object ID.

**Evaluate the Impact**

- Identify compromised data.

- Assess whether any keys or secrets were leaked.

## 5. Remediation Actions

- **Rotate affected secrets, keys, and certificates immediately.**

- **Disable or delete compromised secrets.**

- **If credentials were used in an application:**

  - Contact the administrator to audit application logs.

  - Identify accessed data and mitigate impact.

## 6. Post-Incident Security Enhancements

- **Continuous Monitoring:** Regularly check Azure Key Vault security
  alerts.

- **Access Controls:** Enforce strict least-privilege policies.

- **Threat Detection:** Leverage Azure Security Center for proactive
  monitoring.

- **Logging & Auditing:** Enable and review Azure Key Vault diagnostic
  logs.

- **User & Role Management:** Periodically review Azure AD roles and
  permissions.

By following these steps, organizations can effectively mitigate
security threats to Azure Key Vault and enhance their overall security
posture.

# QnA

# Cryptographic Security in Azure Key Vault

**1. Cross-Device Usability**

- Azure Key Vault can be accessed across multiple devices securely using
  Azure Active Directory (Azure AD) authentication.

- APIs and SDKs enable seamless integration across cloud, mobile, and
  on-premises environments.

**2. Data Storage & Encryption**

- Data is stored in Azure Key Vault and encrypted at rest using **FIPS
  140-2 Level 2 validated** hardware security modules (HSMs).

- Microsoft manages encryption keys by default, but customers can opt
  for **customer-managed keys (CMK)**.

- Data in transit is encrypted using **TLS 1.2 or higher**.

**3. Password Strength & Generation**

- Azure Key Vault does not natively generate passwords but can store and
  retrieve strong passwords securely.

- Integration with Azure AD Password Protection can help enforce strong
  password policies.

**4. Multifactor Authentication (MFA)**

- Azure Key Vault relies on **Azure AD authentication**, which supports
  MFA.

- Conditional Access policies can enforce MFA for added security.

**5. Security Assessment Across Multiple Accounts**

- Azure Security Center integrates with Key Vault to provide **security
  insights** and **compliance monitoring** across multiple accounts.

- Defender for Key Vault detects suspicious activities and unauthorized
  access attempts.

**6. Secure Password Sharing for Teams**

- Azure Key Vault can be used to **securely share credentials** with
  teams by managing access through **Azure Role-Based Access Control
  (RBAC)**.

- Secrets can be accessed via APIs or Azure Managed Identities without
  exposing sensitive information directly.

## Signing Code in Azure Pipelines with Key Vault Certificates

Steps to Sign Code Using a Certificate from Azure Key Vault

1.  **Store Certificate in Key Vault**

    - Upload or generate a code-signing certificate in Azure Key Vault.

2.  **Grant Azure Pipelines Access to Key Vault**

    - Use **Azure RBAC** or **Access Policies** to allow the pipeline's
      service principal access to the certificate.

3.  **Use Azure Pipelines Task to Retrieve and Use Certificate**

    - Add a Key Vault task in Azure Pipelines to fetch the certificate.

    - Use **Azure SignTool** or **PowerShell scripts** to sign the code
      with the retrieved certificate.

### Example YAML Pipeline Configuration

\- task: AzureKeyVault@1

inputs:

azureSubscription: 'Your-Service-Connection'

KeyVaultName: 'YourKeyVaultName'

SecretsFilter: 'CodeSigningCert'

\- task: PowerShell@2

inputs:

targetType: 'inline'

script: \|

\$certPath = "\$(Agent.TempDirectory)\signingCert.pfx"

\$cert = ConvertTo-SecureString -String "\$(CodeSigningCert)"
-AsPlainText -Force

Set-Content -Path \$certPath -Value \$cert

& signtool sign /f \$certPath /t http://timestamp.digicert.com
"\$(Build.ArtifactStagingDirectory)\YourApp.exe"

By implementing these cryptographic security practices, organizations
can enhance data protection, enable secure access across devices, and
streamline security management in Azure environments.

# New

**Azure Key Vault**

- **Benefits:**

  - Centralized application secrets

  - Secure storage of secrets and keys

  - Access and use monitoring

  - Simplified application secret administration

  - Integration with other Azure services

- **What it stores:**

  - Secrets (API keys, passwords, certificates)

  - Cryptographic keys (RSA and Elliptic Curve)

  - SSL/TLS certificates

- **Security best practices:**

  - **Governance:**

    - Separate key vaults per application/environment.

    - Use least privilege access control (RBAC).

    - Enable soft delete and purge protection.

    - Set expiration dates for keys, secrets, and certificates.

  - **Network security:**

    - Disable public network access.

    - Use private link or virtual network service endpoints.

  - **Logging and monitoring:**

    - Enable diagnostic logs.

    - Enable resource logs.

  - **Backup and recovery:**

    - Enable soft delete and purge protection.

    - Create backups of key vault resources.

- **Key Vault vs HSM**

  - Key Vault: Software-protected keys

  - Key Vault HSM: Hardware Security Module protected keys

**Key Differences between Keys and Secrets**

- **Secret:** Anything you want to tightly control access to (passwords,
  API keys, certificates).

- **Key:** Cryptographic key represented as a JSON Web Key (JWK) object.
  Key Vault supports RSA and Elliptic Curve Keys only. **Important:** A
  key never leaves the Key Vault boundary, not even the owner can see
  the clear key.

**Code Signing with Azure Key Vault**

Use Azure Sign Tool to sign code built using Azure Pipelines with a
certificate/key stored in Azure Key Vault.

**Key Vault Security Assessment/Best Practices**

**Governance**

- **Separate Key Vaults:** Use distinct key vaults for each application
  and environment to isolate security boundaries.

- **Least Privilege Access:** Implement strict access controls using
  RBAC to minimize potential damage.

- **Key, Secret, and Certificate Expiration:** Enforce expiration
  policies to mitigate risks associated with compromised credentials.

**Network Security**

- **Network Isolation:** Restrict network access to key vaults using
  firewalls, private endpoints, and virtual network service endpoints.

- **Disable Public Network Access:** Prevent unauthorized access from
  the public internet.

**Logging and Monitoring**

- **Diagnostic Logs:** Enable detailed logging to monitor key vault
  activities and detect anomalies.

**Backup and Recovery**

- **Soft Delete and Purge Protection:** Implement these features to
  recover accidentally deleted resources and prevent malicious deletion.

**Azure Key Vault Assessment**

- Review security alerts in the Azure portal.

- Analyze access logs to identify suspicious activity.

**Azure Key Vault Design for Small Enterprises**

- Choose a suitable name and region.

- Secure access with RBAC and access policies.

- Enable network security measures.

- Use managed identities for authentication.

- Enable logging and auditing.

**Creating an Azure Key Vault**

- Use the Azure portal, Azure CLI, Azure Resource Manager templates, or
  PowerShell.

**Key Vault Use Cases**

- Store secrets, keys, and certificates.

- Perform encryption and signing operations.

**Key Vault Benefits**

- Centralized secret management.

- Secure storage of sensitive information.

- Access monitoring and control.

- Simplified administration.

- Integration with other Azure services.

**Q&A**

- **Keys vs. Secrets:**

  - **Secrets:** Generic data, like passwords or API keys.

  - **Keys:** Cryptographic keys for encryption, decryption, and
    signing.

- **Signing Code with Azure Pipelines:** Use the Azure Key Vault task to
  access and use certificates or keys.

- **Password Generation:** Key Vault doesn't directly generate strong
  passwords.

- **Multi-Factor Authentication:** Key Vault leverages Azure AD for MFA.

- **Security Assessment:** Key Vault doesn't directly assess security
  across multiple accounts.

- **Password Sharing:** Key Vault isn't designed for password sharing.

- **Device and Data Storage:** Key Vault is a cloud-based service, and
  data is encrypted at rest and in transit.

# How to implement Azure Key Vault?

# **How to transfer on-premises HSM keys to Azure Key Vault HSM?**

- ***Step-1: Generate a KEK***

  - *Generate Key Exchange key. KEK used to encrypt the key you want to
    import*

  - *The KEK must be an **RSA-HSM** key. Only Azure KV HSM supports
    RSA-HSM key.*

  - *This KEK should be in **same Key Vault** in which you want to
    import On-prem HSM keys.*

  - *KEY should be created with only "**import**" permission.*

  - *After creation of KEK, note down the **Key Identifier (kid),**
    required to encrypt on-prem HSM key.*

  - *az keyvault key create --kty RSA-HSM --size 4096 --name KEKforBYOK
    --ops import --vault-name ContosoKeyVaultHSM*

- ***Step-2: Download the KEK public key***

  - *Download the KEK public key to a .**pem** file.*

  - *KEK public key is used to **encrypt** on-prem HSM key.*

  - *Transfer the **KEKforBYOK.publickey.pem** file to your computer
    where on-prem HSM is deployed.*

  - *az keyvault key download --name KEKforBYOK --vault-name
    ContosoKeyVaultHSM --file KEKforBYOK.publickey.pem*

- ***Step 3: Generate and prepare your key for transfer***

  - *Refer to your HSM vendor's documentation to download and install
    the BYOK tool.*

  - *Follow instructions from your HSM vendor to generate a target key,
    and then create a key transfer package (a BYOK file).*

  - *BYOK tool will use **kid** and the KEKforBYOK.publickey.pem to
    generate an encrypted target key in a BYOK file.*

- ***Step 4: Transfer your key to Azure Key Vault***

  - *To import an RSA key use following command. Parameter --kty is
    optional and defaults to 'RSA-HSM'.*

  - *az keyvault key import --vault-name ContosoKeyVaultHSM --name
    ContosoFirstHSMkey --byok-file
    KeyTransferPackage-ContosoFirstHSMkey.byok*

>  
