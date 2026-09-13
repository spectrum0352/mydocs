$dest = Join-Path (Get-Location) "identity-documents-sandeep"

New-Item -ItemType Directory -Force -Path $dest | Out-Null

Get-ChildItem -File -Recurse |
Where-Object {
    $_.DirectoryName -ne $dest -and
    $_.Name -match '(?i)(pan|aadhaar|aadhar|e-?aadhaar|e-?aadhar|passport|birth|nsr|voter|rent|vaccine|casa|diamond|police|photo|uan)'
} |
ForEach-Object {

    $targetName = $_.Name
    $targetPath = Join-Path $dest $targetName

    if (Test-Path $targetPath) {
        $base = $_.BaseName
        $ext = $_.Extension
        $counter = 1

        do {
            $targetName = "$base-duplicate-$counter$ext"
            $targetPath = Join-Path $dest $targetName
            $counter++
        } while (Test-Path $targetPath)
    }

    Move-Item $_.FullName $targetPath
    Write-Host "Moved: $($_.Name) -> $targetName"
}