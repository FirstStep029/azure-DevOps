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
az storage account create --name $env:NAME.ToLower() --resource-group $env:RESOURCE_GROUP --location $env:LOCATION --access-tier $env:ACCESS_TIER --sku $env:SKU