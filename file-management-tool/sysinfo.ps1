# Get OS Information
Write-Output "=== Software Information ==="
Get-ComputerInfo | Select-Object OsName, OsArchitecture, WindowsVersion, WindowsBuildLabEx

# Get Processor Information
Write-Output "`n=== Processor Information ==="
Get-WmiObject Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed

# Get RAM Information
Write-Output "`n=== Memory Information ==="
Get-WmiObject Win32_PhysicalMemory | Select-Object Manufacturer, PartNumber, Capacity, Speed

# Get Disk Information
Write-Output "`n=== Disk Information ==="
Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, VolumeName, @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}}, @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}}

# Get GPU Information
Write-Output "`n=== Graphics Information ==="
Get-WmiObject Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion

# Get Installed Software
Write-Output "`n=== Installed Software ==="
Get-WmiObject Win32_Product | Select-Object Name, Version
