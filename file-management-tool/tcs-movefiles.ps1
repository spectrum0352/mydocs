$dest = Join-Path (Get-Location) "amdocs-payslips"

New-Item -ItemType Directory -Force -Path $dest | Out-Null

Get-ChildItem -File -Recurse |
Where-Object {
    $_.DirectoryName -ne $dest -and
    $_.Name -match '(?i)2026'
} |
ForEach-Object {

    $targetName = $_.Name
    $targetPath = Join-Path $dest $targetName

    # Handle duplicate filenames
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

    Move-Item -Path $_.FullName -Destination $targetPath

    Write-Host "Moved: $($_.Name) -> $targetName"
}