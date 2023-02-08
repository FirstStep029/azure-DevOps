<# Main login script which used to login to azure based on login option provided.#>
param($method)


if ($method -eq "SP") {
    & $PSScriptRoot/login-service-principal.ps1
} else {
    throw "Given Method currently not supported, Supported methods are ['SP']"
}