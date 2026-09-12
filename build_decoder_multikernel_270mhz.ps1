[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Platform,

    [string]$Output = "int4_decoder_multikernel_270mhz.xclbin",

    [string]$VppPath = "C:\Xilinx\Vitis\2023.2\bin\v++.bat",

    [string]$VitisHlsPath = "C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat",

    [string]$VivadoPath = "C:\Xilinx\Vivado\2023.2\bin\vivado.bat",

    [switch]$RebuildXo
)

$ErrorActionPreference = "Stop"

$sourceDirectory = $PSScriptRoot
$configPath = Join-Path $sourceDirectory "link_decoder_multikernel_270mhz.cfg"
$hlsScriptPath = Join-Path $sourceDirectory "run_hls_decoder_multikernel.tcl"
$timingGatePath = Join-Path $sourceDirectory "verify_300mhz_routed.tcl"
$xoPaths = 0..3 | ForEach-Object {
    Join-Path $sourceDirectory "int4_decoder_pe${_}_kernel_270mhz.xo"
}
$hlsInputs = @(
    "swiftkv_attention.cpp",
    "swiftkv_attention.hpp",
    "int4_linear_controller.cpp",
    "int4_linear_controller.hpp",
    "int4_decoder_blocks.cpp",
    "int4_decoder_blocks.hpp",
    "int4_decoder_controller.cpp",
    "int4_decoder_controller.hpp",
    "int4_decoder_local.hpp",
    "int4_decoder_multikernel.cpp",
    "int4_decoder_multikernel.hpp",
    "int4_decoder_schedule.hpp",
    "int4_model_layout.hpp",
    "int4_numeric.hpp",
    "int4_task_control.hpp",
    "int4_types.hpp",
    "run_hls_decoder_multikernel.tcl"
) | ForEach-Object { Join-Path $sourceDirectory $_ }

foreach ($requiredPath in @(
    $Platform,
    $VppPath,
    $VivadoPath,
    $configPath,
    $hlsScriptPath,
    $timingGatePath
) + $hlsInputs) {
    if (-not (Test-Path -LiteralPath $requiredPath -PathType Leaf)) {
        throw "Required build input does not exist: $requiredPath"
    }
}

$needsHls = $RebuildXo.IsPresent
if (-not $needsHls) {
    foreach ($xoPath in $xoPaths) {
        if (-not (Test-Path -LiteralPath $xoPath -PathType Leaf) -or
            (Get-Item -LiteralPath $xoPath).Length -eq 0) {
            $needsHls = $true
            break
        }
        $xoTimestamp = (Get-Item -LiteralPath $xoPath).LastWriteTimeUtc
        if ($hlsInputs | Where-Object {
                (Get-Item -LiteralPath $_).LastWriteTimeUtc -gt $xoTimestamp
            }) {
            $needsHls = $true
            break
        }
    }
}

if ($needsHls) {
    if (-not (Test-Path -LiteralPath $VitisHlsPath -PathType Leaf)) {
        throw "Vitis HLS executable does not exist: $VitisHlsPath"
    }
    $hadPeSelection = Test-Path Env:INT4_DECODER_PE
    $savedPeSelection = $env:INT4_DECODER_PE
    Push-Location $sourceDirectory
    try {
        Remove-Item Env:INT4_DECODER_PE -ErrorAction SilentlyContinue
        & $VitisHlsPath -f $hlsScriptPath
        if ($LASTEXITCODE -ne 0) {
            throw "Vitis HLS failed with exit code $LASTEXITCODE"
        }
    } finally {
        if ($hadPeSelection) {
            $env:INT4_DECODER_PE = $savedPeSelection
        } else {
            Remove-Item Env:INT4_DECODER_PE -ErrorAction SilentlyContinue
        }
        Pop-Location
    }
}

foreach ($xoPath in $xoPaths) {
    if (-not (Test-Path -LiteralPath $xoPath -PathType Leaf) -or
        (Get-Item -LiteralPath $xoPath).Length -eq 0) {
        throw "XO is missing or empty after HLS: $xoPath"
    }
}

$buildDirectory = Join-Path $sourceDirectory "build_decoder_multikernel_270mhz"
$runId = "{0}-{1}" -f (Get-Date -Format "yyyyMMdd-HHmmss"), $PID
$runDirectory = Join-Path $buildDirectory (Join-Path "runs" $runId)
$tempDirectory = Join-Path $runDirectory "temp"
$logDirectory = Join-Path $runDirectory "logs"
$reportDirectory = Join-Path $runDirectory "reports"
$candidateOutput = Join-Path $runDirectory "int4_decoder_multikernel_270mhz.candidate.xclbin"
foreach ($directory in @($tempDirectory, $logDirectory, $reportDirectory)) {
    New-Item -ItemType Directory -Force -Path $directory | Out-Null
}

$resolvedOutput = if ([System.IO.Path]::IsPathRooted($Output)) {
    $Output
} else {
    Join-Path $sourceDirectory $Output
}
$resolvedOutputDirectory = Split-Path -Parent $resolvedOutput
if ($resolvedOutputDirectory) {
    New-Item -ItemType Directory -Force -Path $resolvedOutputDirectory | Out-Null
}

$vppArguments = @(
    "--link",
    "--target", "hw",
    "--platform", $Platform,
    "--save-temps",
    "--config", $configPath,
    "--temp_dir", $tempDirectory,
    "--log_dir", $logDirectory,
    "--report_dir", $reportDirectory,
    "--output", $candidateOutput
) + $xoPaths

Write-Host "Build run directory: $runDirectory"
Push-Location $sourceDirectory
try {
    & $VppPath @vppArguments
    $linkExitCode = $LASTEXITCODE
} finally {
    Pop-Location
}
if ($linkExitCode -ne 0) {
    throw "v++ link failed with exit code $linkExitCode. See: $logDirectory"
}
if (-not (Test-Path -LiteralPath $candidateOutput -PathType Leaf) -or
    (Get-Item -LiteralPath $candidateOutput).Length -eq 0) {
    throw "v++ returned success but the candidate XCLBIN is missing or empty: $candidateOutput"
}

$routedCheckpoints = @(
    Get-ChildItem -LiteralPath $tempDirectory -Filter "*routed.dcp" `
        -Recurse -File -ErrorAction SilentlyContinue |
        Sort-Object -Property LastWriteTimeUtc
)
if ($routedCheckpoints.Count -eq 0) {
    throw "Link completed, but no routed DCP was retained under: $tempDirectory"
}
$platformCheckpoints = @(
    $routedCheckpoints | Where-Object { $_.Name -eq "level0_wrapper_routed.dcp" }
)
$routedCheckpoint = if ($platformCheckpoints.Count -gt 0) {
    $platformCheckpoints[-1].FullName
} else {
    $routedCheckpoints[-1].FullName
}

$timingGateLog = Join-Path $logDirectory "timing_gate.log"
Write-Host "Running route, DRC, setup and hold gate on: $routedCheckpoint"
& $VivadoPath -mode batch -notrace -source $timingGatePath `
    -tclargs $routedCheckpoint $reportDirectory "270MHz multi-kernel" 2>&1 |
    Tee-Object -FilePath $timingGateLog
if ($LASTEXITCODE -ne 0) {
    throw "Vivado timing gate failed. See: $timingGateLog"
}
if (-not (Select-String -LiteralPath $timingGateLog `
        -Pattern "270MHz multi-kernel timing gate: TIMING_CLOSED" -Quiet)) {
    throw "Vivado timing gate did not report TIMING_CLOSED. See: $timingGateLog"
}

# Keep any previously accepted image until this exact routed candidate passes.
Move-Item -LiteralPath $candidateOutput -Destination $resolvedOutput -Force
$outputHash = Get-FileHash -LiteralPath $resolvedOutput -Algorithm SHA256
Write-Host "270MHz multi-kernel build gate: ACCEPTED_XCLBIN_PUBLISHED"
Write-Host "XCLBIN: $resolvedOutput"
Write-Host "SHA-256: $($outputHash.Hash)"
Write-Host "Reports: $reportDirectory"
