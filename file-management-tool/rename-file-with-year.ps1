Get-ChildItem -File | ForEach-Object {

    $baseName = $_.BaseName
    $extension = $_.Extension

    # Find first year
    if ($baseName -match '\b((19|20)\d{2})\b') {

        $year = $matches[1]

        # Skip if year already at beginning
        if ($baseName -match "^$year[-_ ]?") {
            return
        }

        # Remove year from current position
        $newBaseName = $baseName -replace "\b$year\b", ''

        # Replace spaces and underscores with hyphens
        $newBaseName = $newBaseName -replace '[ _]+', '-'

        # Remove duplicate hyphens
        $newBaseName = $newBaseName -replace '-{2,}', '-'

        # Trim leading/trailing hyphens
        $newBaseName = $newBaseName.Trim('-')

        # Add year at beginning
        $newBaseName = "$year-$newBaseName"

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