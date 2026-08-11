# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2040 \
    name model_scale_cache1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_scale_cache1 \
    op interface \
    ports { model_scale_cache1_address0 { O 11 vector } model_scale_cache1_ce0 { O 1 bit } model_scale_cache1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_scale_cache1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2033 \
    name group_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_group_stream \
    op interface \
    ports { group_stream_dout { I 92 vector } group_stream_num_data_valid { I 7 vector } group_stream_fifo_cap { I 7 vector } group_stream_empty_n { I 1 bit } group_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2034 \
    name replay_scale_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_replay_scale_stream \
    op interface \
    ports { replay_scale_stream_dout { I 32 vector } replay_scale_stream_num_data_valid { I 3 vector } replay_scale_stream_fifo_cap { I 3 vector } replay_scale_stream_empty_n { I 1 bit } replay_scale_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2035 \
    name final_block_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_final_block_stream \
    op interface \
    ports { final_block_stream_din { O 128 vector } final_block_stream_num_data_valid { I 6 vector } final_block_stream_fifo_cap { I 6 vector } final_block_stream_full_n { I 1 bit } final_block_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2036 \
    name local_tiles_loc \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_loc \
    op interface \
    ports { local_tiles_loc_dout { I 6 vector } local_tiles_loc_num_data_valid { I 3 vector } local_tiles_loc_fifo_cap { I 3 vector } local_tiles_loc_empty_n { I 1 bit } local_tiles_loc_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2037 \
    name input_tiles_loc \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_tiles_loc \
    op interface \
    ports { input_tiles_loc_dout { I 6 vector } input_tiles_loc_num_data_valid { I 3 vector } input_tiles_loc_fifo_cap { I 3 vector } input_tiles_loc_empty_n { I 1 bit } input_tiles_loc_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2038 \
    name idx1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx1 \
    op interface \
    ports { idx1_dout { I 11 vector } idx1_num_data_valid { I 4 vector } idx1_fifo_cap { I 4 vector } idx1_empty_n { I 1 bit } idx1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2039 \
    name local_tiles_loc_c18 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_loc_c18 \
    op interface \
    ports { local_tiles_loc_c18_din { O 6 vector } local_tiles_loc_c18_num_data_valid { I 3 vector } local_tiles_loc_c18_fifo_cap { I 3 vector } local_tiles_loc_c18_full_n { I 1 bit } local_tiles_loc_c18_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


