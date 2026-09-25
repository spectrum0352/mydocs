# Define the log name (e.g., Application, System, Security)
$LogName = "Security"

# Set the output CSV file path (modify path and filename as needed)
$OutputFilePath = "C:\event_logs_$LogName.csv"

# Get events from the specified log
$Events = Get-WinEvent -LogName $LogName

# Select desired properties for the CSV file (modify as needed)
$SelectedProperties = @("TimeCreated", "Level", "Message", "Source")

# Export events to CSV file
$Events | Select-Object $SelectedProperties | Export-Csv -Path $OutputFilePath -NoTypeInformation

# Show confirmation message
Write-Host "Exported events from $LogName to: $OutputFilePath"
