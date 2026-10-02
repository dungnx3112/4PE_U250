param(
    [string]$Vivado  = "C:\Xilinx\Vivado\2023.2\bin\vivado.bat",
    [string]$VitisHls = "C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat"
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot  = (Resolve-Path (Join-Path $ScriptDir "..")).Path

# --- paths ---
$OldRtl = Join-Path $RepoRoot "proj_synth_pe0_verify\solution_300mhz\syn\verilog"
$NewProj = Join-Path $ScriptDir "proj_pe0_latency1"
$NewRtl  = Join-Path $NewProj  "solution_300mhz\syn\verilog"
$DiffDir = Join-Path $ScriptDir "diff_latency1_vs_latency2"
New-Item -ItemType Directory -Force -Path $DiffDir | Out-Null

# --- sanity: confirm the source pragma is now latency=1 ---
$ControllerSrc = Join-Path $RepoRoot "kernel_HLS\int4_decoder_controller.cpp"
$found = Select-String -Path $ControllerSrc -Pattern 'activation_q.*latency=1'
if (-not $found) {
    throw "ERROR: kernel_HLS\int4_decoder_controller.cpp still has latency=2 for activation_q. Edit it first."
}
Write-Host "[OK] Source confirmed: activation_q latency=1"

# --- write synthesis TCL for the new project ---
$SynthTcl = Join-Path $DiffDir "synth_pe0_latency1.tcl"
$KernelDir = Join-Path $RepoRoot "kernel_HLS"
@"
set repo_root [file normalize "$($RepoRoot.Replace('\','/'))" ]
set kernel_dir "$($KernelDir.Replace('\','/'))"
set project_dir "$($NewProj.Replace('\','/'))"

open_project -reset `$project_dir
set_top int4_decoder_pe0_kernel

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -I`$kernel_dir"
foreach source [list \
    [file join `$kernel_dir "swiftkv_attention.cpp"] \
    [file join `$kernel_dir "int4_linear_controller.cpp"] \
    [file join `$kernel_dir "int4_decoder_blocks.cpp"] \
    [file join `$kernel_dir "int4_decoder_controller.cpp"] \
    [file join `$kernel_dir "int4_decoder_multikernel.cpp"]] {
    add_files `$source -cflags `$cflags
}

open_solution -reset solution_300mhz -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.0 -name default
set_clock_uncertainty 0.270

config_interface -m_axi_latency 64
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
config_interface -m_axi_register_io all
config_interface -m_axi_buffer_impl auto
config_rtl -register_reset_num 3
config_dataflow -start_fifo_depth 8

csynth_design
exit
"@ | Set-Content -Encoding UTF8 $SynthTcl
Write-Host "[+] Synthesis TCL written: $SynthTcl"

# --- run HLS synthesis ---
if (-not (Test-Path $VitisHls)) { throw "Vitis HLS not found: $VitisHls" }
Write-Host "`n[+] Running HLS synthesis (latency=1) — this takes ~20-40 min ..."
$LogFile = Join-Path $DiffDir "synth_latency1.log"
& $VitisHls -f $SynthTcl 2>&1 | Tee-Object -FilePath $LogFile
if ($LASTEXITCODE -ne 0) { throw "HLS synthesis failed. See $LogFile" }
Write-Host "[+] Synthesis done."

# --- check new RTL exists ---
if (-not (Test-Path $NewRtl)) { throw "New RTL not found after synthesis: $NewRtl" }

# ===== RTL DIFF =====

function Compare-RtlFile($Name) {
    $Old = Join-Path $OldRtl $Name
    $New = Join-Path $NewRtl $Name
    $Out = Join-Path $DiffDir ($Name -replace '\.v$', '.diff')
    if (-not (Test-Path $Old)) { Write-Host "  SKIP (old not found): $Name"; return }
    if (-not (Test-Path $New)) { Write-Host "  SKIP (new not found): $Name"; return }
    $lines = (git diff --no-index $Old $New 2>&1)
    $lines | Set-Content -Encoding UTF8 $Out
    $changed = ($lines | Where-Object { ($_ -cmatch '^[+]' -or $_ -cmatch '^[-]') -and ($_ -notmatch '^[-]{3} ' -and $_ -notmatch '^\.{3} ') }).Count
    Write-Host "  $Name  changed_lines=$changed  -> $Out"
}

Write-Host "`n===== RTL DIFF: latency=1  vs  latency=2 ====="

# Key file 1: BRAM wrapper — should lose q0_t1 register entirely
Compare-RtlFile "int4_decoder_pe0_kernel_int4_decoder_local_pe_0_activation_q_RAM_2P_BRAM_2R1W.v"

# Key file 2: accumulate FSM — ce0 guard logic + load_reg latch timing changes
$OldFiles = Get-ChildItem $OldRtl -Filter "*accumulate*0_s.v" | Select-Object -First 1
$NewFiles = Get-ChildItem $NewRtl -Filter "*accumulate*0_s.v" | Select-Object -First 1
if ($OldFiles -and $NewFiles) {
    $Out = Join-Path $DiffDir "accumulate_fsm.diff"
    $lines = (git diff --no-index $OldFiles.FullName $NewFiles.FullName 2>&1)
    $lines | Set-Content -Encoding UTF8 $Out
    $changed = ($lines | Where-Object { ($_ -cmatch '^[+]' -or $_ -cmatch '^[-]') -and ($_ -notmatch '^[-]{3} ' -and $_ -notmatch '^\.{3} ') }).Count
    Write-Host "  accumulate_0_s.v  changed_lines=$changed  -> $Out"
} else {
    Write-Host "  SKIP accumulate FSM (file not found in one side)"
}

# Key file 3: parent local_pe_0 (should be largely unchanged)
Compare-RtlFile "int4_decoder_pe0_kernel_int4_decoder_local_pe_0.v"

Write-Host "`n===== EXPECTED DIFF SUMMARY ====="
Write-Host "  BRAM wrapper  : q0_t1 register REMOVED; assign q0 = q0_t0 directly"
Write-Host "  accumulate FSM: load_reg latch cycle shifts by 1; ce0 guard simplified"
Write-Host "  parent pe_0   : ce0 route in state12 unchanged (BRAM wrapper differs, not mux)"
Write-Host "`n[+] Diff files written to: $DiffDir"
