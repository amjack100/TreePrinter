using module ..\Classes\TreePrinter.psm1
function new-tree {
    
    [CmdletBinding()]
    param (
        $root, [scriptblock]$script, [int32]$maxdepth, [scriptblock]$displayscript
    )
        
    $p = [tnode]$root
    $p.disp = $root
        
    function new-branch {
        param([tnode]$p, [int32]$depth = 0)
            
        $children = . $script $p.n
        $dispchildren = . $displayscript $p.n
            
        if (@($children).Count -eq 0) {
            return
        }
            
        if ($depth -gt $maxdepth) {
            return
        }
        $i = 0
        foreach ($item in $children) {
            $node = [tnode]$item
        
            if ($i -gt @($dispchildren).Count - 1) {
                break
            }
        
            $node.disp = @($dispchildren)[$i]
            $p.root += $node
        
            $i ++
            new-branch ($node) ($depth + 1)        
        }
    
        return $p
    }

    $null = new-branch $p 

    $n = 50
    $flag = @()

    $i = 0
    while ($i -lt $n) {
        $flag += $true
        $i ++
    }

    [TreePrinter]::printNTree($p, $flag, 0, $false)

}
