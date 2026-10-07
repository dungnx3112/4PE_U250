#!/usr/bin/env python3
"""Check first-tile PE0 O inputs and EACH accumulator RAM write from a suite.

Golden activation/scale comes from that variant's own input_write capture.
Raw MAC weights/scales are checked bit-for-bit against the supplied model.
Arithmetic ILA is retained for cycle-by-cycle diagnosis; operator CE alone
is deliberately not interpreted as transaction valid.
"""
import argparse
import csv
import json
import math
import struct
from pathlib import Path


def csv_rows(path):
    with path.open(newline="", encoding="utf-8-sig") as handle:
        reader = csv.reader(handle)
        columns = next(reader)
        next(reader)  # Vivado radix row
        return [dict(zip(columns, row)) for row in reader]


def col(rows, leaf):
    matches = [c for c in rows[0] if c.rsplit("/", 1)[-1].split("[", 1)[0] == leaf]
    if len(matches) != 1:
        raise ValueError("signal missing/ambiguous: %s: %s" % (leaf, matches))
    return matches[0]


def num(value):
    return int(value, 16)


def signed(value, bits):
    return value - (1 << bits) if value & (1 << (bits - 1)) else value


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return int.from_bytes(struct.pack("<f", value), "little")


def events(rows, event, index, data, o_only=True):
    e, i, d = [col(rows, s) for s in (event, index, data)]
    o = col(rows, "o_deep_is_o") if o_only else None
    return [(sample, num(row[i]), num(row[d])) for sample, row in enumerate(rows)
            if num(row[e]) and (o is None or num(row[o]))]


def one_csv(base, pattern):
    files = list(base.rglob(pattern))
    if len(files) != 1:
        raise ValueError("expected one %s under %s: %s" % (pattern, base, files))
    return files[0]


def analyze(base, model_region):
    writes = csv_rows(one_csv(base / "input_write", "o_projection_input_write_data.csv"))
    q = {i: data for _, i, data in events(writes,
        "o_ila_o_ram_q_write_we", "activation_q_address1", "activation_q_d1", False)}
    scales = {i: data for _, i, data in events(writes,
        "activation_scale_we0", "activation_scale_address0", "activation_scale_d0", False)}
    if set(q) != set(range(32)) or set(scales) != set(range(32)):
        raise ValueError("incomplete activation writes; need all groups 0..31")
    rows = csv_rows(one_csv(base / "deep", "o_projection_deep_inputs.csv"))
    model_word = lambda index: int.from_bytes(model_region[index * 64:(index + 1) * 64], "little")
    expected_words, expected_scales, updates = {}, [dict() for _ in range(4)], {}
    accum = [[0.0] * 4 for _ in range(32)]
    for group in range(32):
        tile, local_group = divmod(group, 8)
        for row_block in range(32):
            index = group * 32 + row_block
            weight = model_word(128 + tile * 256 + local_group * 32 + row_block)
            expected_words[index] = weight
            scale_word = model_word(tile * 8 + row_block // 4)
            sums = [0] * 4
            for c in range(32):
                activation = signed((q[group] >> (14 * c)) & 0x3fff, 14)
                for lane, nibble in enumerate((1, 0, 3, 2)):
                    w = signed((weight >> (16 * c + 4 * nibble)) & 15, 4)
                    sums[lane] += activation * w
            ascale = math.ldexp(1.0, scales[group] - 127 - 13)
            for lane in range(4):
                offset = 16 * ((row_block & 3) * 8 + local_group // 4 + lane * 2)
                raw = (scale_word >> offset) & 0xffff
                expected_scales[lane][index] = raw
                combined = f32(f32(signed(raw, 16) / 32768.0) * ascale)
                contribution = f32(f32(float(sums[lane])) * combined)
                accum[row_block][lane] = contribution if group == 0 else f32(
                    accum[row_block][lane] + contribution)
            updates[index] = sum(bits(v) << (32 * lane)
                                 for lane, v in enumerate(accum[row_block]))

    def check(actual, expected):
        observed = [e for e in actual if e[1] in expected]
        wrong = [(s, i) for s, i, d in observed if expected[i] != d]
        indices = [i for _, i, _ in observed]
        return {"observed": len(observed), "unique_indices": len(set(indices)),
                "mismatches": len(wrong), "first_mismatches_sample_index": wrong[:8],
                "missing_indices": sorted(set(expected) - set(indices))[:32],
                "duplicate_indices": len(indices) - len(set(indices))}

    report = {"variant": base.name}
    report["raw_weight"] = check(events(rows, "o_deep_weight_fire",
        "o_deep_weight_index", "weight_buffer_dout"), expected_words)
    report["weight_scale"] = [check(events(rows, "o_deep_scale%d_fire" % lane,
        "o_deep_scale%d_index" % lane, "scale_lane%d_dout" % lane), expected_scales[lane])
        for lane in range(4)]
    report["private_q_ram"] = check(events(rows, "o_deep_q_return_valid",
        "o_deep_q_return_address", "activation_q_q0"), q)
    report["private_scale_ram"] = check(events(rows, "o_deep_scale_return_valid",
        "o_deep_scale_return_address", "activation_scale_q0"), scales)
    report["partial_ram_updates"] = check(events(rows, "o_deep_partial_fire",
        "o_deep_partial_index", "o_deep_partial_data"), updates)
    # Repeat reads of Q RAM are expected across output tiles, so duplicates
    # here are coverage information, not necessarily a protocol error.
    report["note"] = "First output tile only; math operator CE is not transaction valid."
    return report


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("capture_dir", type=Path, help="directory containing captured variants")
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    with args.model.open("rb") as handle:
        handle.seek((4160 + 3 * 33792) * 64)
        region = handle.read(4224 * 64)
    if len(region) != 4224 * 64:
        raise ValueError("short dense-model O superblock")
    variants = [variant for variant in ("baseline", "group_packed", "group_scalar", "hardened")
                if (args.capture_dir / variant).is_dir()]
    if not variants:
        raise ValueError("no supported variant directory under capture_dir")
    report = [analyze(args.capture_dir / variant, region) for variant in variants]
    text = json.dumps(report, indent=2)
    print(text)
    if args.output:
        args.output.write_text(text + "\n", encoding="utf-8")
