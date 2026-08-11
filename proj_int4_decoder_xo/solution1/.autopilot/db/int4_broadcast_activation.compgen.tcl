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
    id 1515 \
    name quantized \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename quantized \
    op interface \
    ports { quantized_address0 { O 9 vector } quantized_ce0 { O 1 bit } quantized_we0 { O 1 bit } quantized_d0 { O 480 vector } quantized_q0 { I 480 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'quantized'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1516 \
    name packed_scales \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename packed_scales \
    op interface \
    ports { packed_scales_address0 { O 5 vector } packed_scales_ce0 { O 1 bit } packed_scales_we0 { O 1 bit } packed_scales_d0 { O 512 vector } packed_scales_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'packed_scales'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1517 \
    name quantized_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_stream \
    op interface \
    ports { quantized_stream_dout { I 480 vector } quantized_stream_num_data_valid { I 3 vector } quantized_stream_fifo_cap { I 3 vector } quantized_stream_empty_n { I 1 bit } quantized_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1518 \
    name scale_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_stream \
    op interface \
    ports { scale_stream_dout { I 32 vector } scale_stream_num_data_valid { I 3 vector } scale_stream_fifo_cap { I 3 vector } scale_stream_empty_n { I 1 bit } scale_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1519 \
    name stream_activation \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_activation \
    op interface \
    ports { stream_activation { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1520 \
    name quantized_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe0 \
    op interface \
    ports { quantized_pe0_din { O 480 vector } quantized_pe0_num_data_valid { I 3 vector } quantized_pe0_fifo_cap { I 3 vector } quantized_pe0_full_n { I 1 bit } quantized_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1521 \
    name quantized_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe1 \
    op interface \
    ports { quantized_pe1_din { O 480 vector } quantized_pe1_num_data_valid { I 3 vector } quantized_pe1_fifo_cap { I 3 vector } quantized_pe1_full_n { I 1 bit } quantized_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1522 \
    name quantized_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe2 \
    op interface \
    ports { quantized_pe2_din { O 480 vector } quantized_pe2_num_data_valid { I 3 vector } quantized_pe2_fifo_cap { I 3 vector } quantized_pe2_full_n { I 1 bit } quantized_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1523 \
    name quantized_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe3 \
    op interface \
    ports { quantized_pe3_din { O 480 vector } quantized_pe3_num_data_valid { I 3 vector } quantized_pe3_fifo_cap { I 3 vector } quantized_pe3_full_n { I 1 bit } quantized_pe3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1524 \
    name activation_scale_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe0 \
    op interface \
    ports { activation_scale_pe0_din { O 32 vector } activation_scale_pe0_num_data_valid { I 3 vector } activation_scale_pe0_fifo_cap { I 3 vector } activation_scale_pe0_full_n { I 1 bit } activation_scale_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1525 \
    name activation_scale_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe1 \
    op interface \
    ports { activation_scale_pe1_din { O 32 vector } activation_scale_pe1_num_data_valid { I 3 vector } activation_scale_pe1_fifo_cap { I 3 vector } activation_scale_pe1_full_n { I 1 bit } activation_scale_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1526 \
    name activation_scale_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe2 \
    op interface \
    ports { activation_scale_pe2_din { O 32 vector } activation_scale_pe2_num_data_valid { I 3 vector } activation_scale_pe2_fifo_cap { I 3 vector } activation_scale_pe2_full_n { I 1 bit } activation_scale_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1527 \
    name activation_scale_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe3 \
    op interface \
    ports { activation_scale_pe3_din { O 32 vector } activation_scale_pe3_num_data_valid { I 3 vector } activation_scale_pe3_fifo_cap { I 3 vector } activation_scale_pe3_full_n { I 1 bit } activation_scale_pe3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1528 \
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
    id 1529 \
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
    id 1530 \
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
    id 1531 \
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
    id 1532 \
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


