# MCP for AXI-Lite control reset crossing SLR0->SLR3
# aresetn / m_areset_dly are quasi-static reset signals during inference.
# Verified on level0_wrapper_routed.dcp: improves slack from -1.570ns to +5.837ns.
set_multicycle_path -setup 3 \
    -from [get_cells -hierarchical -filter {NAME =~ *rst_clk_wiz*FDRE_PER_N* && LIB_CELL =~ FD*}] \
    -to   [get_cells -hierarchical -filter {NAME =~ *ict_axi_ctrl_user* && LIB_CELL =~ FD*}]

set_multicycle_path -hold  2 \
    -from [get_cells -hierarchical -filter {NAME =~ *rst_clk_wiz*FDRE_PER_N* && LIB_CELL =~ FD*}] \
    -to   [get_cells -hierarchical -filter {NAME =~ *ict_axi_ctrl_user* && LIB_CELL =~ FD*}]
