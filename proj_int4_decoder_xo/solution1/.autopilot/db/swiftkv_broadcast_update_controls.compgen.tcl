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
    id 510 \
    name value_metadata_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value_metadata_stream \
    op interface \
    ports { value_metadata_stream_dout { I 40 vector } value_metadata_stream_num_data_valid { I 6 vector } value_metadata_stream_fifo_cap { I 6 vector } value_metadata_stream_empty_n { I 1 bit } value_metadata_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 511 \
    name control_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_stream \
    op interface \
    ports { control_stream_dout { I 19 vector } control_stream_num_data_valid { I 5 vector } control_stream_fifo_cap { I 5 vector } control_stream_empty_n { I 1 bit } control_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 512 \
    name position \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_position \
    op interface \
    ports { position { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 513 \
    name engine0_control_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_engine0_control_stream \
    op interface \
    ports { engine0_control_stream_din { O 59 vector } engine0_control_stream_num_data_valid { I 3 vector } engine0_control_stream_fifo_cap { I 3 vector } engine0_control_stream_full_n { I 1 bit } engine0_control_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 514 \
    name engine1_control_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_engine1_control_stream \
    op interface \
    ports { engine1_control_stream_din { O 59 vector } engine1_control_stream_num_data_valid { I 3 vector } engine1_control_stream_fifo_cap { I 3 vector } engine1_control_stream_full_n { I 1 bit } engine1_control_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 515 \
    name engine2_control_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_engine2_control_stream \
    op interface \
    ports { engine2_control_stream_din { O 59 vector } engine2_control_stream_num_data_valid { I 3 vector } engine2_control_stream_fifo_cap { I 3 vector } engine2_control_stream_full_n { I 1 bit } engine2_control_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 516 \
    name engine3_control_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_engine3_control_stream \
    op interface \
    ports { engine3_control_stream_din { O 59 vector } engine3_control_stream_num_data_valid { I 3 vector } engine3_control_stream_fifo_cap { I 3 vector } engine3_control_stream_full_n { I 1 bit } engine3_control_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 517 \
    name position_val_c33 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_position_val_c33 \
    op interface \
    ports { position_val_c33_din { O 12 vector } position_val_c33_num_data_valid { I 3 vector } position_val_c33_fifo_cap { I 3 vector } position_val_c33_full_n { I 1 bit } position_val_c33_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 518 \
    name position_val_c34 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_position_val_c34 \
    op interface \
    ports { position_val_c34_din { O 12 vector } position_val_c34_num_data_valid { I 3 vector } position_val_c34_fifo_cap { I 3 vector } position_val_c34_full_n { I 1 bit } position_val_c34_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 519 \
    name position_val_c35 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_position_val_c35 \
    op interface \
    ports { position_val_c35_din { O 12 vector } position_val_c35_num_data_valid { I 3 vector } position_val_c35_fifo_cap { I 3 vector } position_val_c35_full_n { I 1 bit } position_val_c35_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 520 \
    name position_val_c36 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_position_val_c36 \
    op interface \
    ports { position_val_c36_din { O 12 vector } position_val_c36_num_data_valid { I 3 vector } position_val_c36_fifo_cap { I 3 vector } position_val_c36_full_n { I 1 bit } position_val_c36_write { O 1 bit } } \
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


