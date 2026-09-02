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
$postPlacePath = Join-Path $sourceDirectory "timing_300mhz_post_place.tcl"
$slrDomainsPath = Join-Path $sourceDirectory "timing_300mhz_domains.tcl"
$prePhysoptPath = Join-Path $sourceDirectory "timing_300mhz_pre_physopt.tcl"
$timingGatePath = Join-Path $sourceDirectory "verify_300mhz_routed.tcl"
$postRouteReportPath = Join-Path $sourceDirectory "report_300mhz_post_route.tcl"
$targetFrequencyHz = 300000000
$kernelClock = "int4_decoder_token_controller_1.ap_clk"
$buildDirectory = Join-Path $workspaceDirectory "build_300mhz"
$runId = "{0}-{1}" -f (Get-Date -Format "yyyyMMdd-HHmmss"), $PID
$runDirectory = Join-Path $buildDirectory (Join-Path "runs" $runId)
$tempDirectory = Join-Path $runDirectory "temp"
$logDirectory = Join-Path $runDirectory "logs"
$reportDirectory = Join-Path $runDirectory "reports"
$resolvedConfigPath = Join-Path $runDirectory "link_300mhz.resolved.cfg"
$candidateOutput = Join-Path $runDirectory "int4_decoder_token_controller_300mhz.candidate.xclbin"

foreach ($requiredPath in @(
    $VppPath,
    $VivadoPath,
    $Platform,
    $xoPath,
    $baseConfigPath,
    $prePlacePath,
    $postPlacePath,
    $slrDomainsPath,
    $prePhysoptPath,
    $timingGatePath,
    $postRouteReportPath
)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required build input does not exist: $requiredPath"
    }
}

$xoTimestamp = (Get-Item -LiteralPath $xoPath).LastWriteTimeUtc
$newerHlsInputs = @(
    Get-ChildItem -LiteralPath $sourceDirectory -File |
        Where-Object {
            $_.Extension -in @(".cpp", ".hpp") -or
            $_.Name -in @(
                "run_hls_300mhz.tcl",
                "patch_partitioned_entry_proc.tcl",
                "verify_generated_rtl_300mhz.tcl")
        } |
        Where-Object { $_.LastWriteTimeUtc -gt $xoTimestamp }
)
if ($newerHlsInputs.Count -gt 0) {
    throw "XO is stale relative to HLS source. Rebuild int4_decoder_token_controller_300mhz.xo before linking."
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
$vivadoPostPlacePath = (Resolve-Path -LiteralPath $postPlacePath).Path.Replace("\", "/")
$vivadoPrePhysoptPath = (Resolve-Path -LiteralPath $prePhysoptPath).Path.Replace("\", "/")
$prePlaceProperty =
    "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=$vivadoPrePlacePath"
$prePhysoptProperty =
    "prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.TCL.PRE=$vivadoPrePhysoptPath"
$postPlaceProperty =
    "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.POST=$vivadoPostPlacePath"
$baseConfig = Get-Content -LiteralPath $baseConfigPath
$expectedFrequencyProperty = "freqhz=$targetFrequencyHz`:$kernelClock"
if (@($baseConfig | Where-Object { $_ -eq $expectedFrequencyProperty }).Count -ne 1) {
    throw "Base config must contain exactly one '$expectedFrequencyProperty' entry."
}
$resolvedConfig = $baseConfig `
    -replace '^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.PRE=.*$', $prePlaceProperty `
    -replace '^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.POST=.*$', $postPlaceProperty `
    -replace '^prop=run\.impl_1\.STEPS\.PHYS_OPT_DESIGN\.TCL\.PRE=.*$', $prePhysoptProperty
if (@($resolvedConfig | Where-Object { $_ -eq $prePlaceProperty }).Count -ne 1) {
    throw "Could not inject exactly one Vivado pre-place hook into the resolved link config."
}
if (@($resolvedConfig | Where-Object { $_ -eq $prePhysoptProperty }).Count -ne 1) {
    throw "Could not inject exactly one Vivado pre-physopt hook into the resolved link config."
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
    "--output", $candidateOutput,
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
$localDomainsMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: LOCAL_DOMAINS_APPLIED" -List
$registeredBoundariesMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: REGISTERED_BOUNDARIES_APPLIED" -List
$leafFloorplanMarker = $implementationLogs | Select-String -Pattern "300MHz floorplan: LEAF_PRIMITIVE_OWNERSHIP_APPLIED" -List
$leafPlacementMarker = $implementationLogs | Select-String -Pattern "300MHz post-place: LEAF_OWNERSHIP_VERIFIED" -List
$toolDrivenPhysoptMarker = $implementationLogs | Select-String -Pattern "300MHz physopt: TOOL_DRIVEN_PHYSOPT" -List

if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $floorplanMarker) {
    throw "Vivado implementation ran without the required 300 MHz floorplan hook."
}
if ($floorplanMarker) {
    Write-Host "Verified: 300 MHz PE/SLR floorplan hook was applied."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $localDomainsMarker) {
    throw "Vivado implementation ran without the four local PE/AXI/config domains."
}
if ($localDomainsMarker) {
    Write-Host "Verified: four local PE/AXI/config domains were assigned to SLR0-SLR3."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $registeredBoundariesMarker) {
    throw "Vivado implementation ran without the registered inter-SLR boundary assignments."
}
if ($registeredBoundariesMarker) {
    Write-Host "Verified: position, pair-reduction and completion boundaries were localized."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $leafFloorplanMarker) {
    throw "Vivado implementation ran without leaf-primitive SLR ownership."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $leafPlacementMarker) {
    throw "Vivado placement did not verify physical leaf ownership."
}
if ($leafPlacementMarker) {
    Write-Host "Verified: every owned PE/AXI/memory leaf stayed in its assigned SLR."
}
if (($implementationLogs.Count -gt 0 -or $linkExitCode -eq 0) -and
    -not $toolDrivenPhysoptMarker) {
    throw "Vivado implementation ran without the tool-driven physopt hook."
}
if ($toolDrivenPhysoptMarker) {
    Write-Host "Verified: custom physopt mutations were disabled in favor of the Vivado strategy."
}
if ($linkExitCode -ne 0) {
    exit $linkExitCode
}

if (-not (Test-Path -LiteralPath $candidateOutput -PathType Leaf) -or
    (Get-Item -LiteralPath $candidateOutput).Length -eq 0) {
    throw "v++ returned success but candidate XCLBIN is missing or empty: $candidateOutput"
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
if (-not (Select-String -LiteralPath $timingGateLog `
        -Pattern "300MHz timing gate: ROUTED_LEAF_OWNERSHIP_CLEAN" -Quiet)) {
    throw "Vivado timing gate did not verify routed leaf ownership. See: $timingGateLog"
}

$postRouteLog = Join-Path $logDirectory "post_route_slr_audit.log"
$postRouteArguments = @(
    "-mode", "batch",
    "-notrace",
    "-source", $postRouteReportPath,
    "-tclargs", $routedCheckpoint, $reportDirectory
)
Write-Host "Running full SLR-sequence audit on: $routedCheckpoint"
& $VivadoPath @postRouteArguments 2>&1 | Tee-Object -FilePath $postRouteLog
$postRouteExitCode = $LASTEXITCODE
if ($postRouteExitCode -ne 0) {
    throw "Vivado post-route SLR audit failed with exit code $postRouteExitCode. See: $postRouteLog"
}
if (-not (Select-String -LiteralPath $postRouteLog `
        -Pattern "300MHz post-route: SLR_PATH_AUDIT_COMPLETE" -Quiet)) {
    throw "Vivado post-route report did not complete the SLR path audit. See: $postRouteLog"
}
if (-not (Select-String -LiteralPath $postRouteLog `
        -Pattern "300MHz post-route: INTERNAL_SLR_TOPOLOGY_CLEAN" -Quiet)) {
    throw "Vivado post-route audit found a kernel-internal SLR detour. See: $postRouteLog"
}

# Preserve any previously accepted image until every gate for this run passes.
Move-Item -LiteralPath $candidateOutput -Destination $resolvedOutput -Force
$outputHash = Get-FileHash -LiteralPath $resolvedOutput -Algorithm SHA256
Write-Host "300MHz build gate: ACCEPTED_XCLBIN_PUBLISHED"
Write-Host "XCLBIN build completed: $resolvedOutput"
Write-Host "SHA-256: $($outputHash.Hash)"
Write-Host "Reports: $reportDirectory"
