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
    id 400 \
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
    id 401 \
    name current_record_0_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_0_val \
    op interface \
    ports { current_record_0_val_dout { I 512 vector } current_record_0_val_num_data_valid { I 3 vector } current_record_0_val_fifo_cap { I 3 vector } current_record_0_val_empty_n { I 1 bit } current_record_0_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 402 \
    name current_record_1_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_1_val \
    op interface \
    ports { current_record_1_val_dout { I 512 vector } current_record_1_val_num_data_valid { I 3 vector } current_record_1_val_fifo_cap { I 3 vector } current_record_1_val_empty_n { I 1 bit } current_record_1_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 403 \
    name current_record_2_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_2_val \
    op interface \
    ports { current_record_2_val_dout { I 512 vector } current_record_2_val_num_data_valid { I 3 vector } current_record_2_val_fifo_cap { I 3 vector } current_record_2_val_empty_n { I 1 bit } current_record_2_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 404 \
    name current_record_3_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_3_val \
    op interface \
    ports { current_record_3_val_dout { I 512 vector } current_record_3_val_num_data_valid { I 3 vector } current_record_3_val_fifo_cap { I 3 vector } current_record_3_val_empty_n { I 1 bit } current_record_3_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 405 \
    name current_record_4_val \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_current_record_4_val \
    op interface \
    ports { current_record_4_val_dout { I 512 vector } current_record_4_val_num_data_valid { I 3 vector } current_record_4_val_fifo_cap { I 3 vector } current_record_4_val_empty_n { I 1 bit } current_record_4_val_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 406 \
    name cached_kv_word_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cached_kv_word_stream \
    op interface \
    ports { cached_kv_word_stream_dout { I 512 vector } cached_kv_word_stream_num_data_valid { I 7 vector } cached_kv_word_stream_fifo_cap { I 7 vector } cached_kv_word_stream_empty_n { I 1 bit } cached_kv_word_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 407 \
    name key_metadata_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_key_metadata_stream \
    op interface \
    ports { key_metadata_stream_din { O 40 vector } key_metadata_stream_num_data_valid { I 6 vector } key_metadata_stream_fifo_cap { I 6 vector } key_metadata_stream_full_n { I 1 bit } key_metadata_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 408 \
    name value_metadata_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value_metadata_stream \
    op interface \
    ports { value_metadata_stream_din { O 40 vector } value_metadata_stream_num_data_valid { I 6 vector } value_metadata_stream_fifo_cap { I 6 vector } value_metadata_stream_full_n { I 1 bit } value_metadata_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 409 \
    name key0_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_key0_stream \
    op interface \
    ports { key0_stream_din { O 512 vector } key0_stream_num_data_valid { I 6 vector } key0_stream_fifo_cap { I 6 vector } key0_stream_full_n { I 1 bit } key0_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 410 \
    name key1_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_key1_stream \
    op interface \
    ports { key1_stream_din { O 512 vector } key1_stream_num_data_valid { I 6 vector } key1_stream_fifo_cap { I 6 vector } key1_stream_full_n { I 1 bit } key1_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 411 \
    name value0_engine0_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine0_stream \
    op interface \
    ports { value0_engine0_stream_din { O 128 vector } value0_engine0_stream_num_data_valid { I 6 vector } value0_engine0_stream_fifo_cap { I 6 vector } value0_engine0_stream_full_n { I 1 bit } value0_engine0_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 412 \
    name value0_engine1_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine1_stream \
    op interface \
    ports { value0_engine1_stream_din { O 128 vector } value0_engine1_stream_num_data_valid { I 6 vector } value0_engine1_stream_fifo_cap { I 6 vector } value0_engine1_stream_full_n { I 1 bit } value0_engine1_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 413 \
    name value0_engine2_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine2_stream \
    op interface \
    ports { value0_engine2_stream_din { O 128 vector } value0_engine2_stream_num_data_valid { I 6 vector } value0_engine2_stream_fifo_cap { I 6 vector } value0_engine2_stream_full_n { I 1 bit } value0_engine2_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 414 \
    name value0_engine3_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine3_stream \
    op interface \
    ports { value0_engine3_stream_din { O 128 vector } value0_engine3_stream_num_data_valid { I 6 vector } value0_engine3_stream_fifo_cap { I 6 vector } value0_engine3_stream_full_n { I 1 bit } value0_engine3_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 415 \
    name value1_engine0_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine0_stream \
    op interface \
    ports { value1_engine0_stream_din { O 128 vector } value1_engine0_stream_num_data_valid { I 6 vector } value1_engine0_stream_fifo_cap { I 6 vector } value1_engine0_stream_full_n { I 1 bit } value1_engine0_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 416 \
    name value1_engine1_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine1_stream \
    op interface \
    ports { value1_engine1_stream_din { O 128 vector } value1_engine1_stream_num_data_valid { I 6 vector } value1_engine1_stream_fifo_cap { I 6 vector } value1_engine1_stream_full_n { I 1 bit } value1_engine1_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 417 \
    name value1_engine2_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine2_stream \
    op interface \
    ports { value1_engine2_stream_din { O 128 vector } value1_engine2_stream_num_data_valid { I 6 vector } value1_engine2_stream_fifo_cap { I 6 vector } value1_engine2_stream_full_n { I 1 bit } value1_engine2_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 418 \
    name value1_engine3_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine3_stream \
    op interface \
    ports { value1_engine3_stream_din { O 128 vector } value1_engine3_stream_num_data_valid { I 6 vector } value1_engine3_stream_fifo_cap { I 6 vector } value1_engine3_stream_full_n { I 1 bit } value1_engine3_stream_write { O 1 bit } } \
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


