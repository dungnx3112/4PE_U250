# Usage:
#   vivado -mode batch -source verify_300mhz_routed.tcl -tclargs \
#     <routed.dcp> <output_directory> ?gate_label?
#
# This is a hard build gate: an XCLBIN is not accepted unless both setup and
# hold timing close on the routed checkpoint.

if {$argc < 2 || $argc > 3} {
    error "Usage: verify_300mhz_routed.tcl <routed.dcp> <output_directory> ?gate_label?"
}

set dcp_path [file normalize [lindex $argv 0]]
set report_dir [file normalize [lindex $argv 1]]
set gate_label "300MHz"
if {$argc == 3} {
    set gate_label [lindex $argv 2]
}
if {![file exists $dcp_path]} {
    error "Routed checkpoint does not exist: $dcp_path"
}
file mkdir $report_dir

proc require_numeric_path_slack {paths label} {
    if {[llength $paths] != 1} {
        error "Timing gate could not obtain exactly one $label path"
    }
    set path [lindex $paths 0]
    if {$path eq "" || [string equal -nocase $path "null"]} {
        error "Timing gate received a null Vivado object for the worst $label path"
    }
    set slack ""
    if {[catch {set slack [get_property SLACK $path]} message]} {
        error "Timing gate could not read $label slack from the current routed design: $message"
    }
    if {![string is double -strict $slack]} {
        error "Timing gate received non-numeric $label slack '$slack'"
    }
    return $slack
}

open_checkpoint $dcp_path

# A passing 270 MHz DCP must never be accepted as a 300 MHz image merely
# because this script was given a 300MHz label.  Vitis names the generated
# kernel clock consistently for this platform; validate its actual period in
# the routed checkpoint before looking at slack.
set expected_kernel_period_ns 3.333333
set kernel_clock_name clk_out1_ulp_clk_wiz_0
set kernel_clocks [get_clocks -quiet $kernel_clock_name]
if {[llength $kernel_clocks] != 1} {
    error "$gate_label timing gate expected exactly one '$kernel_clock_name' clock, found [llength $kernel_clocks]"
}
set kernel_period_ns [get_property PERIOD [lindex $kernel_clocks 0]]
if {![string is double -strict $kernel_period_ns]} {
    error "$gate_label timing gate received non-numeric kernel period '$kernel_period_ns'"
}
if {abs($kernel_period_ns - $expected_kernel_period_ns) > 0.002} {
    error "$gate_label timing gate rejected routed clock period ${kernel_period_ns}ns; expected ${expected_kernel_period_ns}ns (300 MHz)"
}

set setup_paths [get_timing_paths -quiet -delay_type max -max_paths 1 -nworst 1]
set hold_paths [get_timing_paths -quiet -delay_type min -max_paths 1 -nworst 1]
set wns [require_numeric_path_slack $setup_paths setup]
set whs [require_numeric_path_slack $hold_paths hold]
set setup_failing [llength [get_timing_paths -quiet -delay_type max \
    -slack_lesser_than 0.0 -max_paths 1 -nworst 1]]
set hold_failing [llength [get_timing_paths -quiet -delay_type min \
    -slack_lesser_than 0.0 -max_paths 1 -nworst 1]]

report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -max_paths 100 -input_pins \
    -file [file join $report_dir timing_gate_summary.rpt]

set route_status [report_route_status -return_string]
set route_report [open [file join $report_dir timing_gate_route_status.rpt] w]
puts $route_report $route_status
close $route_report
if {![regexp {# of routable nets\.*\s*:\s*([0-9]+)} \
        $route_status -> routable_nets] ||
    ![regexp {# of fully routed nets\.*\s*:\s*([0-9]+)} \
        $route_status -> fully_routed_nets] ||
    ![regexp {# of nets with routing errors\.*\s*:\s*([0-9]+)} \
        $route_status -> route_errors]} {
    error "Timing gate could not parse report_route_status"
}

report_drc -ruledecks default -file [file join $report_dir timing_gate_drc.rpt]
set drc_errors [llength [get_drc_violations -quiet -filter {SEVERITY == Error}]]

set result_path [file join $report_dir timing_gate.txt]
set result [open $result_path w]
puts $result "checkpoint=$dcp_path"
puts $result "kernel_clock=$kernel_clock_name"
puts $result "kernel_period_ns=$kernel_period_ns"
puts $result "WNS=$wns"
puts $result "WHS=$whs"
puts $result "setup_failing=$setup_failing"
puts $result "hold_failing=$hold_failing"
puts $result "routable_nets=$routable_nets"
puts $result "fully_routed_nets=$fully_routed_nets"
puts $result "route_errors=$route_errors"
puts $result "drc_errors=$drc_errors"
close $result

puts "INFO: $gate_label timing gate: clock=$kernel_clock_name period_ns=$kernel_period_ns WNS=$wns WHS=$whs routed=$fully_routed_nets/$routable_nets route_errors=$route_errors drc_errors=$drc_errors"
if {$routable_nets != $fully_routed_nets || $route_errors != 0} {
    close_design
    error "$gate_label route gate failed: routed=$fully_routed_nets/$routable_nets route_errors=$route_errors"
}
if {$drc_errors != 0} {
    close_design
    error "$gate_label DRC gate failed: drc_errors=$drc_errors"
}
if {$setup_failing != 0 || $hold_failing != 0 || $wns < 0.0 || $whs < 0.0} {
    close_design
    error "$gate_label timing gate failed: WNS=$wns WHS=$whs"
}

puts "INFO: $gate_label timing gate: TIMING_CLOSED"
close_design
