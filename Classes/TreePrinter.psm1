
class tnode {
    [object]$n
    [array]$root = @()
    [object]$disp

    tnode([object]$data) {
        $this.n = $data
        $this.disp = $data
    }
}

class TreePrinter {

    static [void] printNTree([tnode]$x, [boolean[]]$flag, [int32]$depth, [boolean]$islast) {

        if ($null -eq $x) {
            return
        }


        for ($i = 1; $i -lt $depth; $i++) {
            
            if ($flag[$i] -eq $true) {
                write-host ("| " + " " + " " + " ") -NoNewline
            }
            else {
                write-host (" " + " " + " " + " ") -NoNewline
            }
        }

        if ($depth -eq 0) {
            write-host $x.n
        }
        elseif ($islast) {
            write-host ("+--- " + $x.disp + "`n") -NoNewline
            $flag[$depth] = $false
        }
        else {
            write-host ("+--- " + $x.disp + "`n") -NoNewline
        }

        $it = 0
        foreach ($i in $x.root) {
            
            $it++

            [TreePrinter]::printNTree($i, $flag, ($depth + 1), ($it -eq ($x.root.Count - 1)))
        }
        $flag[$depth] = $true
    }

}
