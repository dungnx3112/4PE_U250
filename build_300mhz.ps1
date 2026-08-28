[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Platform,

    [string]$Output = "int4_decoder_token_controller_300mhz.xclbin",

    [string]$VppPath = "C:\Xilinx\Vitis\2023.2\bin\v++.bat"
)

$ErrorActionPreference = "Stop"

$sourceDirectory = $PSScriptRoot
$workspaceDirectory = Split-Path -Parent $sourceDirectory
$xoPath = Join-Path $sourceDirectory "int4_decoder_token_controller_300mhz.xo"
$baseConfigPath = Join-Path $sourceDirectory "link_300mhz.cfg"
$prePlacePath = Join-Path $sourceDirectory "timing_300mhz_pre_place.tcl"
$postPlacePath = Join-Path $sourceDirectory "timing_300mhz_post_place_check.tcl"
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
    $xoPath,
    $baseConfigPath,
    $prePlacePath,
    $postPlacePath
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
# not reliably relative to the shell launch directory. Resolve both hooks
# immediately before every link so the floorplan cannot disappear when the
# project moves or when the build runs on a different host.
$vivadoPrePlacePath = (Resolve-Path -LiteralPath $prePlacePath).Path.Replace("\", "/")
$vivadoPostPlacePath = (Resolve-Path -LiteralPath $postPlacePath).Path.Replace("\", "/")
$prePlaceProperty =
    "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=$vivadoPrePlacePath"
$postPlaceProperty =
    "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.POST=$vivadoPostPlacePath"
$baseConfig = Get-Content -LiteralPath $baseConfigPath
$expectedFrequencyProperty = "freqhz=$targetFrequencyHz`:$kernelClock"
if (@($baseConfig | Where-Object { $_ -eq $expectedFrequencyProperty }).Count -ne 1) {
    throw "Base config must contain exactly one '$expectedFrequencyProperty' entry."
}
$resolvedConfig = $baseConfig `
    -replace '^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.PRE=.*$', $prePlaceProperty `
    -replace '^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.POST=.*$', $postPlaceProperty
if (@($resolvedConfig | Where-Object { $_ -eq $prePlaceProperty }).Count -ne 1) {
    throw "Could not inject exactly one Vivado pre-place hook into the resolved link config."
}
if (@($resolvedConfig | Where-Object { $_ -eq $postPlaceProperty }).Count -ne 1) {
    throw "Could not inject exactly one Vivado post-place hook into the resolved link config."
}
$resolvedConfig | Set-Content -LiteralPath $resolvedConfigPath -Encoding Ascii
Write-Host "Build run directory: $runDirectory"

$resolvedOutput = if ([System.IO.Path]::IsPathRooted($Output)) {
    $Output
} else {
    Join-Path $workspaceDirectory $Output
}

$vppArguments = @(
    "--link",
    "--target", "hw",
    "--platform", $Platform,
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
$pairLocalMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: PAIR_LOCAL_APPLIED" -List
$postPlaceMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED" -List

if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $floorplanMarker) {
    throw "Vivado implementation ran without the required 300 MHz floorplan hook."
}
if ($floorplanMarker) {
    Write-Host "Verified: 300 MHz PE/SLR floorplan hook was applied."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $pairLocalMarker) {
    throw "Vivado implementation ran without the required pair-local SLR anchors."
}
if ($pairLocalMarker) {
    Write-Host "Verified: pair01/pair23 broadcast and gather anchors were applied."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $postPlaceMarker) {
    throw "Vivado placement did not pass the required physical SLR checks."
}
if ($postPlaceMarker) {
    Write-Host "Verified: placed PE, AXI and control primitives stayed in their assigned SLRs."
}

if ($linkExitCode -ne 0) {
    exit $linkExitCode
}
