[System.IO.Directory]::SetCurrentDirectory($PSScriptRoot)
$iphreeqc = New-Object -ComObject IPhreeqcCOM.Object
$iphreeqc.LoadDatabase("phreeqc.dat")
$iphreeqc.AccumulateLine("TITLE Example 2.--Temperature dependence of solubility")
$iphreeqc.AccumulateLine("                  of gypsum and anhydrite")
$iphreeqc.AccumulateLine("SOLUTION 1 Pure water")
$iphreeqc.AccumulateLine("        pH      7.0")
$iphreeqc.AccumulateLine("        temp    25.0")
$iphreeqc.AccumulateLine("EQUILIBRIUM_PHASES 1")
$iphreeqc.AccumulateLine("        Gypsum          0.0     1.0")
$iphreeqc.AccumulateLine("        Anhydrite       0.0     1.0")
$iphreeqc.AccumulateLine("REACTION_TEMPERATURE 1")
$iphreeqc.AccumulateLine("        25.0 75.0 in 51 steps")
$iphreeqc.AccumulateLine("SELECTED_OUTPUT")
$iphreeqc.AccumulateLine("        -file   ex2.sel")
$iphreeqc.AccumulateLine("        -temperature")
$iphreeqc.AccumulateLine("        -si     anhydrite  gypsum")
$iphreeqc.AccumulateLine("END")
$iphreeqc.OutputFileOn = $true
$iphreeqc.OutputFileName = "ex2.out"
if ($iphreeqc.RunAccumulated() -eq 0) {
    Write-Host "see $($iphreeqc.OutputFileName)."
}
