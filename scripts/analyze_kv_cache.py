#!/usr/bin/env python3
"""Compare layer-zero compressed KV dumps from FPGA and software."""

import argparse
import os
import sys


NUM_PES = 4
LOCAL_HEADS = 8
WORD_BYTES = 64
RECORD_BYTES = 5 * WORD_BYTES
DUMP_BYTES = NUM_PES * LOCAL_HEADS * RECORD_BYTES


def read_dump(path):
    with open(path, "rb") as stream:
        data = stream.read()
    if len(data) != DUMP_BYTES:
        raise ValueError(
            "%s: expected %d bytes, got %d" %
            (path, DUMP_BYTES, len(data)))
    return data


def signed(byte):
    return byte - 256 if byte >= 128 else byte


def shifts(record):
    metadata = 0
    for index in range(5):
        metadata |= record[index] << (8 * index)
    key = [(metadata >> (5 * group)) & 0x1f for group in range(4)]
    value = [
        (metadata >> (20 + 5 * group)) & 0x1f for group in range(4)
    ]
    return key, value


def vector(record, first_word):
    begin = first_word * WORD_BYTES
    return [signed(value) for value in record[begin:begin + 128]]


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Compare headerless [4 PE][8 head][metadata,K0,K1,V0,V1] "
            "layer-zero KV dumps."))
    parser.add_argument("--hardware", required=True)
    parser.add_argument("--software", required=True)
    args = parser.parse_args()

    try:
        hardware = read_dump(args.hardware)
        software = read_dump(args.software)
    except (OSError, ValueError) as error:
        print("ERROR: %s" % error, file=sys.stderr)
        return 2

    total_different = sum(a != b for a, b in zip(hardware, software))
    print("hardware=%s" % os.path.abspath(args.hardware))
    print("software=%s" % os.path.abspath(args.software))
    print("layout=[4 PE][8 local heads][5 x 64-byte words], bytes=%d" %
          DUMP_BYTES)
    print("raw_different_bytes=%d/%d" % (total_different, DUMP_BYTES))
    print("PE head | K-shift HW/SW       V-shift HW/SW       | Kdiff Vdiff")

    first_bad = None
    bad_records = 0
    for pe in range(NUM_PES):
        for head in range(LOCAL_HEADS):
            index = pe * LOCAL_HEADS + head
            begin = index * RECORD_BYTES
            hw_record = hardware[begin:begin + RECORD_BYTES]
            sw_record = software[begin:begin + RECORD_BYTES]
            hw_ks, hw_vs = shifts(hw_record)
            sw_ks, sw_vs = shifts(sw_record)
            hw_k = vector(hw_record, 1)
            sw_k = vector(sw_record, 1)
            hw_v = vector(hw_record, 3)
            sw_v = vector(sw_record, 3)
            kdiff = sum(a != b for a, b in zip(hw_k, sw_k))
            vdiff = sum(a != b for a, b in zip(hw_v, sw_v))
            metadata_padding_diff = sum(
                a != b for a, b in zip(hw_record[5:64], sw_record[5:64]))
            bad = (hw_ks != sw_ks or hw_vs != sw_vs or
                   kdiff != 0 or vdiff != 0 or metadata_padding_diff != 0)
            if bad:
                bad_records += 1
                if first_bad is None:
                    first_bad = (pe, head)
            print(
                "%2d %4d | %-9s/%-9s %-9s/%-9s | %5d %5d%s" %
                (pe, head, str(hw_ks), str(sw_ks), str(hw_vs),
                 str(sw_vs), kdiff, vdiff,
                 "  BAD" if bad else ""))

    if first_bad is None:
        print("RESULT: MATCH - layer-0 compressed KV records are identical.")
        print("Next target: KV routing/dequantization, attention output, or O projection.")
        return 0

    print("RESULT: MISMATCH - %d/32 records differ; first PE=%d head=%d." %
          (bad_records, first_bad[0], first_bad[1]))
    print("Next target: V/K projection boundary or KV quantize/pack path.")
    return 1


if __name__ == "__main__":
    sys.exit(main())
