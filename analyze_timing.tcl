set output_dir "c:/KLTN/4PE_U250/0909_2345"
file mkdir $output_dir

open_checkpoint "c:/KLTN/4PE_U250/level0_wrapper_routed.dcp"

# Report overall timing summary
report_timing_summary -file $output_dir/timing_summary.txt

# Report worst setup paths
report_timing -delay_type max -max_paths 100 -sort_by group -input_pins -routable_nets -file $output_dir/worst_setup_paths.txt

# Report design analysis to see logic depth, fanout, and routing delay
report_design_analysis -timing -setup -max_paths 100 -file $output_dir/design_analysis.txt

exit
