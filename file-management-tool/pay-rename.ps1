Get-ChildItem -File -Recurse | ForEach-Object {

    $baseName = $_.BaseName
    $extension = $_.Extension

    if ($baseName -match '(?i)(payslip|salary)') {

        # Extract year (2000-2099)
        $year = $null
        if ($baseName -match '\b(20\d{2})\b') {
            $year = $matches[1]
        }

        # Remove payslip and salary
        $newBaseName = $baseName -replace '(?i)\b(payslip|salary)\b', ''

        # Remove the extracted year from the remaining name
        if ($year) {
            $newBaseName = $newBaseName -replace "\b$year\b", ''
        }

        # Convert spaces/underscores to hyphens
        $newBaseName = $newBaseName -replace '[ _]+', '-'

        # Remove duplicate hyphens
        $newBaseName = $newBaseName -replace '-{2,}', '-'

        # Trim leading/trailing hyphens
        $newBaseName = $newBaseName.Trim('-')

        # Build final name
        if ($year) {
            $newBaseName = "payslip-$year-$newBaseName"
        }
        else {
            $newBaseName = "payslip-$newBaseName"
        }

        $newName = "$newBaseName$extension"
        $targetPath = Join-Path $_.DirectoryName $newName

        # Handle duplicates
        if (Test-Path $targetPath) {
            $counter = 1
            do {
                $newName = "$newBaseName-duplicate-$counter$extension"
                $targetPath = Join-Path $_.DirectoryName $newName
                $counter++
            } while (Test-Path $targetPath)
        }

        Rename-Item -Path $_.FullName -NewName $newName
        Write-Host "Renamed: $($_.Name) -> $newName"
    }
}