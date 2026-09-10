$tcl = Get-Content timing_300mhz_pre_place.tcl -Raw

$new_proc = @"

proc place_pe_core {pe slr} {
    set pe_pattern "*/int4_decoder_token_controller_1/inst/*/int4_decoder_local_pe_`${pe}_U0"
    set leaves [get_cells -quiet -hierarchical -filter "NAME =~ `$pe_pattern/* && IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND"]
    set pblock [get_pblocks -quiet "pblock_dynamic_`$slr"]
    
    if {[llength `$pblock] == 1 && [llength `$leaves] > 0} {
        add_cells_to_pblock `$pblock `$leaves
        puts "INFO: 300MHz floorplan: PE`$pe CORE -> `$slr ([llength `$leaves] leaves)"
    }
}
"@

$tcl = $tcl -replace '(?m)^foreach pe \{0 1 2 3\} slr \{SLR0 SLR1 SLR2 SLR3\} \{', "$new_proc`r`n`r`nforeach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {"

$tcl = $tcl -replace '(?m)^\s*place_pe_axi_bridges \$pe \$slr', "    place_pe_axi_bridges `$pe `$slr`r`n    place_pe_core `$pe `$slr"

Set-Content timing_300mhz_pre_place.tcl -Value $tcl
