<#
This Powershell script is used to get all availabe regions for Azure and save it as YAML file.
#>
$session_id = New-Guid
$dir_out = "$($PSScriptRoot)/../dataset/tmp/$($session_id)"
New-Item -ItemType Directory -Force -Path $dir_out
az account list-locations -o yaml # | ConvertFrom-Json | ConvertTo-Json | Out-File -Encoding utf8 "$($dir_out)/regions.json"
# python.exe $PSScriptRoot/../python/Convert-JSON-to-YAML.py -folder_path "$($dir_out)/regions.txt"
