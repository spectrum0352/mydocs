**Define Microsoft Entra?**
Microsoft Entra is Cloud-based access and identity management service that enables users to access external resources like the Azure portal, Microsoft 365, and several other SaaS applications.
Microsoft Entra's other services include the help provided in enhancing productivity and business streamlining processing. In contrast, the SSO GIVES access to internal resources such as cloud apps developed in your organization or apps on your corporate intranet network.

**Advantages**
The significant benefits of using Microsoft Entra are 
• Multiple platform availability: It facilitates operation on various devices and platforms for time consumption and productivity.
• Global availability: Operates 28 data centers worldwide and is accessible throughout the globe irrespective of your location.
• Single sign-on for multiple applications: Microsoft Entra makes onboarding new employees faster and easier and helps implement access to new cloud services and terminate those for the leavers.
• Pre integration with favourite cloud services: Helps collaborate with salesforce, office 365, and social media.
• Comprehensive reporting: Protection from additional threats through enhancing security and enabling business monitor applications.

**Briefly explain the relation of Microsoft Entra with subscriptions?**
Microsoft Entra is a cloud-based identity access management service that, in turn, assists the management of Azure resources. There are one too many subscriptions available, and the admin can trust a single Microsoft Entra. However, a single Microsoft Entra is capable of accessing multiple subscriptions.

**Who utilizes a Microsoft Entra?**
Microsoft Entra is mainly intended for the use of 
• App developers: Working with the clients' pre-existing credentials and adding SSO to the applications are the two areas where app developers use Microsoft Entra. Here they act as a guideline-based method.
• Online subscribers of Azure, Microsoft 365, Dynamics CRM, and Office 365: the online subscribers use Microsoft Entra as it is readily provided with Microsoft 365 for accessing their integrated cloud applications.
• As per their business requirements, IT Admins use Microsoft Entra to regulate access to various app resources and apps.

**What is the User principal name in Microsoft Entra?**
Microsoft's Active Directory is the username or sign-in name that uniquely identifies a user in the User Principal Name (UPN) in Microsoft Entra. The Microsoft Entra supports all the online business services of Microsoft, such as Dynamics 365, Azure, Microsoft 365, Power apps, Office 365, etc. 

**What Microsoft Entra B2C features in Microsoft Entra are unavailable?**

The features currently unavailable are: 
The API connectors
Conditional access.

What are the differences between Owner and Global Administrator? 
A person signing up for an Azure subscription is assigned the owner role for Azure resources. This owner can use a school or work account or a Microsoft account to manage services in the Azure portal. It is associated with the Azure subscription. 
A person signing up with the Azure subscription is assigned the global administrator role for the directory. Access to various directory features and related features is given to these administrators. The administrator's job includes managing domain or user licenses, assigning administrative roles to other users, etc. 

How can the on-premises directory be connected to Microsoft Entra? 
Microsoft Entra connect looks up to connecting your on-premises directory to Microsoft Entra. 
Checking up on "Integrating your on-premises identities with Microsoft Entra" provides you with more information. 

Do people in my organization have access to a self-service portal? 
Yes, the users are given the Microsoft Entra Access Panel by the Microsoft Entra for application access and self-service.
Similarly, in the Office 365 portal, a Microsoft 365 user can avail of the same cap[abilities. 

What can be done if the required application is missing from the Microsoft Entra marketplace?
You can add any required application per the user's requirement by subscribing to Microsoft Entra premium. Users can add automated provisioning and SSO configuration based on preferences and the capabilities of the applications. 

Can the on-premises applications be added?  
The required on-premises web applications chosen are given secure and easy access by the Microsoft Entra application proxy. This process does not involve changing network infrastructure or a VPN requirement. Instead, the user can access it the same way you access the SaaS apps in Microsoft Entra. 

Is it possible to set up a secure LDAP connection with Microsoft Entra?
Lightweight Directory Access Protocol (LDAP) is inaccessible through Microsoft Entra. However, adequately configured network groups help enable Microsoft Entra domain services, establishing LDAP connectivity through Azure networking. 

What is automated user provisioning for SaaS apps? 
Azure VAD automates creating, removing, and maintaining identities in various SaaS apps.

**What are the license requirements for using Microsoft Entra connect?**
Microsoft Entra Connect does not involve any fee, i.e., it is free and can be availed with an Azure subscription.

**Name the types of cloud computing in Microsoft Entra?**
The various cloud computing types in Microsoft Entra include:

1. IAAS
2. PAAS
3. SAAS

**Define dynamic groups in Microsoft Entra?**
The dynamic groups are those running on the user's attribute. The significant criteria involve satisfying the conditions. Otherwise, the user is removed from the group. Thus, the dynamic groups are active in adding and removing users.

**What is conditional access in Microsoft Entra?**
Conditional access refers to policies under which actions are completed and helps access resources.

**What is risk detection?**
**Risk detection is categorized under Azure Identity Protection. All the activities against the user account can be detected using Risk detection.

**What are the functions of Microsoft Entra Domain Services?**

Functions of Microsoft Entra services include
• Makes use of domains, forests, and organizational units for object organization.
• Provides authorization and standard authentication
• Customizable schemes
• Provides authentication of NTLM, Kerberos, LDAP, etc.
• Secures object stores
• Provides group policies

**Explain architecture design under Microsoft Entra service?**
Microsoft Entra makes managing and controlling the resources and services secure for the users.
Primary replica and secondary replica are the two components that fall under Microsoft Entra architecture -
• Primary replica: The preceding model receives all the writes for the residing partitions. Before returning success to the caller, all the correct operations are instantaneously duplicated to secondary replicas. Thus, the durability of rights reserved is geo-redundant. 
• Secondary replica: Secondary replicas located throughout the geographies in data centers service all the directory reads. Asynchronous replication of data is a significant cause of the multiple secondary representations. Data centers near the customers handle the directory reads that include authentication requests.

**Differentiate between Windows AD and Microsoft Entra?**
Windows active directory is a service that facilitates interconnected and varying network conditions in a unified manner.
Microsoft Entra is a directory for cloud-based applications. It is mainly used for identity management and resource access management by admins.

What is Microsoft Entra B2C?
Microsoft Entra Business to Consumer or Microsoft Entra B2C manages the access and customer identity. Not only the protection of their identities is assisted by Microsoft Entra, but also it enhances consumer relationships.

State the enabling and configuration of a single sign-on for an enterprise solution on Microsoft Entra tenant?
Before configuring SSO, you need the following:
Prerequisites: 
Create an Microsoft Entra account using one of the following roles:

1. Owner of Service Principal
2. Application Administrator
3. Cloud Application Administrator
4. Global Administrator

To enable SSO:

1. Visit [Microsoft Entra Admin Center](https://aad.portal.azure.com/) and sign in with one of the abovementioned roles.
2. Select Enterprise solutions on the left side. Now, you will see a pane with All Applications and the list of applications for your Microsoft Entra tenant. You can choose the one you need; for instance - Microsoft Entra SAML Toolkit 1.
3. Select SSO on the left side of the menu, where you see the Manage section. Open the single sign on the page to edit.
4. To open the configuration page, choose SAML.
5. Next, go to the Setup Microsoft Entra SAML Toolkit 1 panel.
6. Record the inputs of Logout, Login URL, and Microsoft Entra identifier for your future reference.

Configuration of SSO on tenant:
1. Go to the Set Up Single Sign-on panel in the Azure portal and choose the Edit menu.
2. Enter the following for Reply URL https://samltoolkit.azurewebsites.net/SAML/Consume
3. Enter https://samltoolkit.azurewebsites.net/ for Sign on URL
4. Click Save
5. Choose Download for Certificate in SAML Signing Certificate to download the certificate.
6. Use it later whenever you need it.

**What is the method for applying windows updates under Microsoft Entra Domain Services?**

Controllers automatically apply the necessary window updates in a managed domain, even without your configuration or administration. 
However, the user must ensure that he does not block access to outbound traffic to Windows updates by creating network security groups. 

**Can the tenant id and client id be hideable in the body or headers in Microsoft Entra?**

You must not use a client identifier for client authentication as it is visible to the resource owner and not a secret.
The client id and the tenant id are both visible in the URL. Passing them to the body or headers does not mean they are hidden. Their visibility is still accessible via the developer tools.
According to the OAuth RFC, tenant and client id are not secrets.

**What is the different Microsoft Entra licenses?**
Microsoft Entra licenses include

1. “Pay as you go” feature licenses
2. Microsoft Entra Free
3. Microsoft Entra Premium P1
4. Microsoft Entra Premium P2

**What is identity in Microsoft Entra?**
Identity in Microsoft Entra is the representation of something or a thing that by some means can be authenticated. For example, identity in the Microsoft Entra Directory usually represents a user with a password associated and a unique username used for authentication. Their authentications can be accessed by the use of secret keys or certificates.

Passwordless authentication
Passwordless authentication is not a process under which remembering the password is not a criterion because authentication is done by using FIDO keys, the MS authenticator app, or Windows Hello for business.

**Microsoft Entra Domain Service**
Microsoft Entra Domain Services (Microsoft Entra DS) provides managed domain services such as:

* Domain join
* Group policy
* lightweight directory access protocol (LDAP)
* Kerberos/NTLM authentication

You use these domain services without the need to deploy, manage, and patch domain controllers (DCs) in the cloud. An Microsoft Entra DS managed domain lets you run legacy applications in the cloud that can't use modern authentication methods, or where you don't want directory lookups to always go back to an on-premises AD DS environment. You can lift and shift those legacy applications from your on-premises environment into a managed domain, without needing to manage the AD DS environment in the cloud. Microsoft Entra DS integrates with your existing Microsoft Entra tenant. This integration lets users sign in to services and applications connected to the managed domain using their existing credentials. 
