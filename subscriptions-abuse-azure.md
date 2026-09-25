## Subscriptions

**Azure Subscription Hierarchy in Azure Penetration Testing**

Understanding the Azure subscription hierarchy is a critical component
of an Azure penetration test, as it helps identify the scope of access,
potential targets, and strategies for lateral movement or privilege
escalation.

**1. Subscriptions**

- **Multiple Subscriptions**: Organizations can have multiple
  subscriptions within the same Azure environment. A single organization
  may use different subscriptions for different purposes (e.g.,
  production, development, testing).

- **Identify Subscription**: The first step after compromising an
  account is to determine which subscription you have access to. The
  subscription name often provides valuable information about its
  purpose (e.g., "Prod" for production, "Dev" for development). This can
  guide your reconnaissance and help you understand what resources you
  might find within the subscription.

- **Azure AD Tenant**: Multiple subscriptions can reside under the same
  Azure Active Directory (Azure AD) tenant. Identifying the tenant and
  understanding how subscriptions are organized within it can help you
  map out the environment and determine your next steps.

- **Resource Groups**: Each subscription can contain multiple resource
  groups. Resource groups are containers for managing related Azure
  resources. Understanding how resources are grouped and the permissions
  associated with them can provide a clearer picture of the
  environment's structure and vulnerabilities.

**2. Roles**

Azure provides built-in roles to manage access and permissions within a
subscription. Understanding these roles is essential for identifying
potential areas for privilege escalation and exploiting
misconfigurations.

- **Owner**: The "Owner" role grants full control over all resources
  within a subscription, including the ability to modify permissions. If
  you have access to an account with this role, you can modify access
  for other users or resources, making it a key target for privilege
  escalation.

- **Contributor**: The "Contributor" role provides all rights except the
  ability to modify permissions. While you can manage resources within
  the subscription, you can't change access controls. This role is often
  used for administrators who need to manage resources without being
  able to assign roles or permissions.

- **Reader**: The "Reader" role allows you to view attributes of
  resources but not modify them. This role is useful for reconnaissance
  and data gathering, as you can inspect resources but cannot make any
  changes.

- **User Access Administrator**: The "User Access Administrator" role
  allows you to manage user access to Azure resources. This role can be
  leveraged to escalate privileges by modifying access permissions or
  adding new users with elevated roles.

------------------------------------------------------------------------

By understanding the Azure subscription hierarchy, penetration testers
can better navigate the environment, identify key roles and permissions,
and plan their attacks around the organization’s subscription structure.
Identifying the right subscription, understanding role-based access
controls (RBAC), and leveraging these roles for further exploitation can
be key steps in gaining higher privileges or access to critical
resources within Azure.
