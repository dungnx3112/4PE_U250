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
    id 348 \
    name current_record_0_val1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_0_val1 \
    op interface \
    ports { current_record_0_val1 { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 349 \
    name current_record_0_val1_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_0_val1_c \
    op interface \
    ports { current_record_0_val1_c_din { O 512 vector } current_record_0_val1_c_num_data_valid { I 3 vector } current_record_0_val1_c_fifo_cap { I 3 vector } current_record_0_val1_c_full_n { I 1 bit } current_record_0_val1_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 350 \
    name current_record_1_val2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_1_val2 \
    op interface \
    ports { current_record_1_val2 { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 351 \
    name current_record_1_val2_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_1_val2_c \
    op interface \
    ports { current_record_1_val2_c_din { O 512 vector } current_record_1_val2_c_num_data_valid { I 3 vector } current_record_1_val2_c_fifo_cap { I 3 vector } current_record_1_val2_c_full_n { I 1 bit } current_record_1_val2_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 352 \
    name current_record_2_val3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_2_val3 \
    op interface \
    ports { current_record_2_val3 { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 353 \
    name current_record_2_val3_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_2_val3_c \
    op interface \
    ports { current_record_2_val3_c_din { O 512 vector } current_record_2_val3_c_num_data_valid { I 3 vector } current_record_2_val3_c_fifo_cap { I 3 vector } current_record_2_val3_c_full_n { I 1 bit } current_record_2_val3_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 354 \
    name current_record_3_val4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_3_val4 \
    op interface \
    ports { current_record_3_val4 { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 355 \
    name current_record_3_val4_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_3_val4_c \
    op interface \
    ports { current_record_3_val4_c_din { O 512 vector } current_record_3_val4_c_num_data_valid { I 3 vector } current_record_3_val4_c_fifo_cap { I 3 vector } current_record_3_val4_c_full_n { I 1 bit } current_record_3_val4_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 356 \
    name current_record_4_val5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_4_val5 \
    op interface \
    ports { current_record_4_val5 { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 357 \
    name current_record_4_val5_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_4_val5_c \
    op interface \
    ports { current_record_4_val5_c_din { O 512 vector } current_record_4_val5_c_num_data_valid { I 3 vector } current_record_4_val5_c_fifo_cap { I 3 vector } current_record_4_val5_c_full_n { I 1 bit } current_record_4_val5_c_write { O 1 bit } } \
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


