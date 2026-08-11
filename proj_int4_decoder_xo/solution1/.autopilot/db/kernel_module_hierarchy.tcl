set ModuleHierarchy {[{
"Name" : "int4_decoder_token_controller","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_swiftkv_preload_rope_lut_fu_604","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_swiftkv_preload_rope_lut_Pipeline_preload_rope_lut_loop_fu_65","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "preload_rope_lut_loop","ID" : "3","Type" : "pipeline"},]},]},
	{"Name" : "grp_int4_preload_model_prefix_4ddr_fu_613","ID" : "4","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_int4_preload_model_prefix_4ddr_Pipeline_preload_model_prefix_word_loop_fu_136","ID" : "5","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "preload_model_prefix_word_loop","ID" : "6","Type" : "pipeline"},]},]},
	{"Name" : "grp_swiftkv_load_rope_position_fu_645","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "rope_lut_group_loop_rope_lut_lane_loop","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_int4_load_residual_4ddr_fu_654","ID" : "9","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_int4_load_residual_4ddr_Pipeline_load_residual_word_loop_fu_126","ID" : "10","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "load_residual_word_loop","ID" : "11","Type" : "pipeline"},]},]},
	{"Name" : "grp_int4_store_residual_4ddr_fu_797","ID" : "12","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_int4_store_residual_4ddr_Pipeline_store_residual_word_loop_fu_132","ID" : "13","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "store_residual_word_loop","ID" : "14","Type" : "pipeline"},]},]},],
"SubLoops" : [
	{"Name" : "Loop 1","ID" : "15","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_swiftkv_run_four_pes_fu_674","ID" : "16","Type" : "dataflow",
			"SubInsts" : [
			{"Name" : "swiftkv_broadcast_rope_U0","ID" : "17","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "rope_broadcast_pair_loop","ID" : "18","Type" : "pipeline"},]},
			{"Name" : "swiftkv_broadcast_pe_commands_U0","ID" : "19","Type" : "sequential"},
			{"Name" : "swiftkv_run_pe_0_U0","ID" : "20","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_swiftkv_run_bank_fu_84","ID" : "21","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278","ID" : "22","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "pe_cache_rope_pair_loop","ID" : "23","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "pe_head_loop","ID" : "24","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288","ID" : "25","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_q_word_loop","ID" : "26","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296","ID" : "27","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_k_word_loop","ID" : "28","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304","ID" : "29","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_v_word_loop","ID" : "30","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312","ID" : "31","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_rope_word_loop_pe_rope_pair_phase_loop","ID" : "32","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_quantize_kv_record_fu_337","ID" : "33","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "quantize_kv_group_loop","ID" : "34","Type" : "no",
							"SubInsts" : [
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538","ID" : "35","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "find_kv_group_max_block_loop","ID" : "36","Type" : "pipeline"},]},
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608","ID" : "37","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "quantize_kv_group_block_loop","ID" : "38","Type" : "pipeline"},]},]},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343","ID" : "39","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_write_kv_word_loop","ID" : "40","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_attention_head_fu_355","ID" : "41","Type" : "dataflow",
							"SubInsts" : [
							{"Name" : "entry_proc57_U0","ID" : "42","Type" : "sequential"},
							{"Name" : "swiftkv_read_compressed_kv_cache_U0","ID" : "43","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114","ID" : "44","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "read_compressed_kv_loop","ID" : "45","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_route_compressed_kv_cache_U0","ID" : "46","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120","ID" : "47","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "route_cached_compressed_kv_loop","ID" : "48","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151","ID" : "49","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_current_compressed_kv_loop","ID" : "50","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_process_compressed_kv_U0","ID" : "51","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104","ID" : "52","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "compressed_dot_phase_loop","ID" : "53","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_coefficient_producer_U0","ID" : "54","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81","ID" : "55","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "coefficient_token_loop","ID" : "56","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_reciprocal_normalization_fu_93","ID" : "57","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "reciprocal_divide_bit_loop","ID" : "58","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_update_values_and_quantize_U0","ID" : "59","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_accumulate_values_split_fu_262","ID" : "60","Type" : "dataflow",
									"SubInsts" : [
									{"Name" : "swiftkv_broadcast_update_controls_U0","ID" : "61","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98","ID" : "62","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "broadcast_update_control_loop","ID" : "63","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_0_U0","ID" : "64","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70","ID" : "65","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "66","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_1_U0","ID" : "67","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70","ID" : "68","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "69","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_2_U0","ID" : "70","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70","ID" : "71","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "72","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_3_U0","ID" : "73","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70","ID" : "74","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "75","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_0_U0","ID" : "76","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64","ID" : "77","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "78","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "79","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "80","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_1_U0","ID" : "81","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64","ID" : "82","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "83","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "84","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "85","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_2_U0","ID" : "86","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64","ID" : "87","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "88","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "89","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "90","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_3_U0","ID" : "91","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64","ID" : "92","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "93","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "94","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "95","Type" : "pipeline"},]},]},]},],
								"SubLoops" : [
								{"Name" : "attention_quant_group_loop","ID" : "96","Type" : "no",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320","ID" : "97","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_normalize_lane_loop","ID" : "98","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344","ID" : "99","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_quantize_reverse_loop","ID" : "100","Type" : "pipeline"},]},]},]},]},]},]},]},
			{"Name" : "swiftkv_run_pe_1_U0","ID" : "101","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_swiftkv_run_bank_fu_84","ID" : "102","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278","ID" : "103","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "pe_cache_rope_pair_loop","ID" : "104","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "pe_head_loop","ID" : "105","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288","ID" : "106","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_q_word_loop","ID" : "107","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296","ID" : "108","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_k_word_loop","ID" : "109","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304","ID" : "110","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_v_word_loop","ID" : "111","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312","ID" : "112","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_rope_word_loop_pe_rope_pair_phase_loop","ID" : "113","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_quantize_kv_record_fu_337","ID" : "114","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "quantize_kv_group_loop","ID" : "115","Type" : "no",
							"SubInsts" : [
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538","ID" : "116","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "find_kv_group_max_block_loop","ID" : "117","Type" : "pipeline"},]},
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608","ID" : "118","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "quantize_kv_group_block_loop","ID" : "119","Type" : "pipeline"},]},]},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343","ID" : "120","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_write_kv_word_loop","ID" : "121","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_attention_head_fu_355","ID" : "122","Type" : "dataflow",
							"SubInsts" : [
							{"Name" : "entry_proc57_U0","ID" : "123","Type" : "sequential"},
							{"Name" : "swiftkv_read_compressed_kv_cache_U0","ID" : "124","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114","ID" : "125","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "read_compressed_kv_loop","ID" : "126","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_route_compressed_kv_cache_U0","ID" : "127","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120","ID" : "128","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "route_cached_compressed_kv_loop","ID" : "129","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151","ID" : "130","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_current_compressed_kv_loop","ID" : "131","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_process_compressed_kv_U0","ID" : "132","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104","ID" : "133","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "compressed_dot_phase_loop","ID" : "134","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_coefficient_producer_U0","ID" : "135","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81","ID" : "136","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "coefficient_token_loop","ID" : "137","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_reciprocal_normalization_fu_93","ID" : "138","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "reciprocal_divide_bit_loop","ID" : "139","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_update_values_and_quantize_U0","ID" : "140","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_accumulate_values_split_fu_262","ID" : "141","Type" : "dataflow",
									"SubInsts" : [
									{"Name" : "swiftkv_broadcast_update_controls_U0","ID" : "142","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98","ID" : "143","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "broadcast_update_control_loop","ID" : "144","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_0_U0","ID" : "145","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70","ID" : "146","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "147","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_1_U0","ID" : "148","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70","ID" : "149","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "150","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_2_U0","ID" : "151","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70","ID" : "152","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "153","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_3_U0","ID" : "154","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70","ID" : "155","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "156","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_0_U0","ID" : "157","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64","ID" : "158","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "159","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "160","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "161","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_1_U0","ID" : "162","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64","ID" : "163","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "164","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "165","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "166","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_2_U0","ID" : "167","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64","ID" : "168","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "169","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "170","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "171","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_3_U0","ID" : "172","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64","ID" : "173","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "174","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "175","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "176","Type" : "pipeline"},]},]},]},],
								"SubLoops" : [
								{"Name" : "attention_quant_group_loop","ID" : "177","Type" : "no",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320","ID" : "178","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_normalize_lane_loop","ID" : "179","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344","ID" : "180","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_quantize_reverse_loop","ID" : "181","Type" : "pipeline"},]},]},]},]},]},]},]},
			{"Name" : "swiftkv_run_pe_2_U0","ID" : "182","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_swiftkv_run_bank_fu_84","ID" : "183","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278","ID" : "184","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "pe_cache_rope_pair_loop","ID" : "185","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "pe_head_loop","ID" : "186","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288","ID" : "187","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_q_word_loop","ID" : "188","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296","ID" : "189","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_k_word_loop","ID" : "190","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304","ID" : "191","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_v_word_loop","ID" : "192","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312","ID" : "193","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_rope_word_loop_pe_rope_pair_phase_loop","ID" : "194","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_quantize_kv_record_fu_337","ID" : "195","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "quantize_kv_group_loop","ID" : "196","Type" : "no",
							"SubInsts" : [
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538","ID" : "197","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "find_kv_group_max_block_loop","ID" : "198","Type" : "pipeline"},]},
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608","ID" : "199","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "quantize_kv_group_block_loop","ID" : "200","Type" : "pipeline"},]},]},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343","ID" : "201","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_write_kv_word_loop","ID" : "202","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_attention_head_fu_355","ID" : "203","Type" : "dataflow",
							"SubInsts" : [
							{"Name" : "entry_proc57_U0","ID" : "204","Type" : "sequential"},
							{"Name" : "swiftkv_read_compressed_kv_cache_U0","ID" : "205","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114","ID" : "206","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "read_compressed_kv_loop","ID" : "207","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_route_compressed_kv_cache_U0","ID" : "208","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120","ID" : "209","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "route_cached_compressed_kv_loop","ID" : "210","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151","ID" : "211","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_current_compressed_kv_loop","ID" : "212","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_process_compressed_kv_U0","ID" : "213","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104","ID" : "214","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "compressed_dot_phase_loop","ID" : "215","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_coefficient_producer_U0","ID" : "216","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81","ID" : "217","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "coefficient_token_loop","ID" : "218","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_reciprocal_normalization_fu_93","ID" : "219","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "reciprocal_divide_bit_loop","ID" : "220","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_update_values_and_quantize_U0","ID" : "221","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_accumulate_values_split_fu_262","ID" : "222","Type" : "dataflow",
									"SubInsts" : [
									{"Name" : "swiftkv_broadcast_update_controls_U0","ID" : "223","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98","ID" : "224","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "broadcast_update_control_loop","ID" : "225","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_0_U0","ID" : "226","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70","ID" : "227","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "228","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_1_U0","ID" : "229","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70","ID" : "230","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "231","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_2_U0","ID" : "232","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70","ID" : "233","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "234","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_3_U0","ID" : "235","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70","ID" : "236","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "237","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_0_U0","ID" : "238","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64","ID" : "239","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "240","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "241","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "242","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_1_U0","ID" : "243","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64","ID" : "244","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "245","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "246","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "247","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_2_U0","ID" : "248","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64","ID" : "249","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "250","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "251","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "252","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_3_U0","ID" : "253","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64","ID" : "254","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "255","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "256","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "257","Type" : "pipeline"},]},]},]},],
								"SubLoops" : [
								{"Name" : "attention_quant_group_loop","ID" : "258","Type" : "no",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320","ID" : "259","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_normalize_lane_loop","ID" : "260","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344","ID" : "261","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_quantize_reverse_loop","ID" : "262","Type" : "pipeline"},]},]},]},]},]},]},]},
			{"Name" : "swiftkv_run_pe_3_U0","ID" : "263","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_swiftkv_run_bank_fu_84","ID" : "264","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278","ID" : "265","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "pe_cache_rope_pair_loop","ID" : "266","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "pe_head_loop","ID" : "267","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288","ID" : "268","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_q_word_loop","ID" : "269","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296","ID" : "270","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_k_word_loop","ID" : "271","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304","ID" : "272","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_load_v_word_loop","ID" : "273","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312","ID" : "274","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_rope_word_loop_pe_rope_pair_phase_loop","ID" : "275","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_quantize_kv_record_fu_337","ID" : "276","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "quantize_kv_group_loop","ID" : "277","Type" : "no",
							"SubInsts" : [
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538","ID" : "278","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "find_kv_group_max_block_loop","ID" : "279","Type" : "pipeline"},]},
							{"Name" : "grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608","ID" : "280","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "quantize_kv_group_block_loop","ID" : "281","Type" : "pipeline"},]},]},]},
					{"Name" : "grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343","ID" : "282","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "pe_write_kv_word_loop","ID" : "283","Type" : "pipeline"},]},
					{"Name" : "grp_swiftkv_attention_head_fu_355","ID" : "284","Type" : "dataflow",
							"SubInsts" : [
							{"Name" : "entry_proc57_U0","ID" : "285","Type" : "sequential"},
							{"Name" : "swiftkv_read_compressed_kv_cache_U0","ID" : "286","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114","ID" : "287","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "read_compressed_kv_loop","ID" : "288","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_route_compressed_kv_cache_U0","ID" : "289","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120","ID" : "290","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "route_cached_compressed_kv_loop","ID" : "291","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151","ID" : "292","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_current_compressed_kv_loop","ID" : "293","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_process_compressed_kv_U0","ID" : "294","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104","ID" : "295","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "compressed_dot_phase_loop","ID" : "296","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_coefficient_producer_U0","ID" : "297","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81","ID" : "298","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "coefficient_token_loop","ID" : "299","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_reciprocal_normalization_fu_93","ID" : "300","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "reciprocal_divide_bit_loop","ID" : "301","Type" : "pipeline"},]},]},
							{"Name" : "swiftkv_update_values_and_quantize_U0","ID" : "302","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_accumulate_values_split_fu_262","ID" : "303","Type" : "dataflow",
									"SubInsts" : [
									{"Name" : "swiftkv_broadcast_update_controls_U0","ID" : "304","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98","ID" : "305","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "broadcast_update_control_loop","ID" : "306","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_0_U0","ID" : "307","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70","ID" : "308","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "309","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_1_U0","ID" : "310","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70","ID" : "311","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "312","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_2_U0","ID" : "313","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70","ID" : "314","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "315","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_prepare_update_engine_phases_3_U0","ID" : "316","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70","ID" : "317","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "prepare_update_engine_phase_loop","ID" : "318","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_0_U0","ID" : "319","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64","ID" : "320","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "321","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "322","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "323","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_1_U0","ID" : "324","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64","ID" : "325","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "326","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "327","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "328","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_2_U0","ID" : "329","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64","ID" : "330","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "331","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "332","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "333","Type" : "pipeline"},]},]},
									{"Name" : "swiftkv_update_value_engine_3_U0","ID" : "334","Type" : "sequential",
										"SubInsts" : [
										{"Name" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64","ID" : "335","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "initialize_weighted_value_engine_phase_loop","ID" : "336","Type" : "pipeline"},]},
										{"Name" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76","ID" : "337","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "update_value_engine_phase_loop","ID" : "338","Type" : "pipeline"},]},]},]},],
								"SubLoops" : [
								{"Name" : "attention_quant_group_loop","ID" : "339","Type" : "no",
								"SubInsts" : [
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320","ID" : "340","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_normalize_lane_loop","ID" : "341","Type" : "pipeline"},]},
								{"Name" : "grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344","ID" : "342","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "attention_quantize_reverse_loop","ID" : "343","Type" : "pipeline"},]},]},]},]},]},]},]},
			{"Name" : "swiftkv_gather_attention_streams_U0","ID" : "344","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "integrated_gather_local_head_loop_integrated_gather_pe_loop_integrated_gather_group_loop","ID" : "345","Type" : "pipeline"},]},]},
	{"Name" : "grp_int4_dispatch_linear_registered_fu_710","ID" : "346","Type" : "dataflow",
			"SubInsts" : [
			{"Name" : "entry_proc58_U0","ID" : "347","Type" : "sequential"},
			{"Name" : "int4_dispatch_linear_registered_Block_entry1_proc24_U0","ID" : "348","Type" : "sequential"},
			{"Name" : "int4_execute_dispatch_linear_U0","ID" : "349","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357","ID" : "350","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "seed_linear_stage_with_residual_loop","ID" : "351","Type" : "pipeline"},]},
				{"Name" : "grp_int4_run_preprocess_and_linear_fu_377","ID" : "352","Type" : "dataflow",
					"SubInsts" : [
					{"Name" : "int4_preprocess_activation_stream_U0","ID" : "353","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_int4_swiglu_quantize_stream_4pe_fu_112","ID" : "354","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44","ID" : "355","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "int4_swiglu_quantize_pe0_U0","ID" : "356","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "swiglu_group_loop","ID" : "357","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106","ID" : "358","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_word_loop_swiglu_lane_loop","ID" : "359","Type" : "pipeline"},]},
									{"Name" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117","ID" : "360","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_quantize_reverse_loop","ID" : "361","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_swiglu_quantize_pe1_U0","ID" : "362","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "swiglu_group_loop","ID" : "363","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106","ID" : "364","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_word_loop_swiglu_lane_loop","ID" : "365","Type" : "pipeline"},]},
									{"Name" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117","ID" : "366","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_quantize_reverse_loop","ID" : "367","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_swiglu_quantize_pe2_U0","ID" : "368","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "swiglu_group_loop","ID" : "369","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106","ID" : "370","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_word_loop_swiglu_lane_loop","ID" : "371","Type" : "pipeline"},]},
									{"Name" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117","ID" : "372","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_quantize_reverse_loop","ID" : "373","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_swiglu_quantize_pe3_U0","ID" : "374","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "swiglu_group_loop","ID" : "375","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106","ID" : "376","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_word_loop_swiglu_lane_loop","ID" : "377","Type" : "pipeline"},]},
									{"Name" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117","ID" : "378","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_quantize_reverse_loop","ID" : "379","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_swiglu_gather_streams_U0","ID" : "380","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "swiglu_stream_local_tile_loop_swiglu_stream_pe_loop","ID" : "381","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88","ID" : "382","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "swiglu_stream_group_loop","ID" : "383","Type" : "pipeline"},]},]},]},]},]},
						{"Name" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136","ID" : "384","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_int4_rms_sumsq_four_pes_fu_88","ID" : "385","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "int4_rms_sumsq_pe_U0","ID" : "386","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105","ID" : "387","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "sumsq_word_loop_sumsq_lane_loop","ID" : "388","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127","ID" : "389","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "merge_sumsq_lane_loop","ID" : "390","Type" : "pipeline"},]},]},
								{"Name" : "int4_rms_sumsq_pe_10_U0","ID" : "391","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105","ID" : "392","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "sumsq_word_loop_sumsq_lane_loop","ID" : "393","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127","ID" : "394","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "merge_sumsq_lane_loop","ID" : "395","Type" : "pipeline"},]},]},
								{"Name" : "int4_rms_sumsq_pe_11_U0","ID" : "396","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105","ID" : "397","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "sumsq_word_loop_sumsq_lane_loop","ID" : "398","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127","ID" : "399","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "merge_sumsq_lane_loop","ID" : "400","Type" : "pipeline"},]},]},
								{"Name" : "int4_rms_sumsq_pe_12_U0","ID" : "401","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105","ID" : "402","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "sumsq_word_loop_sumsq_lane_loop","ID" : "403","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127","ID" : "404","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "merge_sumsq_lane_loop","ID" : "405","Type" : "pipeline"},]},]},
								{"Name" : "int4_rms_merge_and_rsqrt_U0","ID" : "406","Type" : "sequential"},]},
							{"Name" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101","ID" : "407","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "int4_rms_normalize_quantize_pe_U0","ID" : "408","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "normalize_group_loop","ID" : "409","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124","ID" : "410","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "normalize_word_loop_normalize_lane_loop","ID" : "411","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137","ID" : "412","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "quantize_reverse_loop","ID" : "413","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_rms_normalize_quantize_pe_13_U0","ID" : "414","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "normalize_group_loop","ID" : "415","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124","ID" : "416","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "normalize_word_loop_normalize_lane_loop","ID" : "417","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137","ID" : "418","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "quantize_reverse_loop","ID" : "419","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_rms_normalize_quantize_pe_14_U0","ID" : "420","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "normalize_group_loop","ID" : "421","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124","ID" : "422","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "normalize_word_loop_normalize_lane_loop","ID" : "423","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137","ID" : "424","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "quantize_reverse_loop","ID" : "425","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_rms_normalize_quantize_pe_15_U0","ID" : "426","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "normalize_group_loop","ID" : "427","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124","ID" : "428","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "normalize_word_loop_normalize_lane_loop","ID" : "429","Type" : "pipeline"},]},
									{"Name" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137","ID" : "430","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "quantize_reverse_loop","ID" : "431","Type" : "pipeline"},]},]},]},
								{"Name" : "int4_rms_gather_streams_U0","ID" : "432","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "rms_stream_local_tile_loop_rms_stream_pe_loop_rms_stream_group_loop","ID" : "433","Type" : "pipeline"},]},]},]},]},
					{"Name" : "icmp_ln113_loc_i_channel_U","ID" : "434","Type" : "sequential"},
					{"Name" : "int4_linear_4pe_from_stream_U0","ID" : "435","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_int4_run_four_pes_fu_572","ID" : "436","Type" : "dataflow",
							"SubInsts" : [
							{"Name" : "int4_broadcast_linear_commands_U0","ID" : "437","Type" : "sequential"},
							{"Name" : "int4_broadcast_activation_U0","ID" : "438","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141","ID" : "439","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "broadcast_activation_seed_loop","ID" : "440","Type" : "pipeline"},]},]},
							{"Name" : "int4_run_pe_dataflow_0_U0","ID" : "441","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "entry_proc56_U0","ID" : "442","Type" : "sequential"},
								{"Name" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0","ID" : "443","Type" : "sequential"},
								{"Name" : "int4_stream_pe_inputs_U0","ID" : "444","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_weight_word_loop","ID" : "445","Type" : "pipeline"},]},
								{"Name" : "int4_cache_and_replay_activation_0_U0","ID" : "446","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100","ID" : "447","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "cache_local_activation_loop","ID" : "448","Type" : "pipeline"},]},
									{"Name" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111","ID" : "449","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop","ID" : "450","Type" : "pipeline"},]},]},
								{"Name" : "int4_stream_integer_blocks_U0","ID" : "451","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86","ID" : "452","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop","ID" : "453","Type" : "pipeline"},]},]},
								{"Name" : "int4_dequantize_final_blocks_U0","ID" : "454","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90","ID" : "455","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop","ID" : "456","Type" : "pipeline"},]},]},
								{"Name" : "int4_pack_dequantized_outputs_U0","ID" : "457","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72","ID" : "458","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "pack_dequantized_value_loop","ID" : "459","Type" : "pipeline"},]},]},
								{"Name" : "int4_write_outputs_9_U0","ID" : "460","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239","ID" : "461","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "write_output_direct_loop","ID" : "462","Type" : "pipeline"},]},],
									"SubLoops" : [
									{"Name" : "write_output_fused_loop","ID" : "463","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248","ID" : "464","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "fused_residual_add_loop","ID" : "465","Type" : "pipeline"},]},]},]},]},
							{"Name" : "int4_run_pe_dataflow_1_U0","ID" : "466","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "entry_proc55_U0","ID" : "467","Type" : "sequential"},
								{"Name" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0","ID" : "468","Type" : "sequential"},
								{"Name" : "int4_stream_pe_inputs_16_U0","ID" : "469","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_weight_word_loop","ID" : "470","Type" : "pipeline"},]},
								{"Name" : "int4_cache_and_replay_activation_1_U0","ID" : "471","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100","ID" : "472","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "cache_local_activation_loop","ID" : "473","Type" : "pipeline"},]},
									{"Name" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111","ID" : "474","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop","ID" : "475","Type" : "pipeline"},]},]},
								{"Name" : "int4_stream_integer_blocks_5_U0","ID" : "476","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86","ID" : "477","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop","ID" : "478","Type" : "pipeline"},]},]},
								{"Name" : "int4_dequantize_final_blocks_17_U0","ID" : "479","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90","ID" : "480","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop","ID" : "481","Type" : "pipeline"},]},]},
								{"Name" : "int4_pack_dequantized_outputs_6_U0","ID" : "482","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72","ID" : "483","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "pack_dequantized_value_loop","ID" : "484","Type" : "pipeline"},]},]},
								{"Name" : "int4_write_outputs_8_U0","ID" : "485","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239","ID" : "486","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "write_output_direct_loop","ID" : "487","Type" : "pipeline"},]},],
									"SubLoops" : [
									{"Name" : "write_output_fused_loop","ID" : "488","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248","ID" : "489","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "fused_residual_add_loop","ID" : "490","Type" : "pipeline"},]},]},]},]},
							{"Name" : "int4_run_pe_dataflow_2_U0","ID" : "491","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "entry_proc54_U0","ID" : "492","Type" : "sequential"},
								{"Name" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0","ID" : "493","Type" : "sequential"},
								{"Name" : "int4_stream_pe_inputs_18_U0","ID" : "494","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_weight_word_loop","ID" : "495","Type" : "pipeline"},]},
								{"Name" : "int4_cache_and_replay_activation_2_U0","ID" : "496","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100","ID" : "497","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "cache_local_activation_loop","ID" : "498","Type" : "pipeline"},]},
									{"Name" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111","ID" : "499","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop","ID" : "500","Type" : "pipeline"},]},]},
								{"Name" : "int4_stream_integer_blocks_3_U0","ID" : "501","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86","ID" : "502","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop","ID" : "503","Type" : "pipeline"},]},]},
								{"Name" : "int4_dequantize_final_blocks_19_U0","ID" : "504","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90","ID" : "505","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop","ID" : "506","Type" : "pipeline"},]},]},
								{"Name" : "int4_pack_dequantized_outputs_4_U0","ID" : "507","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72","ID" : "508","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "pack_dequantized_value_loop","ID" : "509","Type" : "pipeline"},]},]},
								{"Name" : "int4_write_outputs_7_U0","ID" : "510","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239","ID" : "511","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "write_output_direct_loop","ID" : "512","Type" : "pipeline"},]},],
									"SubLoops" : [
									{"Name" : "write_output_fused_loop","ID" : "513","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248","ID" : "514","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "fused_residual_add_loop","ID" : "515","Type" : "pipeline"},]},]},]},]},
							{"Name" : "int4_run_pe_dataflow_3_U0","ID" : "516","Type" : "dataflow",
								"SubInsts" : [
								{"Name" : "entry_proc_U0","ID" : "517","Type" : "sequential"},
								{"Name" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0","ID" : "518","Type" : "sequential"},
								{"Name" : "int4_stream_pe_inputs_20_U0","ID" : "519","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "stream_weight_word_loop","ID" : "520","Type" : "pipeline"},]},
								{"Name" : "int4_cache_and_replay_activation_3_U0","ID" : "521","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100","ID" : "522","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "cache_local_activation_loop","ID" : "523","Type" : "pipeline"},]},
									{"Name" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111","ID" : "524","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop","ID" : "525","Type" : "pipeline"},]},]},
								{"Name" : "int4_stream_integer_blocks_1_U0","ID" : "526","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86","ID" : "527","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop","ID" : "528","Type" : "pipeline"},]},]},
								{"Name" : "int4_dequantize_final_blocks_21_U0","ID" : "529","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90","ID" : "530","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop","ID" : "531","Type" : "pipeline"},]},]},
								{"Name" : "int4_pack_dequantized_outputs_2_U0","ID" : "532","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72","ID" : "533","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "pack_dequantized_value_loop","ID" : "534","Type" : "pipeline"},]},]},
								{"Name" : "int4_write_outputs_U0","ID" : "535","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239","ID" : "536","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "write_output_direct_loop","ID" : "537","Type" : "pipeline"},]},],
									"SubLoops" : [
									{"Name" : "write_output_fused_loop","ID" : "538","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248","ID" : "539","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "fused_residual_add_loop","ID" : "540","Type" : "pipeline"},]},]},]},]},]},]},]},
				{"Name" : "grp_int4_route_linear_projection_5_s_fu_474","ID" : "541","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "route_linear_projection_loop","ID" : "542","Type" : "pipeline"},]},
				{"Name" : "grp_int4_route_linear_projection_4_s_fu_494","ID" : "543","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "route_linear_projection_loop","ID" : "544","Type" : "pipeline"},]},
				{"Name" : "grp_int4_route_linear_projection_2_s_fu_514","ID" : "545","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "route_linear_projection_loop","ID" : "546","Type" : "pipeline"},]},
				{"Name" : "grp_int4_route_linear_projection_1_s_fu_534","ID" : "547","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "route_linear_projection_loop","ID" : "548","Type" : "pipeline"},]},
				{"Name" : "grp_int4_route_linear_projection_6_s_fu_554","ID" : "549","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "route_linear_projection_loop","ID" : "550","Type" : "pipeline"},]},
				{"Name" : "grp_int4_route_linear_projection_0_s_fu_574","ID" : "551","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "route_linear_projection_loop","ID" : "552","Type" : "pipeline"},]},
				{"Name" : "grp_int4_route_linear_projection_7_s_fu_594","ID" : "553","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134","ID" : "554","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "route_linear_projection_loop","ID" : "555","Type" : "pipeline"},]},]},]},]},]},]
}]}