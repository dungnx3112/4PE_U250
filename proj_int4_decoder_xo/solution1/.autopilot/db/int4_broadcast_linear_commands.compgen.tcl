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
    id 1485 \
    name linear_command_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_linear_command_pe0 \
    op interface \
    ports { linear_command_pe0_din { O 14 vector } linear_command_pe0_num_data_valid { I 3 vector } linear_command_pe0_fifo_cap { I 3 vector } linear_command_pe0_full_n { I 1 bit } linear_command_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1486 \
    name linear_command_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_linear_command_pe1 \
    op interface \
    ports { linear_command_pe1_din { O 14 vector } linear_command_pe1_num_data_valid { I 3 vector } linear_command_pe1_fifo_cap { I 3 vector } linear_command_pe1_full_n { I 1 bit } linear_command_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1487 \
    name linear_command_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_linear_command_pe2 \
    op interface \
    ports { linear_command_pe2_din { O 14 vector } linear_command_pe2_num_data_valid { I 3 vector } linear_command_pe2_fifo_cap { I 3 vector } linear_command_pe2_full_n { I 1 bit } linear_command_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1488 \
    name linear_command_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_linear_command_pe3 \
    op interface \
    ports { linear_command_pe3_din { O 14 vector } linear_command_pe3_num_data_valid { I 3 vector } linear_command_pe3_fifo_cap { I 3 vector } linear_command_pe3_full_n { I 1 bit } linear_command_pe3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1489 \
    name local_tiles_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_0 \
    op interface \
    ports { local_tiles_0 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1490 \
    name local_tiles_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_1 \
    op interface \
    ports { local_tiles_1 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1491 \
    name local_tiles_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_2 \
    op interface \
    ports { local_tiles_2 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1492 \
    name local_tiles_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_local_tiles_3 \
    op interface \
    ports { local_tiles_3 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1493 \
    name input_tiles \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_tiles \
    op interface \
    ports { input_tiles { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1494 \
    name output_fxp \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_fxp \
    op interface \
    ports { output_fxp { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1495 \
    name fuse_residual \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fuse_residual \
    op interface \
    ports { fuse_residual { I 1 vector } } \
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


