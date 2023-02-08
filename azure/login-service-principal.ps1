# Login to AZURE PORTAL via CLI
<#
This PowerShell script is used to Login with Azure Portal using APP_ID & APP_SECRET.
This excepts below variables to be present in system environment variables.
AZURE_APP_ID: Azure Application Id (or) Service Pricipal ID (or)  Client Id.
AZURE_APP_SECRET: Azure Application Secret (or) Service Pricipal Secret (or)  Client Secret.
AZURE_TENANT: Azure Tenant Id.
#>
az login --service-principal -u $env:AZURE_APP_ID -p $env:AZURE_APP_SECRET --tenant $env:AZURE_TENANT --output none
Write-Host "Azure Login Success"