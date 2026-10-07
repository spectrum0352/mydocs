Yes. Below are **two separate Azure Policies** (custom policy definitions) that you can use as a starting point.

> **Note:** Azure Policy evaluates ARM resource properties. The exact property aliases can vary by API version. Before deploying to production, verify the aliases with:
>
> ```powershell
> Get-AzPolicyAlias -NamespaceMatch Microsoft.Network
> ```
>
> or
>
> ```powershell
> Get-AzPolicyAlias | Where-Object {$_.Namespace -eq "Microsoft.Network"}
> ```

---

# Policy 1 - Deny "Allow Any → Any" Azure NSG Rules

**File:** `deny-nsg-any-any-allow.json`

```json
{
  "properties": {
    "displayName": "Deny NSG Allow Any-to-Any Rules",
    "policyType": "Custom",
    "mode": "All",
    "description": "Prevents creation of Azure Network Security Group rules that allow unrestricted Any-to-Any network access.",
    "metadata": {
      "category": "Network",
      "version": "1.0.0"
    },
    "parameters": {},
    "policyRule": {
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Network/networkSecurityGroups/securityRules"
          },
          {
            "field": "Microsoft.Network/networkSecurityGroups/securityRules/access",
            "equals": "Allow"
          },
          {
            "field": "Microsoft.Network/networkSecurityGroups/securityRules/sourceAddressPrefix",
            "in": [
              "*",
              "0.0.0.0/0",
              "Internet"
            ]
          },
          {
            "field": "Microsoft.Network/networkSecurityGroups/securityRules/destinationAddressPrefix",
            "equals": "*"
          },
          {
            "field": "Microsoft.Network/networkSecurityGroups/securityRules/destinationPortRange",
            "equals": "*"
          },
          {
            "field": "Microsoft.Network/networkSecurityGroups/securityRules/protocol",
            "equals": "*"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
```

---

## What it blocks

❌ Denied

```text
Access: Allow
Source: *
Destination: *
Protocol: *
Port: *
```

❌ Denied

```text
Access: Allow
Source: Internet
Destination: *
Protocol: *
Port: *
```

❌ Denied

```text
Access: Allow
Source: 0.0.0.0/0
Destination: *
Protocol: *
Port: *
```

---

## Allowed

```text
Allow
10.1.0.0/24
10.2.0.4
TCP
443
```

---

# Policy 2 - Deny Azure Firewall Policy "Allow Any → Any"

**File:** `deny-firewallpolicy-any-any-allow.json`

```json
{
  "properties": {
    "displayName": "Deny Azure Firewall Policy Allow Any-to-Any Rules",
    "policyType": "Custom",
    "mode": "All",
    "description": "Prevents Azure Firewall Policy rules from allowing unrestricted Any-to-Any traffic.",
    "metadata": {
      "category": "Network",
      "version": "1.0.0"
    },
    "parameters": {},
    "policyRule": {
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Network/firewallPolicies/ruleCollectionGroups"
          },
          {
            "count": {
              "field": "Microsoft.Network/firewallPolicies/ruleCollectionGroups/ruleCollections[*].rules[*]",
              "where": {
                "allOf": [
                  {
                    "field": "Microsoft.Network/firewallPolicies/ruleCollectionGroups/ruleCollections[*].action.type",
                    "equals": "Allow"
                  },
                  {
                    "field": "Microsoft.Network/firewallPolicies/ruleCollectionGroups/ruleCollections[*].rules[*].sourceAddresses[*]",
                    "equals": "*"
                  },
                  {
                    "field": "Microsoft.Network/firewallPolicies/ruleCollectionGroups/ruleCollections[*].rules[*].destinationAddresses[*]",
                    "equals": "*"
                  },
                  {
                    "field": "Microsoft.Network/firewallPolicies/ruleCollectionGroups/ruleCollections[*].rules[*].destinationPorts[*]",
                    "equals": "*"
                  },
                  {
                    "field": "Microsoft.Network/firewallPolicies/ruleCollectionGroups/ruleCollections[*].rules[*].ipProtocols[*]",
                    "equals": "Any"
                  }
                ]
              }
            },
            "greater": 0
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
```

---

## What it blocks

❌ Denied

```text
Action: Allow

Source Addresses:
*

Destination Addresses:
*

Destination Ports:
*

Protocols:
Any
```

---

## Allowed

```text
Action: Allow

Source:
10.1.0.0/24

Destination:
10.2.1.10

Protocol:
TCP

Port:
443
```

---

# Recommended Enterprise Enhancements

For a Fortune 500–grade environment, I recommend creating an **Azure Policy Initiative** that includes multiple network governance policies rather than relying only on an "Any-to-Any" rule check. Separate policies make compliance reporting and exception management much easier. Typical policies include:

| Policy                                                          | NSG | Azure Firewall Policy |
| --------------------------------------------------------------- | :-: | :-------------------: |
| Deny Allow Any → Any                                            |  ✅  |           ✅           |
| Deny Internet → Management Ports (22, 3389, 5985, 5986)         |  ✅  |           ✅           |
| Deny Any Destination Port (`*`)                                 |  ✅  |           ✅           |
| Deny Protocol `Any`                                             |  ✅  |           ✅           |
| Require Specific Source Address                                 |  ✅  |           ✅           |
| Require Specific Destination Address                            |  ✅  |           ✅           |
| Deny `0.0.0.0/0` Source                                         |  ✅  |           ✅           |
| Require Service Tags or IP Groups where applicable              |  ✅  |           ✅           |
| Audit overly permissive outbound rules                          |  ✅  |           ✅           |
| Enforce Azure Firewall Policy instead of Classic Firewall Rules | N/A |           ✅           |

This modular approach allows each control to be enabled, disabled, or exempted independently while providing clearer compliance reporting.
