# Final post-route guard for the U250 300 MHz build.
# This hook runs after post-route physical optimization and deliberately makes
# the link fail unless routing, DRC and both setup/hold timing are clean.

puts "INFO: loading [file normalize [info script]]"

set run_directory [pwd]
# A DCP opened outside its original implementation project can retain a
# relative current_run DIRECTORY (typically .runs/impl_1).  In that case the
# directory is metadata from the checkpoint, not a usable report location.
# Standalone timing gates may also provide an explicit destination before
# sourcing this hook.
if {[info exists timing300_report_directory] &&
        $timing300_report_directory ne ""} {
    set run_directory [file normalize $timing300_report_directory]
} elseif {![catch {
        set candidate_run_directory [get_property DIRECTORY [current_run]]
    }] && $candidate_run_directory ne "" &&
        [file isdirectory $candidate_run_directory]} {
    set run_directory [file normalize $candidate_run_directory]
}
file mkdir $run_directory
puts "INFO: 300MHz post-route: report_directory=$run_directory"

set route_report_path [file normalize [file join $run_directory final_route_status.rpt]]
# Use the report command's native file output.  `redirect` is unavailable in
# the Vitis-generated implementation hook interpreter.
report_route_status -file $route_report_path
set route_report_file [open $route_report_path r]
set route_report [read $route_report_file]
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
