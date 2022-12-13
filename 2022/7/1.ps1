$inputDirections = Get-Content "C:\Scripts\Advent of Code\2022\7\input.txt"

function AddToIteratedDirectories {
    Param(
        $currentDirectory,
        $directories,
        $currentCounter
    )

    if($currentCounter -eq 0) {
        return $iteratedDirectories
    }

    $iteratedDirectories[$currentDirectory] += $currentCounter

    While(Split-Path $currentDirectory){
        $currentDirectory = (Split-Path $currentDirectory).Replace("\", "/")
        $iteratedDirectories[$currentDirectory] += $currentCounter
    }

    return $iteratedDirectories
}

$currentDirectory = ""
$iteratedDirectories = @{"/" = 0}
$currentCounter = 0
ForEach($instruction in $inputDirections){
    switch -Regex (($instruction -split " ")[0]){
        "\$" {
            if(($instruction -split " ")[1] -eq "cd"){
                $iteratedDirectories = AddToIteratedDirectories -currentDirectory $currentDirectory -currentCounter $currentCounter -directories $iteratedDirectories
                if(($instruction -split " ")[2] -eq ".."){

                    $currentDirectory = (Split-Path $currentDirectory).Replace("\", "/")
                    
                }
                elseif(($instruction -split " ")[2] -eq "/") {
                    $currentDirectory = "/"
                    continue
                }
                else {

                    #$iteratedDirectories = AddToIteratedDirectories -currentDirectory $currentDirectory -currentCounter $currentCounter -directories $iteratedDirectories

                    if($currentDirectory -eq "/"){
                        $currentDirectory += ($($instruction -split " ")[2])    
                    } else {
                        $currentDirectory += ("/" + $($instruction -split " ")[2])
                    }
                    $currentCounter = 0
                    #continue
                }
                $currentCounter = 0
                continue
            default {
                continue
            }
            }   
        }
        "dir" {
            if(!($iteratedDirectories.ContainsKey($currentDirectory + "/" + ($instruction -split " ")[1]))){
                $iteratedDirectories.Add($currentDirectory + "/" + ($instruction -split " ")[1], 0)
            }
            continue
        }
        "\d+" {
            $currentCounter += [int](($instruction -split " ")[0])
            #$iteratedDirectories[$currentDirectory] += $($instruction -split " ")[0]
            continue
        } default {
            continue
        }
    }
}

$totalSum = 0
ForEach($sum in $iteratedDirectories.GetEnumerator()){
    if([int]($sum.Value) -le 100000){
        $totalSum += [int]($sum.Value)
    } 
}
#$iteratedDirectories | ? {$_.Values -le 100000} | % {$totalSum += $_.Value}




Write-Host $iteratedDirectories