# HLS source guide

## Production dependency layers

1. `int4_types.hpp`: shared bit widths, tensor geometry, enums and packet types.
2. `int4_numeric.hpp`: bit-preserving FP32 memory-boundary conversion.
3. `int4_model_layout.hpp`: matrix shapes and per-DDR offsets.
4. `int4_decoder_schedule.hpp`: the fixed 32-layer execution schedule.
5. `int4_linear_controller.*`, `int4_decoder_blocks.*`, and
   `swiftkv_attention.*`: reusable compute services.
6. `int4_decoder_controller.*`: production top kernel and four local PE
   schedulers.

The production HLS scripts compile only these four translation units:

```text
swiftkv_attention.cpp
int4_linear_controller.cpp
int4_decoder_blocks.cpp
int4_decoder_controller.cpp
```

`int4_weight_packer.*` is host-side model preparation. Files under
`benchmarks/` are standalone experiments and are not production inputs.

## Active versus legacy APIs

The production top uses only the four local linear stages, the two pair
reducers/finalizers, the local decoder blocks, the two RMS pair services and
`int4_swiftkv_attention_pe0..3`.

Older four-PE dispatcher APIs remain available behind
`INT4_ENABLE_LEGACY_GLOBAL_API` for controlled experiments. Production builds
do not define this macro. New code should use the local ownership APIs.

## Initialization contract

The first token invocation after programming the FPGA must use `position == 0`.
That invocation loads weight scales and RMSNorm parameters into persistent
URAM. Later token invocations reuse those caches.

## Verification

Run the fast layout/schedule C simulation before synthesis:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_unit_tests.tcl
```

Run production C synthesis and generated-RTL architecture checks with:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_csynth_300mhz.tcl
```

An exported XO is valid only after `run_hls_300mhz.tcl` succeeds and its
SHA-256 sidecar is regenerated from that exact file.
