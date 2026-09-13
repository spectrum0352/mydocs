$dest = Join-Path (Get-Location) "education-docs"

New-Item -ItemType Directory -Force -Path $dest | Out-Null

Get-ChildItem -File -Recurse |
Where-Object {
    $_.DirectoryName -ne $dest -and
    $_.Name -match '(?i)(btech|degree|10th|12th|marksheet|mark-sheet|ssc|hsc|semester|semister|certificate|certification|az-500|az500|az-900|az900|ms-900|ms900|ceh)'
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