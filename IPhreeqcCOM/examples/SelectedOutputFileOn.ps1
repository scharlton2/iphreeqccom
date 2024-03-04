[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat") | Out-Null
$iphreeqc.SelectedOutputFileOn = $true

if ($iphreeqc.RunFile("ex2") -eq 0) {
    Write-Host "See $($iphreeqc.SelectedOutputFileName)."
}
