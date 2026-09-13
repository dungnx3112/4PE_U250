# Force register replication on high-fanout or_ln2606 (fanout=571)
# This net is the pipeline enable in the SwiftKV RoPE attention loop.
# NOTE: After the RTL fix (direct indexing instead of packed>>=38), this net
# may no longer exist in fresh builds. This hook is a safety net for REUSE_XO builds.
set fanout_nets [get_nets -hierarchical -quiet -filter {NAME =~ *or_ln2606_reg_303_pp0_iter1_reg*}]
if {[llength $fanout_nets] > 0} {
    puts "INFO: Force-replicating [llength $fanout_nets] or_ln2606 high-fanout net(s)"
    phys_opt_design -force_replication_on_nets $fanout_nets
} else {
    puts "INFO: or_ln2606 net not present (RTL fix already eliminates it) - skipping"
}
