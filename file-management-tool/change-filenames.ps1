Get-ChildItem -File -Recurse | ForEach-Object {
    $newName = $_.Name -replace '_', '-'

    if ($newName -ne $_.Name) {
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($newName)
        $extension = [System.IO.Path]::GetExtension($newName)
        $candidate = $newName
        $counter = 1

        while (Test-Path (Join-Path $_.DirectoryName $candidate)) {
            $candidate = "$baseName-duplicate-$counter$extension"
            $counter++
        }

        Rename-Item -Path $_.FullName -NewName $candidate
    }
}