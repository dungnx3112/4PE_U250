@echo off
setlocal enabledelayedexpansion

REM Set PATH to include MinGW compiler from Vitis HLS TPS
set "PATH=C:\Xilinx\Vitis_HLS\2023.2\tps\win64\msys64\mingw64\bin;%PATH%"

cd /d "%~dp0"

echo [1/2] Compiling runq.exe (statically linked)...
g++ -O3 -std=c++14 -static -static-libgcc -static-libstdc++ llama2_decoder_sw_emulator.cpp -o runq.exe
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Compilation failed!
    exit /b %ERRORLEVEL%
)

echo [2/2] Running runq.exe ...
runq.exe -i "Where is Vietnam located?" -n 25
