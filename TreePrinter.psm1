
$Public = Get-Childitem $PSScriptRoot\Library 

foreach ($item in $Public) {
    . (Get-Item $item).FullName
}

Export-ModuleMember -Function $Public.Basename