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
    id 563 \
    name engine3_control_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_engine3_control_stream \
    op interface \
    ports { engine3_control_stream_dout { I 59 vector } engine3_control_stream_num_data_valid { I 3 vector } engine3_control_stream_fifo_cap { I 3 vector } engine3_control_stream_empty_n { I 1 bit } engine3_control_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 564 \
    name value0_engine3_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine3_stream \
    op interface \
    ports { value0_engine3_stream_dout { I 128 vector } value0_engine3_stream_num_data_valid { I 6 vector } value0_engine3_stream_fifo_cap { I 6 vector } value0_engine3_stream_empty_n { I 1 bit } value0_engine3_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 565 \
    name value1_engine3_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine3_stream \
    op interface \
    ports { value1_engine3_stream_dout { I 128 vector } value1_engine3_stream_num_data_valid { I 6 vector } value1_engine3_stream_fifo_cap { I 6 vector } value1_engine3_stream_empty_n { I 1 bit } value1_engine3_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 566 \
    name position \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_position \
    op interface \
    ports { position_dout { I 12 vector } position_num_data_valid { I 3 vector } position_fifo_cap { I 3 vector } position_empty_n { I 1 bit } position_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 567 \
    name engine3_phase_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_engine3_phase_stream \
    op interface \
    ports { engine3_phase_stream_din { O 57 vector } engine3_phase_stream_num_data_valid { I 4 vector } engine3_phase_stream_fifo_cap { I 4 vector } engine3_phase_stream_full_n { I 1 bit } engine3_phase_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 568 \
    name position_val_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_position_val_c \
    op interface \
    ports { position_val_c_din { O 12 vector } position_val_c_num_data_valid { I 3 vector } position_val_c_fifo_cap { I 3 vector } position_val_c_full_n { I 1 bit } position_val_c_write { O 1 bit } } \
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


