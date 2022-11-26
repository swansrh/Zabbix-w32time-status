$currentSource = w32tm /query /source
$peerList = w32tm /query /peers
$w32tmValues = @{Source = $currentSource}


ForEach ($Line in $($peerList -split "`r`n")){ #No Blank Lines
    #Write-Host $Line
    if ($Line -ne ""){
        $tempArray = $Line.Split(":")
        $w32tmValues.add($tempArray[0], $tempArray[1].Remove(0,1))   #Add to Dictionary
    }
}

$w32tmValues