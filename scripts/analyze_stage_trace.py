#!/usr/bin/env python3
"""Compare FPGA/software stage traces and localize one selected linear op."""

import argparse
import math
import os
import struct
import sys


NUM_PES = 4
WORD_BYTES = 64
GROUP_SIZE = 32
LOCAL_DIM = 1024
LOCAL_HIDDEN = 2816
STAGE_WORDS_PER_PE = 3119
STAGE_BYTES_PER_PE = STAGE_WORDS_PER_PE * WORD_BYTES
DUMP_BYTES = NUM_PES * STAGE_BYTES_PER_PE

# The ABI reserves capacity for the largest operation. Only the prefix
# dictated by MODE_INFO is meaningful for a selected operation.
DEEP_ROWS = 4
DEEP_MAX_GROUPS = 88
DEEP_MAX_AUDIT_WORDS = 22
DEEP_LOCAL_PARTIAL_WORDS = 2016
DEEP_LOCAL_PARTIAL_WORD = 861
DEEP_GROUP_DOT_WORD = DEEP_LOCAL_PARTIAL_WORD + DEEP_LOCAL_PARTIAL_WORDS
DEEP_WEIGHT_SCALE_WORD = DEEP_GROUP_DOT_WORD + DEEP_MAX_AUDIT_WORDS
DEEP_CUMULATIVE_WORD = DEEP_WEIGHT_SCALE_WORD + DEEP_MAX_AUDIT_WORDS
DEEP_ACTIVATION_WORD = DEEP_CUMULATIVE_WORD + DEEP_MAX_AUDIT_WORDS
DEEP_WEIGHT_WORD = DEEP_ACTIVATION_WORD + DEEP_MAX_GROUPS

# groups, padded global outputs, normal layer-0 segment name/offset/type/local rows
MODE_INFO = {
    "q": (32, 4096, "layer0_q_projection_q17", 33, "fxp32", LOCAL_DIM),
    "k": (32, 4096, "layer0_k_projection_q17", 97, "fxp32", LOCAL_DIM),
    "v": (32, 4096, "layer0_v_projection_q17", 161, "fxp32", LOCAL_DIM),
    "o": (32, 4096, "layer0_o_projection", 258, "fp32", LOCAL_DIM),
    "gate": (32, 11264, "layer0_gate_projection", 355, "fp32", LOCAL_HIDDEN),
    "up": (32, 11264, "layer0_up_projection", 531, "fp32", LOCAL_HIDDEN),
    "down": (88, 4096, "layer0_down_projection", 797, "fp32", LOCAL_DIM),
    "logits": (32, 32256, None, None, "fp32", 8064),
}

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
    different = max_raw = 0
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


def fp32_stats(hardware, software, word, values, grouped=False):
    different_bits = finite = nonfinite = 0
    sum_e2 = sum_s2 = max_abs = 0.0
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
                    loc = ("group%d row%d" % (index // DEEP_ROWS,
                                               index % DEEP_ROWS)
                           if grouped else "row%d" % index)
                    first = "PE%d %s HW=%.9g SW=%.9g" % (pe, loc, h, s)
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
    return different_bits, rel_l2, rmse, max_abs, nonfinite, first


def compare_deep_i32(hardware, software, word, values):
    different = max_raw = 0
    first = None
    words = (values + 15) // 16
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
                    first = "PE%d group%d row%d HW=%d SW=%d" % (
                        pe, index // DEEP_ROWS, index % DEEP_ROWS, h, s)
    return different, max_raw, first


def compare_deep_words(hardware, software, word, groups):
    different = 0
    first = None
    for pe in range(NUM_PES):
        hw = segment_bytes(hardware, pe, word, groups)
        sw = segment_bytes(software, pe, word, groups)
        for index, pair in enumerate(zip(hw, sw)):
            h, s = pair
            if h != s:
                different += 1
                if first is None:
                    first = "PE%d group%d byte%d HW=0x%02x SW=0x%02x" % (
                        pe, index // WORD_BYTES, index % WORD_BYTES, h, s)
    return different, first


def fp32_add(first, second):
    return struct.unpack("<f", struct.pack("<f", first + second))[0]


def replay_fp32_reduction(data, partial_values, output_word, local_rows):
    words = (partial_values + 15) // 16
    local = []
    for pe in range(NUM_PES):
        raw = segment_bytes(data, pe, DEEP_LOCAL_PARTIAL_WORD, words)
        local.append(struct.unpack("<%df" % partial_values, raw))
    outputs = [segment_bytes(data, pe, output_word,
                             (local_rows + 15) // 16)
               for pe in range(NUM_PES)]
    different = 0
    max_abs = 0.0
    first = None
    for row in range(partial_values):
        expected = fp32_add(fp32_add(local[0][row], local[1][row]),
                            fp32_add(local[2][row], local[3][row]))
        owner = row // local_rows
        actual = struct.unpack_from("<f", outputs[owner],
                                    (row % local_rows) * 4)[0]
        eb = struct.unpack("<I", struct.pack("<f", expected))[0]
        ab = struct.unpack("<I", struct.pack("<f", actual))[0]
        if eb != ab:
            different += 1
            if math.isfinite(expected) and math.isfinite(actual):
                max_abs = max(max_abs, abs(actual - expected))
            if first is None:
                first = "row%d output=%.9g replay=%.9g" % (
                    row, actual, expected)
    return different, max_abs, first


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--hardware", required=True)
    parser.add_argument("--software", required=True)
    parser.add_argument("--deep-layer", type=int, default=0)
    parser.add_argument("--deep-mode", choices=tuple(MODE_INFO), default="o")
    parser.add_argument("--threshold", type=float, default=1.0e-5)
    args = parser.parse_args()
    if args.deep_layer < 0 or args.deep_layer > 32:
        parser.error("--deep-layer must be in [0,32]")
    if (args.deep_layer == 32) != (args.deep_mode == "logits"):
        parser.error("layer 32 and mode logits must be selected together")
    try:
        hardware = read_dump(args.hardware)
        software = read_dump(args.software)
    except (OSError, ValueError) as error:
        print("ERROR: %s" % error, file=sys.stderr)
        return 2

    print("hardware=%s" % os.path.abspath(args.hardware))
    print("software=%s" % os.path.abspath(args.software))
    print("bytes=%d layout=[4 PE][%d x 64-byte stage words]" %
          (DUMP_BYTES, STAGE_WORDS_PER_PE))
    print("selector=layer%d/%s" % (args.deep_layer, args.deep_mode))

    first_bad = None
    stage_bad = {}
    for name, word, words, kind, count in SEGMENTS:
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
            result = fp32_stats(hardware, software, word, count)
            _, rel_l2, rmse, max_abs, nonfinite, detail = result
            bad = rel_l2 > args.threshold or nonfinite != 0
            summary = "rel_l2=%.8g rmse=%.8g max_abs=%.8g nonfinite=%d" % (
                rel_l2, rmse, max_abs, nonfinite)
        print("%-29s %s%s" % (name, summary, "  BAD" if bad else ""))
        if bad and detail:
            print("  first: %s" % detail)
        if bad and first_bad is None:
            first_bad = name
        stage_bad[name] = bad

    groups, outputs, stage_name, stage_word, stage_kind, local_rows = \
        MODE_INFO[args.deep_mode]
    audit_values = groups * DEEP_ROWS
    prefix = args.deep_mode + "_"
    print("\nDeep layer%d/%s localization:" %
          (args.deep_layer, args.deep_mode.upper()))
    deep_bad = {}
    for name, word in [
            (prefix + "activation_consumed", DEEP_ACTIVATION_WORD),
            (prefix + "packed_weight_rows0_3", DEEP_WEIGHT_WORD)]:
        different, detail = compare_deep_words(
            hardware, software, word, groups)
        deep_bad[name] = different != 0
        print("%-29s bytes_different=%d/%d%s" % (
            name, different, NUM_PES * groups * WORD_BYTES,
            "  BAD" if different else ""))
        if detail:
            print("  first: %s" % detail)

    dot_name = prefix + "group_dot_i32"
    different, max_raw, detail = compare_deep_i32(
        hardware, software, DEEP_GROUP_DOT_WORD, audit_values)
    deep_bad[dot_name] = different != 0
    print("%-29s different=%d/%d max_raw_diff=%d%s" % (
        dot_name, different, NUM_PES * audit_values, max_raw,
        "  BAD" if different else ""))
    if detail:
        print("  first: %s" % detail)

    for name, word, values, grouped in [
            (prefix + "weight_scale_fp32", DEEP_WEIGHT_SCALE_WORD,
             audit_values, True),
            (prefix + "cumulative_fp32", DEEP_CUMULATIVE_WORD,
             audit_values, True),
            (prefix + "local_partial_fp32", DEEP_LOCAL_PARTIAL_WORD,
             outputs, False)]:
        result = fp32_stats(hardware, software, word, values, grouped)
        different, rel_l2, rmse, max_abs, nonfinite, detail = result
        bad = different != 0 or nonfinite != 0
        deep_bad[name] = bad
        print("%-29s bits_different=%d/%d rel_l2=%.8g rmse=%.8g "
              "max_abs=%.8g nonfinite=%d%s" % (
                  name, different, NUM_PES * values, rel_l2, rmse,
                  max_abs, nonfinite, "  BAD" if bad else ""))
        if detail:
            print("  first: %s" % detail)

    replay_names = []
    if args.deep_layer == 0 and stage_kind == "fp32" and stage_word is not None:
        for source_name, data in (("hardware", hardware),
                                  ("software", software)):
            different, max_abs, detail = replay_fp32_reduction(
                data, outputs, stage_word, local_rows)
            name = "%s_%s_reduction_replay" % (args.deep_mode, source_name)
            replay_names.append(name)
            deep_bad[name] = different != 0
            print("%-29s bits_different=%d/%d max_abs=%.8g%s" % (
                name, different, outputs, max_abs,
                "  BAD" if different else ""))
            if detail:
                print("  first: %s" % detail)

    if deep_bad[prefix + "activation_consumed"]:
        localization = "activation delivery/addressing"
    elif deep_bad[prefix + "packed_weight_rows0_3"]:
        localization = "packed-weight stream/address ordering"
    elif deep_bad[dot_name]:
        localization = "packed INT4xINT14 MAC arithmetic"
    elif deep_bad[prefix + "weight_scale_fp32"]:
        localization = "weight-scale stream/address ordering"
    elif deep_bad[prefix + "cumulative_fp32"]:
        localization = "FP32 contribution/accumulation or group ordering"
    elif deep_bad[prefix + "local_partial_fp32"]:
        localization = "local MAC outside audited rows 0..3 or packet ordering"
    elif len(replay_names) == 2 and deep_bad[replay_names[1]]:
        localization = "software oracle/reduction trace is inconsistent"
    elif len(replay_names) == 2 and deep_bad[replay_names[0]]:
        localization = "4-PE AXIS reduction/routing or output store"
    elif args.deep_layer == 0 and stage_name and stage_bad.get(stage_name, False):
        localization = "4-PE reduction/routing, conversion, or output store"
    else:
        localization = "no selected deep-path divergence detected"
    print("DEEP RESULT: %s" % localization)

    any_deep_bad = any(deep_bad.values())
    if first_bad is None and not any_deep_bad:
        print("RESULT: stage checkpoints and selected deep trace match.")
        return 0
    if first_bad is None:
        print("RESULT: normal stages match; selected deep trace diverges.")
        return 1
    print("RESULT: first divergent stage: %s" % first_bad)
    return 1


if __name__ == "__main__":
    sys.exit(main())
