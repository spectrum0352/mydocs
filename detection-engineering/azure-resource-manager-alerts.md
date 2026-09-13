### IR for resource manager alerts

Defender for Resource Manager protects all connected resources, so
> even if you are familiar with the application or user that triggered
> the alert, it's important to verify the situation surrounding every
> alert.
>
>
>
> **Contact**

- Contact the resource owner to determine whether the behavior was
  expected or intentional.

- If the activity is expected, dismiss the alert.

- If the activity is unexpected, treat the related user accounts,
  subscriptions, and virtual machines as compromised and mitigate as
  described in the following step.

>
>
> **Immediate mitigation**

- Remediate compromised user accounts:

  - If they are unfamiliar, delete them as they may have been created by
    a threat actor

  - If they are familiar, change their authentication credentials

  - Use Azure Activity Logs to review all activities performed by the
    user and identify any that are suspicious

- Remediate compromised subscriptions:

  - Remove any unfamiliar Runbooks from the compromised automation
    account

  - Review IAM permissions for the subscription and remove permissions
    for any unfamiliar user account

  - Review all Azure resources in the subscription and delete any that
    are unfamiliar

  - Review and investigate any security alerts for the subscription in
    Defender for Cloud

  - Use Azure Activity Logs to review all activities performed in the
    subscription and identify any that are suspicious

- Remediate the compromised virtual machines

  - Change the passwords for all users

  - Run a full antimalware scan on the machine

  - Reimage the machines from a malware-free source



Defender for Resource Manager alerts require investigation even if the
triggering user or application is known. The response process involves:

1.  **Contact:** Check with the resource owner to determine if the
    activity was expected. If so, dismiss the alert. If not, proceed
    with mitigation assuming compromise.

2.  **Immediate Mitigation:** Address potential compromises in user
    accounts, subscriptions, and virtual machines:

    - **User Accounts:** Delete unfamiliar accounts. For familiar
      accounts, change credentials and review Azure Activity Logs for
      suspicious activities.

    - **Subscriptions:** Remove unfamiliar Runbooks, review and correct
      IAM permissions (removing unfamiliar users), delete unfamiliar
      Azure resources, investigate related Defender for Cloud alerts,
      and review subscription activity logs.

    - **Virtual Machines:** Change all user passwords, run a full
      antimalware scan, and reimage from a clean source.
