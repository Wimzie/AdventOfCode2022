$inputFile = Get-Content "C:\Scripts\Advent of Code\2022\5\input.txt"

$startingPositions = $inputFile | ? {$_ -notlike "move *" -and $_ -ne ""} 
[array]::Reverse($startingPositions)

$columns = [System.Collections.ArrayList]::new()

For($i = 0; $i -lt 9; $i++){
    $columns.Add(@())
}

For($i = 1; $i -lt 9; $i++) {
    $currentColumn = 0

    For($j = 1; $j -lt $startingPositions[$i].Length; $j += 4) {
        
        if($startingPositions[$i][$j] -match "[A-Z]"){
            #if($null -eq ($columns[$i-1][$currentColumn])){
            $columns[$currentColumn] += $startingPositions[$i][$j]
            #}

        }
        $currentColumn++
    }
    
}
