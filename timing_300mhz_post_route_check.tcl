# Final post-route guard for the U250 300 MHz build.
# This hook runs after post-route physical optimization and deliberately makes
# the link fail unless routing, DRC and both setup/hold timing are clean.

puts "INFO: loading [file normalize [info script]]"

set run_directory [pwd]
if {![catch {set candidate_run_directory [get_property DIRECTORY [current_run]]}] &&
        $candidate_run_directory ne ""} {
    set run_directory $candidate_run_directory
}

set route_report_path [file normalize [file join $run_directory final_route_status.rpt]]
redirect -variable route_report {report_route_status}
set route_report_file [open $route_report_path w]
puts $route_report_file $route_report
close $route_report_file

proc require_route_count_zero {label pattern report} {
    if {![regexp $pattern $report -> count]} {
        error "300MHz post-route: could not parse '$label' from route status report"
    }
    puts "INFO: 300MHz post-route: $label=$count"
    if {$count != 0} {
        error "300MHz post-route: $label must be zero, got $count"
    }
}

require_route_count_zero "unrouted nets" \
    {# of unrouted nets[. ]*:[[:space:]]*([0-9]+)[[:space:]]*:} $route_report
require_route_count_zero "nets with routing errors" \
    {# of nets with routing errors[. ]*:[[:space:]]*([0-9]+)[[:space:]]*:} $route_report

set timing_report_path [file normalize [file join $run_directory final_timing_summary.rpt]]
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -max_paths 50 -input_pins -file $timing_report_path

set setup_paths [get_timing_paths -quiet -delay_type max -max_paths 1 -nworst 1]
set hold_paths [get_timing_paths -quiet -delay_type min -max_paths 1 -nworst 1]
if {[llength $setup_paths] == 0 || [llength $hold_paths] == 0} {
    error "300MHz post-route: could not obtain both setup and hold timing paths"
}
set wns [get_property SLACK [lindex $setup_paths 0]]
set whs [get_property SLACK [lindex $hold_paths 0]]
puts "INFO: 300MHz post-route: WNS=$wns ns WHS=$whs ns"
if {[expr {double($wns) < 0.0}]} {
    error "300MHz post-route: setup timing failed (WNS=$wns ns)"
}
if {[expr {double($whs) < 0.0}]} {
    error "300MHz post-route: hold timing failed (WHS=$whs ns)"
}

set drc_report_path [file normalize [file join $run_directory final_drc.rpt]]
report_drc -ruledeck default -file $drc_report_path
set drc_errors [get_drc_violations -quiet -filter {SEVERITY == Error}]
puts "INFO: 300MHz post-route: DRC errors=[llength $drc_errors]"
if {[llength $drc_errors] != 0} {
    set examples [lrange $drc_errors 0 4]
    error "300MHz post-route: DRC Error violations remain; examples: [join $examples {, }]"
}

puts "INFO: 300MHz floorplan: ROUTE_AND_TIMING_VALIDATED"
