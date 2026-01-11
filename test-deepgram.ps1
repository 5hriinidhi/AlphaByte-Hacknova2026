$ApiKey = "2ecaf4da15ed9d3139f279e46cc3f1e6af90438f"
$Url = "https://api.deepgram.com/v1/projects"

Write-Host "Testing Deepgram API Key..." -ForegroundColor Cyan

try {
    $Response = Invoke-RestMethod -Uri $Url -Headers @{ "Authorization" = "Token $ApiKey" } -Method Get
    Write-Host "✅ SUCCESS! Key is valid." -ForegroundColor Green
    Write-Host "Project Name: $($Response.projects[0].name)"
} catch {
    Write-Host "❌ FAILED. Response:" -ForegroundColor Red
    Write-Host $_.Exception.Message
    if ($_.Exception.Response) {
        $Stream = $_.Exception.Response.GetResponseStream()
        $Reader = New-Object System.IO.StreamReader($Stream)
        $Body = $Reader.ReadToEnd()
        Write-Host "Body: $Body"
    }
}
