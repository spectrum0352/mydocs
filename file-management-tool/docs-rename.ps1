Get-ChildItem -File -Recurse | ForEach-Object {

    $baseName = $_.BaseName
    $extension = $_.Extension

    $keywords = @(
        'offer',
        'increment',
        'bonus',
        'appointment',
        'settlement',
        'resignation',
        'award',
        'transfer',
        'confirmation',
        'experience',
        'bravo',
        'hi5',
        'xtra',
        'relieving'
    )

    $prefix = $null

    foreach ($keyword in $keywords) {
        if ($baseName -match "(?i)\b$keyword\b") {
            $prefix = $keyword
            break
        }
    }

    if ($prefix) {

        # Remove all keywords
        $newBaseName = $baseName -replace '(?i)\b(offer|increment|bonus|appointment|settlement|resignation|award|transfer|confirmation|experience|bravo|hi5|xtra|relieving)\b', ''

        # Convert spaces and underscores to hyphens
        $newBaseName = $newBaseName -replace '[ _]+', '-'

        # Remove duplicate hyphens
        $newBaseName = $newBaseName -replace '-{2,}', '-'

        # Remove leading/trailing hyphens
        $newBaseName = $newBaseName.Trim('-')

        # Build final name
        if ([string]::IsNullOrWhiteSpace($newBaseName)) {
            $newBaseName = $prefix
        } else {
            $newBaseName = "$prefix-$newBaseName"
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