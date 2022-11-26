$currentSource = w32tm /query /source
Write-Output $currentSource
Write-Output ""

$peerList = w32tm /query /peers
#Write-Output $peerList

ForEach ($Line in $($peerList -split "`r`n")){ #No Blank Lines
    #Write-Host $Line
    if ($Line -ne ""){
        $tempArray = $Line.Split(":")
        #Write-Host $tempArray[1].Remove(0,1)
        Write-Host $tempArray
        #Add to Dictionary
    }

}
