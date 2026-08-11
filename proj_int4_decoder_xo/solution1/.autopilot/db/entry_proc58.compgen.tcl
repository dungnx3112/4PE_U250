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
    id 913 \
    name weight_bank0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank0 \
    op interface \
    ports { weight_bank0 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 914 \
    name weight_bank0_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank0_c \
    op interface \
    ports { weight_bank0_c_din { O 64 vector } weight_bank0_c_num_data_valid { I 3 vector } weight_bank0_c_fifo_cap { I 3 vector } weight_bank0_c_full_n { I 1 bit } weight_bank0_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 915 \
    name weight_bank1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank1 \
    op interface \
    ports { weight_bank1 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 916 \
    name weight_bank1_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank1_c \
    op interface \
    ports { weight_bank1_c_din { O 64 vector } weight_bank1_c_num_data_valid { I 3 vector } weight_bank1_c_fifo_cap { I 3 vector } weight_bank1_c_full_n { I 1 bit } weight_bank1_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 917 \
    name weight_bank2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank2 \
    op interface \
    ports { weight_bank2 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 918 \
    name weight_bank2_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank2_c \
    op interface \
    ports { weight_bank2_c_din { O 64 vector } weight_bank2_c_num_data_valid { I 3 vector } weight_bank2_c_fifo_cap { I 3 vector } weight_bank2_c_full_n { I 1 bit } weight_bank2_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 919 \
    name weight_bank3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank3 \
    op interface \
    ports { weight_bank3 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 920 \
    name weight_bank3_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank3_c \
    op interface \
    ports { weight_bank3_c_din { O 64 vector } weight_bank3_c_num_data_valid { I 3 vector } weight_bank3_c_fifo_cap { I 3 vector } weight_bank3_c_full_n { I 1 bit } weight_bank3_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 921 \
    name logits_pe0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe0 \
    op interface \
    ports { logits_pe0 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 922 \
    name logits_pe0_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe0_c \
    op interface \
    ports { logits_pe0_c_din { O 64 vector } logits_pe0_c_num_data_valid { I 3 vector } logits_pe0_c_fifo_cap { I 3 vector } logits_pe0_c_full_n { I 1 bit } logits_pe0_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 923 \
    name logits_pe1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe1 \
    op interface \
    ports { logits_pe1 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 924 \
    name logits_pe1_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe1_c \
    op interface \
    ports { logits_pe1_c_din { O 64 vector } logits_pe1_c_num_data_valid { I 3 vector } logits_pe1_c_fifo_cap { I 3 vector } logits_pe1_c_full_n { I 1 bit } logits_pe1_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 925 \
    name logits_pe2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe2 \
    op interface \
    ports { logits_pe2 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 926 \
    name logits_pe2_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe2_c \
    op interface \
    ports { logits_pe2_c_din { O 64 vector } logits_pe2_c_num_data_valid { I 3 vector } logits_pe2_c_fifo_cap { I 3 vector } logits_pe2_c_full_n { I 1 bit } logits_pe2_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 927 \
    name logits_pe3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe3 \
    op interface \
    ports { logits_pe3 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 928 \
    name logits_pe3_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_logits_pe3_c \
    op interface \
    ports { logits_pe3_c_din { O 64 vector } logits_pe3_c_num_data_valid { I 3 vector } logits_pe3_c_fifo_cap { I 3 vector } logits_pe3_c_full_n { I 1 bit } logits_pe3_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 929 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 930 \
    name controller_run_linear_in_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_run_linear_in_c \
    op interface \
    ports { controller_run_linear_in_c_din { O 1 vector } controller_run_linear_in_c_num_data_valid { I 3 vector } controller_run_linear_in_c_fifo_cap { I 3 vector } controller_run_linear_in_c_full_n { I 1 bit } controller_run_linear_in_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 931 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 932 \
    name controller_linear_mode_in_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_linear_mode_in_c \
    op interface \
    ports { controller_linear_mode_in_c_din { O 3 vector } controller_linear_mode_in_c_num_data_valid { I 3 vector } controller_linear_mode_in_c_fifo_cap { I 3 vector } controller_linear_mode_in_c_full_n { I 1 bit } controller_linear_mode_in_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 933 \
    name p_read2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read2 \
    op interface \
    ports { p_read2 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 934 \
    name controller_layer_index_in_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_layer_index_in_c \
    op interface \
    ports { controller_layer_index_in_c_din { O 6 vector } controller_layer_index_in_c_num_data_valid { I 3 vector } controller_layer_index_in_c_fifo_cap { I 3 vector } controller_layer_index_in_c_full_n { I 1 bit } controller_layer_index_in_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 935 \
    name idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx \
    op interface \
    ports { idx { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 936 \
    name idx_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_idx_c \
    op interface \
    ports { idx_c_din { O 13 vector } idx_c_num_data_valid { I 3 vector } idx_c_fifo_cap { I 3 vector } idx_c_full_n { I 1 bit } idx_c_write { O 1 bit } } \
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


