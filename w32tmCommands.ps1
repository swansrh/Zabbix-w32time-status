$currentSource = w32tm /query /source
Write-Output $currentSource
Write-Output ""

$peerList = w32tm /query /peers
#Write-Output $peerList

Write-Output "LOOPS Brother"
ForEach ($Line in $($peerList -split "`r`n")){
    Write-Host $Line
}
