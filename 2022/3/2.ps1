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

Get-AlphabeticalPosition -character "A"


$inputFile = Get-Content "C:\Scripts\Advent of Code\2022\3\input.txt"
$totalValue = 0

For ($i = 0; $i -lt $inputFile.Length; $i+= 3){

    $firstLine = $inputFile[$i] -split ''
    $secondLine = $inputFile[$i+1] -split ''
    $thirdLine = $inputFile[$i+2] -split ''

    $commonLetter = ($firstLine | ? {(($secondLine -ccontains $_) -and ($thirdLine -ccontains $_)) -and ($_ -ne "")})[0]

    $commonLetterValue = Get-AlphabeticalPosition -character $commonLetter
    $totalValue += $commonLetterValue

    Write-Host "$commonLetter was the common letter and it has the value of $commonLetterValue."
}

Write-Host "The total value *should* be $totalValue."