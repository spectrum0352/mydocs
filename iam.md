# Identity and Access Management with Microsoft Entra ID and Active Directory

**Executive Summary:** Modern identity management moves beyond
on-premises directories to cloud-based, Zero Trust architectures.
Microsoft Entra ID (formerly Azure AD) is a multitenant cloud identity
service that can operate stand‑alone or integrate with traditional
Active Directory Domain Services (AD DS). Entra ID provides advanced
features like cloud SSO, external identities (B2B/B2C), Conditional
Access, Privileged Identity Management (PIM), and device compliance
through Intune. By contrast, on‑premises AD DS supports domain-joined
PCs, Group Policy, and Kerberos/LDAP. Hybrid identity (syncing AD DS to
Entra ID) is a common pattern to enable cloud apps while retaining
on-prem
resources[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons)[\[2\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,could%20create%20a%20major%20incident).
Key recommendations include verifying all custom domains in Entra ID
before user
sync[\[3\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=Microsoft%20Entra%20ID),
enforcing MFA (phishing-resistant methods) for all
admins[\[4\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=We%20recommend%20that%20you%20require,for%20example%2C%20financial%20officers),
excluding “break‑glass” emergency accounts from Conditional Access, and
using PIM for just-in-time role
elevations[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary)[\[6\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=%2A%20Prioritize%20phishing,resistant%20passwordless%20authentication%20deployment).
This document outlines scope, feature comparisons, architecture patterns
(hybrid, cloud-only, B2B/B2C, etc.), detailed configuration steps
(tenant setup, AD Connect, SSO, federation, PHS vs PTA, CA policies,
MFA, RBAC, PIM, entitlement management, Intune integration, monitoring),
and migration planning (timeline, checklist, risk matrix).

**Scope and Objectives:** This report compares Microsoft Entra ID (Azure
AD) with on-prem AD DS (features, licensing, limitations) and recommends
identity architectures (cloud-only vs hybrid, external identity
scenarios, privileged access). It provides implementation guidance
(prerequisites, step-by-step Azure portal or PowerShell/CLI commands,
common pitfalls and rollbacks) for key components: tenant configuration,
Azure AD Connect sync, federated and modern SSO, password hash sync vs
pass-through, Conditional Access, MFA, RBAC, PIM, entitlement
management/identity governance (access reviews), device management via
Intune, and logging/monitoring (Azure AD logs, Sentinel). Included are
diagrams (architecture flows) and tables for comparison, plus a
migration plan checklist (Gantt chart) and risk/mitigation matrix. All
guidance is based on official Microsoft documentation and best-practice
sources (last 3 years).

## Comparison: Microsoft Entra ID vs On-Premises AD DS

| Aspect | On-Premises AD DS | Microsoft Entra ID (Azure AD) |
|----|----|----|
| **Deployment** | Managed by customer on Windows Servers/VMs. Traditional forests/domains with domain controllers. | Cloud-hosted identity service (IDaaS). Multi-tenant service managed by Microsoft. Can be standalone or synced to AD DS. |
| **Authentication protocols** | Kerberos, NTLM, LDAP; supports Windows integrated auth, GPOs, domain join. | Modern protocols: OAuth2/OIDC, SAML, WS-Fed, OpenID Connect. No Kerberos/NTLM (except via Entra Domain Services). Supports seamless SSO to cloud apps and can integrate with on-prem via federation or password sync[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons)[\[7\]](https://learn.microsoft.com/en-us/entra/fundamentals/compare#:~:text=SaaS%20apps%20Active%20Directory%20doesn%27t,Microsoft%20Entra%20ID%20for%20authentication). |
| **Directory synchronization** | – | Supports AD Connect sync (hash or passthrough) and staging (cloud-only accounts) for hybrid identity[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons)[\[2\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,could%20create%20a%20major%20incident). AD DS can be extended into Azure via VM DCs or managed Entra Domain Services for legacy auth. |
| **User and group management** | Users/groups stored in AD DS; changes via AD tools or LDAP. | Users/groups managed in Entra ID portal/Graph API. Can include cloud-only accounts and external (B2B/B2C) accounts. External identities (guests, social) are supported[\[7\]](https://learn.microsoft.com/en-us/entra/fundamentals/compare#:~:text=SaaS%20apps%20Active%20Directory%20doesn%27t,Microsoft%20Entra%20ID%20for%20authentication)[\[8\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=%2A%20Workforce.%20Your%20full,your%20organization%20such%20as%20business). |
| **Admin roles** | Built-in Domain/Admins roles (Domain Admin, Enterprise Admin) govern AD DS. | Hundreds of built-in *Entra roles* (Global Admin, User Admin, etc.) for directory management[\[9\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Microsoft%20Entra%20role%20Permissions%20Notes,Global%20Administrator) and custom roles. For Azure resources, Azure RBAC (Owner, Contributor, Reader, etc.) applies[\[10\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Azure%20role%20Permissions%20Notes%20Owner)[\[9\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Microsoft%20Entra%20role%20Permissions%20Notes,Global%20Administrator). |
| **Application access** | On-prem apps via AD DS; modern cloud apps not native. ADFS can federate web apps. | Built-in integration for cloud/SaaS apps (Office 365, many gallery apps, custom apps). Supports SAML, OIDC, WS-Fed SSO. Azure App Proxy for on‑prem apps. Can federate to external IdPs. |
| **Conditional Access & MFA** | Not built-in (rely on on-prem MFA solutions). Legacy protocols not natively protected. | Built-in Conditional Access engine for Zero-Trust: policies (if-then rules) that consider user, location, device, risk, etc. to enforce MFA, compliant devices, etc[\[11\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=Modern%20security%20extends%20beyond%20an,account%20when%20enforcing%20policy%20decisions)[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps). MFA (cloud-based) is an integrated feature (can require MFA for admins, control legacy protocol use, etc.)[\[4\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=We%20recommend%20that%20you%20require,for%20example%2C%20financial%20officers). |
| **Privileged access** | No native just-in-time elevation. Static Domain Admin groups. | PIM provides time-bound role activation for Entra ID roles and Azure resources, with approval, MFA, audit[\[13\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Use%20Privileged%20Identity%20Management%20,Microsoft%20365%20or%20Microsoft%20Intune)[\[14\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prepare%20PIM%20for%20Microsoft%20Entra,roles). Also break-glass accounts (cloud-only) should be configured[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary). |
| **Identity Governance** | Manual processes (scripts) or third-party tools for access reviews and lifecycle. | Access Reviews to recertify group/app access, Entitlement Management with access packages and lifecycle policies for B2B/B2C users[\[15\]](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first#:~:text=Managing%20access%20to%20all%20the,when%20it%27s%20no%20longer%20needed). |
| **Devices** | Domain-joined Windows PCs managed via GPOs and on-prem MDM. | Devices can be *Azure AD Joined* or *Hybrid Azure AD Joined*, managed by Intune or other MDM. Conditional Access can require device compliance (Intune policies)[\[16\]](https://learn.microsoft.com/en-us/entra/fundamentals/compare#:~:text=or%20other%20third,allowing%20access%20to%20the%20apps). Windows Hello for Business, FIDO2 keys supported. |
| **Licensing** | Windows Server licenses (standard/enterprise CALs) on each DC. | Entra ID Free (basic features) up to 500k objects by default; Premium P1 (Conditional Access, Hybrid PHS/SSO, etc.) and P2 (Identity Protection, PIM, Governance) add advanced features[\[6\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=%2A%20Prioritize%20phishing,resistant%20passwordless%20authentication%20deployment)[\[17\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prerequisites). M365/E5 or EMS E5 include P2. |
| **Limitations** | Hard to scale beyond on-prem; no native web app integration; physical security/DR needed for DCs. | No native LDAP/Kerberos for line-of-business Windows apps (use Entra Domain Services or AD DS VMs for that). Some legacy protocols must be explicitly blocked (or served by AD FS). Dependent on Azure AD licensing for full features. |

> *Entra ID is a cloud-first identity service combining directory, SSO,
> MFA, risk detection and governance in one
> platform[\[18\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Microsoft%20Entra%20ID%20is%20the,protection%20into%20a%20single%20solution)[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons).
> In hybrid deployments, Azure AD Connect synchronizes identities (often
> with PHS for backup) so users have a single sign-on
> experience[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks)[\[20\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Seamless%20SSO%20can%20be%20combined,ADFS).
> Use cloud-only (Entra) accounts when possible; use AD DS only when
> needed for legacy auth or Group Policy.*

## Recommended Architecture Patterns

- **Cloud-Only Identity:** All users and devices are created in Entra ID
  (no on-prem AD DS). This is simplest for new organizations. Users sign
  in directly to cloud services; devices join Azure AD. Use this if you
  have no existing AD or are a new cloud-native enterprise. Native
  features (SSO, CA, PIM) apply. (No user migration needed.)

- **Hybrid Identity (Sync):** Most common for enterprises with existing
  AD DS. Extend on-prem domain to Azure: deploy AD DCs or Entra Domain
  Services in Azure only if needed for Kerberos/NTLM. Use **Azure AD
  Connect** to sync users/groups to Entra ID for unified
  credentials[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons)[\[2\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,could%20create%20a%20major%20incident).
  This enables SSO to cloud apps while maintaining on-prem apps/auth.
  **Sign-in options:** Password Hash Sync (PHS) or Pass-through
  Authentication (PTA) with Seamless SSO
  (Kerberos)[\[21\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Microsoft%20Entra%20seamless%20single%20sign,premises%20components)[\[22\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=automatically%20signs%20users%20in%20when,premises%20components).
  Modern best practice is PHS + Seamless SSO (no reliance on AD FS, but
  backup federation
  optional)[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks)[\[22\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=automatically%20signs%20users%20in%20when,premises%20components).
  Use PHS even if using federation as a backup for
  outages[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks).
  Diagrammatically:

<!-- -->

    graph LR
      subgraph OnPremises
        ADDS[AD DS Domain Controllers] -->|LDAP/Kerberos| Computers[Users/PCs]
        ADDS -- Sync (PHS/SSO) --> Entra[Microsoft Entra ID]
      end
      subgraph Cloud
        Entra --> SaaS[Office365/SaaS Apps]
        Entra --> AzureSubs[Azure Resources (RBAC)]
        Entra --> Intune[Intune MDM]
        Computers -->|Seamless SSO| Entra
      end

*Figure: Hybrid identity flow – on-prem AD DS syncs to Entra ID via
Azure AD Connect (using password hash sync and Seamless SSO), enabling
unified SSO to cloud
apps[\[22\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=automatically%20signs%20users%20in%20when,premises%20components)[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks).*

- **Federated Identity (AD FS):** An older pattern. Deploy AD FS (and
  WAP) on-prem and configure trust with Entra ID. Users authenticate to
  AD FS (no password stored in cloud). Use only if required (e.g.
  advanced auth rules or specific federation needs). **Drawbacks:**
  Additional servers and maintenance; if AD FS is down, users can’t sign
  in (so Azure AD Connect sync or fallback PHS should be
  enabled)[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks).
  For new projects, Microsoft recommends PTA/PHS over AD FS where
  possible.

- **External Identity (B2B & B2C):** Use Entra External ID for partners
  and consumers:

- **B2B Collaboration:** Invite guest users or set up federation with
  partner tenants. Use Entitlement Management and Access Reviews for
  governance[\[23\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=This%20article%20addresses%20the%20following,considerations%20for%20each%20architecture)[\[24\]](https://learn.microsoft.com/en-us/entra/id-governance/access-reviews-overview#:~:text=Access%20reviews%20in%20Microsoft%20Entra,right%20people%20have%20continued%20access).
  The workforce‑collaboration architecture (see figure) uses a
  centralized *workforce tenant* that governs partner access via Entra
  External ID and Identity
  Governance[\[25\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=%2A%20Workforce%20and%20collaboration,oriented%20architecture%20%2A%20Architecture%20combinations)[\[26\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=Typical%20scenarios%20include%20employees%20initiating,SAML%29%20federated%20identity%20provider).
  <img src="media/image1.png" style="width:5.83333in;height:3.09219in" />\
  *Figure: Sample workforce B2B collaboration architecture – employees
  and invited partners authenticate to the Entra ID “workforce” tenant
  using Entra External ID and Identity
  Governance[\[25\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=%2A%20Workforce%20and%20collaboration,oriented%20architecture%20%2A%20Architecture%20combinations)[\[26\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=Typical%20scenarios%20include%20employees%20initiating,SAML%29%20federated%20identity%20provider).*

- **Isolated Business Partner Access:** For sensitive partners, use a
  separate tenant or selective policies.

- **B2C (Consumers):** Entra B2C is for customer sign-up/sign-in, with
  branding and social logins. Best practices include user flows (or
  custom policies for complex scenarios), MFA risk analysis, and monthly
  active users billing
  model[\[27\]](https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices#:~:text=The%20following%20best%20practices%20and,existing%20or%20new%20application%20environments)[\[28\]](https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices#:~:text=Azure%20AD%20B2C%20Premium%20P2,need%20to%20contact%20%2018).
  Note: As of 2025, new Azure AD B2C tenants use monthly active user
  pricing[\[29\]](https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices#:~:text=Effective%20May%201%2C%202025%2C%20Azure,Learn%20more%20in%20our%20FAQ).

- **Privileged Access Architecture:** Always assume threats target
  admins. Enforce *Just-In-Time* elevation via PIM for all elevated
  roles[\[13\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Use%20Privileged%20Identity%20Management%20,Microsoft%20365%20or%20Microsoft%20Intune).
  For very high-privilege roles (Global Administrator, Privileged Role
  Admin), require MFA and approval workflows. Use Privileged Access
  Workstations for admin tasks. Exclude emergency break-glass accounts
  from Conditional Access (and secure them via FIDO2
  keys)[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary).
  For Azure resource roles, also use PIM (Azure PIM) to discover and
  protect owner/contributor
  assignments[\[14\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prepare%20PIM%20for%20Microsoft%20Entra,roles).

- **Conditional Access Strategy:** Implement Zero Trust: treat every
  access attempt as potentially risky. Common policies: require MFA on
  admin roles, block legacy auth, require compliant or hybrid-joined
  devices for sensitive
  apps[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps)[\[30\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Enforce%20multifactor%20verification%20for%20users).
  Use "What If" tools to test policies. Start with Security Defaults
  (MFA for all) then move to granular CA policies. Regularly review
  Identity Secure Score for
  improvements[\[30\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Enforce%20multifactor%20verification%20for%20users).

## Configuration Guides

### Tenant Setup and Domains

- **Prerequisites:** A verified Entra ID tenant (free to create on Azure
  Portal). Verify and configure custom domains for user UPNs (default
  `.onmicrosoft.com` is insufficient for most
  orgs)[\[31\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,com%20default%20domain)[\[32\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=Set%20the%20primary%20domain%20name,for%20your%20Microsoft%20Entra%20organization).

- *Example:* To add a domain, DNS-verify ownership in the Entra admin
  center (Domains \> Add domain). Then set one verified domain as
  primary (so new UPNs use
  it)[\[32\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=Set%20the%20primary%20domain%20name,for%20your%20Microsoft%20Entra%20organization).

- **Portal Steps:** In the Entra admin center
  (https://entra.microsoft.com) as a Domain Name Administrator:

- Go to **Entra ID (Azure AD) \> Custom domain names**.

- Click *Add custom domain*, enter your domain (e.g. contoso.com), add
  the TXT record in DNS per instructions, and verify.

- Once verified, select the new domain and *Make primary* if
  desired[\[32\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=Set%20the%20primary%20domain%20name,for%20your%20Microsoft%20Entra%20organization).

- **Pitfalls:** Ensure no syncing or federation is in progress before
  switching primary domain. To rollback domain changes, use the
  “ForceDelete” option in Azure AD if needed (see
  docs)[\[33\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=ForceDelete%20option)
  (careful: this will rename users/groups to default domain).

- **Licensing:** Ensure you have adequate Entra ID licenses (P1/P2) for
  desired features (Conditional Access, PIM, etc.). Use \[Microsoft’s
  pricing page\] or \[Entra licensing docs\].

### Directory Synchronization (Azure AD Connect)

- **Purpose:** Sync on-prem AD DS objects to Entra ID for hybrid
  identity. Azure AD Connect (sync) can also enable hybrid password
  writeback and group writeback.
- **Prerequisites:** As documented, ensure AD schema \>= 2003, writable
  DC, no duplicate UPNs (use IdFix
  tool)[\[34\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,which%20features%20you%20should%20enable),
  TLS 1.2 and .NET 4.7.2+ on the AD Connect server, local DB (or
  provisioned SQL), and that Entra Global Admin or Hybrid Identity Admin
  is
  available[\[35\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=)[\[36\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,is%20installed%20but%20in%20a).
- **Step-by-Step (simplified):**
- **Install Azure AD Connect** on a dedicated, domain-joined Windows
  Server. Download from the Entra admin center or Microsoft portal.
- During setup:
  - Connect to your Entra ID tenant (Global Admin).
  - Connect to your on-prem AD (an enterprise admin or delegated
    account).
  - Choose **User sign-in** option: *Password Hash Sync (PHS)* or
    *Pass-through Auth (PTA)*. (PHS is simplest.) Enable *Seamless SSO*
    if
    desired[\[21\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Microsoft%20Entra%20seamless%20single%20sign,premises%20components).
  - Select OUs to sync, and features (e.g. password writeback to
    on-prem, Azure AD App/Group writeback for Exchange, etc.).
  - Finish install; verify the scheduler and sync status.
- **Validation:** After sync completes, check that users/groups appear
  in Entra ID (portal \> Users/Groups). Use **Azure AD Connect Health**
  for monitoring.
- **Pitfalls:**
- **Filtering mistakes:** Syncing too many objects can exceed default
  300k limit (increase by verifying
  domain[\[37\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,or%20Enterprise%20Mobility%20%2B%20Security)).
- **Privileged accounts:** By default, AD Connect syncs only AD default
  Administrator (RID500). *Don’t sync* Domain Admin or Enterprise Admin
  accounts to Entra ID (filter them
  out)[\[2\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,could%20create%20a%20major%20incident),
  else a cloud compromise could pivot on-prem.
- **Connectivity:** Ensure the AD Connect server can reach Azure
  endpoints (add `secure.aadcdn.microsoftonline-p.com` to IE Trusted
  Sites if using PTA and
  MFA)[\[36\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,is%20installed%20but%20in%20a).
- **Rollback:** If misconfigured, you can rerun the AD Connect wizard,
  disable sync, or uninstall AD Connect. Re-add as needed. For urgent
  cutover issues, ensure you have cloud-only Global Admin break-glass
  accounts not reliant on
  sync[\[38\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=Create%20emergency%20access%20accounts).

### Single Sign-On (SSO) and Federation

- **Azure AD Integrated SSO:** For cloud apps (SaaS/O365), Azure AD
  provides built-in SSO. Enterprise apps (pre-integrated from gallery)
  can be enabled in Entra ID. To configure a SAML-based app:

- In **Entra admin center \> Entra ID \> Enterprise applications**
  select your app or add a new gallery app.

- Go to *Single sign-on*, choose **SAML** (or **OIDC**, **Password** as
  needed).

- Follow the wizard: set Identifier (Entity ID), Reply URL (ACS), and
  upload certificates. Copy values as required into the app’s
  configuration[\[39\]](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#:~:text=To%20enable%20SSO%20for%20an,application)[\[40\]](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#:~:text=To%20configure%20SSO%20in%20Microsoft,Entra%20ID).

- **Seamless SSO (Kerberos):** Enables passwordless login for
  domain-joined PCs. From AD Connect installation or later:

- In Azure AD Connect, enable *Seamless SSO*. Alternatively, use
  PowerShell or the portal to turn it on.

- Configure DNS (add `azuread-dev.<domain>` DNS entry) and ensure group
  policy is deployed to domain-joined Windows clients.

- When users are on corporate network on a domain PC, they sign-in
  automatically to Azure AD-backed apps without
  prompts[\[22\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=automatically%20signs%20users%20in%20when,premises%20components).

- *Note:* Seamless SSO works with PHS or PTA but not with AD
  FS[\[41\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Seamless%20SSO%20can%20be%20combined,ADFS).

- Diagram:\
  <img src="media/image2.png" style="width:5.83333in;height:2.39167in" />\
  *Figure: Seamless SSO flow – Azure AD (Entra) uses a Kerberos ticket
  from the on-prem Windows login. The domain-joined user seamlessly
  authenticates to Azure AD and accessed cloud apps without retyping
  credentials[\[22\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=automatically%20signs%20users%20in%20when,premises%20components).*

- **Federation (AD FS):** To federate on-prem AD to Azure AD using AD
  FS:

- Deploy AD FS farm (Windows Server 2022/2025). Configure Web
  Application Proxy (WAP) if publishing
  externally[\[42\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,global%20administrator%20role%20or%20an).

- Obtain SSL certs for AD FS (wildcard or SAN for `adfs.contoso.com`).

- Use AD Connect or PowerShell to convert your AD domain to federated
  (e.g. `Convert-MsolDomainToFederated`).

- Users now authenticate via AD FS when signing into Azure/O365.

- *Pitfalls:* AD FS adds complexity. If AD FS goes down or network
  fails, no login possible. Always configure fallback (PHS) or
  break-glass accounts. AD FS requires correct time sync and TLS, and
  high availability.

- **Rollback:** To revert federation, you can use
  `Convert-MsolDomainToManaged` (though migrating from federated to
  managed is non-trivial). Keep global admins as *non-federated*
  accounts so you can access the cloud tenant independently of AD FS.

### Password Hash Sync vs Pass-Through vs Federation

- **Password Hash Synchronization (PHS):** Simplest: hashes of user
  passwords are synced to Azure AD. Users sign in to cloud with the same
  password. Benefits: resilience (Azure AD login still works if on-prem
  is down) and offline MFA/risk detection. We *recommend* enabling PHS
  even if using federation, as a
  backup[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks).
  It also allows Azure AD Identity Protection to detect compromised
  passwords.
- **Pass-Through Authentication (PTA):** On-prem agent validates
  passwords directly against AD when users sign in. No password hash in
  cloud. Requires on-prem availability. Use PTA if compliance forbids
  password hash in cloud. Seamless SSO can be used with
  PTA[\[21\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Microsoft%20Entra%20seamless%20single%20sign,premises%20components).
- **Federation (AD FS):** No password stored or synced; AD FS issues
  tokens. Use only if required (complex rules, existing investment).
  Requires robust AD FS architecture (weaker recommendation now).
- **Comparison Table (simplified):**

| Feature | PHS | PTA | Federation (AD FS) |
|----|----|----|----|
| Password stored? | Hashed in cloud | Natively in on-prem (no cloud copy) | Not stored; validated by AD FS |
| On-prem dependency | Optional (failover to cloud) | Required for login | Required for login |
| Single sign-on (Kerberos)? | Yes, via Seamless SSO | Yes, via Seamless SSO | Yes, via AD FS SSO |
| MFA & risk features | Fully supported | Fully supported | Supported |
| Setup complexity | Low (built into AD Connect) | Low-medium (requires agents) | High (AD FS farm needed) |
| \- **Pitfalls:** If using PTA or AD FS, network outages prevent logins. Always have a break-glass account (cloud-only, with MFA disabled or FIDO2) not reliant on on-prem infrastructure[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary). If using PHS, ensure Azure AD Connect is regularly updated (service deadline Sep 2026 for v2.5.79) to avoid sync failure[\[43\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=Important). |  |  |  |
| \- **Rollback:** Switching between these modes can be done in Azure AD Connect or via PowerShell (`Set-MsolDomainAuthentication`). Always test in pilot tenant first. |  |  |  |

### Conditional Access Policies

- **Overview:** Conditional Access (CA) in Entra ID implements Zero
  Trust “if-then” rules for
  access[\[11\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=Modern%20security%20extends%20beyond%20an,account%20when%20enforcing%20policy%20decisions).
  It evaluates signals (user, device, location, app, risk level) and
  makes decisions (block, require MFA, compliant device,
  etc.)[\[44\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=Conditional%20Access%20uses%20signals%20from,sources%20to%20make%20access%20decisions)[\[45\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=,activities%20in%20your%20cloud%20environment).
  Common use cases: require MFA for admins, block legacy auth protocols,
  restrict access by network location or device
  state[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps)[\[4\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=We%20recommend%20that%20you%20require,for%20example%2C%20financial%20officers).

- **Prerequisites:** Azure AD P1 (at least) for custom policies;
  Security Defaults (free) can enforce MFA as a starter. Devices must be
  enrolled (Intune) or hybrid joined for device-based
  conditions[\[30\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Enforce%20multifactor%20verification%20for%20users).

- **Creating a Policy (Portal example):**

- In **Entra admin center \> Entra ID \> Security \> Conditional Access
  \> Policies**, click *New policy*.

- Name the policy (e.g. *Require MFA for Azure portal*).

- Under **Assignments \> Users and groups**, select targeted users (e.g.
  *All users*, exclude break-glass accounts and *External*).

- Under **Cloud apps or actions**, choose apps (e.g. *All Azure
  management* or specific app).

- Under **Conditions**, configure as needed (e.g. client apps,
  locations, device platforms).

- Under **Access controls \> Grant**, select *Require multi-factor
  authentication* and/or *Require device to be marked as compliant*.

- Set the policy to *Report-only* mode first, verify impact, then *On*.

- **Example (PowerShell):** Using Microsoft Graph PowerShell, one can
  create a policy. For example:

<!-- -->

- Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess"
      $policy = New-MgIdentityConditionalAccessPolicy -DisplayName "BlockLegacyAuth" `
          -State "enabledForReportingButNotEnforced" `
          -Conditions @{UserRiskLevels = @("high")} `
          -GrantControls @{BuiltInControls = @("block")}

*(Graph PS example; see Microsoft docs for exact syntax.)*

- **Pitfalls:**
- **Lockout:** A badly scoped CA can lock out all admins. Always exclude
  emergency/GlobalAdmin break-glass accounts from restrictive
  policies[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary).
  Test policies in *Report-only* first.
- **Legacy Auth:** By default, older protocols (IMAP, POP, SMTP, older
  Office clients) might bypass CA. Explicitly *Block legacy
  authentication* (built-in control) to mitigate credential
  replay[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps).
- **Missing coverage:** Use the *Coverage* tab to identify apps not
  protected by any CA.
- **Rollback:** If a policy causes issues, disable it in the portal or
  via Graph (`Remove-MgIdentityConditionalAccessPolicy`). Ensure you
  always have at least one global admin excluded so you can sign in.

### Multifactor Authentication (MFA)

- **Prerequisites:** P1 license for Conditional Access MFA; P2 for
  risk-based policies. Security Defaults (free) enforce MFA for all
  users.
- **Options:**
- **Security Defaults:** Easiest – turns on MFA for all (not granular).
- **Per-user MFA:** Basic but coarse.
- **Conditional Access MFA:** Trigger MFA under specific conditions
  (preferred).
- **Deployment:** Encourage registration of strong MFA methods.
  Microsoft recommends FIDO2/passkeys or certificate auth for admins
  (phishing-resistant)[\[6\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=%2A%20Prioritize%20phishing,resistant%20passwordless%20authentication%20deployment).
- **Enable MFA:**
- For pilot, go to *Users \> Multi-Factor Authentication* in portal and
  enable some users to register (this sets method).
- For broad enforcement, use a CA policy as above (*Grant \> Require
  MFA* for targeted users/apps).
- **Pitfalls:** Phased rollout needed to avoid user friction. Mandatory
  MFA will become required for Azure access by Oct
  2025[\[30\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Enforce%20multifactor%20verification%20for%20users).
  Prepare emergency access accounts with non-phone methods (FIDO2) and
  store keys
  offline[\[38\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=Create%20emergency%20access%20accounts).
- **Rollback:** Disable/modify the CA or per-user setting to allow
  access. Break-glass accounts bypass conditional MFA policies by
  design, but ensure they have a secure MFA method.

### Role-Based Access Control (RBAC)

- **Azure RBAC vs Entra Roles:** Understand Azure RBAC (Owner,
  Contributor, Reader, etc. – resource-level permissions) vs Entra ID
  roles (Global Admin, User Admin, etc. – directory
  permissions)[\[10\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Azure%20role%20Permissions%20Notes%20Owner)[\[9\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Microsoft%20Entra%20role%20Permissions%20Notes,Global%20Administrator).
  Azure roles are assigned on subscriptions/resource groups, while Entra
  roles are tenant-scoped.
- **Assignment:**
- In Azure portal (or CLI/PowerShell), assign Azure roles via *Access
  control (IAM)*. E.g.,
  `az role assignment create --role "Reader" --assignee user@contoso.com --scope /subscriptions/{id}`.
- In Entra ID portal, assign directory roles under *Roles and
  administrators*. E.g., make a user *Global Administrator* or *User
  Administrator*.
- **Least Privilege:** Follow principle of least privilege – use
  built-in roles, or create custom roles for specific
  permissions[\[10\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Azure%20role%20Permissions%20Notes%20Owner)[\[9\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Microsoft%20Entra%20role%20Permissions%20Notes,Global%20Administrator).
  Don’t use global admin for everyday tasks.
- **PIM for Roles:** All privileged role assignments should be made
  **eligible** in PIM (see next section). This enforces MFA/approval
  when activating.
- **Pitfalls:** Overlapping permissions if users are both Entra roles
  and Azure roles (switch on “Access management for Azure resources”
  gives Global Admins the User Access Administrator role in the
  subscription)[\[46\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=By%20default%2C%20Azure%20roles%20and,more%20information%2C%20see%20%2025).
  Clean up classic admins (retired).

### Privileged Identity Management (PIM)

- **Prerequisites:** Entra ID Premium P2 (or EMS E5). PIM must be
  enabled at tenant
  level[\[17\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prerequisites).

- **Enable PIM:** In Entra admin center under *Identity Governance \>
  Privileged Identity Management*:

- Go to **Overview**, click *Consent to PIM*. (If first time, the
  service principal is provisioned automatically).

- Under *Azure AD roles* or *Azure resources*, select a role (e.g.
  Global Admin) and *Manage assignments*.

- Add eligible assignments: assign users to roles as *Eligible* (not
  active)[\[47\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Microsoft%20Entra%20enables%20PIM%20for,tenant%20in%20the%20following%20ways)[\[14\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prepare%20PIM%20for%20Microsoft%20Entra,roles).

- Configure assignment settings: require MFA at activation, approval
  workflow, maximum activation duration (e.g. 1h), notifications.

- **Azure Resource Roles in PIM:** Under PIM, *Azure resources*, click
  *Discover resources* and *Manage assignments* for
  subscriptions/resource groups. Assign eligible contributors/owners.

- **Using PIM:** Admins go to *My roles* in PIM to activate an eligible
  role when needed, complete MFA and justification. All activations are
  logged.

- **Pitfalls:** Forgetting to make at least one Global Admin permanently
  active or excluded from PIM (for emergency access). Ensure break-glass
  accounts have their role assignments *Permanent* (not eligible) so PIM
  cannot remove
  them[\[48\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=,for%20your%20emergency%20access%20accounts).

- **Rollback:** To disable PIM, go to *Azure AD roles* \> *Manage
  settings* and turn off eligible mode (this makes all eligible
  assignments active). Or simply remove the P2 license if done (loses
  audit features).

### Entitlement Management & Identity Governance

- **Overview:** Identity Governance includes *Access packages*, *Access
  Reviews*, *Terms of Use*, etc. Use it for lifecycle
  (request→approve→expire) of both internal and external access.

- **Entitlement Management (Access Packages):**

- In Entra admin center: *Identity Governance \> Entitlement
  management*.

- Create a **Catalog** and then an **Access package** bundling resources
  (e.g. groups, apps) with policies.

- Specify who can request (internal, guests, or specific connected
  organizations), approval flows, expiration.

- Internal or guest users request access via a portal; on approval they
  receive group memberships/app access.

- Example: create an access package granting membership to a Marketing
  Teams group for guest contractors, expiring in 30
  days[\[15\]](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first#:~:text=Managing%20access%20to%20all%20the,when%20it%27s%20no%20longer%20needed).

- **Access Reviews:** Periodically review memberships and roles:

- Under *Identity Governance \> Access reviews*, create a review (e.g.
  all members of “Sales” group or all people with a certain role).

- Choose reviewers (group owners, assigned managers, or users
  themselves) and frequency.

- Entra notifies reviewers; they approve/deny continued access.

- This ensures, for example, stale external accounts are removed.

- **Pitfalls:** Entitlement features require P2 or ID Governance
  licenses. Admin roles needed: *Identity Governance Admin* or *Global
  Admin*. If no licenses, settings may be greyed
  out[\[49\]](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first#:~:text=3,page%2C%20open%20an%20access%20package).

- **Rollback:** If an access package is misconfigured, remove the
  package or disable it. Access Reviews results can be reversed manually
  by re-inviting removed users.

### Device Management (Intune Integration)

- **Enroll Devices:** To have device-based controls, enroll devices in
  Intune (via AutoPilot or manual enrollment). Configure Azure AD join
  for Windows 10/11 (enrolls device in Entra ID) and automatic MDM
  enrollment via Azure AD Connect or Intune policy.
- **Conditional Access & Compliance:** Set Compliance policies in Intune
  (e.g. require bitlocker, OS version) and tie them to CA policies. For
  example, require *Grant \> Require device to be marked as compliant*
  for certain apps or roles.
- **Hybrid Azure AD Join:** For domain-joined machines, enable *Hybrid
  Azure AD Join* so they appear in Azure AD/Intune as managed devices.
- **Pitfalls:** Ensure Intune licenses are in place. Devices must stay
  in sync (VPN connectivity or on corp network for SSO).
- **Rollback:** If device enrollment causes login issues, remove the
  device record from Azure AD or unassign compliance policies.

### Monitoring and Logging

- **Azure AD Logs:** Entra ID provides **Audit Logs** (changes to users,
  groups, apps, roles) and **Sign-in Logs** (who signed in, from where,
  success/failure, MFA,
  device)[\[50\]](https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-active-directory#:~:text=Log%20type%20Description%20Log%20schema,app%20or%20service%20provides%20a).
- View these in the Entra admin center (Diagnostic settings) or query
  via Azure Monitor logs.
- **Azure Sentinel:** Use the built-in **Microsoft Entra ID** connector
  to stream logs to a Sentinel
  workspace[\[50\]](https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-active-directory#:~:text=Log%20type%20Description%20Log%20schema,app%20or%20service%20provides%20a).
  This includes:
- AuditLogs (Group membership changes, role assignments)
- SignInLogs (interactive sign-ins)
- NonInteractive user sign-ins (OAuth flows)
- Service principal, managed identity sign-ins
- Risk events (if P2) and
  more[\[50\]](https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-active-directory#:~:text=Log%20type%20Description%20Log%20schema,app%20or%20service%20provides%20a).
- Enable the connector and apply a Sentinel analytics rule to detect
  anomalies (e.g. sign-in from atypical location, multiple failures).
- **Azure AD Connect Health:** Monitors sync and AD FS (if used). Alerts
  on sync failures or performance issues.
- **Pitfalls:** Large tenants produce lots of log volume (monitor cost).
  Configure log retention and alerts for critical events (e.g. new
  Global Admin created).
- **Rollback:** If misconfigured, disable logging or filters to stop
  volume. Logs themselves are append-only but queries can be adjusted.

## Migration Plan and Checklist

Implementing or migrating to Entra ID involves planning and phases.
Below is a sample **Gantt-style checklist** (dates are illustrative):

    gantt
        title IAM Migration Plan (Example Timeline)
        dateFormat  YYYY-MM-DD
        section Assessment & Planning
        Inventory existing AD environment and apps    :done, des1, 2026-06-01, 2026-06-05
        Design hybrid/cloud architecture              :done, des2, 2026-06-06, 2026-06-10
        Procure licenses and resources                :done, des3, 2026-06-06, 2026-06-10
        section Implementation
        Setup Entra tenant and domains               :active, des4, 2026-06-11, 2026-06-14
        Configure Azure AD Connect and SSO          :des5, after des4, 2026-06-15, 2026-06-21
        Pilot user/group sync                       :des6, after des5, 2026-06-22, 2026-06-26
        Implement Conditional Access & MFA          :des7, after des5, 2026-06-22, 2026-06-28
        Configure PIM and Identity Governance       :des8, after des7, 2026-06-27, 2026-07-02
        Onboard applications (SSO integration)      :des9, after des5, 2026-06-23, 2026-06-30
        Enroll devices and enforce compliance       :des10, after des8, 2026-07-01, 2026-07-07
        Monitoring and Alerts setup                 :des11, after des8, 2026-07-01, 2026-07-03
        section Rollout
        Staged user migration                       :des12, after des6, 2026-07-08, 2026-07-15
        Final switch and decommission old AD        :des13, after des12, 2026-07-16, 2026-07-20
        Post-deployment review and optimization     :des14, after des13, 2026-07-21, 2026-07-23

- **Key Phases:** Start with discovery (inventory all users, groups,
  apps, dependencies). Pilot on a small user subset to validate sync and
  SSO. Roll out security configurations (CA, MFA, PIM) early (in
  parallel) to harden the environment before migrating all users.
  Migrate users and resources in waves, monitoring sign-ins and helpdesk
  feedback. Finally, decommission on-prem AD (if moving cloud-only) or
  leave a minimal DC for legacy apps.
- **Rollback/Contingency:** Keep break-glass accounts offline (with
  passwords or keys stored
  securely)[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary).
  Maintain old AD until Azure AD is fully operational. Use *soft
  rollbacks*: if CA locks out users, disable it; if sync causes
  problems, pause the service. Document every change.

## Risk and Mitigation Matrix

| Risk | Likelihood | Impact | Mitigation |
|----|----|----|----|
| **Account lockout by misconfigured CA/MFA** | Medium | High | Exclude emergency global-admin accounts from all Conditional Access; create 2+ cloud-only emergency accounts with FIDO2 keys and no CA enforcement[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary). Test policies in *report-only* first. |
| **AD Connect sync failure or loop** | Low-Med | Medium | Ensure AD Connect server is redundant (staging mode), monitor health, and have a second server ready. Back up AD schema before changes. Use IdFix to avoid attribute conflicts[\[34\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,which%20features%20you%20should%20enable). |
| **User authentication failure** | Medium | High | Pilot test PHS/PTA setup. Provide clear instructions for users. Keep on-prem AD/ADFS stable during cutover. Maintain on-prem AD as fallback until confirmed sync success[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks). |
| **Over-permissioned accounts** | Medium | High | Audit existing permissions. Apply least privilege (PIM for elevating roles, CA for admin tasks). Use Access Reviews to catch unnecessary group/app access[\[24\]](https://learn.microsoft.com/en-us/entra/id-governance/access-reviews-overview#:~:text=Access%20reviews%20in%20Microsoft%20Entra,right%20people%20have%20continued%20access). |
| **Legacy protocol exploitation** | High | Medium | Block legacy auth via Conditional Access[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps). Disable unused legacy authentication on mail services (e.g. IMAP). Monitor logs for old protocol usage. |
| **License shortfalls** | Low | Medium | Inventory current licenses. Ensure appropriate Entra ID/M365/EMS E5 licenses for P1/P2 features. Plan subscription procurement before enabling premium features. |
| **Data loss during migration** | Low | High | Backup critical AD data. Test Azure AD Connect staging with non-production data. Keep both systems in sync during phased migration. |
| **User adoption/training gaps** | Medium | Medium | Conduct user training for MFA, new sign-in flows, self-service password reset (SSPR). Provide helpdesk runbooks for common issues. |

**Summary:** By following Microsoft’s guidance and best
practices—centralizing identity in Entra ID, enabling strong
authentication and monitoring, and phasing the migration—an organization
can modernize IAM with minimal
disruption[\[51\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,for%20corporate%20and%20organizational%20accounts)[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps).
This document covers all key aspects, from high-level planning to
detailed steps, backed by official sources to support each
recommendation.

**Sources:** Microsoft official documentation and
whitepapers[\[7\]](https://learn.microsoft.com/en-us/entra/fundamentals/compare#:~:text=SaaS%20apps%20Active%20Directory%20doesn%27t,Microsoft%20Entra%20ID%20for%20authentication)[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons)[\[2\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,could%20create%20a%20major%20incident)[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps)[\[10\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Azure%20role%20Permissions%20Notes%20Owner)[\[32\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=Set%20the%20primary%20domain%20name,for%20your%20Microsoft%20Entra%20organization)[\[3\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=Microsoft%20Entra%20ID)[\[13\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Use%20Privileged%20Identity%20Management%20,Microsoft%20365%20or%20Microsoft%20Intune)[\[15\]](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first#:~:text=Managing%20access%20to%20all%20the,when%20it%27s%20no%20longer%20needed)[\[24\]](https://learn.microsoft.com/en-us/entra/id-governance/access-reviews-overview#:~:text=Access%20reviews%20in%20Microsoft%20Entra,right%20people%20have%20continued%20access)[\[50\]](https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-active-directory#:~:text=Log%20type%20Description%20Log%20schema,app%20or%20service%20provides%20a)[\[39\]](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#:~:text=To%20enable%20SSO%20for%20an,application),
etc. (see inline citations).

[\[1\]](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity#:~:text=You%20can%20extend%20on,one%20of%20the%20following%20reasons)
Hybrid identity with Active Directory and Microsoft Entra ID in Azure
landing zones - Cloud Adoption Framework \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access-active-directory-hybrid-identity>

[\[2\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,could%20create%20a%20major%20incident)
[\[4\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=We%20recommend%20that%20you%20require,for%20example%2C%20financial%20officers)
[\[6\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=%2A%20Prioritize%20phishing,resistant%20passwordless%20authentication%20deployment)
[\[12\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,and%20Microsoft%20Entra%20ID%E2%80%93connected%20apps)
[\[18\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Microsoft%20Entra%20ID%20is%20the,protection%20into%20a%20single%20solution)
[\[19\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,being%20replayed%20from%20previous%20attacks)
[\[30\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=Enforce%20multifactor%20verification%20for%20users)
[\[51\]](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices#:~:text=,for%20corporate%20and%20organizational%20accounts)
Azure identity & access security best practices \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices>

[\[3\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=Microsoft%20Entra%20ID)
[\[31\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,com%20default%20domain)
[\[34\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,which%20features%20you%20should%20enable)
[\[35\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=)
[\[36\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,is%20installed%20but%20in%20a)
[\[37\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,or%20Enterprise%20Mobility%20%2B%20Security)
[\[42\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=,global%20administrator%20role%20or%20an)
[\[43\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites#:~:text=Important)
Microsoft Entra Connect: Prerequisites and hardware - Microsoft Entra ID
\| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-install-prerequisites>

[\[5\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=User%20accounts%20with%20the%20Global,times%20when%20it%27s%20absolutely%20necessary)
[\[38\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=Create%20emergency%20access%20accounts)
[\[48\]](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access#:~:text=,for%20your%20emergency%20access%20accounts)
Manage emergency access admin accounts - Microsoft Entra ID \| Microsoft
Learn

<https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access>

[\[7\]](https://learn.microsoft.com/en-us/entra/fundamentals/compare#:~:text=SaaS%20apps%20Active%20Directory%20doesn%27t,Microsoft%20Entra%20ID%20for%20authentication)
[\[16\]](https://learn.microsoft.com/en-us/entra/fundamentals/compare#:~:text=or%20other%20third,allowing%20access%20to%20the%20apps)
Compare Active Directory to Microsoft Entra ID - Microsoft Entra \|
Microsoft Learn

<https://learn.microsoft.com/en-us/entra/fundamentals/compare>

[\[8\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=%2A%20Workforce.%20Your%20full,your%20organization%20such%20as%20business)
[\[23\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=This%20article%20addresses%20the%20following,considerations%20for%20each%20architecture)
[\[25\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=%2A%20Workforce%20and%20collaboration,oriented%20architecture%20%2A%20Architecture%20combinations)
[\[26\]](https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures#:~:text=Typical%20scenarios%20include%20employees%20initiating,SAML%29%20federated%20identity%20provider)
Microsoft Entra External ID deployment architectures with Microsoft
Entra - Microsoft Entra \| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/architecture/external-identity-deployment-architectures>

[\[9\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Microsoft%20Entra%20role%20Permissions%20Notes,Global%20Administrator)
[\[10\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=Azure%20role%20Permissions%20Notes%20Owner)
[\[46\]](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles#:~:text=By%20default%2C%20Azure%20roles%20and,more%20information%2C%20see%20%2025)
Azure roles, Microsoft Entra roles, and classic subscription
administrator roles \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles>

[\[11\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=Modern%20security%20extends%20beyond%20an,account%20when%20enforcing%20policy%20decisions)
[\[44\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=Conditional%20Access%20uses%20signals%20from,sources%20to%20make%20access%20decisions)
[\[45\]](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview#:~:text=,activities%20in%20your%20cloud%20environment)
Microsoft Entra Conditional Access: Zero Trust Policy Engine - Microsoft
Entra ID \| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview>

[\[13\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Use%20Privileged%20Identity%20Management%20,Microsoft%20365%20or%20Microsoft%20Intune)
[\[14\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prepare%20PIM%20for%20Microsoft%20Entra,roles)
[\[17\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Prerequisites)
[\[47\]](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started#:~:text=Microsoft%20Entra%20enables%20PIM%20for,tenant%20in%20the%20following%20ways)
Start using PIM - Microsoft Entra ID Governance \| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-getting-started>

[\[15\]](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first#:~:text=Managing%20access%20to%20all%20the,when%20it%27s%20no%20longer%20needed)
[\[49\]](https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first#:~:text=3,page%2C%20open%20an%20access%20package)
Tutorial - Manage access to resources in entitlement management -
Microsoft Entra ID Governance \| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/id-governance/entitlement-management-access-package-first>

[\[20\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Seamless%20SSO%20can%20be%20combined,ADFS)
[\[21\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Microsoft%20Entra%20seamless%20single%20sign,premises%20components)
[\[22\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=automatically%20signs%20users%20in%20when,premises%20components)
[\[41\]](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso#:~:text=Seamless%20SSO%20can%20be%20combined,ADFS)
Microsoft Entra Connect: Seamless single sign-on - Microsoft Entra ID \|
Microsoft Learn

<https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/how-to-connect-sso>

[\[24\]](https://learn.microsoft.com/en-us/entra/id-governance/access-reviews-overview#:~:text=Access%20reviews%20in%20Microsoft%20Entra,right%20people%20have%20continued%20access)
What are access reviews? - Microsoft Entra - Microsoft Entra ID
Governance \| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/id-governance/access-reviews-overview>

[\[27\]](https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices#:~:text=The%20following%20best%20practices%20and,existing%20or%20new%20application%20environments)
[\[28\]](https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices#:~:text=Azure%20AD%20B2C%20Premium%20P2,need%20to%20contact%20%2018)
[\[29\]](https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices#:~:text=Effective%20May%201%2C%202025%2C%20Azure,Learn%20more%20in%20our%20FAQ)
Best practices for Azure AD B2C - Azure AD B2C \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/active-directory-b2c/best-practices>

[\[32\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=Set%20the%20primary%20domain%20name,for%20your%20Microsoft%20Entra%20organization)
[\[33\]](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage#:~:text=ForceDelete%20option)
Add and verify custom domain names - Microsoft Entra ID \| Microsoft
Learn

<https://learn.microsoft.com/en-us/entra/identity/users/domains-manage>

[\[39\]](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#:~:text=To%20enable%20SSO%20for%20an,application)
[\[40\]](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#:~:text=To%20configure%20SSO%20in%20Microsoft,Entra%20ID)
Enable SAML single sign-on for an enterprise application - Microsoft
Entra ID \| Microsoft Learn

<https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso>

[\[50\]](https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-active-directory#:~:text=Log%20type%20Description%20Log%20schema,app%20or%20service%20provides%20a)
Send Microsoft Entra ID data to Microsoft Sentinel \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-active-directory>
