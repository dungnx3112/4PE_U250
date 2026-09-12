set script_directory [file dirname [file normalize [info script]]]
cd $script_directory

set requested_pes {0 1 2 3}
if {[info exists ::env(INT4_DECODER_PE)] &&
    $::env(INT4_DECODER_PE) ne ""} {
    set requested_pe $::env(INT4_DECODER_PE)
    if {$requested_pe ni {0 1 2 3}} {
        error "INT4_DECODER_PE must be one of 0, 1, 2 or 3"
    }
    set requested_pes [list $requested_pe]
}

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -I."
set production_sources [list \
    swiftkv_attention.cpp \
    int4_linear_controller.cpp \
    int4_decoder_blocks.cpp \
    int4_decoder_controller.cpp \
    int4_decoder_multikernel.cpp]

foreach pe $requested_pes {
    set kernel_name "int4_decoder_pe${pe}_kernel"
    set project_name "proj_int4_decoder_pe${pe}"
    set xo_name "int4_decoder_pe${pe}_kernel_270mhz.xo"

    open_project -reset $project_name
    set_top $kernel_name
    foreach source $production_sources {
        add_files $source -cflags $cflags
    }

    open_solution -reset solution_270mhz -flow_target vitis
    set_part {xcu250-figd2104-2L-e}
    # Match the proven standalone Attention flow: synthesize against 3.0 ns
    # so HLS inserts the pipeline stages needed for routed closure at 3.703 ns.
    create_clock -period 3.0 -name default
    set_clock_uncertainty 0.300

    config_interface -m_axi_latency 32
    config_interface -m_axi_alignment_byte_size 64
    config_interface -m_axi_max_widen_bitwidth 512
    config_rtl -register_reset_num 3
    config_dataflow -start_fifo_depth 8

    csynth_design
    export_design -format xo -output $xo_name
    close_project
}

exit
