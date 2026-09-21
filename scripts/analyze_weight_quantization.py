import json
import os

import numpy as np

from autoround_pack_llama2_u250 import (
    DIM,
    MODEL_DIR,
    MODE_DOWN,
    MODE_GATE,
    MODE_K,
    MODE_O,
    MODE_Q,
    MODE_UP,
    NUM_PES,
    SafeTensorNumpyReader,
    TILE_COLS,
    TILE_ROWS,
    conservative_quantize_tile_mat,
    matrix_shape_info,
    permute_qk_rows_for_adjacent_rope,
)


def main():
    with open(os.path.join(MODEL_DIR, "model.safetensors.index.json")) as stream:
        weight_map = json.load(stream)["weight_map"]

    readers = {}

    def load(name):
        shard = weight_map[name]
        if shard not in readers:
            readers[shard] = SafeTensorNumpyReader(os.path.join(MODEL_DIR, shard))
        return readers[shard].get_tensor(name)

    cases = [
        (0, MODE_Q, "self_attn.q_proj.weight"),
        (0, MODE_K, "self_attn.k_proj.weight"),
        (0, MODE_O, "self_attn.o_proj.weight"),
        (0, MODE_GATE, "mlp.gate_proj.weight"),
        (0, MODE_UP, "mlp.up_proj.weight"),
        (0, MODE_DOWN, "mlp.down_proj.weight"),
        (31, MODE_Q, "self_attn.q_proj.weight"),
        (31, MODE_O, "self_attn.o_proj.weight"),
    ]

    print("layer matrix                 zero%   rel_rmse   cosine")
    for layer, mode, suffix in cases:
        name = f"model.layers.{layer}.{suffix}"
        original = load(name)
        if mode in (MODE_Q, MODE_K):
            original = permute_qk_rows_for_adjacent_rope(original)

        valid_out, padded_out, valid_in, padded_in, out_tiles, local_in_tiles, *_ = matrix_shape_info(mode)
        if (valid_out, valid_in) != (padded_out, padded_in):
            matrix = np.zeros((padded_out, padded_in), dtype=np.float32)
            matrix[:valid_out, :valid_in] = original
        else:
            matrix = original

        local_cols = padded_in // NUM_PES
        zeros = count = 0
        signal_sq = error_sq = dot = reconstruction_sq = 0.0
        for pe in range(NUM_PES):
            local = matrix[:, pe * local_cols : (pe + 1) * local_cols]
            tiles = local.reshape(out_tiles, TILE_ROWS, local_in_tiles, TILE_COLS).transpose(0, 2, 1, 3)
            quantized, scales = conservative_quantize_tile_mat(tiles)
            reconstructed = quantized.astype(np.float32) * scales[:, :, None, None].astype(np.float32)
            delta = tiles - reconstructed
            zeros += np.count_nonzero(quantized == 0)
            count += quantized.size
            signal_sq += float(np.sum(tiles * tiles, dtype=np.float64))
            error_sq += float(np.sum(delta * delta, dtype=np.float64))
            dot += float(np.sum(tiles * reconstructed, dtype=np.float64))
            reconstruction_sq += float(np.sum(reconstructed * reconstructed, dtype=np.float64))

        zero_percent = 100.0 * zeros / count
        relative_rmse = np.sqrt(error_sq / signal_sq)
        cosine = dot / np.sqrt(signal_sq * reconstruction_sq)
        print(f"{layer:5d} {suffix:22s} {zero_percent:7.2f} {relative_rmse:10.4f} {cosine:8.5f}")


if __name__ == "__main__":
    main()
