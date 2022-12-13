#$inputGrid = Get-Content "C:\Scripts\Advent of Code\2022\8\input.txt"
$inputGrid = Get-Content "C:\Scripts\Advent of Code\2022\8\testInput.txt"
$hiddenTrees = 0

# function isTreeHidden {
#     Param(
#         $grid,
#         $x,
#         $y
#     )

#     $treeValue = $grid[$x][$y]

#     if($treeValue -eq 0){
#         return $true
#     }
#     #Left
#     For($k = $y; $k -gt -1; $k--) {
#         if($grid[$x][$k] -lt $treeValue) {
#             return $false
#         }
#     }
#     #Right
#     For($k = $y; $k -lt $inputGrid[$x].Length; $k++) {
#         if($grid[$x][$k] -lt $treeValue) {
#             return $false
#         }
#     }
#     #Down
#     For($k = $x; $k -lt $inputGrid[$x].Count; $k++) {
#         if($grid[$k][$x] -lt $treeValue) {
#             return $false
#         }
#     }
#     #Up
#     For($k = $x; $k -gt -1; $k--) {
#         if($grid[$k][$x] -lt $treeValue) {
#             return $false
#         }
#     }

#     return $true
# }
    

# #$totalAmountOfTrees = $inputGrid.Count * $inputGrid[-1].Length
# For($i = 1; $i -lt $inputGrid.Count -1; $i++){    
#     For($j = 1; $j -lt $inputGrid[$i].Length -1; $j++){
#         #Write-Progress -Activity "Counting trees" -Status "$x,$y" -PercentComplete ($i*$j / $totalAmountOfTrees)
#         if(isTreeHidden -grid $inputGrid -x $i -y $j){
#             $hiddenTrees++
#         }
#     }
# }

$visibleTrees = @{}

#Count outer parameter of trees
For($j = 0; $j -lt $inputGrid[0].Length; $j++){
    $visibleTrees["0,$j"] = $true
}
For($j = 0; $j -lt $inputGrid[0].Length; $j++){
    $visibleTrees["$($inputGrid[0].Length -1),$j"] = $true
}
For($i = 0; $i -lt $inputGrid.Count; $i++){
    $visibleTrees["$i,0"] = $true
}
For($i = 0; $i -lt $inputGrid.Count; $i++){
    $visibleTrees["$i,$($inputGrid[0].Length -1)"] = $true
}

#From West to East
For($i = 1; $i -lt $inputGrid.Count -1; $i++){
    $highestTree = $inputGrid[$i][0]
    For($j = 1; $j -lt $inputGrid[0].Length; $j++){
            
        if($inputGrid[$i][$j] -gt $highestTree){
            $visibleTrees["$i,$j"] = $true
            $highestTree = $inputGrid[$i][$j]
        }
        
    }
}
#From East to West
$i = $inputGrid.Count -1
$highestTree = $inputGrid[$i][-1]
For($i = $inputGrid.Count -2; $i -ge 0; $i--){
    $highestTree = $inputGrid[$i][-1]
    For($j = 1; $j -lt $inputGrid[0].Length; $j++){
            
        if($inputGrid[$i][$j] -gt $highestTree){
            $visibleTrees["$i,$j"] = $true
            $highestTree = $inputGrid[$i][$j]
        }
        
    }
}

#From North to South
For($j = 1; $j -lt $inputGrid[0].Length; $j++){
    $highestTree = $inputGrid[0][$j]
    For($i = 1; $i -lt $inputGrid.Count; $i++){
        if($inputGrid[$i][$j] -gt $highestTree){
            $visibleTrees["$i,$j"] = $true
            $highestTree = $inputGrid[$i][$j]
        }
        
    }
}

#From South to North
For($j = ($inputGrid[0].Length) - 2; $j -ge 0; $j--){
    $highestTree = $inputGrid[-1][$j]
    For($i = $inputGrid.Count -2; $i -ge 0; $i--){
        if($inputGrid[$i][$j] -gt $highestTree){
            $visibleTrees["$i,$j"] = $true
            $highestTree = $inputGrid[$i][$j]
        }
        
    }
}






Write-Host $hiddenTrees