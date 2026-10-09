integrate AWS with defender


1️⃣ How to Connect Google & AWS Accounts with Microsoft Defender for Cloud, Sentinel & Microsoft 365 Defender
🔷 A. Connect AWS to Microsoft Defender for Cloud
Steps:
Go to Microsoft Defender for Cloud
Navigate to Environment settings
Click Add environment → Amazon Web Services
Create a CloudFormation stack in AWS
Use Defender for Cloud cross-account IAM role
Enable:
Defender CSPM
Defender for Servers
Defender for Containers
Defender for Databases
📌 Uses AWS IAM role with external ID for secure access.
🔷 B. Connect GCP to Microsoft Defender for Cloud
Steps:
Defender for Cloud → Environment settings
Add Google Cloud
Deploy provided GCP deployment script
Configure:
Workload identity federation
Service account permissions
Log export to Azure
🔷 C. Connect AWS/GCP to Microsoft Sentinel
AWS:
Use AWS CloudTrail connector
Use Amazon S3 + Azure Function
Use Amazon Security Lake
Native AWS data connector in Sentinel
GCP:
Export logs to Pub/Sub
Route to Azure Event Hub
Use Sentinel GCP connector
🔷 D. Microsoft 365 Defender Integration
Microsoft 365 Defender integrates via:
Azure AD
Defender for Endpoint
Defender for Identity
Defender for Cloud Apps
Connected automatically once tenant is unified.
