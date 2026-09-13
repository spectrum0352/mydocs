# ===============================
# Cyber Security File Organizer
# High-Level Categorization
# ===============================

$RootFolder = "D:\Learning"

# Change to $false to actually move files
$DryRun = $false

# Supported file types
$Extensions = @(
"*.pdf","*.doc","*.docx","*.ppt","*.pptx",
"*.xls","*.xlsx","*.csv","*.txt",
"*.md","*.vsdx","*.zip"
)

# ----------------------------
# Categories
# ----------------------------

$Categories = [ordered]@{

"AI" = @(
"ai","artificial intelligence","copilot",
"chatgpt","llm","machine learning",
"ml","genai","agentic","prompt"
)

"Cloud\Azure" = @(
"azure","az-","entra","sentinel",
"intune","purview","aad",
"azure ad","microsoft defender",
"logic app","key vault","azure firewall",
"azure security","azure vm","azure storage"
)

"Cloud\AWS" = @(
"aws","ec2","s3","iam",
"cloudtrail","guardduty","lambda"
)

"Cloud\GCP" = @(
"gcp","google cloud"
)

"Cloud\General" = @(
"cloud","casb","cspm","cnapp",
"multicloud"
)

"Identity and Access Management" = @(
"identity","access","authentication",
"authorization","conditional access",
"active directory","ad ",
"ldap","kerberos",
"pim","pam","mfa","sso","rbac"
)

"Security Operations" = @(
"soc","siem","soar","xdr","edr",
"monitoring","sentinel",
"security operations",
"threat hunting","log analytics"
)

"Endpoint Security" = @(
"endpoint","defender","antivirus",
"bitlocker","device","windows security"
)

"Network Security" = @(
"network","firewall","vpn","dns",
"nsg","waf","proxy","router",
"switch","tcp","udp","bgp"
)

"Application Security" = @(
"application security","appsec",
"burp","web security",
"xss","csrf","owasp",
"secure coding"
)

"API Security" = @(
"api","swagger","rest",
"graphql"
)

"Penetration Testing" = @(
"pentest","penetration",
"red team","oscp",
"ceh","burp suite",
"metasploit","bloodhound"
)

"Vulnerability Management" = @(
"vulnerability","cve","patch",
"hardening","baseline"
)

"Threat Intelligence" = @(
"ioc","threat","mitre",
"attack","apt","osint"
)

"Incident Response" = @(
"incident","forensics",
"recovery","containment"
)

"Malware" = @(
"malware","ransomware",
"trojan","virus","worm",
"botnet","backdoor","adware"
)

"Digital Forensics" = @(
"forensic","memory analysis",
"disk analysis"
)

"DevSecOps" = @(
"devsecops","devops",
"pipeline","github",
"jenkins","terraform",
"ansible"
)

"Containers and Kubernetes" = @(
"docker","container",
"kubernetes","k8s",
"helm","aks"
)

"Governance Risk Compliance" = @(
"risk","audit","governance",
"compliance","nist",
"iso","cis","pci",
"hipaa","gdpr","cisa",
"cissp","cism"
)

"Policies Standards Procedures" = @(
"policy","procedure",
"standard","runbook",
"sop","guideline",
"checklist"
)

"Architecture" = @(
"architecture","design",
"landing zone","reference architecture"
)

"Cryptography" = @(
"crypto","encryption",
"certificate","tls","ssl",
"pki","hash"
)

"Certifications" = @(
"az-","sc-","ai-",
"dp-","ccsk","comptia",
"security+","cysa",
"certification","exam",
"study guide","practice questions"
)

"Programming" = @(
"python","powershell",
"bash","shell","c#",
"java","javascript"
)

"Operating Systems" = @(
"windows","linux",
"ubuntu","redhat",
"unix","android"
)

"Career and Soft Skills" = @(
"resume","interview",
"leadership","career",
"communication",
"productivity",
"manager","employee",
"boss"
)

"Books" = @(
"book","handbook",
"guide","manual"
)

"Templates" = @(
"template","sample",
"format","form"
)

"Projects" = @(
"project","implementation",
"migration","deployment"
)

}

# ---------------------------------
# Create folders
# ---------------------------------

foreach($Folder in $Categories.Keys){

    $Full = Join-Path $RootFolder $Folder

    if(!(Test-Path $Full)){
        New-Item -ItemType Directory -Path $Full -Force | Out-Null
    }

}

$Uncat = Join-Path $RootFolder "Uncategorized"

if(!(Test-Path $Uncat)){
    New-Item -ItemType Directory $Uncat | Out-Null
}

# ---------------------------------
# Process files
# ---------------------------------

$Files = Get-ChildItem $RootFolder `
-Recurse `
-File `
-Include $Extensions |
Where-Object {

$_.DirectoryName -notmatch "Uncategorized"

}

foreach($File in $Files){

    $Name = $File.BaseName.ToLower()

    $CategoryFound = $null

    foreach($Category in $Categories.Keys){

        foreach($Keyword in $Categories[$Category]){

            if($Name.Contains($Keyword.ToLower())){

                $CategoryFound = $Category
                break

            }

        }

        if($CategoryFound){ break }

    }

    if(!$CategoryFound){

        $CategoryFound = "Uncategorized"

    }

    $Destination = Join-Path $RootFolder $CategoryFound

    if($DryRun){

        Write-Host "[DRYRUN] $($File.Name)  -->  $CategoryFound"

    }
    else{

        Move-Item $File.FullName $Destination -Force

        Write-Host "[MOVED] $($File.Name) --> $CategoryFound"

    }

}

Write-Host ""
Write-Host "Completed."