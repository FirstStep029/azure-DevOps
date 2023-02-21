# Logout of session
az logout
if ($LASTEXITCODE -eq 0) {
    Write-Host "Logout Session Successfull."
}