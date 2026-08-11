# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2156 \
    name quantized_pe2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe2 \
    op interface \
    ports { quantized_pe2_dout { I 480 vector } quantized_pe2_num_data_valid { I 3 vector } quantized_pe2_fifo_cap { I 3 vector } quantized_pe2_empty_n { I 1 bit } quantized_pe2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2157 \
    name activation_scale_pe2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe2 \
    op interface \
    ports { activation_scale_pe2_dout { I 32 vector } activation_scale_pe2_num_data_valid { I 3 vector } activation_scale_pe2_fifo_cap { I 3 vector } activation_scale_pe2_empty_n { I 1 bit } activation_scale_pe2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2158 \
    name replay_activation_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_replay_activation_stream \
    op interface \
    ports { replay_activation_stream_din { O 480 vector } replay_activation_stream_num_data_valid { I 3 vector } replay_activation_stream_fifo_cap { I 3 vector } replay_activation_stream_full_n { I 1 bit } replay_activation_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2159 \
    name replay_scale_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_replay_scale_stream \
    op interface \
    ports { replay_scale_stream_din { O 32 vector } replay_scale_stream_num_data_valid { I 3 vector } replay_scale_stream_fifo_cap { I 3 vector } replay_scale_stream_full_n { I 1 bit } replay_scale_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2160 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2161 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2162 \
    name input_tiles_loc_c16 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_tiles_loc_c16 \
    op interface \
    ports { input_tiles_loc_c16_din { O 6 vector } input_tiles_loc_c16_num_data_valid { I 3 vector } input_tiles_loc_c16_fifo_cap { I 3 vector } input_tiles_loc_c16_full_n { I 1 bit } input_tiles_loc_c16_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2163 \
    name local_tiles_loc_c20 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_loc_c20 \
    op interface \
    ports { local_tiles_loc_c20_din { O 6 vector } local_tiles_loc_c20_num_data_valid { I 3 vector } local_tiles_loc_c20_fifo_cap { I 3 vector } local_tiles_loc_c20_full_n { I 1 bit } local_tiles_loc_c20_write { O 1 bit } } \
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


