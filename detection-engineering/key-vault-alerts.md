
### IR to Key vault alerts

> Defender for Key Vault protects applications and credentials, so even
> if you are familiar with the application or user that triggered the
> alert, it is important to verify the situation surrounding every alert
>
>
>
> Defender for Key Vault security alert includes the following elements:

- Object ID

- User Principal Name

- IP Address of the suspicious resource

>
>
> **Verify the traffic source:** internal or external to tenant
>
> ** **
>
> **Immediate mitigation**
>
> If source of traffic identified then contact user or application
> owner.
>
>
>
> <span class="mark">If source of traffic is not identified then:</span>
>
>
>
> If the traffic came from an unrecognized IP Address:

- Enable the Azure Key Vault firewall as described in Configure Azure
  Key Vault firewalls and virtual networks.

- Configure the firewall with trusted resources and virtual networks.

>
>
> If the source of the alert was an unauthorized application or
> suspicious user:

- Open the key vault's access policy settings.
- Remove the corresponding security principal, or restrict the operations the security principal can perform.

If the source of the alert has an Azure Active Directory role in your tenant:

- Contact your administrator.
- Determine whether there is a need to reduce or revoke Azure Active Directory permissions.

**Identify Impact**

- When the impact has been mitigated, investigate the secrets in your key vault that were affected:
  - Open the “Security” page on your Azure Key Vault and view the triggered alert.
  - Select the specific alert that was triggered. Review the list of secrets that were accessed and timestamp.
  - Optionally, if you have key vault diagnostic logs enabled, review the previous operations for the corresponding caller IP, user principal, or object ID.
- Respond to alerts from Azure resources

**Take action**

- When you have compiled your list of the secrets, keys, and certificates that the suspicious user or application accessed, you should immediately rotate those objects.
- Affected secrets should be disabled or deleted from your key vault.
- If the credentials were used for a specific application:
  - Contact the administrator of the application and ask them to audit their environment for any uses of the compromised credentials since they were compromised.
  - If the compromised credentials were used, the application owner should identify the information that was accessed and mitigate the impact.
