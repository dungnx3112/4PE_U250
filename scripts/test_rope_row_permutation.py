import numpy as np

from autoround_pack_llama2_u250 import (
    DIM,
    HEAD_DIM,
    NUM_HEADS,
    permute_qk_rows_for_adjacent_rope,
)


def split_half_rope(values, cosine, sine):
    half = HEAD_DIM // 2
    first = values[:, :half]
    second = values[:, half:]
    return np.concatenate(
        (first * cosine - second * sine, second * cosine + first * sine),
        axis=1,
    )


def adjacent_rope(values, cosine, sine):
    pairs = values.reshape(NUM_HEADS, HEAD_DIM // 2, 2)
    output = np.empty_like(pairs)
    output[:, :, 0] = pairs[:, :, 0] * cosine - pairs[:, :, 1] * sine
    output[:, :, 1] = pairs[:, :, 0] * sine + pairs[:, :, 1] * cosine
    return output.reshape(NUM_HEADS, HEAD_DIM)


def main():
    rng = np.random.default_rng(20260915)
    weight = rng.standard_normal((DIM, DIM), dtype=np.float32)
    activation = rng.standard_normal(DIM, dtype=np.float32)
    angles = rng.standard_normal((NUM_HEADS, HEAD_DIM // 2), dtype=np.float32)
    cosine = np.cos(angles)
    sine = np.sin(angles)

    original = (weight @ activation).reshape(NUM_HEADS, HEAD_DIM)
    permuted_weight = permute_qk_rows_for_adjacent_rope(weight)
    adjacent_input = (permuted_weight @ activation).reshape(NUM_HEADS, HEAD_DIM)

    expected = split_half_rope(original, cosine, sine)
    actual_adjacent = adjacent_rope(adjacent_input, cosine, sine)
    actual_split_layout = np.empty_like(actual_adjacent)
    actual_split_layout[:, : HEAD_DIM // 2] = actual_adjacent[:, 0::2]
    actual_split_layout[:, HEAD_DIM // 2 :] = actual_adjacent[:, 1::2]

    np.testing.assert_allclose(actual_split_layout, expected, rtol=2e-5, atol=2e-4)
    print("PASS: Hugging Face split-half RoPE == packed adjacent-pair RoPE")


if __name__ == "__main__":
    main()
