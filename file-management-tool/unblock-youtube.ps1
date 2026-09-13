Copy-Item "$env:SystemRoot\System32\drivers\etc\hosts.normal" `
          "$env:SystemRoot\System32\drivers\etc\hosts" -Force

ipconfig /flushdns
Write-Host "YouTube unblocked."
Pause