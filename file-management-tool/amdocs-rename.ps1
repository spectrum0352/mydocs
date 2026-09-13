Get-ChildItem -File | Where-Object {
    $_.BaseName -match '(2017|2018|2019|2020)' -and
    $_.BaseName -notmatch '(?i)-INFOSYS$'
} | ForEach-Object {

    $newName = "$($_.BaseName)-INFOSYS$($_.Extension)"
    $targetPath = Join-Path $_.DirectoryName $newName

    if (Test-Path $targetPath) {
        $counter = 1
        do {
            $newName = "$($_.BaseName)-INFOSYS-duplicate-$counter$($_.Extension)"
            $targetPath = Join-Path $_.DirectoryName $newName
            $counter++
        } while (Test-Path $targetPath)
    }

    Rename-Item -Path $_.FullName -NewName $newName

    Write-Host "Renamed: $($_.Name) -> $newName"
}