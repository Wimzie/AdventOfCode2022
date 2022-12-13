$inputFile = Get-Content "C:\Scripts\Advent of Code\2022\4\input.txt"

$fullyContainedRanges = 0
ForEach($pair in $inputFile){
    $firstPair = ($pair -split (","))[0]
    $secondPair = ($pair -split (","))[1]

    $firstRange = Invoke-Expression ($firstPair -replace "-", "..")
    $secondRange = Invoke-Expression ($secondPair -replace "-", "..")


    if ($firstRange | ? {$secondRange -contains $_}) {
        Write-Host "$firstPair and $secondPair have duplicates in their range."
        $fullyContainedRanges += 1
    }
}

Write-Host "Found $fullyContainedRanges pairs with overlapping ranges."