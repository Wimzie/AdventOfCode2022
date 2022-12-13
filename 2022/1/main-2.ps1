$inputString = Get-Content "C:\Scripts\Advent of Code\2022\1\input.txt"


$counterArray = @()

$counter = 0
ForEach($line in $inputString){
    if($line -eq ""){
        $counterArray += $counter
        $counter = 0
        continue
    }

    $counter += [int]$line
}


$counterArray = $counterArray | Sort-Object -Descending
Write-Host $($counterArray[0] + $counterArray[1] + $counterArray[2])