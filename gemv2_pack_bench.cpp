#include "gemv2_pack_bench.hpp"

// ============================================================
// Configuration
// ============================================================
//
// DSP48E2:
//   pre-adder : 27 bit
//   multiplier: 27 x 18
//   post-add  : 48 bit
//
// Pack:
//   packed_w = (w_hi << 23) + w_lo
//
// Multiply:
//   packed_w[27] * x[15]
//
// Expansion:
//   ((w_hi << 23) + w_lo) * x
// = (w_hi * x) << 23
// + (w_lo * x)
//
// Therefore two A15 x W4 products share one activation x.
//
// ============================================================

static constexpr int PACK_GAP = 23;


// ------------------------------------------------------------
// Pack two signed INT4 weights into one signed 27-bit operand.
//
// REQUIREMENT:
//   w_hi, w_lo in [-7, +7]
//
// We deliberately use:
//   (w_hi << 23) + w_lo
//
// rather than concatenation.
//
// This matches signed two's-complement packed arithmetic.
// ------------------------------------------------------------
static ap_int<27> pack_two_w4(
    w4_t w_hi,
    w4_t w_lo
) {
#pragma HLS INLINE

    ap_int<27> hi = (ap_int<27>)w_hi;
    ap_int<27> lo = (ap_int<27>)w_lo;

    ap_int<27> packed =
        (hi << PACK_GAP) + lo;

    return packed;
}


// ------------------------------------------------------------
// Recover two signed 23-bit dot products from packed accumulator.
//
// Packed relation:
//
//   P = (S_hi << 23) + S_lo
//
// where S_lo fits signed 23 bits.
//
// Due to arithmetic two's-complement packing:
//
//   if S_lo >= 0:
//       upper_raw = S_hi
//
//   if S_lo < 0:
//       upper_raw = S_hi - 1
//
// Therefore:
//
//   S_hi = upper_raw + sign(S_lo)
//
// This is the final correction.
// ------------------------------------------------------------
static void unpack_acc23(
    ap_int<48> packed_acc,
    ap_int<23>& hi_out,
    ap_int<23>& lo_out
) {
#pragma HLS INLINE

    ap_int<23> lo =
        packed_acc.range(22, 0);

    ap_int<23> hi_raw =
        packed_acc.range(45, 23);

    // Use 24 bits temporarily to avoid accidental overflow
    // inside the correction expression.
    ap_int<24> hi_corrected =
        (ap_int<24>)hi_raw
        + (lo[22] ? 1 : 0);

    lo_out = lo;
    hi_out = (ap_int<23>)hi_corrected;
}


// ============================================================
// BASELINE G32
//
// Two independent MACs:
//
//   acc0 += x * w0
//   acc1 += x * w1
//
// Desired expected mapping:
//   2 DSP48E2
//
// No manual packing.
// ============================================================
void gemv2_base_g32(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out23_t>& y0_s,
    hls::stream<out23_t>& y1_s
) {
#pragma HLS INTERFACE ap_fifo port=x_s
#pragma HLS INTERFACE ap_fifo port=w0_s
#pragma HLS INTERFACE ap_fifo port=w1_s
#pragma HLS INTERFACE ap_fifo port=y0_s
#pragma HLS INTERFACE ap_fifo port=y1_s

    ap_int<23> acc0 = 0;
    ap_int<23> acc1 = 0;

G32_BASE_LOOP:
    for (int i = 0; i < 32; ++i) {
#pragma HLS PIPELINE II=1

        act15_t x = x_s.read();
        w4_t w0 = w0_s.read();
        w4_t w1 = w1_s.read();

        // Keep direct MAC expressions.
        // Do not split unnecessarily into many temporary variables.
        acc0 += x * w0;
        acc1 += x * w1;
    }

    y0_s.write((out23_t)acc0);
    y1_s.write((out23_t)acc1);
}


// ============================================================
// PACKED G32
//
// One packed MAC:
//
//   packed_acc += ((w0 << 23) + w1) * x
//
// Desired expected mapping:
//   1 DSP48E2
//
// After 32 terms:
//   unpack once
//   correct upper lane once
// ============================================================
void gemv2_pack_g32(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out23_t>& y0_s,
    hls::stream<out23_t>& y1_s
) {
#pragma HLS INTERFACE ap_fifo port=x_s
#pragma HLS INTERFACE ap_fifo port=w0_s
#pragma HLS INTERFACE ap_fifo port=w1_s
#pragma HLS INTERFACE ap_fifo port=y0_s
#pragma HLS INTERFACE ap_fifo port=y1_s

    ap_int<48> packed_acc = 0;

G32_PACK_LOOP:
    for (int i = 0; i < 32; ++i) {
#pragma HLS PIPELINE II=1

        act15_t x = x_s.read();
        w4_t w0 = w0_s.read();
        w4_t w1 = w1_s.read();

        ap_int<27> packed_w =
            pack_two_w4(w0, w1);

        // CRITICAL EXPRESSION
        //
        // Try to let HLS recognize:
        //
        //   pre-add/pack
        //       ->
        //   multiply
        //       ->
        //   accumulate
        //
        // as one DSP-style chain.
        packed_acc += packed_w * x;
    }

    ap_int<23> y0;
    ap_int<23> y1;

    unpack_acc23(
        packed_acc,
        y0,
        y1
    );

    y0_s.write((out23_t)y0);
    y1_s.write((out23_t)y1);
}


// ============================================================
// BASELINE G64
//
// Full exact accumulator width:
//   A15 x symmetric W4 -> product bounded for [-7,+7]
//   sum 64 -> signed 24-bit accumulator
// ============================================================
void gemv2_base_g64(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out24_t>& y0_s,
    hls::stream<out24_t>& y1_s
) {
#pragma HLS INTERFACE ap_fifo port=x_s
#pragma HLS INTERFACE ap_fifo port=w0_s
#pragma HLS INTERFACE ap_fifo port=w1_s
#pragma HLS INTERFACE ap_fifo port=y0_s
#pragma HLS INTERFACE ap_fifo port=y1_s

    ap_int<24> acc0 = 0;
    ap_int<24> acc1 = 0;

G64_BASE_LOOP:
    for (int i = 0; i < 64; ++i) {
#pragma HLS PIPELINE II=1

        act15_t x = x_s.read();
        w4_t w0 = w0_s.read();
        w4_t w1 = w1_s.read();

        acc0 += x * w0;
        acc1 += x * w1;
    }

    y0_s.write(acc0);
    y1_s.write(acc1);
}


// ============================================================
// PACKED G64
//
// A15 cannot safely keep the worst-case 64-term lower dot
// product inside one signed 23-bit lane.
//
// Therefore:
//
//   chunk 0: 32 terms -> unpack/correct
//   chunk 1: 32 terms -> unpack/correct
//
// then:
//
//   total = chunk0 + chunk1
//
// Desired mapping:
//   still 1 packed DSP reused over time
//
// Extra hardware:
//   24-bit final accumulation
// ============================================================
void gemv2_pack_g64(
    hls::stream<act15_t>& x_s,
    hls::stream<w4_t>& w0_s,
    hls::stream<w4_t>& w1_s,
    hls::stream<out24_t>& y0_s,
    hls::stream<out24_t>& y1_s
) {
#pragma HLS INTERFACE ap_fifo port=x_s
#pragma HLS INTERFACE ap_fifo port=w0_s
#pragma HLS INTERFACE ap_fifo port=w1_s
#pragma HLS INTERFACE ap_fifo port=y0_s
#pragma HLS INTERFACE ap_fifo port=y1_s

    ap_int<24> total0 = 0;
    ap_int<24> total1 = 0;

G64_CHUNK_LOOP:
    for (int chunk = 0; chunk < 2; ++chunk) {

        ap_int<48> packed_acc = 0;

G64_PACK_INNER:
        for (int i = 0; i < 32; ++i) {
#pragma HLS PIPELINE II=1

            act15_t x = x_s.read();
            w4_t w0 = w0_s.read();
            w4_t w1 = w1_s.read();

            ap_int<27> packed_w =
                pack_two_w4(w0, w1);

            packed_acc += packed_w * x;
        }

        ap_int<23> part0;
        ap_int<23> part1;

        unpack_acc23(
            packed_acc,
            part0,
            part1
        );

        total0 += (ap_int<24>)part0;
        total1 += (ap_int<24>)part1;
    }

    y0_s.write(total0);
    y1_s.write(total1);
}
