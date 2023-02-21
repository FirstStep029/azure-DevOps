# Write-Host "BLOB-NAME: $($env:NAME) `nSKU: $($env:SKU) `nRG: $($env:RESOURCE_GROUP) `nLOCATION: $($env:LOCATION) `nACCESS_TIER: $($env:ACCESS_TIER)"


# Check Storage Name is Valid
$name_exists = az storage account check-name --name $env:NAME.ToLower() | ConvertFrom-Json

if($name_exists.nameAvailable) {
    Write-Host "Name '$($blob_prop.'name')' Available."
} else {
    Write-Host "Name '$($blob_prop.'name')' Already Taken."
    exit 1
}

# Create Blob Storage Account
# az storage account create --name $blob_prop.'name' --resource-group $blob_prop.'resource-group' --location $blob_prop.'region'
