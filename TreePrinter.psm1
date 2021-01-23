#Requires -Version 6

$Public = Get-Childitem $PSScriptRoot\Public

foreach ($item in $Public) {
    . (Get-Item $item).FullName
}

Export-ModuleMember -Function $Public.Basename