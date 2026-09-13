Copy-Item "$env:SystemRoot\System32\drivers\etc\hosts.youtubeblocked" `
          "$env:SystemRoot\System32\drivers\etc\hosts" -Force

ipconfig /flushdns
Write-Host "YouTube blocked."
Pause