#pragma once

#include <ap_int.h>
#include <cstdint>

// Bit-preserving FP32 conversion used at packed-memory boundaries. Keeping it
// in one header avoids three subtly different union helpers across the HLS
// modules. The functions are always inlined and do not create hardware blocks.
union Int4Fp32Bits {
    std::uint32_t bits;
    float value;
};

static inline float int4_fp32_from_bits(ap_uint<32> bits) {
#pragma HLS INLINE
    Int4Fp32Bits converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static inline ap_uint<32> int4_fp32_to_bits(float value) {
#pragma HLS INLINE
    Int4Fp32Bits converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}
