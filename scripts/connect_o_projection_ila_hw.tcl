# Reset Vivado Hardware Manager and connect to the PE0 O-projection ILAs.
#
# Normal use from the Vivado Tcl Console:
#   source scripts/connect_o_projection_ila_hw.tcl
#
# The script rebuilds the Vivado hardware-manager connection on every run. It
# retries an empty XVC scan once, then reports a diagnostic code and concrete
# commands for the Linux FPGA host.
#
# Optional environment overrides (set before starting Vivado):
#   O_ILA_LTX=/absolute/path/to/file.xclbin.ltx
#   O_ILA_HW_SERVER_URL=localhost:3121
#   O_ILA_XVC_URL=localhost:10200
#   O_ILA_DEVICE_FILTER=*debug_bridge*
#   O_ILA_EXPECTED_BDF=0000:13:00.0
#
# On success these global variables are populated:
#   ::O_ILA_DEVICE
#   ::O_ILA_CONTROL_ILA
#   ::O_ILA_DATA_ILA

namespace eval ::o_projection_ila {
    variable script_dir [file dirname [file normalize [info script]]]
    variable repo_root [file normalize [file join $script_dir ..]]
}

proc ::o_projection_ila::env_or_default {name default_value} {
    if {[info exists ::env($name)] && $::env($name) ne ""} {
        return $::env($name)
    }
    return $default_value
}

proc ::o_projection_ila::banner {text} {
    puts ""
    puts "================================================================"
    puts $text
    puts "================================================================"
}

proc ::o_projection_ila::fail {code summary actions} {
    banner "FAIL $code"
    puts "CAUSE: $summary"
    if {[llength $actions] > 0} {
        puts ""
        puts "HOW TO FIX:"
        foreach action $actions {
            puts "  $action"
        }
    }
    puts ""
    puts "After fixing the problem, run again:"
    puts "  source scripts/connect_o_projection_ila_hw.tcl"
    return -code error -errorcode [list O_PROJECTION_ILA $code] \
        "$code: $summary"
}

proc ::o_projection_ila::safe_property {object property} {
    set value "<unavailable>"
    catch {set value [get_property $property $object]}
    return $value
}

proc ::o_projection_ila::list_devices {device_filter} {
    set devices {}
    if {$device_filter ne ""} {
        catch {set devices [get_hw_devices -quiet $device_filter]}
    }
    if {[llength $devices] == 0} {
        catch {set devices [get_hw_devices -quiet]}
    }
    return $devices
}

proc ::o_projection_ila::close_current_target {} {
    set target ""
    catch {set target [current_hw_target -quiet]}
    if {$target ne ""} {
        puts "INFO: Closing hardware target: $target"
        if {[catch {close_hw_target $target} message]} {
            # Some Vivado releases only accept close_hw_target without an
            # object argument. Try that form before giving up.
            if {[catch {close_hw_target} fallback_message]} {
                puts "WARN: Could not close target cleanly: $message"
                puts "WARN: Fallback close result: $fallback_message"
            }
        }
    }
}

proc ::o_projection_ila::reset_and_connect_server {hw_server_url} {
    banner "STEP 1/4 - Reset Vivado Hardware Manager"

    # This drops cached servers, targets, devices, and stale XVC scan results.
    if {[catch {close_hw_manager} close_message]} {
        puts "INFO: No existing hardware manager to close: $close_message"
    } else {
        puts "INFO: Previous hardware-manager session closed."
    }
    after 500

    if {[catch {open_hw_manager} open_message]} {
        fail E_HW_MANAGER_OPEN \
            "Vivado could not open Hardware Manager: $open_message" \
            [list \
                "Confirm this script is sourced from Vivado, not plain tclsh." \
                "Restart Vivado if Hardware Manager remains locked."]
    }

    puts "INFO: Connecting to hw_server at $hw_server_url"
    if {[catch {connect_hw_server -url $hw_server_url} connect_message]} {
        fail E_HW_SERVER_CONNECT \
            "Vivado cannot connect to hw_server at $hw_server_url: $connect_message" \
            [list \
                "On the FPGA host, verify: ps -ef | grep '\[h\]w_server'" \
                "Verify the port: ss -ltnp | grep ':3121'" \
                "Start it if needed: hw_server -sTCP::3121" \
                "If Vivado is on another machine, verify the SSH tunnel/firewall."]
    }
    puts "PASS: Connected to hw_server."
}

proc ::o_projection_ila::open_xvc_and_scan {xvc_url device_filter} {
    banner "STEP 2/4 - Open XVC target and scan the debug chain"

    set devices {}
    set last_open_message ""
    set last_open_succeeded 0
    set max_attempts 2

    set xvc_port 10200
    regexp {:([0-9]+)$} $xvc_url ignored xvc_port

    for {set attempt 1} {$attempt <= $max_attempts} {incr attempt} {
        if {$attempt > 1} {
            puts "WARN: First XVC scan was empty; forcing one clean reopen."
            close_current_target
            after 1000
        }

        puts "INFO: Opening XVC target $xvc_url (attempt $attempt/$max_attempts)"
        if {[catch {open_hw_target -xvc_url $xvc_url} last_open_message]} {
            set last_open_succeeded 0
            puts "WARN: open_hw_target failed: $last_open_message"
            continue
        }
        set last_open_succeeded 1

        after 1500
        set devices [list_devices $device_filter]
        if {[llength $devices] > 0} {
            break
        }
        puts "WARN: XVC TCP target opened, but the debug chain is empty."
    }

    if {[llength $devices] == 0} {
        set current_target "<none>"
        catch {set current_target [current_hw_target -quiet]}
        puts "INFO: Current target after retry: $current_target"

        if {!$last_open_succeeded} {
            fail E_XVC_CONNECT \
                "hw_server cannot open XVC endpoint $xvc_url: $last_open_message" \
                [list \
                    "On the FPGA host: ps -ef | grep '\[x\]vc_pcie'" \
                    "On the FPGA host: ss -ltnp | grep ':$xvc_port'" \
                    "Start XVC with the correct node: xvc_pcie -d /dev/xvc_pub.<driver_id> -s TCP::$xvc_port" \
                    "Newer XRT may use: /dev/xfpga/xvc_pub.<driver_id>"]
        }

        set expected_bdf [env_or_default O_ILA_EXPECTED_BDF 0000:13:00.0]
        fail E_XVC_EMPTY_CHAIN \
            "XVC at $xvc_url accepts a connection but exposes no Vivado hardware device. The .ltx file has not been used yet, so it is not the cause." \
            [list \
                "The expected card is $expected_bdf; load the debug xclbin on that card and pause the host after loading it." \
                "Check debug IPs: xbutil examine --device $expected_bdf --report debug-ip-status" \
                "List XVC nodes: ls -l /dev/xvc_pub.* /dev/xfpga/xvc_pub.* 2>/dev/null" \
                "Map a node to PCIe: udevadm info --query=path --name=/dev/xvc_pub.<driver_id>" \
                "Inspect the server: ps -ef | grep '\[x\]vc_pcie'" \
                "Inspect the port: ss -ltnp | grep ':$xvc_port'" \
                "Stop only the xvc_pcie PID bound to $xvc_port, then restart it with the node mapped to $expected_bdf:" \
                "xvc_pcie -d /dev/xvc_pub.<correct_driver_id> -s TCP::$xvc_port" \
                "If another xclbin was loaded after xvc_pcie started, restart xvc_pcie and source this script again."]
    }

    if {[llength $devices] > 1} {
        puts "WARN: XVC returned multiple hardware devices: $devices"
        puts "WARN: Selecting the first device; this endpoint should map to one card."
    }

    set device [lindex $devices 0]
    puts "PASS: Found hardware device: $device"
    puts "INFO: Device NAME=[safe_property $device NAME] PART=[safe_property $device PART]"
    return $device
}

proc ::o_projection_ila::load_probes {device ltx_file} {
    banner "STEP 3/4 - Load the ILA probes file"

    current_hw_device $device
    if {[catch {set_property PROBES.FILE $ltx_file $device} property_message]} {
        fail E_LTX_SET \
            "Vivado rejected PROBES.FILE '$ltx_file' for $device: $property_message" \
            [list \
                "Confirm the .ltx was generated together with the currently loaded .xclbin." \
                "Do not mix .ltx and .xclbin files from different builds."]
    }
    catch {set_property FULL_PROBES.FILE {} $device}

    puts "INFO: Refreshing $device with probes from:"
    puts "INFO:   $ltx_file"
    if {[catch {refresh_hw_device $device} refresh_message]} {
        fail E_DEVICE_REFRESH \
            "Vivado failed to refresh the device or load the probes: $refresh_message" \
            [list \
                "Verify that the debug .xclbin is still loaded and has not been replaced." \
                "Verify that $ltx_file belongs to exactly that .xclbin build." \
                "If the error mentions a debug hub clock, keep the kernel/debug clock running." \
                "Restart xvc_pcie if the xclbin was reprogrammed."]
    }
    puts "PASS: Device refreshed and probes file accepted."
}

proc ::o_projection_ila::find_required_ilas {device} {
    banner "STEP 4/4 - Verify the required forensic ILAs"

    set ilas [get_hw_ilas -quiet -of_objects $device]
    set control_ila ""
    set data_ila ""

    puts "INFO: Vivado found [llength $ilas] ILA core(s)."
    foreach ila $ilas {
        set cell_name [safe_property $ila CELL_NAME]
        puts "FOUND_ILA hw_name=$ila cell_name=$cell_name"
        if {[string match *ila_o_projection_pe0_control_inst* $cell_name]} {
            set control_ila $ila
        }
        if {[string match *ila_o_projection_pe0_data_inst* $cell_name]} {
            set data_ila $ila
        }
    }

    if {[llength $ilas] == 0} {
        fail E_NO_ILA \
            "The hardware device was found, but it exposes no ILA cores." \
            [list \
                "The wrong xclbin is probably loaded, or its debug hub is not running." \
                "Run: xbutil examine --device [env_or_default O_ILA_EXPECTED_BDF 0000:13:00.0] --report debug-ip-status" \
                "Load the forensic debug xclbin that was built with the selected .ltx file."]
    }

    if {$control_ila eq "" || $data_ila eq ""} {
        set missing {}
        if {$control_ila eq ""} {
            lappend missing ila_o_projection_pe0_control_inst
        }
        if {$data_ila eq ""} {
            lappend missing ila_o_projection_pe0_data_inst
        }
        fail E_REQUIRED_ILA_MISSING \
            "The device has [llength $ilas] ILA core(s), but required core(s) are missing: [join $missing {, }]" \
            [list \
                "Compare the FOUND_ILA cell names printed above with the required names." \
                "Load int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin." \
                "Use the .xclbin.ltx generated by that same build."]
    }

    return [list $control_ila $data_ila]
}

proc ::o_projection_ila::main {} {
    variable repo_root

    set default_ltx [file join $repo_root \
        int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin.ltx]
    set ltx_file [file normalize [env_or_default O_ILA_LTX $default_ltx]]
    set hw_server_url [env_or_default O_ILA_HW_SERVER_URL localhost:3121]
    set xvc_url [env_or_default O_ILA_XVC_URL localhost:10200]
    set device_filter [env_or_default O_ILA_DEVICE_FILTER *debug_bridge*]

    banner "PE0 O-PROJECTION ILA CONNECTION AND DIAGNOSTICS"
    puts "INFO: LTX file       : $ltx_file"
    puts "INFO: hw_server      : $hw_server_url"
    puts "INFO: XVC endpoint   : $xvc_url"
    puts "INFO: device filter  : $device_filter"

    if {![file exists $ltx_file]} {
        fail E_LTX_MISSING \
            "ILA probes file does not exist: $ltx_file" \
            [list \
                "Copy the matching .xclbin.ltx file to the repository root, or set:" \
                "export O_ILA_LTX=/absolute/path/to/the/matching.xclbin.ltx"]
    }
    if {![file isfile $ltx_file] || [file size $ltx_file] == 0} {
        fail E_LTX_INVALID \
            "ILA probes path is not a non-empty regular file: $ltx_file" \
            [list "Replace it with the .xclbin.ltx produced by the forensic build."]
    }

    reset_and_connect_server $hw_server_url
    set device [open_xvc_and_scan $xvc_url $device_filter]
    load_probes $device $ltx_file
    set required_ilas [find_required_ilas $device]

    set control_ila [lindex $required_ilas 0]
    set data_ila [lindex $required_ilas 1]

    set ::O_ILA_DEVICE $device
    set ::O_ILA_CONTROL_ILA $control_ila
    set ::O_ILA_DATA_ILA $data_ila

    banner "PASS O_PROJECTION_ILA_HW_CONNECTED"
    puts "device : $device"
    puts "control: $control_ila"
    puts "data   : $data_ila"
    puts "ltx    : $ltx_file"
    puts ""
    puts "Next (default checkpoint is the O-projection output):"
    puts "  source scripts/capture_o_projection_ila.tcl"
    puts "Optional checkpoint selection before source:"
    puts "  set ::env(O_ILA_CAPTURE_POINT) input_write|input_read|partial|completed|output|projection_read|residual"
}

::o_projection_ila::main
