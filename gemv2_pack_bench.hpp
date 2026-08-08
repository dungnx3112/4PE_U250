#pragma once

#include <ap_int.h>
#include <hls_stream.h>

// Activation mantissa
using act15_t = ap_int<15>;

// IMPORTANT:
// Quantizer must guarantee weight in [-7, +7].
// Value -8 is NOT allowed for the packed G32 proof.
using w4_t = ap_int<4>;

// Output widths:
// G32 mathematically needs 23 bits.
// G64 mathematically needs 24 bits.
using out23_t = ap_int<23>;
using out24_t = ap_int<24>;

// Four synthesis tops
void gemv2_base_g32(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out23_t>& y0_s,
    hls::stream<out23_t>& y1_s
);

void gemv2_pack_g32(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out23_t>& y0_s,
    hls::stream<out23_t>& y1_s
);

void gemv2_base_g64(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out24_t>& y0_s,
    hls::stream<out24_t>& y1_s
);

void gemv2_pack_g64(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out24_t>& y0_s,
    hls::stream<out24_t>& y1_s
);
