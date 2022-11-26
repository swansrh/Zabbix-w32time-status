$currentSource = w32tm /query /source
$peerList = w32tm /query /peers
$w32tmValues = [ordered]@{"Current Source" = $currentSource}
ForEach ($Line in $($peerList -split "`r`n")){ #Breaks input into indivual lines
    if ($Line -ne ""){ #checks if line is epmty
        $tempArray = $Line.Split(":") #splits based on :
        $w32tmValues.add($tempArray[0], $tempArray[1].Remove(0,1))   #Add to Dictionary
    }
}
$w32tmValues