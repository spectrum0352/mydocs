####################################################
# Cyber Security Document Categorizer
####################################################

$Root = "D:\CyberDocs"

# File extensions to process
$Extensions = @(
"*.pdf","*.docx","*.pptx","*.xlsx",
"*.txt","*.md","*.csv","*.vsdx"
)

# Categories and Keywords
$Categories = @{

"Security Operations" = @(
"soc","security operations","monitoring",
"alert","incident","security event","triage"
)

"Microsoft Sentinel" = @(
"sentinel","analytics rule","playbook",
"workbook","kql","log analytics"
)

"SIEM" = @(
"siem","splunk","qradar","elastic","log management"
)

"SOAR" = @(
"soar","automation","playbook"
)

"Threat Intelligence" = @(
"ioc","threat intel","mitre","attack",
"ttp","malware","apt"
)

"Incident Response" = @(
"incident response","forensics","containment",
"eradication","post incident"
)

"Risk Management" = @(
"risk","risk register","risk assessment",
"iso31000"
)

"Governance" = @(
"governance","policy","strategy",
"operating model"
)

"Compliance" = @(
"iso27001","pci","hipaa","gdpr",
"nist","cis","soc2","compliance"
)

"Audit" = @(
"audit","internal audit","external audit"
)

"Identity and Access Management" = @(
"iam","identity","access","authentication",
"authorization","rbac","pim","pam","sso","mfa"
)

"Microsoft Entra ID" = @(
"entra","azure ad","conditional access",
"identity protection"
)

"Azure" = @(
"azure","aks","virtual network","storage account",
"key vault","azure firewall"
)

"AWS" = @(
"aws","ec2","s3","iam","lambda",
"cloudtrail","guardduty"
)

"GCP" = @(
"gcp","google cloud","cloud armor"
)

"Cloud Security" = @(
"cloud security","cspm","cnapp",
"multicloud","shared responsibility"
)

"Endpoint Security" = @(
"endpoint","edr","xdr","antivirus",
"device control"
)

"Microsoft Defender" = @(
"defender","mdatp","mde","defender xdr",
"defender for endpoint"
)

"Intune" = @(
"intune","endpoint manager","device compliance"
)

"Microsoft 365 Security" = @(
"m365","office365","exchange online",
"sharepoint","teams security"
)

"Purview" = @(
"purview","information protection",
"data classification","insider risk"
)

"Email Security" = @(
"email security","phishing",
"spam","safe links","safe attachments"
)

"Network Security" = @(
"network","switch","router","ids","ips",
"vpn","segmentation"
)

"Firewall" = @(
"firewall","palo alto","fortigate",
"checkpoint","asa"
)

"Zero Trust" = @(
"zero trust"
)

"Data Protection" = @(
"data protection","backup","recovery"
)

"DLP" = @(
"dlp","data loss prevention"
)

"Encryption" = @(
"encryption","tls","ssl","bitlocker","kms"
)

"PKI Certificates" = @(
"certificate","pki","ca","csr"
)

"DevSecOps" = @(
"devsecops","pipeline","github",
"azure devops","jenkins"
)

"Kubernetes" = @(
"kubernetes","aks","helm","k8s"
)

"Containers" = @(
"docker","container"
)

"Windows Security" = @(
"windows","windows server","gpo",
"credential guard","lsass"
)

"Linux Security" = @(
"linux","ubuntu","redhat","selinux"
)

"Policies" = @(
"policy"
)

"Procedures" = @(
"procedure"
)

"Standards" = @(
"standard"
)

"SOP" = @(
"sop","runbook"
)

"Projects" = @(
"project","implementation","migration"
)

"Training" = @(
"training","course","lab","exercise"
)

}

# Create folders
foreach($Category in $Categories.Keys)
{
    New-Item -ItemType Directory -Path "$Root\$Category" -Force | Out-Null
}

New-Item -ItemType Directory "$Root\Uncategorized" -Force | Out-Null

Get-ChildItem $Root -Recurse -Include $Extensions |
Where-Object { !$_.PSIsContainer } |
ForEach-Object{

    $Name = $_.BaseName.ToLower()

    $Found = $false

    foreach($Category in $Categories.Keys)
    {
        foreach($Keyword in $Categories[$Category])
        {
            if($Name -match [regex]::Escape($Keyword.ToLower()))
            {
                Move-Item $_.FullName "$Root\$Category\" -Force
                Write-Host "$($_.Name) -> $Category"
                $Found = $true
                break
            }
        }

        if($Found){break}
    }

    if(!$Found)
    {
        Move-Item $_.FullName "$Root\Uncategorized\" -Force
    }

}