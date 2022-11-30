$currentSource = w32tm /query /source
$peerList = w32tm /query /peers
$w32tmValues = "["

ForEach ($Line in $($peerList -split "`r`n")){ #Breaks input into indivual lines
    if ($Line -eq "" -or $Line -like '*#Peers: *'){ #checks if line is epmty
     #No lines Added
    }else{
        $tempArray = $Line.Split(":") #splits based on :
        if($tempArray[0] -eq "Peer" -and $tempArray[1].Remove(0,1) -eq $currentSource.Remove($currentSource.Length - 1)){
            $w32tmValues += '{"Current Source":"True",'
        }elseif ($tempArray[0] -eq "Peer") {
            $w32tmValues += '{"Current Source":"False",'
        }
        if($tempArray[0] -eq "HostPoll Interval"){
            $w32tmValues += '"' + $tempArray[0] + '":"' + $tempArray[1].Remove(0,1) + '"},'
        }else{
            $w32tmValues += '"' + $tempArray[0] + '":"' + $tempArray[1].Remove(0,1) + '",'
        }
    }
}
$w32tmValues = $w32tmValues.Remove($w32tmValues.Length - 1)
$w32tmValues += "]"
Write-Host($w32tmValues)