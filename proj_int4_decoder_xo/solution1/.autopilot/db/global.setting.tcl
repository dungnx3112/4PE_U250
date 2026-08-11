
set TopModule "int4_decoder_token_controller"
set ClockPeriod 3.333
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 1
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 1
set ResetVariableFlag 0
set ResetRegisterNum 3
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix int4_decoder_token_controller_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xcu250:-figd2104:-2L-e
set SourceFiles {sc {} c {../../source/swiftkv_attention.cpp ../../source/int4_weight_packer.cpp ../../source/int4_linear_controller.cpp ../../source/int4_decoder_controller.cpp ../../source/int4_decoder_blocks.cpp ../../source/gemv_tile_pe.cpp ../../source/gemv2_pack_bench.cpp}}
set SourceFlags {sc {} c {{-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP} {-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP} {-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP} {-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP} {-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP} {-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP} {-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP}}}
set DirectiveFile {}
set TBFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {bc "" c "" sc "" cas "" vhdl "" verilog ""}
set TBInstNames {bc "" c "" sc "" cas "" vhdl "" verilog ""}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../../.
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/virtexuplus/virtexuplus}}}
set HPFPO 0
