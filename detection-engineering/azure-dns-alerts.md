
### IR to DNS alerts

Defender for DNS protects all connected resources, so even if you are
familiar with the application or user that triggered the alert, it's
important to verify the situation surrounding every alert.

>

Contact

- Contact the resource owner to determine whether the behavior was
  expected or intentional.

- If the activity is expected, dismiss the alert.

- If the activity is unexpected, treat the resource as potentially
  compromised and mitigate as described in the next step.

Immediate mitigation

Isolate the resource from the network to prevent lateral movement.

- Run a full antimalware scan on the resource, following any resulting
  remediation advice.

- Review installed and running software on the resource, removing any
  unknown or unwanted packages.

- Revert the machine to a known good state, reinstalling the operating
  system if necessary, and restore software from a verified malware-free
  source.

- Resolve any Defender for Cloud recommendations for the machine,
  remediating highlighted security issues to prevent future breaches.



**How to respond to MDC alerts for DNS?**

- Investigation

  - Contact the resource owner to determine whether the behavior was
    expected or intentional.

  - If the activity is expected, dismiss the alert.

  - If the activity is unexpected, treat resource as compromised and
    mitigate as described in the next step.

- Immediate mitigation

  - Isolate the resource from the network to prevent lateral movement.

  - Run a full antimalware scan on resource, following any resulting
    remediation advice.

  - Review installed and running software on resource, removing any
    unknown or unwanted packages.

  - Revert machine to healthy state, if necessary, reimage VM, restore
    software from trusted source.

  - Resolve MDC recommendations for machine, remediating security issues
    to prevent future breaches.

  - Respond to alerts from Azure resources
