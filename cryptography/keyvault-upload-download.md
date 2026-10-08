4️⃣ How to Upload On-Prem Certificate to Azure Key Vault, download certificates from key vault
🔷 Step 1: Convert Certificate
Ensure format:
.PFX (with private key)
Or PEM
🔷 Step 2: Upload via Portal
Azure Portal → Key Vault
Certificates → Generate/Import
Import
Upload .PFX
Enter password
🔷 Step 3: Using CLI
az keyvault certificate import \    --vault-name MyKeyVault \    --name MyCert \    --file certificate.pfx \    --password "P@ssword"  
🔷 Architecture Flow
