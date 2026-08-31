[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Platform,

    [string]$Output = "int4_decoder_token_controller_300mhz.xclbin",

    [string]$VppPath = "C:\Xilinx\Vitis\2023.2\bin\v++.bat",

    [string]$VivadoPath = "C:\Xilinx\Vivado\2023.2\bin\vivado.bat"
)

$ErrorActionPreference = "Stop"

$sourceDirectory = $PSScriptRoot
$workspaceDirectory = Split-Path -Parent $sourceDirectory
$xoPath = Join-Path $sourceDirectory "int4_decoder_token_controller_300mhz.xo"
$baseConfigPath = Join-Path $sourceDirectory "link_300mhz.cfg"
$prePlacePath = Join-Path $sourceDirectory "timing_300mhz_pre_place.tcl"
$prePhysoptPath = Join-Path $sourceDirectory "timing_300mhz_pre_physopt.tcl"
$timingGatePath = Join-Path $sourceDirectory "verify_300mhz_routed.tcl"
$targetFrequencyHz = 300000000
$kernelClock = "int4_decoder_token_controller_1.ap_clk"
$buildDirectory = Join-Path $workspaceDirectory "build_300mhz"
$runId = "{0}-{1}" -f (Get-Date -Format "yyyyMMdd-HHmmss"), $PID
$runDirectory = Join-Path $buildDirectory (Join-Path "runs" $runId)
$tempDirectory = Join-Path $runDirectory "temp"
$logDirectory = Join-Path $runDirectory "logs"
$reportDirectory = Join-Path $runDirectory "reports"
$resolvedConfigPath = Join-Path $runDirectory "link_300mhz.resolved.cfg"

foreach ($requiredPath in @(
    $VppPath,
    $VivadoPath,
    $Platform,
    $xoPath,
    $baseConfigPath,
    $prePlacePath,
    $prePhysoptPath,
    $timingGatePath
)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required build input does not exist: $requiredPath"
    }
}

New-Item -ItemType Directory -Force -Path $buildDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $runDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $tempDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $logDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $reportDirectory | Out-Null

# Relative Tcl hooks are interpreted inside Vitis' generated Vivado project,
# not reliably relative to the shell launch directory. Resolve the pre-place hook
# immediately before every link so the floorplan cannot disappear when the
# project moves or when the build runs on a different host.
$vivadoPrePlacePath = (Resolve-Path -LiteralPath $prePlacePath).Path.Replace("\", "/")
$vivadoPrePhysoptPath = (Resolve-Path -LiteralPath $prePhysoptPath).Path.Replace("\", "/")
$prePlaceProperty =
    "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=$vivadoPrePlacePath"
$prePhysoptProperty =
    "prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.TCL.PRE=$vivadoPrePhysoptPath"
$baseConfig = Get-Content -LiteralPath $baseConfigPath
$expectedFrequencyProperty = "freqhz=$targetFrequencyHz`:$kernelClock"
if (@($baseConfig | Where-Object { $_ -eq $expectedFrequencyProperty }).Count -ne 1) {
    throw "Base config must contain exactly one '$expectedFrequencyProperty' entry."
}
$resolvedConfig = $baseConfig `
    -replace '^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.PRE=.*$', $prePlaceProperty `
    -replace '^prop=run\.impl_1\.STEPS\.PHYS_OPT_DESIGN\.TCL\.PRE=.*$', $prePhysoptProperty
if (@($resolvedConfig | Where-Object { $_ -eq $prePlaceProperty }).Count -ne 1) {
    throw "Could not inject exactly one Vivado pre-place hook into the resolved link config."
}
if (@($resolvedConfig | Where-Object { $_ -eq $prePhysoptProperty }).Count -ne 1) {
    throw "Could not inject exactly one Vivado pre-physopt hook into the resolved link config."
}
$resolvedConfig | Set-Content -LiteralPath $resolvedConfigPath -Encoding Ascii
Write-Host "Build run directory: $runDirectory"

$resolvedOutput = if ([System.IO.Path]::IsPathRooted($Output)) {
    $Output
} else {
    Join-Path $workspaceDirectory $Output
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
    "--freqhz", "$targetFrequencyHz`:$kernelClock",
    "--config", $resolvedConfigPath,
    "--temp_dir", $tempDirectory,
    "--log_dir", $logDirectory,
    "--report_dir", $reportDirectory,
    "--output", $resolvedOutput,
    $xoPath
)

Push-Location $workspaceDirectory
try {
    & $VppPath @vppArguments
    $linkExitCode = $LASTEXITCODE
} finally {
    Pop-Location
}

# Only inspect logs from this unique invocation.  Reusing a fixed temp
# directory allowed an old FLOORPLAN_APPLIED marker to make a later link pass
# verification even when its pre-place hook never ran.
$implementationLogs = @(
    Get-ChildItem -LiteralPath $tempDirectory -Filter "runme.log" -Recurse -File -ErrorAction SilentlyContinue
)
$floorplanMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: FLOORPLAN_APPLIED" -List
$taskAnchorMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: DATA_DRIVEN_TASK_ANCHORS_APPLIED" -List
$controlPhysoptMarker = $implementationLogs | Select-String -Pattern "300MHz control physopt: CONTROL_MEMORY_PATH_OPT_APPLIED" -List

if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $floorplanMarker) {
    throw "Vivado implementation ran without the required 300 MHz floorplan hook."
}
if ($floorplanMarker) {
    Write-Host "Verified: 300 MHz PE/SLR floorplan hook was applied."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $taskAnchorMarker) {
    throw "Vivado implementation ran without the PE-local KPN and registered boundary anchors."
}
if ($taskAnchorMarker) {
    Write-Host "Verified: PE-local KPN workers and registered SLR boundaries were anchored."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $controlPhysoptMarker) {
    throw "Vivado implementation ran without the scheduler-to-memory control physopt pass."
}
if ($controlPhysoptMarker) {
    Write-Host "Verified: top scheduler-to-memory control paths were replicated and optimized."
}
if ($linkExitCode -ne 0) {
    exit $linkExitCode
}

if (-not (Test-Path -LiteralPath $resolvedOutput -PathType Leaf) -or
    (Get-Item -LiteralPath $resolvedOutput).Length -eq 0) {
    throw "v++ returned success but XCLBIN is missing or empty: $resolvedOutput"
}

$routedCheckpoints = @(
    Get-ChildItem -LiteralPath $tempDirectory -Filter "*routed.dcp" `
        -Recurse -File -ErrorAction SilentlyContinue |
        Sort-Object -Property LastWriteTime
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
$timingGateArguments = @(
    "-mode", "batch",
    "-notrace",
    "-source", $timingGatePath,
    "-tclargs", $routedCheckpoint, $reportDirectory
)

Write-Host "Running hard setup/hold timing gate on: $routedCheckpoint"
& $VivadoPath @timingGateArguments 2>&1 | Tee-Object -FilePath $timingGateLog
$timingGateExitCode = $LASTEXITCODE
if ($timingGateExitCode -ne 0) {
    throw "Vivado timing gate failed with exit code $timingGateExitCode. See: $timingGateLog"
}
if (-not (Select-String -LiteralPath $timingGateLog `
        -Pattern "300MHz timing gate: TIMING_CLOSED" -Quiet)) {
    throw "Vivado timing gate did not emit TIMING_CLOSED. See: $timingGateLog"
}

$outputHash = Get-FileHash -LiteralPath $resolvedOutput -Algorithm SHA256
Write-Host "XCLBIN build completed: $resolvedOutput"
Write-Host "SHA-256: $($outputHash.Hash)"
Write-Host "Reports: $reportDirectory"
