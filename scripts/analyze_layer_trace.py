#!/usr/bin/env python3
"""Compare one FPGA layer trace with the matching software reference trace."""

import argparse
import array
import csv
import math
import sys
from pathlib import Path


DIM = 4096
NUM_PES = 4
LOCAL_DIM = DIM // NUM_PES
NUM_LAYERS = 32
CHECKPOINTS = 1 + 2 * NUM_LAYERS
FLOATS = CHECKPOINTS * DIM


def read_f32(path: Path):
    data = array.array("f")
    with path.open("rb") as handle:
        data.fromfile(handle, FLOATS)
        if handle.read(1):
            raise ValueError(f"{path}: file is larger than {FLOATS * 4} bytes")
    if len(data) != FLOATS:
        raise ValueError(f"{path}: got {len(data)} floats, expected {FLOATS}")
    if sys.byteorder != "little":
        data.byteswap()
    return data


def checkpoint_name(slot):
    if slot == 0:
        return "decoder_input"
    layer = (slot - 1) // 2
    kind = "after_attention" if slot & 1 else "after_ffn"
    return f"layer{layer:02d}_{kind}"


def metrics(reference, hardware, start, stop):
    count = stop - start
    sum_r = sum_h = sum_rr = sum_hh = sum_rh = 0.0
    sum_e2 = sum_r2 = max_abs = 0.0
    for index in range(start, stop):
        r = float(reference[index])
        h = float(hardware[index])
        error = h - r
        sum_r += r
        sum_h += h
        sum_rr += r * r
        sum_hh += h * h
        sum_rh += r * h
        sum_e2 += error * error
        sum_r2 += r * r
        max_abs = max(max_abs, abs(error))
    covariance = sum_rh - sum_r * sum_h / count
    variance_r = sum_rr - sum_r * sum_r / count
    variance_h = sum_hh - sum_h * sum_h / count
    denominator = math.sqrt(max(0.0, variance_r * variance_h))
    correlation = covariance / denominator if denominator else float("nan")
    return {
        "corr": correlation,
        "rmse": math.sqrt(sum_e2 / count),
        "rel_l2": math.sqrt(sum_e2 / sum_r2) if sum_r2 else float("inf"),
        "max_abs": max_abs,
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--hardware", required=True, type=Path)
    parser.add_argument("--software", required=True, type=Path)
    parser.add_argument("--csv", type=Path)
    parser.add_argument("--threshold", type=float, default=0.05,
                        help="relative-L2 threshold used to flag first bad slot")
    args = parser.parse_args()

    hardware = read_f32(args.hardware)
    software = read_f32(args.software)
    rows = []
    first_bad = None
    for slot in range(CHECKPOINTS):
        base = slot * DIM
        whole = metrics(software, hardware, base, base + DIM)
        pe_metrics = []
        for pe in range(NUM_PES):
            start = base + pe * LOCAL_DIM
            pe_metrics.append(metrics(software, hardware,
                                      start, start + LOCAL_DIM))
        row = {
            "slot": slot,
            "name": checkpoint_name(slot),
            **whole,
        }
        for pe, values in enumerate(pe_metrics):
            for key, value in values.items():
                row[f"pe{pe}_{key}"] = value
        rows.append(row)
        if first_bad is None and whole["rel_l2"] > args.threshold:
            first_bad = row
        print(
            f"{slot:02d} {row['name']:<25} "
            f"corr={whole['corr']:+.6f} rmse={whole['rmse']:.6f} "
            f"rel_l2={whole['rel_l2']:.6f} max={whole['max_abs']:.6f} "
            + " ".join(
                f"PE{pe}={pe_metrics[pe]['rel_l2']:.4f}"
                for pe in range(NUM_PES)
            )
        )

    if args.csv:
        args.csv.parent.mkdir(parents=True, exist_ok=True)
        with args.csv.open("w", newline="", encoding="utf-8") as handle:
            writer = csv.DictWriter(handle, fieldnames=list(rows[0]))
            writer.writeheader()
            writer.writerows(rows)

    if first_bad:
        print(
            f"FIRST_BAD threshold={args.threshold}: slot={first_bad['slot']} "
            f"{first_bad['name']} rel_l2={first_bad['rel_l2']:.6f}"
        )
    else:
        print(f"NO_BAD_SLOT above relative-L2 threshold {args.threshold}")


if __name__ == "__main__":
    main()
