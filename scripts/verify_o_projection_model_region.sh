#!/usr/bin/env bash
set -euo pipefail

bank=${1:-/dev/shm/4PE_U250_dense/model_bank0.bin}

expected_size=865071104
o_word_offset=105536
o_superblock_words=4224
expected_o_superblock_sha256=7335cfdfc8ee795b444d26c4a40ab9d3716488578886c5ef4f9df5ed1b5f7dfb

if [[ ! -r "$bank" ]]; then
    echo "FAIL: cannot read model bank: $bank" >&2
    exit 1
fi

actual_size=$(stat -c%s "$bank")
if [[ "$actual_size" != "$expected_size" ]]; then
    echo "FAIL: wrong dense model size: $actual_size (expected $expected_size)" >&2
    exit 1
fi

actual_sha256=$(
    dd if="$bank" bs=64 skip="$o_word_offset" count="$o_superblock_words" \
        status=none | sha256sum | awk '{print $1}'
)

echo "BANK=$bank"
echo "SIZE=$actual_size"
echo "O_SUPERBLOCK0_SHA256=$actual_sha256"

if [[ "$actual_sha256" != "$expected_o_superblock_sha256" ]]; then
    echo "FAIL O_PROJECTION_MODEL_REGION_MISMATCH"
    echo "EXPECTED=$expected_o_superblock_sha256"
    exit 1
fi

echo "PASS O_PROJECTION_MODEL_REGION_MATCH"
