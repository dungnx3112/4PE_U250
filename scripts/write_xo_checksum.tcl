# Write a portable SHA-256 sidecar for the XO produced by export_design.
proc write_xo_checksum {input_path} {
    set xo_path [file normalize $input_path]
    if {![file exists $xo_path]} {
        error "Cannot hash missing XO: $xo_path"
    }

    if {$::tcl_platform(platform) eq "windows"} {
        set certutil "C:/Windows/System32/certutil.exe"
        if {![file executable $certutil]} {
            error "Cannot find Windows SHA-256 utility: $certutil"
        }
        set digest ""
        foreach output_line [split [exec $certutil -hashfile $xo_path SHA256] "\n"] {
            set candidate [string map [list " " "" "\r" ""] [string trim $output_line]]
            if {[regexp {^[0-9A-Fa-f]{64}$} $candidate]} {
                set digest $candidate
                break
            }
        }
    } else {
        set digest [lindex [split [string trim [exec sha256sum $xo_path]]] 0]
    }

    if {![regexp {^[0-9A-Fa-f]{64}$} $digest]} {
        error "Unexpected SHA-256 output for $xo_path: $digest"
    }
    set digest [string toupper $digest]
    set sidecar_path "${xo_path}.sha256"
    set sidecar [open $sidecar_path w]
    puts $sidecar "$digest  [file tail $xo_path]"
    close $sidecar
    puts "INFO: XO SHA-256: $digest"
}
