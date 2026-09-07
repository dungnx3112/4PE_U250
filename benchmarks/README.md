# Standalone GEMV experiments

These files are isolated micro-benchmarks for packed INT4 DSP arithmetic. They
are not compiled into `int4_decoder_token_controller` by either production HLS
script.

- `gemv_tile_pe.*`: tiled GEMV experiment.
- `gemv2_pack_bench.*`: two-INT4-multiply DSP packing experiment.

Keeping the experiments here prevents them from being confused with the active
decoder datapath while preserving them for QoR comparisons.
