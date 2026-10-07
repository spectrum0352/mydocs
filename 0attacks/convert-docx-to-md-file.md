pandoc input.docx -f docx -t gfm -o output.md


Convert all docx files of current folder:
Get-ChildItem *.docx | % { pandoc $_.FullName -t gfm --wrap=none -o "$($_.BaseName).md" }


Convert all files present in sub-folders:
Get-ChildItem -Recurse *.docx | % { pandoc $_.FullName -t gfm --wrap=none -o "$($_.DirectoryName)\$($_.BaseName).md" }
