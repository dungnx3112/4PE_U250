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
STAGE_WORDS_PER_PE = 1205
STAGE_BYTES_PER_PE = STAGE_WORDS_PER_PE * WORD_BYTES
DUMP_BYTES = NUM_PES * STAGE_BYTES_PER_PE
Q_DEEP_ROWS = 4
Q_DEEP_GROUPS = LOCAL_DIM // GROUP_SIZE
Q_DEEP_VALUES = Q_DEEP_ROWS * Q_DEEP_GROUPS
Q_DEEP_WORDS = Q_DEEP_VALUES // 16
Q_LOCAL_PARTIAL_WORD = 861
Q_GROUP_DOT_WORD = Q_LOCAL_PARTIAL_WORD + 256
Q_WEIGHT_SCALE_WORD = Q_GROUP_DOT_WORD + Q_DEEP_WORDS
Q_CUMULATIVE_WORD = Q_WEIGHT_SCALE_WORD + Q_DEEP_WORDS
Q_ACTIVATION_WORD = Q_CUMULATIVE_WORD + Q_DEEP_WORDS
Q_WEIGHT_WORD = Q_ACTIVATION_WORD + Q_DEEP_GROUPS

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
    rel_l2 = (math.sqrt(sum_e2 / sum_s2) if sum_s2 else
              (0.0 if sum_e2 == 0.0 else float("inf")))
    return rel_l2, rmse, max_abs, nonfinite, first


def compare_deep_i32(hardware, software, word):
    different = 0
    max_raw = 0
    first = None
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, Q_DEEP_WORDS)
        sw = segment_bytes(software, pe, word, Q_DEEP_WORDS)
        for index in range(Q_DEEP_VALUES):
            h = struct.unpack_from("<i", hw, index * 4)[0]
            s = struct.unpack_from("<i", sw, index * 4)[0]
            if h != s:
                different += 1
                max_raw = max(max_raw, abs(h - s))
                if first is None:
                    first = "PE%d group%d row%d HW=%d SW=%d" % (
                        pe, index // Q_DEEP_ROWS,
                        index % Q_DEEP_ROWS, h, s)
    return different, max_raw, first


def compare_deep_words(hardware, software, word):
    different = 0
    first = None
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, Q_DEEP_GROUPS)
        sw = segment_bytes(software, pe, word, Q_DEEP_GROUPS)
        for index, (h, s) in enumerate(zip(hw, sw)):
            if h != s:
                different += 1
                if first is None:
                    first = "PE%d group%d byte%d HW=0x%02x SW=0x%02x" % (
                        pe, index // WORD_BYTES, index % WORD_BYTES, h, s)
    return different, first


def compare_deep_fp32(hardware, software, word, values, grouped):
    different_bits = 0
    sum_e2 = 0.0
    sum_s2 = 0.0
    max_abs = 0.0
    finite = 0
    nonfinite = 0
    first = None
    words = (values + 15) // 16
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, words)
        sw = segment_bytes(software, pe, word, words)
        for index in range(values):
            hb = struct.unpack_from("<I", hw, index * 4)[0]
            sb = struct.unpack_from("<I", sw, index * 4)[0]
            h = struct.unpack_from("<f", hw, index * 4)[0]
            s = struct.unpack_from("<f", sw, index * 4)[0]
            if hb != sb:
                different_bits += 1
                if first is None:
                    location = ("group%d row%d" %
                                (index // Q_DEEP_ROWS,
                                 index % Q_DEEP_ROWS)) if grouped else (
                                     "row%d" % index)
                    first = "PE%d %s HW=%.9g SW=%.9g" % (
                        pe, location, h, s)
            if not math.isfinite(h) or not math.isfinite(s):
                nonfinite += 1
                continue
            error = h - s
            finite += 1
            sum_e2 += error * error
            sum_s2 += s * s
            max_abs = max(max_abs, abs(error))
    rmse = math.sqrt(sum_e2 / finite) if finite else float("inf")
    rel_l2 = (math.sqrt(sum_e2 / sum_s2) if sum_s2 else
              (0.0 if sum_e2 == 0.0 else float("inf")))
    return (different_bits, rel_l2, rmse, max_abs, nonfinite, first)


def fp32_add(first, second):
    """Round an addition exactly once to IEEE-754 binary32."""
    return struct.unpack("<f", struct.pack("<f", first + second))[0]


def replay_o_reduction(data):
    """Replay the hardware PE reduction tree from captured local partials."""
    local = []
    for pe in range(NUM_PES):
        raw = segment_bytes(data, pe, Q_LOCAL_PARTIAL_WORD, 256)
        local.append(struct.unpack("<4096f", raw))

    outputs = [
        segment_bytes(data, pe, 258, 64) for pe in range(NUM_PES)
    ]
    different = 0
    max_abs = 0.0
    first = None
    for row in range(NUM_PES * LOCAL_DIM):
        sum01 = fp32_add(local[0][row], local[1][row])
        sum23 = fp32_add(local[2][row], local[3][row])
        expected = fp32_add(sum01, sum23)
        owner = row // LOCAL_DIM
        local_row = row % LOCAL_DIM
        actual = struct.unpack_from("<f", outputs[owner], local_row * 4)[0]
        expected_bits = struct.unpack("<I", struct.pack("<f", expected))[0]
        actual_bits = struct.unpack("<I", struct.pack("<f", actual))[0]
        if expected_bits != actual_bits:
            different += 1
            if math.isfinite(expected) and math.isfinite(actual):
                max_abs = max(max_abs, abs(actual - expected))
            if first is None:
                first = "row%d HW/output=%.9g replay=%.9g" % (
                    row, actual, expected)
    return different, max_abs, first


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--hardware", required=True)
    parser.add_argument("--software", required=True)
    parser.add_argument("--deep-mode", choices=("q", "o"), default="o",
                        help="projection stored in the shared deep trace region")
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
    print("bytes=%d layout=[4 PE][1205 x 64-byte stage words]" % DUMP_BYTES)
    first_bad = None
    stage_bad = {}
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
        stage_bad[name] = bad

    deep_label = args.deep_mode.upper()
    deep_prefix = args.deep_mode + "_"
    print("\nDeep %s localization:" % deep_label)
    deep_bad = {}
    for name, word in [
            (deep_prefix + "activation_consumed", Q_ACTIVATION_WORD),
            (deep_prefix + "packed_weight_rows0_3", Q_WEIGHT_WORD)]:
        different, detail = compare_deep_words(hardware, software, word)
        deep_bad[name] = different != 0
        total = NUM_PES * Q_DEEP_GROUPS * WORD_BYTES
        print("%-29s bytes_different=%d/%d%s" % (
            name, different, total, "  BAD" if different else ""))
        if detail:
            print("  first: %s" % detail)

    different, max_raw, detail = compare_deep_i32(
        hardware, software, Q_GROUP_DOT_WORD)
    dot_name = deep_prefix + "group_dot_i32"
    deep_bad[dot_name] = different != 0
    print("%-29s different=%d/%d max_raw_diff=%d%s" % (
        dot_name, different, NUM_PES * Q_DEEP_VALUES,
        max_raw, "  BAD" if different else ""))
    if detail:
        print("  first: %s" % detail)

    for name, word, values, grouped in [
            (deep_prefix + "weight_scale_fp32", Q_WEIGHT_SCALE_WORD,
             Q_DEEP_VALUES, True),
            (deep_prefix + "cumulative_fp32", Q_CUMULATIVE_WORD,
             Q_DEEP_VALUES, True),
            (deep_prefix + "local_partial_fp32", Q_LOCAL_PARTIAL_WORD,
             4096, False)]:
        result = compare_deep_fp32(
            hardware, software, word, values, grouped)
        different_bits, rel_l2, rmse, max_abs, nonfinite, detail = result
        bad = different_bits != 0 or nonfinite != 0
        deep_bad[name] = bad
        print("%-29s bits_different=%d/%d rel_l2=%.8g "
              "rmse=%.8g max_abs=%.8g nonfinite=%d%s" % (
                  name, different_bits, NUM_PES * values, rel_l2,
                  rmse, max_abs, nonfinite, "  BAD" if bad else ""))
        if detail:
            print("  first: %s" % detail)

    if args.deep_mode == "o":
        for source_name, data in (("hardware", hardware),
                                  ("software", software)):
            different, max_abs, detail = replay_o_reduction(data)
            name = "o_%s_reduction_replay" % source_name
            deep_bad[name] = different != 0
            print("%-29s bits_different=%d/%d max_abs=%.8g%s" % (
                name, different, NUM_PES * LOCAL_DIM, max_abs,
                "  BAD" if different else ""))
            if detail:
                print("  first: %s" % detail)

    activation_name = deep_prefix + "activation_consumed"
    weight_name = deep_prefix + "packed_weight_rows0_3"
    scale_name = deep_prefix + "weight_scale_fp32"
    cumulative_name = deep_prefix + "cumulative_fp32"
    partial_name = deep_prefix + "local_partial_fp32"
    hardware_replay_name = "o_hardware_reduction_replay"
    software_replay_name = "o_software_reduction_replay"
    if deep_bad[activation_name]:
        localization = "%s activation delivery/addressing" % deep_label
    elif deep_bad[weight_name]:
        localization = "%s packed-weight stream/address ordering" % deep_label
    elif deep_bad[dot_name]:
        localization = "packed INT4xINT14 MAC arithmetic"
    elif deep_bad[scale_name]:
        localization = "%s weight-scale stream/address ordering" % deep_label
    elif deep_bad[cumulative_name]:
        localization = "FP32 contribution/accumulation or group ordering"
    elif deep_bad[partial_name]:
        localization = "local MAC outside audited rows 0..3 or local packet ordering"
    elif args.deep_mode == "o" and deep_bad[software_replay_name]:
        localization = "software trace/reference reduction is internally inconsistent"
    elif args.deep_mode == "o" and deep_bad[hardware_replay_name]:
        localization = "4-PE AXIS reduction/routing or final output store"
    elif stage_bad.get("layer0_%s_projection%s" % (
            args.deep_mode, "_q17" if args.deep_mode == "q" else ""), False):
        localization = "4-PE AXIS reduction/routing, conversion, or store"
    else:
        localization = "no %s-path divergence detected" % deep_label
    print("DEEP-%s RESULT: %s" % (deep_label, localization))

    any_deep_bad = any(deep_bad.values())
    if first_bad is None and not any_deep_bad:
        print("RESULT: all layer-zero stage checkpoints match.")
        return 0
    if first_bad is None:
        print("RESULT: normal stages match; deep %s trace diverges." % deep_label)
        return 1
    print("RESULT: first divergent stage: %s" % first_bad)
    return 1


if __name__ == "__main__":
    sys.exit(main())
