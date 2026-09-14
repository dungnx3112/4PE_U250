[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Platform,

    [string]$Output = "int4_decoder_multikernel_300mhz.xclbin",

    [string]$VppPath = "C:\Xilinx\Vitis\2023.2\bin\v++.bat",

    [string]$VitisHlsPath = "C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat",

    [string]$VivadoPath = "C:\Xilinx\Vivado\2023.2\bin\vivado.bat",

    [switch]$RebuildXo
)

$ErrorActionPreference = "Stop"

$scriptDirectory = $PSScriptRoot
if (Test-Path (Join-Path $scriptDirectory "kernel_HLS")) {
    $repoRoot = $scriptDirectory
    $kernelDir = Join-Path $scriptDirectory "kernel_HLS"
} elseif (Test-Path (Join-Path (Split-Path $scriptDirectory -Parent) "kernel_HLS")) {
    $repoRoot = Split-Path $scriptDirectory -Parent
    $kernelDir = Join-Path $repoRoot "kernel_HLS"
} else {
    $repoRoot = $scriptDirectory
    $kernelDir = $scriptDirectory
}

$sourceDirectory = $scriptDirectory
$configPath = Join-Path $scriptDirectory "link_decoder_multikernel_300mhz.cfg"
$hlsScriptPath = Join-Path $scriptDirectory "run_hls_decoder_multikernel.tcl"
$timingGatePath = Join-Path $scriptDirectory "verify_300mhz_routed.tcl"
$xoPaths = 0..3 | ForEach-Object {
    Join-Path $repoRoot "int4_decoder_pe${_}_kernel_300mhz.xo"
}
$hlsInputs = @(
    (Join-Path $kernelDir "swiftkv_attention.cpp"),
    (Join-Path $kernelDir "swiftkv_attention.hpp"),
    (Join-Path $kernelDir "int4_linear_controller.cpp"),
    (Join-Path $kernelDir "int4_linear_controller.hpp"),
    (Join-Path $kernelDir "int4_decoder_blocks.cpp"),
    (Join-Path $kernelDir "int4_decoder_blocks.hpp"),
    (Join-Path $kernelDir "int4_decoder_controller.cpp"),
    (Join-Path $kernelDir "int4_decoder_controller.hpp"),
    (Join-Path $kernelDir "int4_decoder_local.hpp"),
    (Join-Path $kernelDir "int4_decoder_multikernel.cpp"),
    (Join-Path $kernelDir "int4_decoder_multikernel.hpp"),
    (Join-Path $kernelDir "int4_decoder_schedule.hpp"),
    (Join-Path $kernelDir "int4_model_layout.hpp"),
    (Join-Path $kernelDir "int4_numeric.hpp"),
    (Join-Path $kernelDir "int4_task_control.hpp"),
    (Join-Path $kernelDir "int4_types.hpp"),
    $hlsScriptPath
)

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
    $hadTargetFreq = Test-Path Env:TARGET_FREQ
    $savedTargetFreq = $env:TARGET_FREQ
    Push-Location $sourceDirectory
    try {
        Remove-Item Env:INT4_DECODER_PE -ErrorAction SilentlyContinue
        $env:TARGET_FREQ = "300mhz"
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
        if ($hadTargetFreq) {
            $env:TARGET_FREQ = $savedTargetFreq
        } else {
            Remove-Item Env:TARGET_FREQ -ErrorAction SilentlyContinue
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

$buildDirectory = Join-Path $repoRoot "build_multikernel_300mhz"
$runId = "{0}-{1}" -f (Get-Date -Format "yyyyMMdd-HHmmss"), $PID
$runDirectory = Join-Path $buildDirectory (Join-Path "runs" $runId)
$tempDirectory = Join-Path $runDirectory "temp"
$logDirectory = Join-Path $runDirectory "logs"
$reportDirectory = Join-Path $runDirectory "reports"
$candidateOutput = Join-Path $runDirectory "int4_decoder_multikernel_300mhz.candidate.xclbin"
foreach ($directory in @($tempDirectory, $logDirectory, $reportDirectory)) {
    New-Item -ItemType Directory -Force -Path $directory | Out-Null
}

$resolvedOutput = if ([System.IO.Path]::IsPathRooted($Output)) {
    $Output
} else {
    Join-Path $repoRoot $Output
}
$resolvedOutputDirectory = Split-Path -Parent $resolvedOutput
if ($resolvedOutputDirectory) {
    New-Item -ItemType Directory -Force -Path $resolvedOutputDirectory | Out-Null
}

# Patch config file with absolute paths
$constraintsDir = if (Test-Path (Join-Path $repoRoot "constraints")) {
    Join-Path $repoRoot "constraints"
} else {
    Join-Path $sourceDirectory "constraints"
}
$prePlaceTcl = (Join-Path $constraintsDir "pre_place.tcl").Replace('\', '/')
$prePhysoptTcl = (Join-Path $constraintsDir "pre_physopt.tcl").Replace('\', '/')
$configPatched = Join-Path $tempDirectory "link_decoder_multikernel_300mhz_patched.cfg"
$cfgRaw = Get-Content -LiteralPath $configPath -Raw
$cfgPatched = $cfgRaw.Replace("__PRE_PLACE_TCL__", $prePlaceTcl).Replace("__PRE_PHYSOPT_TCL__", $prePhysoptTcl)
[System.IO.File]::WriteAllText($configPatched, $cfgPatched, [System.Text.Encoding]::UTF8)

$vppArguments = @(
    "--link",
    "--target", "hw",
    "--platform", $Platform,
    "--save-temps",
    "--config", $configPatched,
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

# Publish output
Move-Item -LiteralPath $candidateOutput -Destination $resolvedOutput -Force
$outputHash = Get-FileHash -LiteralPath $resolvedOutput -Algorithm SHA256
Write-Host "300MHz multi-kernel build: SUCCESSFUL"
Write-Host "XCLBIN: $resolvedOutput"
Write-Host "SHA-256: $($outputHash.Hash)"
Write-Host "Reports: $reportDirectory"