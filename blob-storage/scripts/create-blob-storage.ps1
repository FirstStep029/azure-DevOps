Write-Host "BLOB-NAME: $($env:NAME) `nSKU: $($env:SKU) `nRG: $($env:RESOURCE_GROUP) `nLOCATION: $($env:LOCATION) `nACCESS_TIER: $($env:ACCESS_TIER)"

# create name with remove Special Characters and convert to lower case
$blob_name = $env:NAME.ToLower() -replace '\W',''

# Check Storage Name is Valid
$name_exists = az storage account check-name --name $blob_name | ConvertFrom-Json

if($name_exists.nameAvailable) {
    Write-Host "Name '$($blob_name)' Available."
} else {
    Write-Host "Name '$($blob_name)' Already Taken."
    exit 1
}

# Create Blob Storage Account
az storage account create --name $blob_name --resource-group $env:RESOURCE_GROUP --location $env:LOCATION --access-tier $env:ACCESS_TIER --sku $env:SKU --min-tls-version $env:TLS_VERSION --public-network-access $env:PNA --kind $env:KIND --output none

# az storage account create $arguments
if ($LASTEXITCODE -eq 0) {
    Write-Host "Blob Creation Success in RG: $($env:LOCATION) with Name: '$($blob_name)'"
}