# Write-Host "BLOB-NAME: $($env:NAME) `nSKU: $($env:SKU) `nRG: $($env:RESOURCE_GROUP) `nLOCATION: $($env:LOCATION) `nACCESS_TIER: $($env:ACCESS_TIER)"


# Check Storage Name is Valid
$name_exists = az storage account check-name --name $env:NAME.ToLower() | ConvertFrom-Json

if($name_exists.nameAvailable) {
    Write-Host "Name '$($env:NAME.ToLower())' Available."
} else {
    Write-Host "Name '$($env:NAME.ToLower())' Already Taken."
    exit 1
}

# Create Blob Storage Account
az storage account create --name $env:NAME.ToLower() --resource-group $env:RESOURCE_GROUP --location $env:LOCATION --access-tier $env:ACCESS_TIER --sku $env:SKU --output none

# az storage account create $arguments
if ($LASTEXITCODE -eq 0) {
    Write-Host "Blob Creation Success in RG: $($env:LOCATION) with Name: '$($env:NAME.ToLower())'"
}

# Logout of session
az logout
if ($LASTEXITCODE -eq 0) {
    Write-Host "Logout Session Successfull."
}