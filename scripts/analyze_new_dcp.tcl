set output_dir c:/KLTN/4PE_U250/report_0911_new
file mkdir 

puts === OPENING CHECKPOINT level0_wrapper_routed.dcp ===
open_checkpoint c:/KLTN/4PE_U250/level0_wrapper_routed.dcp

puts === REPORTING TIMING SUMMARY ===
report_timing_summary -delay_type min_max -max_paths 50 -input_pins -file /timing_summary.txt

puts === REPORTING WORST SETUP PATHS (100) ===
report_timing -delay_type max -max_paths 100 -nworst 1 -sort_by group -path_type full_clock_expanded -input_pins -file /worst_setup_100.rpt

puts === REPORTING DESIGN ANALYSIS ===
catch { report_design_analysis -timing -setup -max_paths 50 -file /design_analysis_setup.rpt }
catch { report_design_analysis -congestion -file /congestion.rpt }

puts === REPORTING UTILIZATION SLR ===
catch { report_utilization -slr -file /utilization_slr.rpt }

puts === REPORTING HIGH FANOUT NETS ===
catch { report_high_fanout_nets -timing -load_types -max_nets 100 -file /high_fanout.rpt }

# Print summary to stdout
set wns_path [get_timing_paths -quiet -delay_type max -max_paths 1 -nworst 1]
set whs_path [get_timing_paths -quiet -delay_type min -max_paths 1 -nworst 1]

if {[llength ] > 0} {
    set wns [get_property SLACK [lindex  0]]
    set src [get_property STARTPOINT_PIN [lindex  0]]
    set dst [get_property ENDPOINT_PIN [lindex  0]]
    puts RESULT_WNS: 
    puts RESULT_WNS_SOURCE: 
    puts RESULT_WNS_DEST: 
}
if {[llength ] > 0} {
    set whs [get_property SLACK [lindex  0]]
    puts RESULT_WHS: 
}

set failing_setup [llength [get_timing_paths -quiet -delay_type max -slack_lesser_than 0.0 -max_paths 100000 -nworst 1]]
puts RESULT_FAILING_SETUP_COUNT_SAMPLE: 

puts === ANALYSIS COMPLETE ===
exit
