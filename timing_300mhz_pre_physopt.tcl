# Deliberately do not mutate the placed netlist here.
#
# The implementation strategy already runs AggressiveExplore phys_opt_design.
# A previous hook force-replicated top-level scheduler nets, including nets that
# were themselves replicas. On the full U250 design that pass worsened WNS and
# increased the work presented to the following SLR-crossing optimization.
# Leave fanout replication, BRAM-enable optimization and SLR-crossing placement
# to the configured Vivado strategy, which has complete path and congestion
# context.

puts "INFO: loading [file normalize [info script]]"
puts "INFO: 300MHz physopt: no custom netlist transformations"
puts "INFO: 300MHz physopt: TOOL_DRIVEN_PHYSOPT"
