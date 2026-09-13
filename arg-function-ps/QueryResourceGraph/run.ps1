using namespace System.Net

param($Request, $TriggerMetadata)

Write-Host "Processing Azure Resource Graph query request via PowerShell."

# Extract custom KQL query from POST body or GET query string
$kqlQuery = $Request.Body.query
if (-not $kqlQuery) {
    $kqlQuery = $Request.Query.query
}

# Fallback default query if none is provided
if (-not $kqlQuery) {
    $kqlQuery = "Resources | summarize count() by type | order by count_ desc | take 10"
}

# Optional: get target subscriptions from the payload
$subscriptions = $Request.Body.subscriptions

try {
    # Build parameters for Search-AzGraph
    $graphParams = @{
        Query = $kqlQuery
    }

    if ($subscriptions -and $subscriptions.Count -gt 0) {
        $graphParams['Subscription'] = $subscriptions
    }

    # Execute the query
    $graphResult = Search-AzGraph @graphParams

    $responsePayload = @{
        total_records = $graphResult.Count
        data          = $graphResult
    } | ConvertTo-Json -Depth 10

    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $responsePayload
        Headers    = @{
            "Content-Type" = "application/json"
        }
    })
}
catch {
    Write-Error "Failed to execute Resource Graph query: $_"

    $errorPayload = @{
        error   = $_.Exception.Message
        details = $_.ScriptStackTrace
    } | ConvertTo-Json

    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::InternalServerError
        Body       = $errorPayload
        Headers    = @{
            "Content-Type" = "application/json"
        }
    })
}