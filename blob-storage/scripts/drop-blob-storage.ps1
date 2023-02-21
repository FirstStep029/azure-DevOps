# create name with remove Special Characters and convert to lower case
$blob_name = $env:NAME.ToLower() -replace '\W',''

# Check Storage Name is Valid
$name_exists = az storage account check-name --name $blob_name | ConvertFrom-Json
Write-Host $name_exists

if($name_exists.nameAvailable) {
    Write-Host "'$($blob_name)' Does Not Exists, Skipping."
} else {
    Write-Host "'$($blob_name)' Available & Dropping."
    az storage account delete --name $blob_name --resource-group $env:RESOURCE_GROUP    
}