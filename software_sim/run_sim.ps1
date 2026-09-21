# PowerShell execution script for Software Emulator (matching runq.c)
param (
    [string]$Prompt = "Where is Vietnam located?",
    [int]$Steps = 25
)

$ErrorActionPreference = "Stop"

$compilerCandidates = @(
    "C:\msys64\ucrt64\bin\g++.exe",
    "C:\Xilinx\Vitis_HLS\2023.2\tps\win64\msys64\mingw64\bin\g++.exe"
)
$compiler = $compilerCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $compiler) {
    throw "No supported g++.exe was found. Install MSYS2 UCRT64 GCC or Vitis HLS."
}

Push-Location -Path $PSScriptRoot
try {
    Write-Host "Compiling runq.exe (statically linked)..." -ForegroundColor Yellow
    & $compiler -O3 -std=c++14 -static -static-libgcc -static-libstdc++ llama2_decoder_sw_emulator.cpp -o runq.exe

    if ($LASTEXITCODE -ne 0) {
        throw "Compilation failed with exit code $LASTEXITCODE"
    }

    Write-Host "Running runq.exe..." -ForegroundColor Green
    & .\runq.exe -i $Prompt -n $Steps
} finally {
    Pop-Location
}
