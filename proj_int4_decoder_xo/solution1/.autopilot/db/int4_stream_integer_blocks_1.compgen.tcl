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
    id 2592 \
    name weight_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_stream \
    op interface \
    ports { weight_stream_dout { I 512 vector } weight_stream_num_data_valid { I 15 vector } weight_stream_fifo_cap { I 15 vector } weight_stream_empty_n { I 1 bit } weight_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2593 \
    name replay_activation_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_replay_activation_stream \
    op interface \
    ports { replay_activation_stream_dout { I 480 vector } replay_activation_stream_num_data_valid { I 3 vector } replay_activation_stream_fifo_cap { I 3 vector } replay_activation_stream_empty_n { I 1 bit } replay_activation_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2594 \
    name group_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_group_stream \
    op interface \
    ports { group_stream_din { O 92 vector } group_stream_num_data_valid { I 7 vector } group_stream_fifo_cap { I 7 vector } group_stream_full_n { I 1 bit } group_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2595 \
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
    id 2596 \
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
    id 2597 \
    name input_tiles_loc_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_tiles_loc_c \
    op interface \
    ports { input_tiles_loc_c_din { O 6 vector } input_tiles_loc_c_num_data_valid { I 3 vector } input_tiles_loc_c_fifo_cap { I 3 vector } input_tiles_loc_c_full_n { I 1 bit } input_tiles_loc_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2598 \
    name local_tiles_loc_c19 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_loc_c19 \
    op interface \
    ports { local_tiles_loc_c19_din { O 6 vector } local_tiles_loc_c19_num_data_valid { I 3 vector } local_tiles_loc_c19_fifo_cap { I 3 vector } local_tiles_loc_c19_full_n { I 1 bit } local_tiles_loc_c19_write { O 1 bit } } \
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


