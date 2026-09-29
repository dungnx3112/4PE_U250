#!/usr/bin/env python3
"""Compare all layer-zero full-stage checkpoints from FPGA and software."""

import argparse
import math
import os
import struct
import sys


NUM_PES = 4
WORD_BYTES = 64
LOCAL_DIM = 1024
LOCAL_HIDDEN = 2816
GROUP_SIZE = 32
STAGE_WORDS_PER_PE = 861
STAGE_BYTES_PER_PE = STAGE_WORDS_PER_PE * WORD_BYTES
DUMP_BYTES = NUM_PES * STAGE_BYTES_PER_PE

# name, word offset, words, representation, logical values/groups per PE
SEGMENTS = [
    ("layer0_attn_rms_qscale", 0, 33, "qscale", 32),
    ("layer0_q_projection_q17", 33, 64, "fxp32", LOCAL_DIM),
    ("layer0_k_projection_q17", 97, 64, "fxp32", LOCAL_DIM),
    ("layer0_v_projection_q17", 161, 64, "fxp32", LOCAL_DIM),
    ("layer0_attention_qscale", 225, 33, "qscale", 32),
    ("layer0_o_projection", 258, 64, "fp32", LOCAL_DIM),
    ("layer0_ffn_rms_qscale", 322, 33, "qscale", 32),
    ("layer0_gate_projection", 355, 176, "fp32", LOCAL_HIDDEN),
    ("layer0_up_projection", 531, 176, "fp32", LOCAL_HIDDEN),
    ("layer0_swiglu_qscale", 707, 90, "qscale", 88),
    ("layer0_down_projection", 797, 64, "fp32", LOCAL_DIM),
]


def read_dump(path):
    with open(path, "rb") as stream:
        data = stream.read()
    if len(data) != DUMP_BYTES:
        raise ValueError("%s: expected %d bytes, got %d" %
                         (path, DUMP_BYTES, len(data)))
    return data


def segment_bytes(data, pe, word, words):
    base = pe * STAGE_BYTES_PER_PE + word * WORD_BYTES
    return data[base:base + words * WORD_BYTES]


def signed14(raw):
    return raw - (1 << 14) if raw & (1 << 13) else raw


def get_bits_le(data, first_bit, width):
    value = 0
    for bit in range(width):
        source = first_bit + bit
        value |= ((data[source // 8] >> (source % 8)) & 1) << bit
    return value


def compare_qscale(hardware, software, word, words, groups):
    qdiff = scale_diff = 0
    first = None
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, words)
        sw = segment_bytes(software, pe, word, words)
        for group in range(groups):
            hw_word = hw[group * WORD_BYTES:(group + 1) * WORD_BYTES]
            sw_word = sw[group * WORD_BYTES:(group + 1) * WORD_BYTES]
            for lane in range(GROUP_SIZE):
                h = signed14(get_bits_le(hw_word, lane * 14, 14))
                s = signed14(get_bits_le(sw_word, lane * 14, 14))
                if h != s:
                    qdiff += 1
                    if first is None:
                        first = "PE%d group%d lane%d HW=%d SW=%d" % (
                            pe, group, lane, h, s)
        scale_base = groups * WORD_BYTES
        for group in range(groups):
            h = hw[scale_base + group]
            s = sw[scale_base + group]
            if h != s:
                scale_diff += 1
                if first is None:
                    first = "PE%d scale%d HW=%d SW=%d" % (pe, group, h, s)
    return qdiff, scale_diff, first


def compare_fxp32(hardware, software, word, words, values):
    different = 0
    max_raw = 0
    first = None
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, words)
        sw = segment_bytes(software, pe, word, words)
        for index in range(values):
            h = struct.unpack_from("<i", hw, index * 4)[0]
            s = struct.unpack_from("<i", sw, index * 4)[0]
            if h != s:
                different += 1
                max_raw = max(max_raw, abs(h - s))
                if first is None:
                    first = "PE%d index%d HW=%d SW=%d" % (pe, index, h, s)
    return different, max_raw, first


def compare_fp32(hardware, software, word, words, values):
    sum_e2 = 0.0
    sum_s2 = 0.0
    max_abs = 0.0
    finite = 0
    nonfinite = 0
    first = None
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, words)
        sw = segment_bytes(software, pe, word, words)
        for index in range(values):
            h = struct.unpack_from("<f", hw, index * 4)[0]
            s = struct.unpack_from("<f", sw, index * 4)[0]
            if not math.isfinite(h) or not math.isfinite(s):
                nonfinite += 1
                if first is None and h != s:
                    first = "PE%d index%d HW=%r SW=%r" % (pe, index, h, s)
                continue
            error = h - s
            finite += 1
            sum_e2 += error * error
            sum_s2 += s * s
            max_abs = max(max_abs, abs(error))
            if first is None and error != 0.0:
                first = "PE%d index%d HW=%.9g SW=%.9g" % (
                    pe, index, h, s)
    rmse = math.sqrt(sum_e2 / finite) if finite else float("inf")
    rel_l2 = math.sqrt(sum_e2 / sum_s2) if sum_s2 else float("inf")
    return rel_l2, rmse, max_abs, nonfinite, first


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--hardware", required=True)
    parser.add_argument("--software", required=True)
    parser.add_argument("--threshold", type=float, default=1.0e-5,
                        help="relative-L2 threshold for FP32 checkpoints")
    args = parser.parse_args()
    try:
        hardware = read_dump(args.hardware)
        software = read_dump(args.software)
    except (OSError, ValueError) as error:
        print("ERROR: %s" % error, file=sys.stderr)
        return 2

    print("hardware=%s" % os.path.abspath(args.hardware))
    print("software=%s" % os.path.abspath(args.software))
    print("bytes=%d layout=[4 PE][861 x 64-byte stage words]" % DUMP_BYTES)
    first_bad = None
    for name, word, words, kind, count in SEGMENTS:
        bad = False
        detail = None
        if kind == "qscale":
            qdiff, sdiff, detail = compare_qscale(
                hardware, software, word, words, count)
            bad = qdiff != 0 or sdiff != 0
            summary = "qdiff=%d/%d scalediff=%d/%d" % (
                qdiff, NUM_PES * count * GROUP_SIZE,
                sdiff, NUM_PES * count)
        elif kind == "fxp32":
            different, max_raw, detail = compare_fxp32(
                hardware, software, word, words, count)
            bad = different != 0
            summary = "different=%d/%d max_raw_diff=%d" % (
                different, NUM_PES * count, max_raw)
        else:
            rel_l2, rmse, max_abs, nonfinite, detail = compare_fp32(
                hardware, software, word, words, count)
            bad = rel_l2 > args.threshold or nonfinite != 0
            summary = (
                "rel_l2=%.8g rmse=%.8g max_abs=%.8g nonfinite=%d" %
                (rel_l2, rmse, max_abs, nonfinite))
        print("%-29s %s%s" %
              (name, summary, "  BAD" if bad else ""))
        if bad and detail:
            print("  first: %s" % detail)
        if bad and first_bad is None:
            first_bad = name

    if first_bad is None:
        print("RESULT: all layer-zero stage checkpoints match.")
        return 0
    print("RESULT: first divergent stage: %s" % first_bad)
    return 1


if __name__ == "__main__":
    sys.exit(main())
