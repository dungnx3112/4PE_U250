# Usage:
#   vivado -mode batch -source verify_300mhz_routed.tcl -tclargs \
#     <routed.dcp> <output_directory>
#
# This is a hard build gate: an XCLBIN is not accepted unless both setup and
# hold timing close on the routed checkpoint.

if {$argc != 2} {
    error "Usage: verify_300mhz_routed.tcl <routed.dcp> <output_directory>"
}

set dcp_path [file normalize [lindex $argv 0]]
set report_dir [file normalize [lindex $argv 1]]
if {![file exists $dcp_path]} {
    error "Routed checkpoint does not exist: $dcp_path"
}
file mkdir $report_dir

open_checkpoint $dcp_path

set setup_paths [get_timing_paths -quiet -delay_type max -max_paths 1 -nworst 1]
set hold_paths [get_timing_paths -quiet -delay_type min -max_paths 1 -nworst 1]
if {[llength $setup_paths] != 1} {
    error "Timing gate could not obtain a worst setup path"
}
if {[llength $hold_paths] != 1} {
    error "Timing gate could not obtain a worst hold path"
}

set wns [get_property SLACK [lindex $setup_paths 0]]
set whs [get_property SLACK [lindex $hold_paths 0]]
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
puts $result "WNS=$wns"
puts $result "WHS=$whs"
puts $result "setup_failing=$setup_failing"
puts $result "hold_failing=$hold_failing"
puts $result "routable_nets=$routable_nets"
puts $result "fully_routed_nets=$fully_routed_nets"
puts $result "route_errors=$route_errors"
puts $result "drc_errors=$drc_errors"
close $result

puts "INFO: 300MHz timing gate: WNS=$wns WHS=$whs routed=$fully_routed_nets/$routable_nets route_errors=$route_errors drc_errors=$drc_errors"
if {$routable_nets != $fully_routed_nets || $route_errors != 0} {
    close_design
    error "300MHz route gate failed: routed=$fully_routed_nets/$routable_nets route_errors=$route_errors"
}
if {$drc_errors != 0} {
    close_design
    error "300MHz DRC gate failed: drc_errors=$drc_errors"
}
if {$setup_failing != 0 || $hold_failing != 0 || $wns < 0.0 || $whs < 0.0} {
    close_design
    error "300MHz timing gate failed: WNS=$wns WHS=$whs"
}

puts "INFO: 300MHz timing gate: TIMING_CLOSED"
close_design
