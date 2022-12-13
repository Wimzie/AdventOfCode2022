function Get-AlphabeticalPosition {
    param(
    [char] $character
    )

    $uppercase = $false

    if($character -cmatch "[A-Z]"){
        $uppercase = $true
    }

    $number = [int][char](([string]$character).ToUpper()) - 64

    if($uppercase){
        $number += 26
    }

    return $number
}

# Call the function to convert a character to its alphabetical position

Get-AlphabeticalPosition -character "A"


$inputFile = Get-Content "C:\Scripts\Advent of Code\2022\3\input.txt"
$totalValue = 0

ForEach($line in $inputFile){

    $halfLength = ($line.Length /2)
    $firstHalf = $line.Substring(0, $halfLength) -split ''
    $secondHalf = $line.Substring($halfLength) -split ''

    $commonLetter = ($firstHalf | ? {($secondHalf -ccontains $_) -and ($_ -ne "")})[0]

    $commonLetterValue = Get-AlphabeticalPosition -character $commonLetter
    $totalValue += $commonLetterValue

    Write-Host "$commonLetter was the common letter and it has the value of $commonLetterValue."
}

Write-Host "The total value *should* be $totalValue."