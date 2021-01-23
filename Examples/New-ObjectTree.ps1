
param(
    [Parameter(Mandatory)]
    [object]$InputObject
)

$Options = @{
    Root          = $InputObject
    Script        = { param($item) $item.psobject.properties | Select-Object -expandProperty value }
    MaxDepth      = 2
    DisplayScript = { param($item) $item.psobject.properties | ForEach-Object { "$(truncate $_.name -MaxChars 25) $(truncate "$($_.value)" -MaxChars 50)" } }
}

New-Tree @Options