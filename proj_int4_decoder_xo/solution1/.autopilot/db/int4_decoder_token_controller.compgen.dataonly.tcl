# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
position { 
	dir I
	width 12
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
model_bank0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 24
	offset_end 35
}
model_bank1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 36
	offset_end 47
}
model_bank2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 48
	offset_end 59
}
model_bank3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 60
	offset_end 71
}
rope_lut_ddr { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 72
	offset_end 83
}
residual_pe0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 84
	offset_end 95
}
residual_pe1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 96
	offset_end 107
}
residual_pe2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 108
	offset_end 119
}
residual_pe3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 120
	offset_end 131
}
logits_pe0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 132
	offset_end 143
}
logits_pe1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 144
	offset_end 155
}
logits_pe2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 156
	offset_end 167
}
logits_pe3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 168
	offset_end 179
}
kv_cache_pe0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 180
	offset_end 191
}
kv_cache_pe1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 192
	offset_end 203
}
kv_cache_pe2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 204
	offset_end 215
}
kv_cache_pe3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 216
	offset_end 227
}
ap_start { }
ap_done { }
ap_ready { }
ap_continue { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


