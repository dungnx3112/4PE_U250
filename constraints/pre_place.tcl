# Enable maximum multi-threading (up to 8 threads allowed in Vivado)
set_param general.maxThreads 8

# Read custom timing constraints before placement
set script_dir [file dirname [file normalize [info script]]]
read_xdc [file join $script_dir mcp_reset.xdc]
puts "INFO: mcp_reset.xdc loaded - MCP 3/2 applied on AXI-Lite reset SLR0->SLR3"
