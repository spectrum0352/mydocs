# 1. Define the KQL query and convert to JSON
$body = @{
    query = "resources"
} | ConvertTo-Json

# 2. Send the POST request to the local Azure Function
$response = Invoke-RestMethod -Uri "http://localhost:7071/api/QueryResourceGraph" `
                              -Method Post `
                              -Body $body `
                              -ContentType "application/json"

# 3. Output the results in a table
$response.data | Format-Table -AutoSize