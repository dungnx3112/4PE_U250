open_project -reset proj_int4_decoder_300mhz
set_top int4_decoder_token_controller

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP"
foreach source_file [list \
    swiftkv_attention.cpp \
    int4_weight_packer.cpp \
    int4_linear_controller.cpp \
    int4_decoder_controller.cpp \
    int4_decoder_blocks.cpp \
    gemv_tile_pe.cpp \
    gemv2_pack_bench.cpp] {
    add_files $source_file -cflags $cflags
}

open_solution -reset solution1 -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.333 -name default
config_interface -m_axi_latency 64
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3

csynth_design
export_design -format xo -output int4_decoder_token_controller_300mhz.xo
exit
