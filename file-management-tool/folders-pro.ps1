# Create Professional Documents Folder Structure

$root = "$HOME\Documents\Professional_Documents"

$companies = @(
    "01_Lobo_Staffing",
    "02_Prompt",
    "03_Lobo",
    "04_TCTSL",
    "05_Infosys",
    "06_TCS",
    "07_Altera",
    "08_Amdocs"
)

$subFolders = @(
    "01_Offer_Letter",
    "02_Joining_Documents",
    "03_Confirmation_Letter",
    "04_Promotion_Appraisal",
    "05_Salary_Revisions",
    "06_Payslips",
    "07_Form16_Tax",
    "08_Experience_Letter",
    "09_Relieving_Letter",
    "10_Other"
)

# Create root folder
New-Item -Path $root -ItemType Directory -Force | Out-Null

# Create company folders and subfolders
foreach ($company in $companies) {
    $companyPath = Join-Path $root $company

    New-Item -Path $companyPath -ItemType Directory -Force | Out-Null

    foreach ($folder in $subFolders) {
        New-Item -Path (Join-Path $companyPath $folder) -ItemType Directory -Force | Out-Null
    }
}

# Create Career Master folder
$careerMaster = Join-Path $root "99_Career_Master"

$careerFolders = @(
    "Resume_CV",
    "Certifications",
    "Education",
    "Awards",
    "Background_Verification",
    "PF_UAN",
    "Salary_History",
    "References"
)

New-Item -Path $careerMaster -ItemType Directory -Force | Out-Null

foreach ($folder in $careerFolders) {
    New-Item -Path (Join-Path $careerMaster $folder) -ItemType Directory -Force | Out-Null
}

Write-Host ""
Write-Host "Professional document folder structure created successfully." -ForegroundColor Green
Write-Host "Location: $root" -ForegroundColor Cyan