$inputFile = Get-Content "C:\Scripts\Advent of Code\2022\4\input.txt"

$fullyContainedRanges = 0
ForEach($pair in $inputFile){
    $firstPair = ($pair -split (","))[0]
    $secondPair = ($pair -split (","))[1]

    $firstRange = Invoke-Expression ($firstPair -replace "-", "..")
    $secondRange = Invoke-Expression ($secondPair -replace "-", "..")

    if((($secondRange -contains $firstRange[0]) -and ($secondRange -contains $firstRange[-1])) -or (($firstRange -contains $secondRange[0]) -and ($firstRange -contains $secondRange[-1]))){
        $fullyContainedRanges += 1

        Write-Host "$firstPair and $secondPair contains each others range."
    }
}

Write-Host "Found $fullyContainedRanges pairs with overlapping ranges."