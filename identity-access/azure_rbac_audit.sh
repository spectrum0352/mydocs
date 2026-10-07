#!/bin/bash

# خروج on error
set -e

# Output file
OUTPUT_FILE="azure_rbac_report.html"

echo "[*] Fetching Azure Subscription Info..."
SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "[*] Collecting RBAC role assignments..."
az role assignment list --all > rbac.json

echo "[*] Processing data..."

# High risk roles
HIGH_RISK_ROLES=("Owner" "Contributor" "User Access Administrator")

# Start HTML
cat <<EOF > $OUTPUT_FILE
<html>
<head>
<title>Azure RBAC Security Report</title>
<style>
body { font-family: Arial; background:#0f172a; color:#e2e8f0; }
h1, h2 { color:#38bdf8; }
table { border-collapse: collapse; width:100%; margin-bottom:20px; }
th, td { border:1px solid #334155; padding:8px; text-align:left; }
th { background:#1e293b; }
tr:nth-child(even) { background:#020617; }
.high { color:#ef4444; font-weight:bold; }
.medium { color:#f59e0b; }
.low { color:#22c55e; }
</style>
</head>
<body>

<h1>Azure RBAC Security Report</h1>
<p><b>Subscription:</b> $SUBSCRIPTION_NAME ($SUBSCRIPTION_ID)</p>
<p><b>Generated:</b> $(date)</p>

<h2>🔴 High Risk Role Assignments</h2>
<table>
<tr><th>Principal</th><th>Type</th><th>Role</th><th>Scope</th></tr>
EOF

# Extract high-risk roles
jq -c '.[]' rbac.json | while read role; do
    ROLE_NAME=$(echo $role | jq -r '.roleDefinitionName')
    PRINCIPAL=$(echo $role | jq -r '.principalName')
    TYPE=$(echo $role | jq -r '.principalType')
    SCOPE=$(echo $role | jq -r '.scope')

    for HR in "${HIGH_RISK_ROLES[@]}"; do
        if [[ "$ROLE_NAME" == "$HR" ]]; then
            echo "<tr><td>$PRINCIPAL</td><td>$TYPE</td><td class='high'>$ROLE_NAME</td><td>$SCOPE</td></tr>" >> $OUTPUT_FILE
        fi
    done
done

cat <<EOF >> $OUTPUT_FILE
</table>

<h2>📊 All Role Assignments</h2>
<table>
<tr><th>Principal</th><th>Type</th><th>Role</th><th>Scope</th></tr>
EOF

# All roles
jq -c '.[]' rbac.json | while read role; do
    ROLE_NAME=$(echo $role | jq -r '.roleDefinitionName')
    PRINCIPAL=$(echo $role | jq -r '.principalName')
    TYPE=$(echo $role | jq -r '.principalType')
    SCOPE=$(echo $role | jq -r '.scope')

    echo "<tr><td>$PRINCIPAL</td><td>$TYPE</td><td>$ROLE_NAME</td><td>$SCOPE</td></tr>" >> $OUTPUT_FILE
done

cat <<EOF >> $OUTPUT_FILE
</table>

<h2>🧠 Summary</h2>
<p>This report highlights Azure RBAC assignments with focus on high-risk roles.</p>
<ul>
<li>Owner = Full control</li>
<li>Contributor = Modify resources</li>
<li>User Access Administrator = Can assign roles</li>
</ul>

</body>
</html>
EOF

echo "[+] Report generated: $OUTPUT_FILE"