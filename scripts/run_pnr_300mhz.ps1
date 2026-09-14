[CmdletBinding()]
param(
    [string]$VivadoPath = "C:\Xilinx\Vivado\2023.2\bin\vivado.bat"
)

$ErrorActionPreference = "Stop"
$sourceDir = $PSScriptRoot
$tclScript = Join-Path $sourceDir "run_pnr_decoder_multikernel_300mhz.tcl"
$logFile = Join-Path $sourceDir "pnr_decoder_multikernel_300mhz.log"
$jouFile = Join-Path $sourceDir "pnr_decoder_multikernel_300mhz.jou"

if (-not (Test-Path -LiteralPath $VivadoPath)) {
    throw "Vivado executable not found: $VivadoPath"
}

Write-Host "========================================================================"
Write-Host " Running Standalone OOC PnR @ 300 MHz on AMD Alveo U250 (Local Windows)"
Write-Host " Script: $tclScript"
Write-Host " Log:    $logFile"
Write-Host "========================================================================"

Push-Location $sourceDir
try {
    & $VivadoPath -mode batch -notrace -source $tclScript -log $logFile -journal $jouFile
} finally {
    Pop-Location
}
