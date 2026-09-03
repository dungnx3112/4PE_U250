# Keep only PE1 close to its DDR1 interface.  Vivado is free to place every
# other hierarchy and to perform all detailed placement/physical optimisation.
puts "INFO: loading [file normalize [info script]]"

set pe1_cells [get_cells -quiet -hierarchical -filter {
    NAME =~ */int4_decoder_token_controller_1/inst/*/int4_decoder_local_pe_1_U0/*}]
if {[llength $pe1_cells] == 0} {
    error "300MHz placement: no surviving PE1 cells were found"
}

set_property USER_SLR_ASSIGNMENT SLR1 $pe1_cells
puts "INFO: 300MHz placement: assigned [llength $pe1_cells] PE1 cells to SLR1"
puts "INFO: 300MHz placement: PE1_SLR1_APPLIED"
