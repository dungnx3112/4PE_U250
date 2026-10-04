# Insert one native Vivado ILA around the SwiftKV -> activation BRAM ->
# O-projection boundary. This script is sourced after synthesis and before
# placement by the Vitis link flow.

namespace eval o_projection_ila {
    variable pe 0
    variable depth 4096
    variable data_bits 32
    variable core_name ila_o_projection_pe0
    variable parent_cell ""
    variable probe_index 0

    proc env_uint {name default minimum maximum} {
        if {![info exists ::env($name)] || $::env($name) eq ""} {
            return $default
        }
        set value $::env($name)
        if {![string is integer -strict $value] ||
            $value < $minimum || $value > $maximum} {
            error "$name must be an integer in the range $minimum..$maximum (got '$value')"
        }
        return $value
    }

    proc find_parent_cell {} {
        variable pe

        # Normal linked-Vitis hierarchy first; the fallback also supports an
        # isolated HLS kernel synthesis used by the local validation test.
        set linked_re [format {^.*/pe%d/inst/(.*/)?int4_decoder_local_pe_%d_U0$} $pe $pe]
        set cells [get_cells -hierarchical -quiet -regexp $linked_re]
        if {[llength $cells] == 0} {
            set fallback_re [format {(^|.*/)int4_decoder_local_pe_%d_U0$} $pe]
            set cells [get_cells -hierarchical -quiet -regexp $fallback_re]
        }
        if {[llength $cells] != 1} {
            error "O-projection ILA expected exactly one PE${pe} local-controller cell; found [llength $cells]: $cells"
        }
        return [lindex $cells 0]
    }

    proc find_nets {label leaf_regexp max_bits required} {
        variable parent_cell

        set expression [format {^%s/%s(\[[0-9]+\])?$} $parent_cell $leaf_regexp]
        set nets [lsort -dictionary [get_nets -hierarchical -quiet -regexp $expression]]
        if {$max_bits > 0 && [llength $nets] > $max_bits} {
            set nets [lrange $nets 0 [expr {$max_bits - 1}]]
        }
        if {[llength $nets] == 0} {
            if {$required} {
                error "O-projection ILA cannot find required signal '$label' under '$parent_cell' (regexp '$leaf_regexp')"
            }
            puts "WARNING: O-projection ILA optional signal '$label' was optimized away; skipping"
        }
        return $nets
    }

    proc add_probe {core label leaf_regexp max_bits required} {
        variable probe_index

        set nets [find_nets $label $leaf_regexp $max_bits $required]
        if {[llength $nets] == 0} {
            return
        }

        if {$probe_index == 0} {
            set port [get_debug_ports ${core}/probe0]
        } else {
            set port [create_debug_port $core probe]
        }
        set_property PORT_WIDTH [llength $nets] $port
        set_property PROBE_TYPE DATA_AND_TRIGGER $port
        set_property MARK_DEBUG true $nets
        connect_debug_port $port $nets
        puts [format "O_ILA_PROBE probe%-2d width=%-3d %-28s %s" \
            $probe_index [llength $nets] $label $nets]
        incr probe_index
    }

    proc connect_clock {core} {
        variable pe
        variable parent_cell

        set clock_net {}

        # HLS hierarchy reconstruction can remove the child ap_clk pin. Derive
        # the clock from the flop that launches O ap_start; this survives both
        # isolated kernel synthesis and the linked Vitis design.
        set start_re [format {grp_int4_linear_local_stage_pe%d_fu_[0-9]+_ap_start_reg} $pe]
        set start_nets [find_nets o_start_clock_source $start_re 0 1]
        foreach driver [get_pins -leaf -quiet -of_objects $start_nets -filter {DIRECTION == OUT}] {
            foreach pin [get_pins -quiet -of_objects [get_cells -quiet -of_objects $driver]] {
                set ref_pin [get_property REF_PIN_NAME $pin]
                if {$ref_pin eq "C" || $ref_pin eq "CLK"} {
                    set candidates [get_nets -quiet -of_objects $pin]
                    if {[llength $candidates] > 0} {
                        set clock_net [lindex $candidates 0]
                        break
                    }
                }
            }
            if {[llength $clock_net] > 0} {
                break
            }
        }

        # Fallbacks cover a preserved child clock pin and the isolated HLS top.
        if {[llength $clock_net] == 0} {
            set clock_pin [get_pins -quiet ${parent_cell}/ap_clk]
            if {[llength $clock_pin] == 1} {
                set clock_net [get_nets -quiet -of_objects $clock_pin]
            }
        }
        if {[llength $clock_net] == 0} {
            set top_clock_port [get_ports -quiet ap_clk]
            if {[llength $top_clock_port] == 1} {
                set clock_net [get_nets -quiet -of_objects $top_clock_port]
            }
        }
        if {[llength $clock_net] == 0} {
            error "O-projection ILA cannot resolve the PE${pe} clock net"
        }
        connect_debug_port [get_debug_ports ${core}/clk] [lindex $clock_net 0]
        puts "O_ILA_CLOCK [lindex $clock_net 0]"
    }

    proc insert {} {
        variable pe
        variable depth
        variable data_bits
        variable core_name
        variable parent_cell
        variable probe_index

        set pe [env_uint O_ILA_PE 0 0 3]
        set depth [env_uint O_ILA_DEPTH 4096 1024 131072]
        set data_bits [env_uint O_ILA_DATA_BITS 32 8 128]
        set core_name [format "ila_o_projection_pe%d" $pe]
        set probe_index 0
        set parent_cell [find_parent_cell]

        if {[llength [get_debug_cores -quiet $core_name]] != 0} {
            error "Debug core '$core_name' already exists"
        }

        puts "INFO: inserting O-projection ILA: pe=$pe depth=$depth data_bits=$data_bits"
        puts "INFO: O-projection parent cell: $parent_cell"

        set core [create_debug_core $core_name ila]
        set_property C_DATA_DEPTH $depth $core
        set_property C_ADV_TRIGGER true $core
        set_property C_INPUT_PIPE_STAGES 0 $core
        set_property C_EN_STRG_QUAL true $core
        connect_clock $core

        # Transaction/FSM boundary. Post-synthesis HLS control nets retain a
        # _reg suffix even when their original module-boundary pins disappear.
        add_probe $core parent_fsm              {ap_CS_fsm_state[0-9]+} 16 0
        add_probe $core swiftkv_start           [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_ap_start_reg} $pe] 0 1
        add_probe $core swiftkv_done            [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_ap_done} $pe] 0 1
        add_probe $core o_start                 [format {grp_int4_linear_local_stage_pe%d_fu_[0-9]+_ap_start_reg} $pe] 0 1

        # SwiftKV producer, before the parent BRAM-port mux.
        add_probe $core writer_q_addr           [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_q_address1} $pe] 0 0
        add_probe $core writer_q_ce             [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_q_ce1} $pe] 0 1
        add_probe $core writer_q_we             [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_q_we1} $pe] 0 1
        add_probe $core writer_q_data           [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_q_d1} $pe] $data_bits 0
        add_probe $core writer_scale_addr       [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_scale_address1} $pe] 0 0
        add_probe $core writer_scale_ce         [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_scale_ce1} $pe] 0 1
        add_probe $core writer_scale_we         [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_scale_we1} $pe] 0 0
        add_probe $core writer_scale_data       [format {grp_int4_swiftkv_attention_pe%d_fu_[0-9]+_activation_scale_d1} $pe] 0 1

        # Physical BRAM write-side nets survive parent mux optimization. The
        # wide activation_q address/data aliases can be absorbed into BRAM
        # primitives, but its write-enable and the complete scale port remain.
        add_probe $core bram_q_we               {activation_q_U/WEBWE} 0 1
        add_probe $core bram_scale_addr         {activation_scale_U/ADDRBWRADDR} 0 1
        add_probe $core bram_scale_data         {activation_scale_U/DINBDIN} 0 1
        add_probe $core bram_scale_we           {activation_scale_U/WEBWE} 0 1

        # O-projection BRAM reads. q_data contains the exact byte that was
        # observed as 0x00 instead of the expected 0x40 on hardware.
        add_probe $core o_q_addr                [format {grp_int4_linear_local_stage_pe%d_fu_[0-9]+_activation_q_address0} $pe] 0 1
        add_probe $core o_q_ce                  {activation_q_ce0} 0 1
        add_probe $core o_q_data                {activation_q_q0} $data_bits 1
        add_probe $core o_scale_addr            [format {grp_int4_linear_local_stage_pe%d_fu_[0-9]+_activation_scale_address0} $pe] 0 1
        add_probe $core o_scale_ce              {activation_scale_ce0} 0 1
        add_probe $core o_scale_data            {(activation_scale_q0|activation_scale_U/activation_scale_q0)} 0 1

        # O-projection output committed to projection RAM.
        add_probe $core o_output_addr           [format {grp_int4_linear_local_stage_pe%d_fu_[0-9]+_output_mem_address1} $pe] 0 1
        add_probe $core o_output_we             {projection_we1} 0 1
        add_probe $core o_output_data           [format {grp_int4_linear_local_stage_pe%d_fu_[0-9]+_output_mem_d1} $pe] $data_bits 1

        puts "INFO: O-projection ILA '$core_name' connected with $probe_index probes"
        puts "INFO: recommended trigger: o_start == 1; capture position 50%"
    }
}

o_projection_ila::insert
