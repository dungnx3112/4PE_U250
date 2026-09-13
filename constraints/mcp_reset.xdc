# MCP for AXI-Lite control reset crossing SLR0->SLR3 
# aresetn is static during inference - safe to relax to 3 cycles 
set_multicycle_path -setup 3 -from [get_cells -hierarchical -filter {NAME =~ *rst_clk_wiz_270M*FDRE_PER_N*}] -to [get_cells -hierarchical -filter {NAME =~ *ict_axi_ctrl_user*aresetn*}] 
set_multicycle_path -hold  2 -from [get_cells -hierarchical -filter {NAME =~ *rst_clk_wiz_270M*FDRE_PER_N*}] -to [get_cells -hierarchical -filter {NAME =~ *ict_axi_ctrl_user*aresetn*}] 
