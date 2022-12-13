$inputString = Get-Content "C:\Scripts\Advent of Code\2022\1\input.txt"


$highestCalories = 0

$counter = 0
ForEach($line in $inputString){
    if($line -eq ""){
        if($counter -gt $highestCalories){
            $highestCalories = $counter
        }
        $counter = 0
        continue
    }

    $counter += [int]$line
}

Write-Host $highestCalories